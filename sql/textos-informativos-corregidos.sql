-- Textos originales con saltos de línea reales.
-- Ejecutar TODO el archivo conectado a adaptia (Alt+X).
BEGIN;

-- Lección 1: Fundamentos de Modelos Generativos (LLMs)
UPDATE public.ramas
SET contenido_teorico = $leccion_1$
# Fundamentos de Modelos Generativos (LLMs)

Un Modelo de Lenguaje Extenso (LLM, por sus siglas en inglés) es una de las arquitecturas más avanzadas dentro del campo de la Inteligencia Artificial y el aprendizaje profundo. A diferencia de los sistemas de software tradicionales basados en reglas condicionales rígidas, un LLM está diseñado para comprender, procesar y sintetizar lenguaje natural humano con un nivel de fluidez sin precedentes. Su funcionamiento no se basa en consultar una base de datos estática para encontrar la respuesta correcta, sino en analizar el texto introducido y calcular matemáticamente cómo debería continuar la conversación.

El concepto central para entender esta tecnología es la "predicción probabilística de tokens". Cuando ingresas un texto, el modelo lo descompone en fragmentos más pequeños llamados tokens, que pueden ser palabras completas, sílabas o letras. A partir de ahí, la red neuronal evalúa el contexto de toda tu frase y predice cuál es el siguiente token más probable, basándose en los inmensos volúmenes de texto que procesó durante su creación. Este proceso se repite a una velocidad vertiginosa, generando párrafos completos de manera fluida.

La gran revolución que hizo posibles a los LLMs modernos fue la introducción de la arquitectura Transformer y su mecanismo de "Atención" en 2017. Antes de esto, las inteligencias artificiales leían el texto de forma estrictamente lineal, olvidando el principio de una frase larga al llegar al final. El mecanismo de atención permite que el modelo evalúe simultáneamente todas las palabras de un prompt y asigne un peso o relevancia a la relación entre ellas, logrando capturar matices semánticos, sarcasmo y dependencias gramaticales a gran distancia.

Para que un LLM alcance este nivel de competencia, atraviesa dos fases críticas en su ciclo de vida. La primera es el Pre-entrenamiento, donde consume billones de tokens de internet (libros, artículos, código) para aprender la estructura del lenguaje y adquirir conocimiento general sobre el mundo. La segunda fase es la Alineación o Ajuste Fino, donde equipos humanos entrenan al modelo mediante recompensas (RLHF) para que deje de ser un simple autocompletador de texto y se comporte como un asistente útil, respetuoso y capaz de seguir instrucciones precisas.

A pesar de su potencia, estos modelos tienen límites estructurales importantes. Tienen una "fecha de corte", lo que significa que ignoran por completo los eventos mundiales ocurridos después de su entrenamiento. Además, carecen de memoria dinámica a largo plazo entre diferentes sesiones, y al basarse en probabilidades, son susceptibles de generar "alucinaciones" (afirmaciones falsas presentadas con total seguridad). Conocer estos límites es el primer paso para dominar su uso profesional.
$leccion_1$
WHERE nombre = 'Fundamentos de Modelos Generativos (LLMs)'
RETURNING id, nombre;

-- Lección 2: Anatomía y Estructura del Prompt
UPDATE public.ramas
SET contenido_teorico = $leccion_2$
# Anatomía y Estructura del Prompt

El Prompt Engineering o Ingeniería de Prompts es mucho más que simplemente "hablar con la Inteligencia Artificial". Se trata de una disciplina técnica enfocada en estructurar las entradas (inputs) de manera sistemática para maximizar la precisión, relevancia y utilidad de las salidas (outputs) generadas por el modelo. Un prompt bien diseñado elimina la ambigüedad y guía a la red neuronal a través de un camino predecible, transformando a la IA de un oráculo impredecible en una herramienta de trabajo rigurosa.

