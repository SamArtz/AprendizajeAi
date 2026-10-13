-- Textos originales de Intermedio con saltos de línea reales.
-- Ejecutar TODO el archivo conectado a adaptia (Alt+X).
BEGIN;

-- Lección 1: Identificación y Manejo de Alucinaciones
UPDATE public.ramas
SET contenido_teorico = $intermedio_1$
# Identificación y Manejo de Alucinaciones

Una "alucinación" en el contexto de la Inteligencia Artificial generativa ocurre cuando un Modelo de Lenguaje Extenso (LLM) produce una respuesta que es gramaticalmente correcta y suena extremadamente convincente, pero que es factual o lógicamente falsa. A diferencia de un error de software tradicional que arroja un código de falla, una alucinación se presenta con total seguridad. Esto sucede porque el modelo no consulta una base de datos de verdades absolutas, sino que calcula probabilísticamente qué palabra debería seguir a la anterior.

Las causas de las alucinaciones son variadas. Frecuentemente ocurren cuando se le pide al modelo información sobre eventos posteriores a su fecha de corte de entrenamiento, o cuando se le exige procesar un prompt altamente ambiguo. En su intento por ser útil y cumplir con la instrucción a toda costa, la red neuronal "rellena los vacíos" de su conocimiento inventando nombres, fechas, citas bibliográficas o enlaces web que simplemente no existen en el mundo real.

Detectar estas anomalías es una de las habilidades más críticas de un Prompt Engineer. Las alucinaciones bibliográficas (inventar libros o estudios) y las alucinaciones matemáticas son las más comunes. La técnica principal de detección consiste en el escrutinio cruzado: nunca asumir que un dato estadístico, una cita legal o un bloque de código complejo es correcto en el primer intento sin validarlo externamente, especialmente si el modelo no fue alimentado con un documento de referencia estricto en el prompt.

Para mitigar este riesgo desde la estructura del prompt, la técnica más efectiva es proporcionar una vía de escape explícita. Incluir instrucciones como "Responde basándote únicamente en el texto proporcionado; si la respuesta no se encuentra en el texto, responde textualmente 'No hay suficiente información'" reduce drásticamente la tasa de invención. Obligar al modelo a citar la sección exacta del contexto provisto también ancla su generación probabilística a datos reales.

En entornos empresariales, el manejo de alucinaciones es la barrera principal entre un prototipo de IA y un producto en producción. Entender que el modelo es un motor de razonamiento sintáctico y no una base de datos factual es el primer paso. Al implementar controles estrictos, validación cruzada y prompts defensivos, los profesionales pueden aprovechar la fluidez de la IA minimizando el riesgo de propagar desinformación corporativa o académica.
$intermedio_1$
WHERE nombre = 'Identificación y Manejo de Alucinaciones'
  AND modulo IN ('Intermedio', 'Módulo Intermedio')
RETURNING id, nombre;

-- Lección 2: Asignación de Roles y Personas (Role-prompting)
UPDATE public.ramas
SET contenido_teorico = $intermedio_2$
# Asignación de Roles y Personas (Role-prompting)

El "Role-prompting" o asignación de roles es una técnica de nivel intermedio que consiste en instruir al modelo de lenguaje para que asuma una identidad, profesión o arquetipo específico antes de ejecutar una tarea. Al iniciar un prompt con "Actúa como un Arquitecto de Software Senior con 15 años de experiencia en ciberseguridad", no solo estás decorando la instrucción, sino que estás modificando drásticamente el espacio latente de la red neuronal del que se extraerán las respuestas.

A nivel estadístico, cuando asignas un rol, el modelo ajusta instantáneamente sus probabilidades de predicción de tokens para coincidir con el vocabulario, las restricciones y las prioridades de esa profesión. Un "redactor de marketing" priorizará palabras persuasivas y cierres emocionales, mientras que un "auditor contable" adoptará un tono escéptico, analítico y centrado en la mitigación de riesgos, incluso si a ambos se les entrega exactamente el mismo texto base para analizar.

Para que la asignación de un rol sea verdaderamente efectiva, debe contar con tres dimensiones: el título, el nivel de experiencia y el enfoque metodológico. Un rol deficiente sería "Eres un programador". Un rol avanzado sería "Eres un Desarrollador Full-Stack experto en Next.js; tu objetivo es revisar este código buscando vulnerabilidades, priorizando el rendimiento y explicando tus correcciones de manera didáctica para un estudiante". Cuanta más resolución tenga el personaje, mayor será la precisión técnica de la salida.

Un antipatrón común en esta técnica es la saturación o el conflicto de roles. Pedirle al modelo que "actúe como un abogado corporativo y también como un comediante de stand-up" genera instrucciones contradictorias que degradan la calidad del resultado, provocando que la IA oscile torpemente entre jerga legal y chistes fuera de lugar. Si se requiere analizar un problema desde múltiples perspectivas, es preferible utilizar iteraciones separadas o pedirle que actúe como un panel de debate con voces delimitadas.

