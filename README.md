# Adaptia
Prototipo SaaS B2B de adopción adaptativa de IA con Next.js App Router, TypeScript, Tailwind CSS, lucide-react y Recharts.

## Desarrollo
```sh
npm ci --cache /tmp/adaptia-npm-cache
npm run dev
```

## Validación y producción
```sh
npm run build
npm run typecheck
npm start
```

Rutas: `/`, `/dashboard`, `/evaluacion`.

El dashboard contiene datos ilustrativos; el badge SSO no representa autenticación real. Solicitar Demo abre una introducción a la demo. La evaluación carga las preguntas desde PostgreSQL y calcula el puntaje según sus opciones y permite repetirla; sus respuestas se pierden al salir o recargar. El nivel final se conserva en localStorage bajo `userLevel` y habilita los módulos correspondientes en el Dashboard. Sin un nivel válido, se requiere completar la evaluación. Los módulos incluyen guías introductorias; su lectura no modifica el nivel. No requiere credenciales, backend ni base de datos.

Las rutas contienen 45 lecciones secuenciales: 10 Básicas, 15 Intermedias y 20 Avanzadas. Los datos y tipos están en `lib/learning.ts`. Cada módulo mantiene su propia secuencia; su primera lección está disponible al acceder al módulo. `completedBranches` guarda sus IDs como JSON en localStorage; completar una lección habilita la siguiente. El progreso no cambia el nivel de evaluación ni las métricas simuladas.

## PostgreSQL y preguntas dinámicas
Dependencias: `npm install pg` y `npm install -D @types/pg` (ya declaradas).
Copia `.env.example` a `.env` y completa `PGDATABASE`, `PGUSER` y `PGPASSWORD` con tus datos reales. Next.js carga el archivo automáticamente; reinicia el servidor tras cambiarlo. No uses variables `NEXT_PUBLIC_` para credenciales ni subas `.env`.

La API GET `/api/preguntas` une `preguntas(id, texto, dificultad, modulo)` con `opciones(id, pregunta_id, texto, puntos)`, ordena por IDs y agrupa las opciones en `opciones`. Consulta todas las preguntas. Cada pregunta necesita dos o más opciones, con puntos enteros no negativos y al menos una opción con puntos positivos. `modulo` y `dificultad` deben ser textos no nulos. No se crean ni modifican tablas automáticamente.

El cuestionario suma los puntos de la opción seleccionada. El máximo es la suma de la mejor opción de cada pregunta. Para preservar los niveles existentes, se normaliza el total sobre 300 antes de aplicar los cortes 100/200; si el banco suma 300, los cortes originales son idénticos. El nivel sigue guardándose en `userLevel`.

`localhost:5432` es el PostgreSQL de la máquina donde corre Next.js. Una aplicación en la nube no puede acceder al localhost de tu computadora: usa un host accesible o ejecuta Next.js junto a tu PostgreSQL. Para conexiones remotas utiliza las opciones TLS verificadas de tu proveedor, por ejemplo `PGSSLMODE=verify-full`.

La API devuelve puntos al navegador para este prototipo. Una evaluación certificada requeriría calificación en el servidor y autenticación.
