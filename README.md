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

El dashboard contiene datos ilustrativos; el badge SSO no representa autenticación real. Solicitar Demo abre una introducción a la demo. La evaluación tiene quince preguntas, calcula el resultado de 0 a 300 y permite repetirla; sus respuestas se pierden al salir o recargar. El nivel final se conserva en localStorage bajo `userLevel` y habilita los módulos correspondientes en el Dashboard. Sin un nivel válido, se requiere completar la evaluación. Los módulos incluyen guías introductorias; su lectura no modifica el nivel. No requiere credenciales, backend ni base de datos.