El primer componente indispensable de un prompt avanzado es la asignación de un Rol. Al indicarle al modelo "Actúa como un Auditor Financiero Senior" o "Asume el rol de un Desarrollador Full-Stack", estás calibrando estadísticamente el peso de sus respuestas. Esta simple instrucción ajusta automáticamente el vocabulario, el tono, la profundidad técnica y los marcos de referencia que la IA utilizará, garantizando que el resultado se adapte exactamente al contexto profesional que necesitas.

El segundo pilar es la definición clara de la Instrucción (Task) y el Contexto. La instrucción debe usar verbos de acción directos ("Resume", "Clasifica", "Extrae", "Compara") en lugar de peticiones ambiguas ("Háblame de"). El contexto, por su parte, es la información de fondo o los datos crudos sobre los cuales la IA debe operar. Sin contexto, el modelo intentará adivinar basándose en su conocimiento general; con contexto, se convierte en un procesador enfocado exclusivamente en la información que tú le has proporcionado.

Para asegurar que la respuesta sea utilizable, es vital establecer Restricciones y definir un Formato. Las restricciones son límites explícitos (por ejemplo, "No utilices jerga de marketing", "Limita tu respuesta a tres párrafos" o "Usa un tono estrictamente objetivo"). El formato exige que el modelo estructure su salida visualmente o a nivel de código, pidiéndole explícitamente que entregue el resultado como una tabla, una lista de viñetas, un archivo Markdown o un objeto JSON, evitando así bloques de texto inmanejables.

Finalmente, cuando se construyen prompts complejos que incluyen instrucciones largas y grandes bloques de texto de contexto, es obligatorio usar Delimitadores. Herramientas como triples comillas, asteriscos o etiquetas estilo XML sirven para separar las órdenes directas de los datos que deben ser procesados. Esto previene un error crítico conocido como "desbordamiento de contexto", donde el modelo se confunde y comienza a interpretar los datos de análisis como si fueran nuevas instrucciones del usuario.
$leccion_2$
WHERE nombre = 'Anatomía y Estructura del Prompt'
RETURNING id, nombre;

-- Lección 3: Privacidad y Reglas de Seguridad Básicas
UPDATE public.ramas
SET contenido_teorico = $leccion_3$
# Privacidad y Reglas de Seguridad Básicas

Al interactuar con Inteligencia Artificial generativa, la privacidad es una preocupación técnica de primer nivel. A diferencia de las aplicaciones tradicionales que procesan información localmente, los modelos de lenguaje públicos envían la información a servidores externos. Esto significa que cualquier dato introducido en tu prompt podría ser almacenado, revisado o utilizado para entrenar futuras versiones del modelo, exponiendo información confidencial si no se toman precauciones.

El riesgo más común en el diseño de prompts es la fuga involuntaria de Información de Identificación Personal (PII) o secretos comerciales. Introducir nombres reales de clientes, reportes financieros, contraseñas, claves de bases de datos o código fuente propietario en un chat público equivale a sacar esa información del perímetro seguro de una organización. Una vez enviados, eliminar esos registros de los servidores del proveedor es prácticamente imposible.

Para mitigar estos riesgos, la regla de oro es la anonimización o el enmascaramiento de los datos. Antes de enviar un contexto extenso al modelo, todos los identificadores sensibles deben ser reemplazados por variables ficticias. Por ejemplo, en lugar de utilizar un nombre y un correo real, se debe redactar el prompt usando marcadores como "[Cliente A]" y "[correo@empresa.com]", lo que permite a la IA ejecutar la tarea sin procesar información verídica.

Otra medida fundamental es gestionar las políticas de retención de datos y las opciones de exclusión voluntaria (Opt-Out). Muchas plataformas de IA permiten desactivar la opción que autoriza el uso de tu historial para entrenar sus sistemas. Es un paso obligatorio revisar la configuración de privacidad de la herramienta que utilices y asegurar que la información de tus prompts no alimente el conocimiento público del modelo fundacional.