En aplicaciones empresariales avanzadas, el role-prompting se utiliza para simular escenarios ("Red Teaming"). Puedes pedirle a la IA que actúe como un cliente hostil para entrenar a tu equipo de soporte, o que asuma el rol de un hacker intentando vulnerar la lógica de tu sistema. Dominar la construcción de personas permite transformar un modelo de lenguaje generalista en un especialista temporal altamente calibrado para la tarea en cuestión.
$intermedio_2$
WHERE nombre = 'Asignación de Roles y Personas (Role-prompting)'
  AND modulo IN ('Intermedio', 'Módulo Intermedio')
RETURNING id, nombre;

-- Lección 3: Límites de Tokens y Estructura de Precios
UPDATE public.ramas
SET contenido_teorico = $intermedio_3$
# Límites de Tokens y Estructura de Precios

Para comprender cómo interactúan financieramente y técnicamente los modelos generativos, primero se debe entender el concepto de "token". Un token no es necesariamente una palabra completa; es el fragmento básico de texto que el modelo procesa. En idiomas como el inglés, un token equivale a aproximadamente tres cuartas partes de una palabra, pero en idiomas como el español o en lenguajes de programación, una sola palabra puede dividirse en múltiples tokens. Esta fragmentación es la unidad de medida universal en la Inteligencia Artificial.

Todo modelo de lenguaje posee un límite estricto de tokens que puede procesar en una sola interacción, conocido como su capacidad máxima. Este límite abarca tanto los tokens de entrada (tu prompt y el contexto) como los tokens de salida (la respuesta generada). Si tu solicitud excede este tope, el modelo arrojará un error o simplemente truncará la información, cortando la respuesta abruptamente antes de finalizar la idea, lo que puede romper integraciones de software automatizadas.

Comercialmente, el uso de las APIs de los LLMs se factura en función de este consumo, generalmente calculando el costo por cada 1,000 o 1,000,000 de tokens procesados. Es crucial destacar que los proveedores de IA aplican tarifas diferenciadas: los tokens de entrada o contexto suelen ser considerablemente más baratos que los tokens de salida. Esto significa que enviarle a la IA un documento largo para que lo lea es mucho más económico que pedirle que redacte un documento largo desde cero.

Frente a esta estructura, la optimización de prompts se convierte en una habilidad financiera. Eliminar palabras innecesarias, saludos, cortesías ("por favor", "gracias") y formatear el contexto de manera densa reduce el consumo. Además, traducir flujos de trabajo internos al idioma inglés antes de procesarlos puede llegar a ahorrar hasta un 30% en costos de API, ya que los modelos fueron entrenados principalmente en este idioma y tokenizan sus palabras de manera mucho más eficiente.

Finalmente, la elección del modelo adecuado dictará el balance entre costo y capacidad. No todas las tareas requieren el modelo más avanzado y costoso del mercado. Para tareas sencillas de clasificación o extracción, un modelo más pequeño y rápido puede realizar el trabajo por una fracción del precio. Comprender los límites de tokens permite a los arquitectos de sistemas diseñar soluciones escalables, eligiendo el modelo correcto para cada nivel de complejidad sin agotar el presupuesto operativo.
$intermedio_3$
WHERE nombre = 'Límites de Tokens y Estructura de Precios'
  AND modulo IN ('Intermedio', 'Módulo Intermedio')
RETURNING id, nombre;

-- Lección 4: Gestión de Ventanas de Contexto (Context Windows)
UPDATE public.ramas
SET contenido_teorico = $intermedio_4$
# Gestión de Ventanas de Contexto (Context Windows)

La "Ventana de Contexto" es la memoria a corto plazo de un modelo de lenguaje. Representa la cantidad máxima de información (medida en tokens) que la inteligencia artificial puede retener y considerar activamente durante una sola generación de respuesta. Una vez que la conversación o el documento proporcionado supera este límite, el modelo comienza a "olvidar" la información más antigua, lo que provoca respuestas descontextualizadas o la incapacidad de seguir instrucciones que se dieron al principio de la interacción.

Incluso si no superas el límite técnico de la ventana, existe un problema documentado conocido como "Lost in the Middle" (Pérdida en el medio). Numerosos estudios sobre la arquitectura Transformer han demostrado que los LLMs prestan una atención desproporcionadamente alta a los datos ubicados al principio y al final del prompt, pero tienden a ignorar o degradar la calidad de análisis de la información que se encuentra enterrada en la mitad del texto. Por ello, la posición de las instrucciones críticas es vital.

Para gestionar adecuadamente estas ventanas, la principal estrategia es la técnica de fragmentación (Chunking). Cuando te enfrentas a un documento que excede la memoria del modelo, no debes ingresarlo completo. El documento debe dividirse en secciones más pequeñas y lógicas, procesando cada fragmento de manera secuencial o en paralelo. Posteriormente, puedes tomar los resúmenes o extracciones de cada fragmento y pasarlos por un prompt final consolidador.

Otra práctica indispensable en el diseño de interfaces conversacionales es la limpieza periódica del contexto. En los chats de asistencia impulsados por IA, cada mensaje nuevo vuelve a enviar todo el historial previo al modelo, lo que incrementa el costo por token y satura la ventana rápidamente. Es responsabilidad del sistema o del usuario reiniciar la conversación cuando se cambia de tema, evitando arrastrar "basura" de tokens irrelevantes que solo confunden al modelo y encarecen la consulta.

