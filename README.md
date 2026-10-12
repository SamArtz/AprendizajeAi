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

El Dashboard carga el catálogo desde `/api/ramas`. Abrir módulo despliega sus ramas; Completar lección abre primero el Markdown de `contenido_teorico`, sin ejecutar HTML incrustado. Continuar al cuestionario consulta de nuevo `/api/preguntas` con el ID de la rama y muestra sus 15 preguntas completas. Guardar lección completada registra el progreso y desbloquea la siguiente. No se exige nota mínima. Salir antes de completar el cuestionario no registra progreso.

La evaluación inicial normaliza el puntaje sobre 300 y asigna Básico (0–100), Intermedio (101–200) o Avanzado (201–300). Las prácticas de rama muestran su puntuación sin cambiar ese nivel. `userLevel` y `completedBranches` se guardan en localStorage; los IDs completados se validan como un prefijo consecutivo independiente por módulo. Empezar desde cero elimina únicamente esas claves tras confirmar.

Las métricas ejecutivas siguen siendo simulaciones etiquetadas según el nivel. El SSO es de demostración. La API devuelve puntos al navegador; una evaluación certificada requiere autenticación y calificación en el servidor.

## Verificación
Abre `/api/ramas` para comprobar el JSON, `/dashboard` para las rutas y `/evaluacion` para el diagnóstico.
```sh
npm run build
npm run typecheck
npm start
```
Para actualizar localmente: Ctrl+C, `git pull origin main`, `npm ci`, `npm run dev`. Conserva tu `.env` local.

Las prácticas no usan preguntas precargadas ni muestras estáticas: cada apertura consulta PostgreSQL con el ID real de la rama. La API y el cliente verifican las 15 preguntas; una rama con solo 3 devuelve un error explícito. `Fundamentos Generativos` se selecciona por el ID de su registro de `ramas`, sin asumir que ese ID sea 1.