Finalmente, a nivel de arquitectura de software, existe una diferencia crítica entre las interfaces gratuitas para consumidores y las APIs de nivel empresarial. Las conexiones por API comerciales suelen incluir acuerdos legales de "Cero Retención de Datos", donde la información enviada jamás se utiliza para entrenamiento. Comprender esta separación es indispensable para integrar la inteligencia artificial en procesos de negocio cumpliendo con las normativas de seguridad corporativa.
$leccion_3$
WHERE nombre = 'Privacidad y Reglas de Seguridad Básicas'
RETURNING id, nombre;

-- Lección 4: Buscadores Tradicionales vs. IA Generativa
UPDATE public.ramas
SET contenido_teorico = $leccion_4$
# Buscadores Tradicionales vs. IA Generativa

Comprender la diferencia fundamental entre un motor de búsqueda clásico y un modelo de lenguaje extenso (LLM) es vital para utilizar ambas herramientas con eficacia. Un buscador tradicional funciona como un enorme índice de internet; su objetivo es rastrear, clasificar y recuperar páginas web existentes que coincidan con las palabras clave introducidas. En contraste, la Inteligencia Artificial generativa no "busca" información en una base de datos de enlaces, sino que sintetiza respuestas nuevas y únicas prediciendo matemáticamente qué palabra debe seguir a la anterior basándose en su entrenamiento previo.

Esta diferencia arquitectónica determina cómo procesan la intención del usuario. Los buscadores dependen de la coincidencia de términos, el posicionamiento SEO y la popularidad de los sitios web para ofrecer resultados relevantes. Por su parte, la IA generativa destaca en la comprensión semántica profunda, lo que le permite procesar instrucciones complejas, inferir el contexto y responder a preguntas compuestas en un formato conversacional directo, sin obligar al usuario a navegar por múltiples enlaces para armar la respuesta por sí mismo.

Sin embargo, la frescura de la información marca un límite estricto. Los motores de búsqueda están conectados a la web en tiempo real, indexando noticias y eventos que suceden al instante. Por el contrario, un modelo fundacional estándar posee una "fecha de corte" de conocimiento, que corresponde al momento en que finalizó su fase de entrenamiento. Cualquier evento ocurrido después de esa fecha es desconocido para el modelo, a menos que se le integre una herramienta externa de navegación en vivo o se le proporcione la información reciente directamente dentro del prompt.

La verificabilidad de los datos es otro factor crítico de divergencia. Cuando utilizas un buscador, la responsabilidad de la información recae en la fuente original (la página web), y puedes evaluar rápidamente la credibilidad del autor mediante el enlace proporcionado. La IA generativa, al generar texto probabilístico, puede sufrir de "alucinaciones" —afirmaciones que suenan convincentes y estructuradas, pero que son factual o lógicamente falsas— y generalmente no incluye citas rastreables a menos que opere bajo una arquitectura avanzada como RAG (Retrieval-Augmented Generation).

En la práctica profesional, ambas tecnologías son complementarias. Los buscadores tradicionales son insustituibles para verificar hechos precisos, acceder a datos en tiempo real, buscar sitios web específicos y validar información crítica. La Inteligencia Artificial, en cambio, es la herramienta superior para tareas de razonamiento, resumen de documentos extensos, traducción contextual, redacción de correos, ideación y escritura de código, donde el valor reside en la generación y procesamiento de la información, no en su simple recuperación.
$leccion_4$
WHERE nombre = 'Buscadores Tradicionales vs. IA Generativa'
RETURNING id, nombre;

-- Lección 5: Formateo y Estructuración de Salidas (JSON, Markdown)
UPDATE public.ramas
SET contenido_teorico = $leccion_5$
# Formateo y Estructuración de Salidas (JSON, Markdown)