A medida que los proveedores lanzan modelos con ventanas de contexto masivas, surge la tentación de volcar bases de datos enteras en un solo prompt. Sin embargo, la eficiencia computacional dicta lo contrario: introducir solo el contexto estrictamente necesario siempre producirá resultados más precisos, económicos y rápidos que obligar al modelo a encontrar una aguja en un inmenso pajar de tokens.
$intermedio_4$
WHERE nombre = 'Gestión de Ventanas de Contexto (Context Windows)'
  AND modulo IN ('Intermedio', 'Módulo Intermedio')
RETURNING id, nombre;

-- Lección 5: Sesgos, Ética y Discriminación Algorítmica
UPDATE public.ramas
SET contenido_teorico = $intermedio_5$
# Sesgos, Ética y Discriminación Algorítmica

Los modelos de lenguaje no son entidades objetivas; son espejos de los datos con los que fueron entrenados. Dado que su conocimiento proviene de vastas recopilaciones de internet, los LLMs absorben irremediablemente los prejuicios, estereotipos y sesgos históricos de la humanidad. Comprender esta limitación es el primer paso para un uso ético de la Inteligencia Artificial, ya que confiar ciegamente en sus salidas puede perpetuar la discriminación a escala masiva.

La discriminación algorítmica ocurre cuando un modelo toma o sugiere decisiones que perjudican injustamente a ciertos grupos basándose en género, raza o nivel socioeconómico. Por ejemplo, si se utiliza un LLM para filtrar currículums sin controles estrictos, podría penalizar automáticamente a candidatos de ciertas universidades o regiones simplemente porque los datos históricos de contratación de la empresa reflejaban ese sesgo. La IA no razona sobre la justicia, solo replica patrones estadísticos.

Como Prompt Engineer, tienes la responsabilidad técnica de mitigar estos sesgos a través de instrucciones explícitas. Un prompt ético y defensivo incluye directrices directas como: "Analiza estos perfiles de manera estrictamente objetiva, ignorando variables de género, edad o nacionalidad, y basándote únicamente en las métricas de rendimiento descritas". Obligar al modelo a justificar su razonamiento paso a paso también ayuda a visibilizar y corregir posibles sesgos ocultos.

Más allá del sesgo, la ética en la IA abarca la transparencia y el respeto a la propiedad intelectual. Es una mala práctica profesional, e incluso un riesgo legal, hacer pasar el texto generado por IA como trabajo humano original en contextos donde la autoría es crítica. La transparencia de declarar cuándo un documento fue redactado o asistido por IA fomenta la confianza y protege a la organización de acusaciones de plagio o fraude.

Finalmente, la auditoría continua es esencial. Antes de desplegar una solución basada en LLMs en un entorno de producción, los resultados deben someterse a pruebas de estrés con casos extremos y perfiles diversos para garantizar su equidad. La Inteligencia Artificial es una herramienta de amplificación: si se alimenta con instrucciones éticas y controladas, amplifica la eficiencia; si se deja sin supervisión, amplificará la injusticia.
$intermedio_5$
WHERE nombre = 'Sesgos, Ética y Discriminación Algorítmica'
  AND modulo IN ('Intermedio', 'Módulo Intermedio')
RETURNING id, nombre;

-- Lección 6: Técnicas de Iteración de Prompts
UPDATE public.ramas
SET contenido_teorico = $intermedio_6$
# Técnicas de Iteración de Prompts

Un mito común en el Prompt Engineering es la expectativa del "prompt perfecto" al primer intento. En la realidad profesional, el diseño de instrucciones para modelos generativos es un proceso profundamente iterativo y experimental. Rara vez el primer borrador de un prompt entregará el resultado óptimo, ya sea porque la instrucción fue demasiado ambigua, el contexto fue insuficiente o el modelo interpretó la tarea desde un ángulo inesperado.

El ciclo de iteración comienza con la generación de un borrador o "Zero Draft". Se envía una instrucción base al modelo y se analiza críticamente la respuesta. En lugar de borrar todo y empezar de cero si el resultado falla, el objetivo es identificar la brecha exacta entre lo obtenido y lo deseado. ¿El tono es incorrecto? ¿La estructura es caótica? ¿Inventó datos? Identificar el error específico dicta qué componente del prompt debe ajustarse en la siguiente ronda.

Una técnica fundamental de iteración es aislar variables. Si decides cambiar el rol, agregar tres restricciones nuevas y modificar el formato de salida todo al mismo tiempo, no sabrás qué cambio mejoró o empeoró la respuesta. Es recomendable aplicar un enfoque de pruebas A/B: modifica un solo elemento estructural a la vez y observa cómo impacta el comportamiento del modelo. Esto permite construir prompts robustos de manera metódica y replicable.

Las "restricciones negativas" suelen ser el ajuste más efectivo durante la iteración. Cuando un modelo insiste en incluir elementos indeseados, como jerga técnica innecesaria o una introducción demasiado larga, la solución no siempre es pedirle que sea más directo, sino prohibirle explícitamente el comportamiento. Añadir cláusulas como "Omite cualquier introducción de cortesía, no uses listas numeradas y excluye la palabra 'innovador'" refina drásticamente la salida.

