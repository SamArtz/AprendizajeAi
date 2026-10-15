# Adaptia
Prototipo SaaS B2B con Next.js App Router, TypeScript, Tailwind CSS, lucide-react, Recharts y PostgreSQL.

## Instalación y arranque local
```sh
npm ci
```
Copia `.env.example` a `.env` y completa tu usuario y contraseña de PostgreSQL. Los valores locales son `PGHOST=localhost`, `PGPORT=5432` y `PGDATABASE=adaptia`. Next.js carga `.env` automáticamente. No subas el archivo ni expongas credenciales mediante variables `NEXT_PUBLIC_`. Si usas `DATABASE_URL`, tiene prioridad sobre las variables PG.

```sh
npm run dev
```
Next.js debe ejecutarse en la misma computadora que PostgreSQL para usar localhost. DBeaver es el cliente para administrar la base; no sustituye al servidor PostgreSQL. Reinicia Next.js después de modificar `.env`.

## Esquema actual
```sql
CREATE TABLE ramas (
  id SERIAL PRIMARY KEY,
  modulo VARCHAR(50) NOT NULL,
  nombre VARCHAR(150) NOT NULL,
  contenido_teorico TEXT NOT NULL
);
CREATE TABLE preguntas (
  id SERIAL PRIMARY KEY,
  texto TEXT NOT NULL,
  dificultad VARCHAR(20) NOT NULL,
  modulo VARCHAR(50),
  rama_id INTEGER REFERENCES ramas(id)
);
CREATE TABLE opciones (
  id SERIAL PRIMARY KEY,
  pregunta_id INTEGER REFERENCES preguntas(id) ON DELETE CASCADE,
  texto TEXT NOT NULL,
  puntos INTEGER NOT NULL
);
```
Este esquema documenta las tablas existentes; la aplicación no las crea ni migra. No ejecutes el seed histórico `sql/preguntas-ramas-extra.sql` sobre este esquema: ese seed utilizaba IDs textuales de rama.

## API y contenido dinámico
- GET `/api/ramas`: JOIN jerárquico de ramas, preguntas y opciones. Devuelve `id` como string para localStorage, `title` desde `nombre`, `description` vacía (el esquema no contiene descripción), `modulo`, `contenido_teorico`, `orden` desde el ID y `preguntas` con `opciones`.
- Cada rama requiere teoría, un módulo Básico/Intermedio/Avanzado y exactamente 15 preguntas válidas con al menos dos opciones y puntos enteros no negativos. La API devuelve 422 para contenido incompleto; no inventa ni recorta preguntas.
- Si `preguntas.modulo` es NULL, se utiliza `ramas.modulo`.
- GET `/api/preguntas?modulo=Evaluacion Inicial`: evaluación inicial con preguntas de la base de datos. Las preguntas iniciales pueden tener `rama_id` NULL.
- GET `/api/preguntas?modulo=Módulo Básico&rama=1`: consulta filtrada por módulo y ID numérico de rama.
- Consultas sin caché; errores de conexión devuelven 503 sin mostrar credenciales.

El Dashboard carga el catálogo desde `/api/ramas`. Abrir módulo despliega sus ramas; Completar lección abre primero el Markdown de `contenido_teorico`, sin ejecutar HTML incrustado. Continuar al cuestionario consulta de nuevo `/api/preguntas` con el ID de la rama y muestra sus 15 preguntas completas. Guardar lección completada registra el progreso y desbloquea la siguiente. Se exige al menos 80% del puntaje máximo para completar una rama. Salir antes de completar el cuestionario no registra progreso.

La evaluación inicial normaliza el puntaje sobre 300 y asigna Básico (0–100), Intermedio (101–200) o Avanzado (201–300). Las prácticas de rama muestran su puntuación sin cambiar ese nivel. `userLevel` y `completedBranches` se guardan en localStorage con claves separadas por ID de usuario; los IDs completados se validan como un prefijo consecutivo independiente por módulo. Empezar desde cero elimina únicamente esas claves tras confirmar.

Las métricas ejecutivas siguen siendo simulaciones etiquetadas según el nivel. El acceso requiere cuenta y sesión; no hay integración SSO corporativa. La API de contenido exige sesión y devuelve puntos al navegador; una evaluación certificada también requiere calificación y progreso en el servidor.

## Verificación
Abre `/api/ramas` para comprobar el JSON, `/dashboard` para las rutas y `/evaluacion` para el diagnóstico.
```sh
npm run build
npm run typecheck
npm start
```
Para actualizar localmente: Ctrl+C, `git pull origin main`, `npm ci`, `npm run dev`. Conserva tu `.env` local.

Las prácticas no usan preguntas precargadas ni muestras estáticas: cada apertura consulta PostgreSQL con el ID real de la rama. La API y el cliente verifican las 15 preguntas; una rama con solo 3 devuelve un error explícito. `Fundamentos Generativos` se selecciona por el ID de su registro de `ramas`, sin asumir que ese ID sea 1.