Uno de los mayores errores al interactuar con Inteligencia Artificial es permitir que el modelo decida cómo presentar la información, lo que generalmente resulta en bloques de texto plano difíciles de procesar. El formateo de salidas es la técnica de exigir al modelo que estructure su respuesta utilizando lenguajes de marcado ligeros o formatos de intercambio de datos estandarizados, convirtiendo el texto crudo en información lista para ser integrada de inmediato en otros sistemas o documentos de trabajo.

Markdown es el lenguaje de marcado preferido para la legibilidad humana. Al solicitar que la IA responda en Markdown, puedes garantizar que la salida incluya automáticamente títulos jerárquicos, listas con viñetas, texto en negrita para resaltar conceptos clave y tablas comparativas ordenadas. Esto elimina la necesidad de reformatear manualmente la información en un procesador de texto, acelerando la creación de informes, documentación de proyectos y minutas de reuniones de manera exponencial.

Por otro lado, cuando el objetivo es la automatización de procesos o la integración con software, JSON (JavaScript Object Notation) es el estándar absoluto. En lugar de pedirle al modelo un resumen descriptivo, puedes ordenarle que extraiga variables específicas —como nombres, fechas o montos— y las estructure en un formato de clave-valor estricto. Esto permite que el resultado generado por la IA sea consumido directamente por una base de datos, una API web o una aplicación sin intervención manual.

Para lograr que la IA respete estos formatos de manera consistente, el prompt debe incluir instrucciones directas y explícitas. No basta con decir "formatea como tabla"; es necesario especificar las columnas exactas deseadas. En el caso de JSON, la práctica más segura es proporcionar una plantilla o esquema vacío dentro del prompt (ejemplo: `{"cliente": "", "total": 0}`), indicándole al modelo que rellene los valores faltantes sin alterar la estructura de las llaves, corchetes y comillas, minimizando así los errores de sintaxis.

Dominar la estructuración de salidas transforma a la IA generativa de un simple generador de texto a un potente motor de procesamiento de datos. Al aplicar sistemáticamente Markdown para la lectura humana y JSON para la comunicación entre máquinas, los usuarios aseguran que las respuestas de los modelos sean predecibles, consistentes y directamente aplicables en flujos de trabajo empresariales.
$leccion_5$
WHERE nombre = 'Formateo y Estructuración de Salidas (JSON, Markdown)'
RETURNING id, nombre;

-- Lección 6: Técnicas de Resumen y Extracción de Información
UPDATE public.ramas
SET contenido_teorico = $leccion_6$
# Técnicas de Resumen y Extracción de Información

El procesamiento de grandes volúmenes de texto es una de las capacidades más potentes y utilizadas de los Modelos de Lenguaje Extensos (LLMs). A diferencia de un lector humano que puede sufrir fatiga cognitiva al revisar documentos extensos, la inteligencia artificial puede analizar miles de palabras en segundos. Sin embargo, para obtener resultados precisos y útiles, es fundamental dominar las técnicas específicas tanto de resumen como de extracción de información, ya que ambas cumplen propósitos radicalmente distintos.

Resumir consiste en condensar las ideas principales de un texto, reduciendo su longitud mientras se preserva el mensaje central y el contexto. Al solicitar un resumen, el prompt debe definir claramente la audiencia objetivo y el nivel de detalle esperado. Por ejemplo, "Resume este reporte para un ejecutivo ocupado en tres viñetas" generará un resultado muy diferente a "Resume los métodos técnicos de este documento para un equipo de ingeniería". Establecer restricciones de longitud y formato es clave para evitar que el modelo simplemente recorte párrafos originales.

Por otro lado, la extracción de información es un proceso quirúrgico. Su objetivo no es interpretar ni condensar, sino aislar puntos de datos específicos dentro de un mar de texto, como nombres, fechas, montos financieros o correos electrónicos. Para una extracción exitosa, el prompt debe listar explícitamente las variables a buscar y prohibir al modelo que invente datos si no los encuentra. Una instrucción como "Extrae el nombre del cliente y el monto total; si algún dato falta, escribe 'No especificado'" previene alucinaciones y asegura la integridad de los datos.

