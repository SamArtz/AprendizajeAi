# Piloto de chat jurídico

Ruta: `/chat-juridico`. Requiere una sesión de Adaptia y una cuenta cuyo correo
esté autorizado en `CHAT_JURIDICO_EMAILS`. El enlace está en la navegación cuando
hay sesión. Usuarios no autorizados no pueden consultar el endpoint.

## Configuración inicial

La biblioteca debe estar importada con `npm run db:juridica`. No se requieren
tablas nuevas ni repetir esa importación.

Añade a tu `.env`, conservando el resto:

```dotenv
CHAT_JURIDICO_EMAILS=tu-correo-registrado@example.com
CHAT_JURIDICO_PRUEBA_IA=false
OPENAI_API_KEY=
OPENAI_MODEL=gpt-4.1-mini
```

Sustituye el correo de ejemplo por el de tu cuenta de Adaptia. Se pueden autorizar
varios correos separados por comas. Reinicia `npm run dev` tras cambiar el archivo.
Con esa configuración el chat funciona como búsqueda documental, sin llamadas
al proveedor. Consulta `artículo 198`, `aguinaldo` o `vacaciones`.

## Activar la explicación con OpenAI para pruebas

1. Crea un proyecto y una clave en https://platform.openai.com/api-keys y configura
   facturación de API; la suscripción de ChatGPT no incluye este consumo.
2. Guarda la clave en `OPENAI_API_KEY` de `.env`. Nunca la compartas en el chat,
   navegador ni repositorio y no uses el prefijo `NEXT_PUBLIC_`.
3. Para pruebas internas con esta compilación pendiente de verificar, configura
   `CHAT_JURIDICO_PRUEBA_IA=true`. Es una activación explícita de prueba, no una
   certificación de vigencia ni una habilitación pública de los documentos.
4. Reinicia el servidor y abre `/chat-juridico` con la cuenta autorizada.

La pregunta, hasta ocho fragmentos del mismo documento y sus notas legales
(incluidas las referencias de inconstitucionalidad) se envían a OpenAI. Se solicita
`store: false`; esto no equivale a un acuerdo de retención cero del proveedor.
Usa casos ficticios y comprueba las condiciones de tratamiento antes de usar datos
confidenciales. El cliente muestra las páginas del PDF, no inventa enlaces a una
URL oficial que todavía no se ha registrado.

## Alcance y controles

- Piloto del Código de Trabajo; no cubre todas las leyes salvadoreñas.
- Cada pregunta se procesa de forma independiente mediante búsqueda textual.
- Conversación solo en memoria de la página: al recargar se pierde. No hay
  historial sincronizado ni expedientes privados en PostgreSQL todavía.
- El servidor exige sesión, correo autorizado y origen válido; limita a diez
  consultas por cuenta cada quince minutos y acota cuerpo, longitud y respuesta.
- El proveedor debe devolver fuentes presentes en los fragmentos suministrados.
  Si falla, se agota el tiempo o devuelve citas inválidas, se muestran los
  documentos sin presentar la respuesta como una explicación generada válida.
- Validar las citas no verifica que todas las afirmaciones de la respuesta estén
  respaldadas. Falta evaluación jurídica, cotejo de tablas, reformas posteriores,
  búsqueda semántica y pruebas de precisión antes de habilitarlo a clientes.
- No se realizan acciones ni modificaciones de expedientes con el modelo.

## Verificación realizada

`node --test tests/legal-chat.test.cjs` cubre acceso cerrado por defecto,
activación explícita del piloto, límites del cuerpo, configuración del proveedor,
notas legales y rechazo de citas desconocidas y respuestas incompletas.

`npm run build` pasa. Se verificaron por HTTP con una base temporal: redirección
al login, errores 401/403, consulta autenticada con fuentes, proveedor sin clave,
consulta sin resultados, rechazo de entrada excesiva, página autenticada y
límite de frecuencia. Las respuestas de OpenAI se probaron con un proveedor
simulado; no se ha verificado una llamada real ni la calidad jurídica del modelo.