Compatibilidad: los JOIN comparan IDs como texto para admitir el esquema existente con `preguntas.rama_id TEXT`. Una pregunta con rama_id="1" se asocia a ramas.id=1; los valores antiguos como `basico-1` no se reasignan automáticamente. Solo aparecen ramas realmente registradas. Los filtros de módulo aceptan Básico y Módulo Básico (y equivalentes).

## Recuperación del catálogo existente (IDs 1–45 confirmados)
El script `sql/recuperar-45-ramas.sql` está preparado para el inventario con `ramas.id` INTEGER y `preguntas.rama_id` TEXT: rama 1 con 15 preguntas, las otras 44 vacías y grupos antiguos `basico-*`, `intermedio-*`, `avanzado-*`.
Ejecuta el archivo completo en DBeaver conectado a `adaptia` (Alt+X). Valida IDs, nombres y módulos antes de modificar; conserva la rama 1, reutiliza solo grupos temáticamente compatibles y completa cada destino hasta 15. Reemplaza únicamente teoría vacía o `Contenido en desarrollo...`. No elimina preguntas ni opciones; muestra los grupos antiguos que permanecen sin asociar. La operación es transaccional y reejecutable sin duplicados. El script no cambia tipos de columnas.
Después verifica 45 filas con 15 preguntas en la consulta final y vuelve a intentar `/api/ramas`. Si hay un error de validación, revisa el mensaje y no alteres el inventario para forzar la ejecución.

## Guía en diapositivas
La teoría de PostgreSQL se presenta una diapositiva por párrafo, con Anterior, Siguiente y avance de lectura. Los encabezados acompañan al siguiente bloque; listas, tablas y código se conservan completos. No requiere cambiar el SQL ni crear tablas. Solo la última diapositiva muestra Comenzar lección, que carga las 15 preguntas de la rama. Volver desde el cuestionario conserva la diapositiva donde quedó la lectura durante esa sesión.

Al finalizar el test se abre una revisión de errores: respuesta elegida en rojo y correctas de máxima puntuación en verde, con etiquetas e iconos. El 80% se compara con el puntaje real, sin redondear el porcentaje mostrado. Un intento insuficiente no guarda ni desbloquea la rama; se puede repetir con opciones mezcladas. La evaluación inicial conserva su clasificación de nivel. El progreso guardado antes de esta regla no se borra automáticamente.

## Registro y login
Después de `npm ci`, completa tu `.env` de PostgreSQL y ejecuta una vez:
```sh
npm run db:auth
npm run dev
```
`db:auth` ejecuta `sql/usuarios.sql` en la base existente `adaptia`. Es reejecutable y no modifica ramas, preguntas ni opciones. Alternativa: abre ese SQL en DBeaver y ejecútalo completo (Alt+X). No crea una base nueva ni usuarios de prueba.

- `/register`: nombre, correo y contraseña de 12–128 caracteres; crea cuenta e inicia sesión.
- `/login`: inicio con correo y contraseña.
- `POST /api/register`: JSON `{ "nombre": "Tu nombre", "email": "tu@correo.com", "password": "tu contraseña de al menos 12 caracteres" }`.
- `POST /api/login`: JSON con email/password. Devuelve usuario público y cookie; nunca el hash ni el token en JSON.
- `POST /api/logout`: revoca la sesión en PostgreSQL y elimina la cookie.
- `GET /api/me`: usuario de sesión o 401.
- `/dashboard`, `/evaluacion`, `/api/ramas` y `/api/preguntas` requieren sesión.

Las contraseñas usan scrypt con sal aleatoria. Las sesiones son tokens opacos aleatorios: solo se almacena su SHA-256 en PostgreSQL. Cookie HttpOnly, SameSite=Lax, Secure en producción; vencimiento de 7 días y revocación al salir. HTTPS es obligatorio en producción. Las peticiones POST comprueban Origin; para un dominio detrás de un proxy define APP_URL con la URL pública exacta. No se requiere AUTH_SECRET. Los intentos de login/registro se limitan a 10 por correo y operación cada 15 minutos mediante PostgreSQL.

El progreso continúa en el navegador, separado por cuenta (`adaptia:user:ID:userLevel` y `adaptia:user:ID:completedBranches`); los datos globales anteriores no se adjudican automáticamente a una persona. No hay sincronización de aprendizaje entre dispositivos, recuperación de contraseña ni verificación de correo todavía. Las sesiones sí se verifican en el servidor.

Validación: `npm run test:auth`, `npm run build`. Las tablas de sesiones y límites pueden limpiarse periódicamente eliminando solo filas vencidas. Para producción, añade la política de recuperación/verificación de correo y protección de tráfico adecuada al despliegue.