Un factor crítico al trabajar con documentos largos es la "ventana de contexto" del modelo, que es el límite máximo de información que puede procesar en una sola interacción. Si un documento supera este límite, el modelo puede truncar el texto o perder detalles importantes del medio (un fenómeno conocido como "pérdida en el medio"). Para documentos extremadamente largos, suele ser necesario dividir el texto en fragmentos más pequeños y procesarlos por separado, aunque las versiones más modernas de IA están ampliando drásticamente esta capacidad.

Finalmente, la combinación de extracción y formato de salida eleva el nivel de automatización. Si solicitas que la extracción de datos se entregue directamente en formato JSON o como una tabla delimitada por comas (CSV), puedes conectar inmediatamente la salida de la IA con bases de datos o software de análisis. Dominar la diferencia entre condensar ideas y aislar datos estructurados te permitirá reducir horas de lectura manual a simples segundos de procesamiento automatizado.
$leccion_6$
WHERE nombre = 'Técnicas de Resumen y Extracción de Información'
RETURNING id, nombre;

-- Lección 7: Ajuste de Tono y Traducción Contextual
UPDATE public.ramas
SET contenido_teorico = $leccion_7$
# Ajuste de Tono y Traducción Contextual

El ajuste de tono es una de las aplicaciones más prácticas y potentes de los modelos generativos en el entorno empresarial. No se trata simplemente de cambiar palabras formales por informales, sino de adaptar el vocabulario, el ritmo y el nivel de empatía de un mensaje para que resuene de manera óptima con un receptor específico. Un mismo informe técnico puede ser transformado en un correo conciliador para un cliente molesto o en un resumen ejecutivo directo para un director general, conservando intactos los datos críticos.

Para lograr un ajuste de tono efectivo, el prompt debe ir más allá de adjetivos genéricos como "hazlo profesional". Las mejores prácticas indican que se debe proveer un rol explícito y directrices emocionales claras. Por ejemplo, una instrucción como "Reescribe este correo asumiendo el rol de un gerente de cuenta empático, eliminando cualquier lenguaje defensivo y enfocándote en la resolución proactiva del problema" garantiza que la inteligencia artificial modifique la estructura del mensaje sin perder la intención original.

En paralelo, esta capacidad de adaptación semántica revoluciona la traducción de textos. Los motores de traducción tradicionales operan mediante un mapeo literal de palabras, lo que frecuentemente destruye modismos, expresiones culturales y el tono original del mensaje. En contraste, un Modelo de Lenguaje Extenso (LLM) realiza una traducción contextual, comprendiendo primero el significado profundo de la oración para luego generar su equivalente natural en el idioma de destino.

Para aprovechar esta traducción avanzada, es fundamental incluir contexto en el prompt. Si simplemente pides "Traduce esto al español", el modelo optará por una versión estándar y neutra. Sin embargo, si indicas "Traduce esta campaña de marketing al español de El Salvador, manteniendo un tono persuasivo, enérgico y orientado a jóvenes universitarios", el modelo ajustará su redacción para incluir el vocabulario regional y la energía publicitaria requerida, logrando un texto mucho más persuasivo.

A pesar de la alta capacidad de los LLMs para estas tareas, la revisión humana sigue siendo indispensable. Los modelos pueden incurrir en el "valle inquietante" textual, generando mensajes que suenan artificialmente entusiastas o utilizando coloquialismos de manera forzada. El proceso ideal es iterativo: generar una primera versión con la IA, identificar qué fragmentos no suenan naturales, y pedirle al modelo que ajuste específicamente esas oraciones hasta alcanzar la perfección.
$leccion_7$
WHERE nombre = 'Ajuste de Tono y Traducción Contextual'
RETURNING id, nombre;