Sin embargo, la iteración también requiere saber cuándo detenerse. Existe un punto de rendimientos decrecientes donde invertir 20 minutos ajustando un prompt para corregir una sola oración es menos eficiente que aceptar una salida al 90% y hacer la corrección manual. El objetivo de iterar no es lograr que la IA reemplace el criterio humano por completo, sino automatizar el grueso del trabajo pesado para facilitar la edición final.
$intermedio_6$
WHERE nombre = 'Técnicas de Iteración de Prompts'
  AND modulo IN ('Intermedio', 'Módulo Intermedio')
RETURNING id, nombre;

-- Lección 7: Few-Shot y Zero-Shot Prompting
UPDATE public.ramas
SET contenido_teorico = $intermedio_7$
# Few-Shot y Zero-Shot Prompting

El concepto de "Zero-Shot Prompting" se refiere a la capacidad de un modelo de lenguaje para ejecutar una tarea sin haber recibido ejemplos previos dentro de la instrucción. Cuando le pides a la IA "Traduce esta frase al francés" y lo hace correctamente, estás utilizando una estrategia Zero-Shot. Esta técnica es ideal para tareas genéricas, de conocimiento común o de bajo nivel de complejidad, aprovechando el pre-entrenamiento base de la red neuronal.

Sin embargo, cuando la tarea exige un formato muy específico, un tono corporativo particular o un análisis lógico que se desvía del estándar, el Zero-Shot suele fallar. Es aquí donde interviene el "Few-Shot Prompting" (Prompting de pocos ejemplos). Esta técnica consiste en incluir dentro del contexto del prompt un conjunto de ejemplos de "entrada" y "salida" deseada antes de presentar el problema real que el modelo debe resolver, calibrando así sus pesos probabilísticos hacia el patrón exacto que necesitas.

Estructurar un buen prompt Few-Shot requiere precisión y consistencia. Los ejemplos deben estar claramente delimitados, preferiblemente utilizando etiquetas como "Entrada:" y "Salida:", o formatos estructurados como JSON. Si los ejemplos que proporcionas tienen inconsistencias entre sí (por ejemplo, en uno respondes con un párrafo completo y en otro con una sola palabra), el modelo se confundirá y la calidad de la respuesta final se degradará significativamente.

Un factor crucial al aplicar esta técnica es la selección de la muestra. Los ejemplos elegidos (comúnmente entre 3 y 5) deben abarcar la diversidad de los casos extremos (edge cases) que el modelo podría encontrar. Si estás entrenando al modelo para clasificar la urgencia de correos electrónicos de clientes, no basta con incluir solo ejemplos de correos "Urgentes"; debes incluir correos "Normales" y correos "Spam" para que la red neuronal aprenda a trazar los límites entre las categorías.

En el entorno empresarial, el Few-Shot es una herramienta indispensable para la extracción de datos complejos y el análisis de sentimientos. Permite "enseñar" temporalmente al modelo reglas de negocio específicas de tu organización sin necesidad de incurrir en los altos costos de reentrenar la base de datos subyacente (Fine-Tuning), logrando resultados altamente personalizados con tan solo modificar el texto del prompt.
$intermedio_7$
WHERE nombre = 'Few-Shot y Zero-Shot Prompting'
  AND modulo IN ('Intermedio', 'Módulo Intermedio')
RETURNING id, nombre;

-- Lección 8: Cadena de Pensamiento (Chain of Thought - CoT)
UPDATE public.ramas
SET contenido_teorico = $intermedio_8$
# Cadena de Pensamiento (Chain of Thought - CoT)

La técnica de "Chain of Thought" (Cadena de Pensamiento) es una de las metodologías más revolucionarias descubiertas en el Prompt Engineering avanzado. Su premisa es sencilla pero poderosa: en lugar de exigirle al modelo de lenguaje que salte directamente a la respuesta final de un problema complejo, se le obliga a generar y explicar paso a paso su razonamiento lógico intermedio. Esta descomposición de la tarea reduce drásticamente las alucinaciones matemáticas y lógicas.

El funcionamiento técnico detrás de CoT radica en cómo los modelos generativos procesan la información. Al generar texto paso a paso, cada "token" de razonamiento producido se convierte en parte del contexto para el siguiente token. Si el modelo intenta resolver una ecuación matemática compleja de un solo golpe, es probable que falle estadísticamente; pero si primero describe las variables, luego plantea la fórmula y finalmente resuelve la operación, utiliza su propia salida intermedia como un ancla para llegar a la respuesta correcta.