-- Lección 8: Brainstorming y Lluvia de Ideas Asistida
UPDATE public.ramas
SET contenido_teorico = $leccion_8$
# Brainstorming y Lluvia de Ideas Asistida

El uso de Inteligencia Artificial para el "brainstorming" o lluvia de ideas no consiste en pedirle a la máquina que haga el trabajo creativo por ti, sino en utilizarla como un socio estratégico para superar el síndrome de la página en blanco. Los LLMs destacan en el pensamiento divergente; al haber sido entrenados con vastas cantidades de conocimiento humano, pueden conectar conceptos de industrias, disciplinas y contextos que a un operador humano podrían pasarle desapercibidos en una primera instancia.

El error más común al idear con IA es formular prompts genéricos y abiertos, como "dame 10 ideas para una campaña de marketing". Esto inevitablemente produce resultados clichés y predecibles. Para desbloquear la verdadera creatividad del modelo, el prompt debe estar cargado de restricciones. Incorporar limitaciones de presupuesto, definir un público objetivo muy de nicho o exigir el uso de una temática poco convencional fuerza a la red neuronal a explorar caminos probabilísticos menos comunes, generando ideas más innovadoras.

Una técnica avanzada para la lluvia de ideas es la iteración conversacional. En lugar de pedir una lista definitiva en un solo intento, puedes pedirle al modelo que genere conceptos base y luego aplicar la regla de la improvisación "Sí, y...". Tomas la idea número tres generada por la IA y le pides: "Me gusta el tercer concepto. Ahora, expándelo y combínalo con una estrategia de gamificación móvil". Este rebote de ideas permite esculpir el resultado paso a paso.

Otra estrategia sumamente efectiva es la ideación basada en roles. Puedes pedirle a la IA que aborde un problema asumiendo la perspectiva de una figura específica o un arquetipo profesional. Prompts como "Analiza este problema de logística como si fueras un experto en eficiencia de Toyota" o "¿Cómo resolvería este desafío de diseño Steve Jobs?" cambian radicalmente el enfoque de la respuesta, obligando al modelo a aplicar los principios y el vocabulario asociados a esas personalidades o filosofías.

En última instancia, en el proceso de brainstorming asistido por IA, el rol de la máquina es proporcionar el volumen y la diversidad de opciones, mientras que el rol del humano es la curaduría y el juicio crítico. El modelo inevitablemente generará tanto sugerencias brillantes como ideas impracticables. La habilidad del Prompt Engineer reside en saber filtrar, refinar y validar los mejores conceptos para adaptarlos a la realidad del proyecto.
$leccion_8$
WHERE nombre = 'Brainstorming y Lluvia de Ideas Asistida'
RETURNING id, nombre;

-- Lección 9: Automatización de Tareas Administrativas
UPDATE public.ramas
SET contenido_teorico = $leccion_9$
# Automatización de Tareas Administrativas

La automatización de tareas administrativas es uno de los casos de uso más rentables y de rápida implementación para la Inteligencia Artificial en el entorno corporativo. Diariamente, los profesionales invierten horas en actividades rutinarias como redactar correos, estructurar minutas de reuniones, o dar formato a listas de datos. Delegar esta carga operativa a un Modelo de Lenguaje Extenso (LLM) permite liberar capacidad cognitiva y redirigir el tiempo hacia tareas de mayor valor estratégico y toma de decisiones.

Una de las aplicaciones más frecuentes es la gestión de comunicaciones. En lugar de redactar un correo electrónico desde cero, puedes proporcionar a la IA un contexto mínimo, como "Redacta un correo formal al proveedor cancelando el pedido #452 por retraso en la entrega, pero mantén la puerta abierta para futuros negocios". El modelo generará una plantilla profesional en segundos. De manera similar, se puede alimentar a la IA con un hilo largo de correos y pedirle que resuma los puntos clave y proponga una respuesta adecuada.