Existen dos formas principales de implementar esta técnica. El "Zero-Shot CoT" consiste simplemente en añadir la frase mágica "Pensemos paso a paso" (Let's think step by step) al final de cualquier instrucción. Este simple añadido fuerza al modelo a estructurar su respuesta lógicamente. Por otro lado, el "Few-Shot CoT" implica proporcionarle al modelo ejemplos previos donde no solo se muestra la entrada y la salida, sino que se incluye todo el párrafo de razonamiento que conecta a ambas.

El impacto de esta técnica es masivo en áreas que requieren inferencia compleja, como la resolución de acertijos de lógica, la depuración de código de programación (debugging), el análisis legal y el cálculo financiero. En lugar de recibir un simple "Sí" o "No" que podría ser una alucinación, el usuario recibe una auditoría transparente del proceso mental de la IA, lo que permite identificar en qué punto exacto la máquina se equivocó si la respuesta final resulta ser incorrecta.

No obstante, la Cadena de Pensamiento tiene un costo operativo directo. Al forzar al modelo a escribir múltiples párrafos de justificación antes de llegar a la conclusión, se incrementa significativamente el consumo de tokens de salida. Esto significa que la generación será más lenta y económicamente más costosa a través de APIs. Por lo tanto, el uso de CoT debe reservarse estratégicamente para tareas de alta complejidad donde la precisión lógica sea absolutamente crítica.
$intermedio_8$
WHERE nombre = 'Cadena de Pensamiento (Chain of Thought - CoT)'
  AND modulo IN ('Intermedio', 'Módulo Intermedio')
RETURNING id, nombre;

-- Lección 9: Análisis de Datos Estructurados con IA
UPDATE public.ramas
SET contenido_teorico = $intermedio_9$
# Análisis de Datos Estructurados con IA

Aunque los Modelos de Lenguaje Extensos (LLMs) son conocidos por su fluidez en el procesamiento de texto libre, su capacidad para analizar datos estructurados (como archivos CSV, tablas de Excel o bases de datos SQL) ha abierto una nueva frontera en la analítica de negocios. La Inteligencia Artificial puede actuar como un analista de datos virtual, capaz de identificar tendencias, resumir métricas clave y generar reportes financieros a partir de matrices numéricas, siempre y cuando se estructuren correctamente las instrucciones de entrada.

El primer paso para un análisis exitoso es proporcionar el esquema de los datos. Si vas a insertar una tabla delimitada por comas en tu prompt, es crucial incluir una cabecera que defina qué significa cada columna, junto con un breve diccionario de datos si los encabezados son acrónimos técnicos. Por ejemplo, indicar que "VTA_Q3" significa "Ventas del Tercer Trimestre en dólares" le otorga al modelo el contexto semántico necesario para razonar sobre los números y no tratarlos como simples cadenas de texto.

Sin embargo, existe una limitación fundamental que todo Prompt Engineer debe conocer: los LLMs no son calculadoras matemáticas; son motores de predicción estadística de texto. Si le entregas una tabla con 500 filas de ventas y le pides que calcule el promedio exacto, es altamente probable que el modelo "alucine" el resultado final. La red neuronal intentará adivinar la respuesta basada en patrones numéricos previos en lugar de ejecutar una operación aritmética determinista.

Para superar esta limitación técnica, la mejor práctica en el análisis de datos estructurados no es pedirle al modelo que calcule la respuesta, sino pedirle que escriba el código para calcularla. Solicitar "Escribe una consulta SQL para obtener el promedio de ventas" o "Genera un script en Python usando la librería Pandas para analizar este CSV" garantiza que la operación matemática sea ejecutada por un motor de cómputo infalible, dejando a la IA la tarea exclusiva de traducir la lógica humana a código informático.

Finalmente, la seguridad es un factor crítico al manejar datos estructurados. Las bases de datos empresariales suelen contener Información de Identificación Personal (PII) o datos financieros altamente confidenciales. Antes de pegar un bloque de datos en un LLM público para su análisis, es imperativo aplicar procesos de anonimización y enmascaramiento, garantizando que ninguna tabla exponga secretos comerciales o viole normativas de privacidad de datos durante el proceso de consulta.
$intermedio_9$
WHERE nombre = 'Análisis de Datos Estructurados con IA'
  AND modulo IN ('Intermedio', 'Módulo Intermedio')
RETURNING id, nombre;

-- Lección 10: Parámetros Clave: Temperatura y Top-P
UPDATE public.ramas
SET contenido_teorico = $intermedio_10$
# Parámetros Clave: Temperatura y Top-P

Detrás de la interfaz de chat de cualquier modelo generativo, existen parámetros matemáticos que los desarrolladores y usuarios avanzados pueden ajustar para alterar radicalmente el comportamiento de la red neuronal. Los dos parámetros más críticos para controlar la precisión y la creatividad de las respuestas generadas son la Temperatura (Temperature) y el Muestreo de Núcleo (Top-P). Entender cómo manipular estas variables es esencial para pasar de un uso casual a un despliegue profesional a través de APIs.

La Temperatura controla directamente el nivel de aleatoriedad en la selección de palabras. Matemáticamente, este valor (que generalmente oscila entre 0.0 y 2.0) aplana o afila la distribución de probabilidades de los tokens. Una temperatura cercana a 0.0 hace que el modelo sea completamente determinista; siempre elegirá la palabra más lógica y estadísticamente probable, generando respuestas predecibles y conservadoras. Por el contrario, una temperatura alta (ej. 0.8 o 1.0) permite al modelo elegir palabras menos comunes, inyectando variedad, creatividad y sorpresa en el texto generado.

El Top-P (Nucleus Sampling) es un mecanismo de control de calidad que trabaja restringiendo el universo de palabras disponibles antes de que se tome la decisión. Si configuras el Top-P en 0.9, le estás indicando al modelo que solo considere el subconjunto de tokens cuyas probabilidades sumen el 90%. Esto descarta automáticamente las palabras más extrañas o ilógicas (el 10% restante), evitando que la respuesta degenere en texto sin sentido, al tiempo que mantiene un margen seguro para la variabilidad.

En la práctica del Prompt Engineering, la configuración de estos parámetros depende enteramente del caso de uso. Para tareas donde la precisión es innegociable, como la generación de código de programación, la extracción de datos JSON, la resolución de problemas matemáticos o la redacción de contratos legales, la Temperatura debe fijarse en 0.0. No se requiere creatividad en un bloque de código, se requiere exactitud absoluta.

Por otro lado, para tareas creativas como la redacción de campañas de marketing, la lluvia de ideas (brainstorming), la escritura de ficción o la creación de variaciones de un mismo texto, se recomienda elevar la Temperatura a niveles entre 0.7 y 0.9. Como regla general en la industria, se aconseja ajustar la Temperatura o el Top-P, pero no ambos al mismo tiempo, para poder medir con precisión cómo impacta cada cambio en la consistencia de los resultados finales.
$intermedio_10$
WHERE nombre = 'Parámetros Clave: Temperatura y Top-P'
  AND modulo IN ('Intermedio', 'Módulo Intermedio')
RETURNING id, nombre;

-- Lección 11: Generación, Revisión y Debugging de Código
UPDATE public.ramas
SET contenido_teorico = $intermedio_11$
# Generación, Revisión y Debugging de Código

El uso de Modelos de Lenguaje Extensos (LLMs) en la ingeniería de software ha transformado radicalmente el ciclo de desarrollo. Lejos de ser simples autocompletadores, estas herramientas actúan como compañeros de programación (pair-programming) con conocimientos vastos en múltiples lenguajes y frameworks, gracias a su entrenamiento con inmensos repositorios de código abierto. Sin embargo, su eficacia depende directamente de la precisión y estructura técnica de las instrucciones que reciben.

Para la generación de código nuevo, la ambigüedad es el mayor enemigo. Un prompt deficiente como "crea una página de login" producirá código genérico y probablemente desactualizado. Un prompt de nivel intermedio debe especificar el lenguaje, el framework, la arquitectura deseada y las librerías permitidas. Por ejemplo: "Genera un componente funcional en React para un inicio de sesión, estilizado con Tailwind CSS, implementando manejo de estado y validación de errores". Esta especificidad acota el espacio de predicción del modelo y previene código inservible.

Más allá de generar código desde cero, los LLMs son herramientas excepcionales para la revisión y refactorización. Puedes proporcionarle a la IA un bloque de código desordenado o ineficiente y solicitarle que lo optimice para mejorar su rendimiento algorítmico, reducir la complejidad de lectura o adaptarlo a los principios de desarrollo limpio. Además, pueden ser instruidos para actuar como auditores de seguridad, buscando vulnerabilidades comunes como inyecciones SQL o fallos lógicos antes de las pruebas formales.

El proceso de "debugging" (depuración) también se acelera significativamente con el uso de IA. Cuando te enfrentas a un error, la mejor práctica es pegar el bloque de código problemático junto con el registro completo del error (stack trace) que arroja tu consola. Al aplicar técnicas como la Cadena de Pensamiento (CoT), puedes pedirle al modelo que explique paso a paso por qué ocurre el error antes de proponer la solución, lo que no solo repara el código, sino que también facilita el aprendizaje.

A pesar de sus impresionantes capacidades, el código generado por IA nunca debe desplegarse directamente sin una revisión exhaustiva. Los modelos pueden sufrir de alucinaciones técnicas, sugiriendo el uso de funciones inventadas, librerías obsoletas o ignorando el contexto global de la aplicación. El desarrollador humano sigue siendo el arquitecto responsable de ensamblar, probar y validar que las piezas de código funcionen de manera segura en el sistema completo.
$intermedio_11$
WHERE nombre = 'Generación, Revisión y Debugging de Código'
  AND modulo IN ('Intermedio', 'Módulo Intermedio')
RETURNING id, nombre;

-- Lección 12: Automatización de Minutas y Correos Complejos
UPDATE public.ramas
SET contenido_teorico = $intermedio_12$
# Automatización de Minutas y Correos Complejos

Mientras que la automatización básica se enfoca en plantillas estáticas cortas, el nivel intermedio aborda la síntesis y redacción de comunicaciones corporativas complejas con múltiples variables. Las herramientas de IA generativa brillan en escenarios donde la información está dispersa o es excesivamente extensa, transformando el caos de una cadena de correos o la transcripción cruda de una reunión en documentos ejecutivos listos para la toma de decisiones ágil.

La creación de minutas a partir de transcripciones es uno de los casos de uso más eficientes. Las transcripciones de reuniones virtuales suelen estar llenas de interrupciones y saltos de tema. Al diseñar un prompt, debes exigir un formato estructurado y la extracción de puntos clave. Una instrucción efectiva sería: "Actúa como un asistente ejecutivo. Analiza esta transcripción y genera una minuta en Markdown que incluya: 1) Resumen de tres líneas, 2) Decisiones tomadas, y 3) Tabla de acciones a realizar con sus respectivos responsables".

En la redacción de correos electrónicos complejos, el desafío radica en el equilibrio del tono y la incorporación de restricciones diplomáticas o comerciales. Para negociaciones, resoluciones de conflictos con clientes o comunicaciones internas delicadas, el prompt debe proveer un contexto exhaustivo. Debes indicarle al modelo el objetivo del correo, los puntos innegociables que deben mencionarse y, fundamentalmente, la postura emocional deseada (por ejemplo, firme pero conciliador, o profesional y empático).

Cuando se trata de hilos de correos muy largos, se corre el riesgo de saturar la ventana de contexto o de que el modelo sufra de "pérdida en el medio". La técnica recomendada en estos casos es un flujo iterativo de dos pasos: primero, pedir a la IA que genere un resumen cronológico de la discusión excluyendo las firmas; y segundo, en un nuevo prompt, entregarle ese resumen limpio junto con las directrices para redactar la respuesta final. Esto mantiene el enfoque del modelo nítido y preciso.

A pesar del alto grado de automatización que esto proporciona, la revisión final humana es obligatoria. La Inteligencia Artificial carece de contexto sobre la política interna de la empresa, las relaciones personales subyacentes o las normas no escritas de la organización. El modelo te entregará un borrador excelente que ahorra el grueso del tiempo de redacción, pero el toque humano es indispensable para calibrar la pertinencia estratégica del mensaje final.
$intermedio_12$
WHERE nombre = 'Automatización de Minutas y Correos Complejos'
  AND modulo IN ('Intermedio', 'Módulo Intermedio')
RETURNING id, nombre;

-- Lección 13: Creación de Plantillas Dinámicas Multiuso
UPDATE public.ramas
SET contenido_teorico = $intermedio_13$
# Creación de Plantillas Dinámicas Multiuso

A medida que el uso de la Inteligencia Artificial se escala dentro de una organización, escribir un prompt desde cero para cada interacción se vuelve ineficiente y propenso a errores. La solución profesional es la creación de "Plantillas Dinámicas" (Prompt Templates). Estas plantillas son estructuras predefinidas donde las instrucciones centrales, el formato y el rol permanecen estáticos, mientras que los datos específicos de cada consulta se inyectan a través de variables dinámicas, de manera similar a como funciona un formulario web.

Técnicamente, una plantilla se construye utilizando marcadores de posición claramente identificables, como corchetes dobles `[[CLIENTE]]`, llaves `{producto}` o etiquetas XML `<fecha>`. En un entorno de desarrollo de software (por ejemplo, utilizando Next.js o Python), el código backend toma esta plantilla, reemplaza los marcadores con los datos reales ingresados por el usuario en la interfaz, y luego envía el prompt ensamblado de forma invisible a la API del modelo de lenguaje.

La clave para una plantilla robusta es la separación estricta entre la lógica de instrucción y los datos variables. Si el usuario final tiene la capacidad de escribir texto libre que se inyectará en la plantilla, existe el riesgo de que accidentalmente (o intencionalmente) altere el comportamiento del modelo, un fenómeno conocido como "Prompt Injection". Por ello, los datos variables siempre deben estar encapsulados dentro de delimitadores fuertes, y el prompt debe instruir a la IA para que trate ese contenido estrictamente como información a procesar, no como nuevas órdenes.

Un diseño avanzado de plantillas también debe contemplar los casos límite (edge cases). ¿Qué sucede si la variable `[HISTORIAL_MEDICO]` llega vacía? Una plantilla profesional incluye instrucciones de contingencia, como: "Si el bloque de historial médico está vacío, responde 'No hay datos previos suficientes' y detén el análisis". Esto asegura que la automatización no colapse ni alucine información cuando los datos de entrada son imperfectos o incompletos.

Implementar plantillas dinámicas transforma a los LLMs de simples asistentes conversacionales en verdaderos motores de procesamiento en segundo plano. Permite estandarizar la calidad de los reportes, correos y análisis de toda una empresa, garantizando que, sin importar qué empleado utilice la herramienta, las restricciones éticas, el formato de salida y el tono corporativo se mantengan rigurosamente idénticos en cada ejecución.
$intermedio_13$
WHERE nombre = 'Creación de Plantillas Dinámicas Multiuso'
  AND modulo IN ('Intermedio', 'Módulo Intermedio')
RETURNING id, nombre;

-- Lección 14: Interpretabilidad Básica de Modelos
UPDATE public.ramas
SET contenido_teorico = $intermedio_14$
# Interpretabilidad Básica de Modelos

Uno de los mayores desafíos de trabajar con Modelos de Lenguaje Extensos (LLMs) es el problema de la "caja negra". A diferencia del código de programación tradicional, donde un ingeniero puede rastrear exactamente qué línea o condicional produjo un resultado específico, en las redes neuronales profundas la decisión se toma a través de miles de millones de operaciones matemáticas simultáneas (pesos y sesgos). La interpretabilidad es la disciplina que intenta comprender y auditar por qué un modelo generó una respuesta particular.

A nivel básico, los usuarios suelen intentar interpretar al modelo simplemente preguntándole: "¿Por qué llegaste a esta conclusión?". Sin embargo, esta es una trampa metodológica. Los modelos generativos no tienen verdadera autoconciencia de su proceso interno; cuando les pides que expliquen su respuesta anterior, a menudo "alucinan" una justificación lógica retrospectiva que suena plausible pero que no refleja en absoluto el cálculo matemático real que ocurrió en sus capas ocultas.

Para obtener una interpretabilidad funcional sin acceder al código fuente del modelo, la técnica más confiable es forzar la transparencia antes de la respuesta final mediante la Cadena de Pensamiento (Chain of Thought). Al obligar a la IA a externalizar sus pasos lógicos en texto visible antes de emitir un veredicto, el Prompt Engineer puede auditar el "razonamiento" intermedio. Si la conclusión final es errónea, la cadena de texto permite identificar exactamente en qué suposición o extracción de datos se desvió el sistema.

A nivel de API, herramientas avanzadas ofrecen métricas de interpretabilidad más técnicas, como los "Logprobs" (probabilidades logarítmicas). Esta función permite ver matemáticamente qué tan "seguro" estaba el modelo al elegir cada token. Si un modelo extrae una cifra financiera de un contrato, pero el logprob de ese número es extremadamente bajo, el sistema puede levantar una bandera de advertencia, indicando a los auditores humanos que esa extracción específica requiere revisión manual urgente.

Para las empresas, la interpretabilidad no es solo un ejercicio académico, sino un requisito de cumplimiento y gobernanza. Desplegar sistemas de IA en sectores regulados (como finanzas, salud o recursos humanos) exige poder justificar las decisiones automatizadas. Entender que los LLMs son cajas negras probabilísticas obliga a los arquitectos de sistemas a diseñar barreras de contención, validaciones externas y auditorías continuas para garantizar que las salidas sean rastreables y seguras.
$intermedio_14$
WHERE nombre = 'Interpretabilidad Básica de Modelos'
  AND modulo IN ('Intermedio', 'Módulo Intermedio')
RETURNING id, nombre;

-- Lección 15: Evaluación Final: Nivel Intermedio
UPDATE public.ramas
SET contenido_teorico = $intermedio_15$
# Evaluación Final: Nivel Intermedio

Has alcanzado el final del Módulo Intermedio, una etapa donde dejamos atrás la simple generación de texto para adentrarnos en el control técnico y la arquitectura de sistemas basados en Inteligencia Artificial. A lo largo de estas lecciones, aprendiste que los modelos generativos no son infalibles y dominaste estrategias para identificar y mitigar alucinaciones, garantizando que las respuestas sean veraces y se basen en el contexto proporcionado en lugar de invenciones probabilísticas.

Durante este recorrido, descubriste cómo manipular el espacio latente de la red neuronal mediante el Role-prompting avanzado, asignando identidades y restricciones metodológicas precisas. También exploramos la anatomía financiera y técnica de los modelos, comprendiendo cómo se contabilizan los tokens, cómo optimizar los costos de la API y cómo gestionar la ventana de contexto para evitar el desbordamiento de memoria y la "pérdida en el medio" en documentos extensos.

A nivel de ingeniería de instrucciones, dominaste el ciclo de iteración sistemática y adoptaste técnicas fundamentales para tareas complejas. Pasaste del Zero-Shot al Few-Shot Prompting para calibrar formatos específicos, y aprendiste a forzar la transparencia lógica del modelo mediante la Cadena de Pensamiento (Chain of Thought), una herramienta indispensable para resolver problemas matemáticos, depurar código de programación y garantizar interpretabilidad básica.

Además, abordamos el análisis de datos estructurados, la configuración de parámetros críticos como la Temperatura y el Top-P, y la transición hacia la automatización a escala mediante plantillas dinámicas multiuso. Todo esto sin perder de vista la innegociable responsabilidad ética del Prompt Engineer: aplicar controles estrictos para evitar que la IA perpetúe sesgos estadísticos y discriminación algorítmica en entornos corporativos.

Esta evaluación final pondrá a prueba tu capacidad para aplicar estas metodologías en escenarios prácticos. Te enfrentarás a un cuestionario diseñado para validar tu criterio técnico en la depuración de prompts, la optimización de recursos y la mitigación de riesgos. Superar esta prueba demostrará tu competencia intermedia y te abrirá las puertas al Módulo Avanzado, donde exploraremos agentes autónomos, integraciones con APIs externas y fine-tuning. Tómate tu tiempo y demuestra lo aprendido.
$intermedio_15$
WHERE nombre = 'Evaluación Final: Nivel Intermedio'
  AND modulo IN ('Intermedio', 'Módulo Intermedio')
RETURNING id, nombre;

COMMIT;