El procesamiento de transcripciones y minutas de reuniones es otra área donde la IA brilla excepcionalmente. Al finalizar una videollamada, la transcripción cruda suele ser extensa y difícil de leer. Un prompt estructurado como "Toma esta transcripción, genera un resumen ejecutivo, lista los acuerdos tomados y crea una tabla con las tareas asignadas y sus responsables" transforma texto caótico en un documento de gestión de proyectos estructurado, eliminando el trabajo manual de transcripción y síntesis.

Además de la generación de texto, los LLMs son herramientas altamente eficaces para la limpieza y estandarización de datos no estructurados. Si tienes una lista de contactos con formatos inconsistentes (nombres en minúsculas, teléfonos sin código de área), puedes usar un prompt para que la IA normalice toda la información y la devuelva en un formato tabular o CSV, lista para ser importada a un CRM o base de datos.

A pesar de la eficiencia que aporta, la automatización administrativa con IA requiere una supervisión humana innegociable (Human-in-the-Loop). La IA puede interpretar mal un matiz en un correo o asignar incorrectamente una tarea en una minuta. Por lo tanto, el flujo de trabajo correcto no es "generar y enviar", sino "generar, revisar, ajustar y enviar". Adoptar esta mentalidad garantiza velocidad operativa sin comprometer la calidad ni la precisión profesional.
$leccion_9$
WHERE nombre = 'Automatización de Tareas Administrativas'
RETURNING id, nombre;

-- Lección 10: Evaluación Final: Nivel Básico
UPDATE public.ramas
SET contenido_teorico = $leccion_10$
# Evaluación Final: Nivel Básico

Has llegado a la culminación del Módulo Básico. A lo largo de estas lecciones, has transitado desde la comprensión teórica de qué es un Modelo de Lenguaje Extenso y cómo predice tokens matemáticamente, hasta la aplicación práctica de técnicas de estructuración. Has aprendido que el Prompt Engineering no es una conversación casual, sino una disciplina rigurosa que exige roles claros, instrucciones precisas, contexto, restricciones y formatos de salida bien definidos.

Durante este recorrido, también establecimos las reglas inquebrantables de seguridad y privacidad. Comprendiste el riesgo crítico de exponer Información de Identificación Personal (PII) o datos corporativos en plataformas públicas, y dominaste la técnica de anonimización para proteger el entorno de trabajo. Además, marcamos la línea divisoria entre cuándo utilizar un buscador tradicional para recuperar datos verificables y cuándo emplear la IA generativa para sintetizar información nueva.

Posteriormente, exploramos cómo tomar control absoluto sobre las salidas del modelo. Aprendiste a abandonar el texto plano para exigir formatos estructurados como Markdown o JSON, facilitando la integración con otras herramientas. Diferenciaste entre la condensación de ideas mediante resúmenes y la precisión quirúrgica requerida para la extracción de datos, aplicando estas habilidades en la automatización de tareas administrativas, el ajuste de tono y las sesiones de lluvia de ideas asistida.

Esta evaluación final está diseñada para poner a prueba tu dominio sobre todos estos conceptos fundamentales. Te enfrentarás a un cuestionario integral que validará si has interiorizado la anatomía del prompt y si eres capaz de identificar antipatrones comunes y riesgos de seguridad en escenarios prácticos. Responder correctamente demostrará que posees una base sólida y técnica sobre el funcionamiento de los LLMs en el mundo real.

Al superar esta prueba, estarás listo para desbloquear el Módulo Intermedio. En la próxima etapa del curso, profundizaremos en técnicas de mitigación de alucinaciones, la gestión avanzada de la ventana de contexto, el diseño de prompts tipo Few-Shot y Chain of Thought, y la aplicación de la IA en el análisis de datos complejos. Tómate tu tiempo, lee cada pregunta con atención y demuestra tu dominio del nivel básico.
$leccion_10$
WHERE nombre = 'Evaluación Final: Nivel Básico'
RETURNING id, nombre;

COMMIT;
