-- Recuperación para adaptia: ramas existentes 1..45, preguntas.rama_id TEXT.
-- Ejecutar TODO el archivo (Alt+X en DBeaver), no solo una sentencia.
-- Conserva sin cambios la rama 1 y sus 15 preguntas.
-- No elimina preguntas, opciones ni progreso. No crea ramas duplicadas.
-- Reutiliza preguntas del seed anterior únicamente mediante el mapa de temas.
-- Completa cada rama 2..45 hasta 15 preguntas y teoría Markdown.
-- Si los IDs/nombres no coinciden, aborta y revierte los cambios de tablas.
BEGIN;
LOCK TABLE ramas, preguntas, opciones IN SHARE ROW EXCLUSIVE MODE;

DO $recuperacion$
DECLARE
  banco jsonb := $contenido$[
  {
    "id": 2,
    "modulo": "Intermedio",
    "nombre": "Identificación y Manejo de Alucinaciones",
    "legacy": "intermedio-1",
    "teoria": "## Identificación y Manejo de Alucinaciones\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Una alucinación es una afirmación plausible pero falsa o no sustentada.\n2. **Criterio 2:** Las referencias generadas deben verificarse en la fuente original.\n3. **Criterio 3:** Cuando falta evidencia conviene reconocer la incertidumbre.\n4. **Criterio 4:** Aportar fuentes relevantes reduce riesgos sin garantizar exactitud.\n5. **Criterio 5:** La fluidez y el tono seguro no demuestran veracidad.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Identificación y Manejo de Alucinaciones», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Una alucinación es una afirmación plausible pero falsa o no sustentada.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Identificación y Manejo de Alucinaciones», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Las referencias generadas deben verificarse en la fuente original.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Identificación y Manejo de Alucinaciones», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Cuando falta evidencia conviene reconocer la incertidumbre.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "En «Identificación y Manejo de Alucinaciones», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Aportar fuentes relevantes reduce riesgos sin garantizar exactitud.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Identificación y Manejo de Alucinaciones», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La fluidez y el tono seguro no demuestran veracidad.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Identificación y Manejo de Alucinaciones», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Una alucinación es una afirmación plausible pero falsa o no sustentada.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Identificación y Manejo de Alucinaciones», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las referencias generadas deben verificarse en la fuente original.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al trabajar con «Identificación y Manejo de Alucinaciones», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Cuando falta evidencia conviene reconocer la incertidumbre.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Identificación y Manejo de Alucinaciones», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Aportar fuentes relevantes reduce riesgos sin garantizar exactitud.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Identificación y Manejo de Alucinaciones», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La fluidez y el tono seguro no demuestran veracidad.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Identificación y Manejo de Alucinaciones», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Una alucinación es una afirmación plausible pero falsa o no sustentada.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Identificación y Manejo de Alucinaciones», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Las referencias generadas deben verificarse en la fuente original.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Identificación y Manejo de Alucinaciones», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Cuando falta evidencia conviene reconocer la incertidumbre.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Identificación y Manejo de Alucinaciones», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Aportar fuentes relevantes reduce riesgos sin garantizar exactitud.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Identificación y Manejo de Alucinaciones», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: La fluidez y el tono seguro no demuestran veracidad.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 3,
    "modulo": "Intermedio",
    "nombre": "Asignación de Roles y Personas (Role-prompting)",
    "legacy": "intermedio-2",
    "teoria": "## Asignación de Roles y Personas (Role-prompting)\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** El rol orienta el estilo y el enfoque de una respuesta.\n2. **Criterio 2:** Asignar un rol de experto no sustituye la revisión profesional.\n3. **Criterio 3:** El rol debe acompañarse de una tarea y criterios de salida.\n4. **Criterio 4:** Las restricciones de privacidad siguen vigentes con cualquier persona asignada.\n5. **Criterio 5:** La coherencia del rol se evalúa con casos representativos.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Asignación de Roles y Personas (Role-prompting)», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "El rol orienta el estilo y el enfoque de una respuesta.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Asignación de Roles y Personas (Role-prompting)», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Asignar un rol de experto no sustituye la revisión profesional.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Asignación de Roles y Personas (Role-prompting)», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "El rol debe acompañarse de una tarea y criterios de salida.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "En «Asignación de Roles y Personas (Role-prompting)», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Las restricciones de privacidad siguen vigentes con cualquier persona asignada.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Asignación de Roles y Personas (Role-prompting)», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La coherencia del rol se evalúa con casos representativos.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Asignación de Roles y Personas (Role-prompting)», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: El rol orienta el estilo y el enfoque de una respuesta.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Asignación de Roles y Personas (Role-prompting)», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Asignar un rol de experto no sustituye la revisión profesional.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al trabajar con «Asignación de Roles y Personas (Role-prompting)», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: El rol debe acompañarse de una tarea y criterios de salida.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Asignación de Roles y Personas (Role-prompting)», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las restricciones de privacidad siguen vigentes con cualquier persona asignada.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Asignación de Roles y Personas (Role-prompting)», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La coherencia del rol se evalúa con casos representativos.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Asignación de Roles y Personas (Role-prompting)», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: El rol orienta el estilo y el enfoque de una respuesta.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Asignación de Roles y Personas (Role-prompting)», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Asignar un rol de experto no sustituye la revisión profesional.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Asignación de Roles y Personas (Role-prompting)», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: El rol debe acompañarse de una tarea y criterios de salida.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Asignación de Roles y Personas (Role-prompting)», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Las restricciones de privacidad siguen vigentes con cualquier persona asignada.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Asignación de Roles y Personas (Role-prompting)», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: La coherencia del rol se evalúa con casos representativos.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 4,
    "modulo": "Intermedio",
    "nombre": "Límites de Tokens y Estructura de Precios",
    "legacy": "intermedio-3",
    "teoria": "## Límites de Tokens y Estructura de Precios\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Los tokens son unidades de procesamiento y no equivalen siempre a palabras.\n2. **Criterio 2:** El presupuesto de contexto debe reservar espacio para la respuesta.\n3. **Criterio 3:** Los costes pueden diferenciar tokens de entrada y de salida.\n4. **Criterio 4:** Los límites y precios dependen del modelo y del proveedor.\n5. **Criterio 5:** Medir el consumo real permite ajustar el presupuesto por tarea.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Límites de Tokens y Estructura de Precios», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Los tokens son unidades de procesamiento y no equivalen siempre a palabras.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Límites de Tokens y Estructura de Precios», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "El presupuesto de contexto debe reservar espacio para la respuesta.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Límites de Tokens y Estructura de Precios», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los costes pueden diferenciar tokens de entrada y de salida.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "En «Límites de Tokens y Estructura de Precios», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Los límites y precios dependen del modelo y del proveedor.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Límites de Tokens y Estructura de Precios», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Medir el consumo real permite ajustar el presupuesto por tarea.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Límites de Tokens y Estructura de Precios», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los tokens son unidades de procesamiento y no equivalen siempre a palabras.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Límites de Tokens y Estructura de Precios», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: El presupuesto de contexto debe reservar espacio para la respuesta.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al trabajar con «Límites de Tokens y Estructura de Precios», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Los costes pueden diferenciar tokens de entrada y de salida.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Límites de Tokens y Estructura de Precios», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los límites y precios dependen del modelo y del proveedor.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Límites de Tokens y Estructura de Precios», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Medir el consumo real permite ajustar el presupuesto por tarea.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Límites de Tokens y Estructura de Precios», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los tokens son unidades de procesamiento y no equivalen siempre a palabras.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Límites de Tokens y Estructura de Precios», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: El presupuesto de contexto debe reservar espacio para la respuesta.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Límites de Tokens y Estructura de Precios», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los costes pueden diferenciar tokens de entrada y de salida.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Límites de Tokens y Estructura de Precios», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los límites y precios dependen del modelo y del proveedor.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Límites de Tokens y Estructura de Precios», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Medir el consumo real permite ajustar el presupuesto por tarea.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 5,
    "modulo": "Intermedio",
    "nombre": "Gestión de Ventanas de Contexto (Context Windows)",
    "legacy": "intermedio-4",
    "teoria": "## Gestión de Ventanas de Contexto (Context Windows)\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** La ventana de contexto limita la información disponible en una solicitud.\n2. **Criterio 2:** Una conversación extensa puede perder información anterior por truncamiento.\n3. **Criterio 3:** Seleccionar fragmentos relevantes mejora el aprovechamiento del contexto.\n4. **Criterio 4:** Los resúmenes de contexto deben conservar restricciones y hechos verificables.\n5. **Criterio 5:** Una ventana amplia no garantiza que se utilice correctamente cada detalle.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Gestión de Ventanas de Contexto (Context Windows)», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "La ventana de contexto limita la información disponible en una solicitud.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Gestión de Ventanas de Contexto (Context Windows)», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Una conversación extensa puede perder información anterior por truncamiento.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Gestión de Ventanas de Contexto (Context Windows)», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Seleccionar fragmentos relevantes mejora el aprovechamiento del contexto.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "En «Gestión de Ventanas de Contexto (Context Windows)», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Los resúmenes de contexto deben conservar restricciones y hechos verificables.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Gestión de Ventanas de Contexto (Context Windows)», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Una ventana amplia no garantiza que se utilice correctamente cada detalle.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Gestión de Ventanas de Contexto (Context Windows)», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La ventana de contexto limita la información disponible en una solicitud.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Gestión de Ventanas de Contexto (Context Windows)», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Una conversación extensa puede perder información anterior por truncamiento.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al trabajar con «Gestión de Ventanas de Contexto (Context Windows)», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Seleccionar fragmentos relevantes mejora el aprovechamiento del contexto.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Gestión de Ventanas de Contexto (Context Windows)», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los resúmenes de contexto deben conservar restricciones y hechos verificables.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Gestión de Ventanas de Contexto (Context Windows)», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Una ventana amplia no garantiza que se utilice correctamente cada detalle.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Gestión de Ventanas de Contexto (Context Windows)», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La ventana de contexto limita la información disponible en una solicitud.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Gestión de Ventanas de Contexto (Context Windows)», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Una conversación extensa puede perder información anterior por truncamiento.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Gestión de Ventanas de Contexto (Context Windows)», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Seleccionar fragmentos relevantes mejora el aprovechamiento del contexto.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Gestión de Ventanas de Contexto (Context Windows)», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los resúmenes de contexto deben conservar restricciones y hechos verificables.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Gestión de Ventanas de Contexto (Context Windows)», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Una ventana amplia no garantiza que se utilice correctamente cada detalle.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 6,
    "modulo": "Intermedio",
    "nombre": "Sesgos, Ética y Discriminación Algorítmica",
    "legacy": "intermedio-5",
    "teoria": "## Sesgos, Ética y Discriminación Algorítmica\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Los sesgos pueden proceder de datos, diseño y decisiones de uso.\n2. **Criterio 2:** Evaluar resultados por grupos ayuda a detectar impactos desiguales.\n3. **Criterio 3:** La automatización no implica neutralidad ni justicia.\n4. **Criterio 4:** Las decisiones sensibles requieren revisión y mecanismos de apelación.\n5. **Criterio 5:** La evaluación ética debe considerar el contexto y las personas afectadas.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Sesgos, Ética y Discriminación Algorítmica», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Los sesgos pueden proceder de datos, diseño y decisiones de uso.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Sesgos, Ética y Discriminación Algorítmica», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Evaluar resultados por grupos ayuda a detectar impactos desiguales.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Sesgos, Ética y Discriminación Algorítmica», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La automatización no implica neutralidad ni justicia.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "En «Sesgos, Ética y Discriminación Algorítmica», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Las decisiones sensibles requieren revisión y mecanismos de apelación.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Sesgos, Ética y Discriminación Algorítmica», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La evaluación ética debe considerar el contexto y las personas afectadas.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Sesgos, Ética y Discriminación Algorítmica», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los sesgos pueden proceder de datos, diseño y decisiones de uso.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Sesgos, Ética y Discriminación Algorítmica», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Evaluar resultados por grupos ayuda a detectar impactos desiguales.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al trabajar con «Sesgos, Ética y Discriminación Algorítmica», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: La automatización no implica neutralidad ni justicia.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Sesgos, Ética y Discriminación Algorítmica», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las decisiones sensibles requieren revisión y mecanismos de apelación.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Sesgos, Ética y Discriminación Algorítmica», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La evaluación ética debe considerar el contexto y las personas afectadas.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Sesgos, Ética y Discriminación Algorítmica», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los sesgos pueden proceder de datos, diseño y decisiones de uso.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Sesgos, Ética y Discriminación Algorítmica», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Evaluar resultados por grupos ayuda a detectar impactos desiguales.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Sesgos, Ética y Discriminación Algorítmica», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La automatización no implica neutralidad ni justicia.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Sesgos, Ética y Discriminación Algorítmica», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Las decisiones sensibles requieren revisión y mecanismos de apelación.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Sesgos, Ética y Discriminación Algorítmica», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: La evaluación ética debe considerar el contexto y las personas afectadas.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 7,
    "modulo": "Intermedio",
    "nombre": "Técnicas de Iteración de Prompts",
    "legacy": "intermedio-6",
    "teoria": "## Técnicas de Iteración de Prompts\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Iterar consiste en ajustar instrucciones a partir de resultados observados.\n2. **Criterio 2:** Cambiar una variable cada vez facilita comparar sus efectos.\n3. **Criterio 3:** Una rúbrica definida de antemano permite evaluar mejoras.\n4. **Criterio 4:** Los ejemplos de fallos ayudan a concretar restricciones faltantes.\n5. **Criterio 5:** Registrar versiones evita perder una instrucción que funcionaba mejor.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Técnicas de Iteración de Prompts», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Iterar consiste en ajustar instrucciones a partir de resultados observados.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Técnicas de Iteración de Prompts», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Cambiar una variable cada vez facilita comparar sus efectos.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Técnicas de Iteración de Prompts», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Una rúbrica definida de antemano permite evaluar mejoras.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "En «Técnicas de Iteración de Prompts», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Los ejemplos de fallos ayudan a concretar restricciones faltantes.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Técnicas de Iteración de Prompts», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Registrar versiones evita perder una instrucción que funcionaba mejor.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Técnicas de Iteración de Prompts», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Iterar consiste en ajustar instrucciones a partir de resultados observados.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Técnicas de Iteración de Prompts», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Cambiar una variable cada vez facilita comparar sus efectos.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al trabajar con «Técnicas de Iteración de Prompts», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Una rúbrica definida de antemano permite evaluar mejoras.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Técnicas de Iteración de Prompts», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los ejemplos de fallos ayudan a concretar restricciones faltantes.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Técnicas de Iteración de Prompts», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Registrar versiones evita perder una instrucción que funcionaba mejor.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Técnicas de Iteración de Prompts», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Iterar consiste en ajustar instrucciones a partir de resultados observados.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Técnicas de Iteración de Prompts», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Cambiar una variable cada vez facilita comparar sus efectos.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Técnicas de Iteración de Prompts», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Una rúbrica definida de antemano permite evaluar mejoras.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Técnicas de Iteración de Prompts», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los ejemplos de fallos ayudan a concretar restricciones faltantes.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Técnicas de Iteración de Prompts», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Registrar versiones evita perder una instrucción que funcionaba mejor.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 8,
    "modulo": "Intermedio",
    "nombre": "Few-Shot y Zero-Shot Prompting",
    "legacy": "intermedio-11",
    "teoria": "## Few-Shot y Zero-Shot Prompting\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Zero-shot plantea la tarea sin ejemplos de demostración.\n2. **Criterio 2:** Few-shot aporta ejemplos de entrada y salida en el contexto.\n3. **Criterio 3:** Los ejemplos deben representar el formato y los casos esperados.\n4. **Criterio 4:** Los ejemplos en un prompt no entrenan permanentemente el modelo.\n5. **Criterio 5:** La calidad y diversidad de los ejemplos importan más que repetirlos.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Few-Shot y Zero-Shot Prompting», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Zero-shot plantea la tarea sin ejemplos de demostración.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Few-Shot y Zero-Shot Prompting», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Few-shot aporta ejemplos de entrada y salida en el contexto.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Few-Shot y Zero-Shot Prompting», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los ejemplos deben representar el formato y los casos esperados.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "En «Few-Shot y Zero-Shot Prompting», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Los ejemplos en un prompt no entrenan permanentemente el modelo.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Few-Shot y Zero-Shot Prompting», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La calidad y diversidad de los ejemplos importan más que repetirlos.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Few-Shot y Zero-Shot Prompting», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Zero-shot plantea la tarea sin ejemplos de demostración.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Few-Shot y Zero-Shot Prompting», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Few-shot aporta ejemplos de entrada y salida en el contexto.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al trabajar con «Few-Shot y Zero-Shot Prompting», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Los ejemplos deben representar el formato y los casos esperados.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Few-Shot y Zero-Shot Prompting», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los ejemplos en un prompt no entrenan permanentemente el modelo.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Few-Shot y Zero-Shot Prompting», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La calidad y diversidad de los ejemplos importan más que repetirlos.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Few-Shot y Zero-Shot Prompting», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Zero-shot plantea la tarea sin ejemplos de demostración.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Few-Shot y Zero-Shot Prompting», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Few-shot aporta ejemplos de entrada y salida en el contexto.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Few-Shot y Zero-Shot Prompting», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los ejemplos deben representar el formato y los casos esperados.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Few-Shot y Zero-Shot Prompting», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los ejemplos en un prompt no entrenan permanentemente el modelo.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Few-Shot y Zero-Shot Prompting», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: La calidad y diversidad de los ejemplos importan más que repetirlos.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 9,
    "modulo": "Intermedio",
    "nombre": "Cadena de Pensamiento (Chain of Thought - CoT)",
    "legacy": null,
    "teoria": "## Cadena de Pensamiento (Chain of Thought - CoT)\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Dividir un problema en pasos verificables facilita detectar errores.\n2. **Criterio 2:** Una explicación generada no prueba que el resultado sea correcto.\n3. **Criterio 3:** Es preferible pedir una justificación breve comprobable y resultados intermedios útiles.\n4. **Criterio 4:** No es necesario acceder al razonamiento interno privado del modelo para validar una respuesta.\n5. **Criterio 5:** Los cálculos importantes deben comprobarse con herramientas fiables.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Cadena de Pensamiento (Chain of Thought - CoT)», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Dividir un problema en pasos verificables facilita detectar errores.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Cadena de Pensamiento (Chain of Thought - CoT)», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Una explicación generada no prueba que el resultado sea correcto.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Cadena de Pensamiento (Chain of Thought - CoT)», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Es preferible pedir una justificación breve comprobable y resultados intermedios útiles.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "En «Cadena de Pensamiento (Chain of Thought - CoT)», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "No es necesario acceder al razonamiento interno privado del modelo para validar una respuesta.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Cadena de Pensamiento (Chain of Thought - CoT)», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los cálculos importantes deben comprobarse con herramientas fiables.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Cadena de Pensamiento (Chain of Thought - CoT)», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Dividir un problema en pasos verificables facilita detectar errores.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Cadena de Pensamiento (Chain of Thought - CoT)», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Una explicación generada no prueba que el resultado sea correcto.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al trabajar con «Cadena de Pensamiento (Chain of Thought - CoT)», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Es preferible pedir una justificación breve comprobable y resultados intermedios útiles.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Cadena de Pensamiento (Chain of Thought - CoT)», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: No es necesario acceder al razonamiento interno privado del modelo para validar una respuesta.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Cadena de Pensamiento (Chain of Thought - CoT)», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los cálculos importantes deben comprobarse con herramientas fiables.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Cadena de Pensamiento (Chain of Thought - CoT)», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Dividir un problema en pasos verificables facilita detectar errores.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Cadena de Pensamiento (Chain of Thought - CoT)», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Una explicación generada no prueba que el resultado sea correcto.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Cadena de Pensamiento (Chain of Thought - CoT)», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Es preferible pedir una justificación breve comprobable y resultados intermedios útiles.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Cadena de Pensamiento (Chain of Thought - CoT)», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: No es necesario acceder al razonamiento interno privado del modelo para validar una respuesta.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Cadena de Pensamiento (Chain of Thought - CoT)», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Los cálculos importantes deben comprobarse con herramientas fiables.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 10,
    "modulo": "Intermedio",
    "nombre": "Análisis de Datos Estructurados con IA",
    "legacy": "intermedio-7",
    "teoria": "## Análisis de Datos Estructurados con IA\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Antes de analizar deben revisarse el esquema, las unidades y los tipos de datos.\n2. **Criterio 2:** Los valores faltantes requieren una política explícita de tratamiento.\n3. **Criterio 3:** Una correlación no demuestra causalidad.\n4. **Criterio 4:** Los cálculos generados deben contrastarse con consultas o herramientas fiables.\n5. **Criterio 5:** Solo deben procesarse datos autorizados con controles de privacidad.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Análisis de Datos Estructurados con IA», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Antes de analizar deben revisarse el esquema, las unidades y los tipos de datos.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Análisis de Datos Estructurados con IA», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los valores faltantes requieren una política explícita de tratamiento.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Análisis de Datos Estructurados con IA», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Una correlación no demuestra causalidad.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "En «Análisis de Datos Estructurados con IA», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Los cálculos generados deben contrastarse con consultas o herramientas fiables.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Análisis de Datos Estructurados con IA», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Solo deben procesarse datos autorizados con controles de privacidad.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Análisis de Datos Estructurados con IA», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Antes de analizar deben revisarse el esquema, las unidades y los tipos de datos.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Análisis de Datos Estructurados con IA», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los valores faltantes requieren una política explícita de tratamiento.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al trabajar con «Análisis de Datos Estructurados con IA», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Una correlación no demuestra causalidad.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Análisis de Datos Estructurados con IA», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los cálculos generados deben contrastarse con consultas o herramientas fiables.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Análisis de Datos Estructurados con IA», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Solo deben procesarse datos autorizados con controles de privacidad.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Análisis de Datos Estructurados con IA», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Antes de analizar deben revisarse el esquema, las unidades y los tipos de datos.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Análisis de Datos Estructurados con IA», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Los valores faltantes requieren una política explícita de tratamiento.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Análisis de Datos Estructurados con IA», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Una correlación no demuestra causalidad.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Análisis de Datos Estructurados con IA», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los cálculos generados deben contrastarse con consultas o herramientas fiables.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Análisis de Datos Estructurados con IA», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Solo deben procesarse datos autorizados con controles de privacidad.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 11,
    "modulo": "Intermedio",
    "nombre": "Parámetros Clave: Temperatura y Top-P",
    "legacy": null,
    "teoria": "## Parámetros Clave: Temperatura y Top-P\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** La temperatura modifica la distribución usada para muestrear tokens.\n2. **Criterio 2:** Top-P limita candidatos según una masa de probabilidad acumulada.\n3. **Criterio 3:** Temperatura baja no garantiza ausencia de errores ni alucinaciones.\n4. **Criterio 4:** Conviene variar un parámetro a la vez y evaluar los resultados.\n5. **Criterio 5:** La disponibilidad y los rangos de parámetros dependen del modelo.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Parámetros Clave: Temperatura y Top-P», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "La temperatura modifica la distribución usada para muestrear tokens.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Parámetros Clave: Temperatura y Top-P», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Top-P limita candidatos según una masa de probabilidad acumulada.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Parámetros Clave: Temperatura y Top-P», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Temperatura baja no garantiza ausencia de errores ni alucinaciones.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "En «Parámetros Clave: Temperatura y Top-P», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Conviene variar un parámetro a la vez y evaluar los resultados.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Parámetros Clave: Temperatura y Top-P», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La disponibilidad y los rangos de parámetros dependen del modelo.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Parámetros Clave: Temperatura y Top-P», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La temperatura modifica la distribución usada para muestrear tokens.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Parámetros Clave: Temperatura y Top-P», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Top-P limita candidatos según una masa de probabilidad acumulada.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al trabajar con «Parámetros Clave: Temperatura y Top-P», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Temperatura baja no garantiza ausencia de errores ni alucinaciones.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Parámetros Clave: Temperatura y Top-P», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Conviene variar un parámetro a la vez y evaluar los resultados.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Parámetros Clave: Temperatura y Top-P», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La disponibilidad y los rangos de parámetros dependen del modelo.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Parámetros Clave: Temperatura y Top-P», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La temperatura modifica la distribución usada para muestrear tokens.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Parámetros Clave: Temperatura y Top-P», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Top-P limita candidatos según una masa de probabilidad acumulada.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Parámetros Clave: Temperatura y Top-P», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Temperatura baja no garantiza ausencia de errores ni alucinaciones.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Parámetros Clave: Temperatura y Top-P», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Conviene variar un parámetro a la vez y evaluar los resultados.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Parámetros Clave: Temperatura y Top-P», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: La disponibilidad y los rangos de parámetros dependen del modelo.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 12,
    "modulo": "Intermedio",
    "nombre": "Generación, Revisión y Debugging de Código",
    "legacy": null,
    "teoria": "## Generación, Revisión y Debugging de Código\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** El código generado debe revisarse antes de ejecutarse.\n2. **Criterio 2:** Las pruebas deben cubrir casos normales, límites y fallos esperados.\n3. **Criterio 3:** Las dependencias sugeridas deben comprobarse en fuentes confiables.\n4. **Criterio 4:** Los secretos no deben pegarse en prompts ni en el código.\n5. **Criterio 5:** Un programa que compila todavía puede tener errores lógicos o de seguridad.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Generación, Revisión y Debugging de Código», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "El código generado debe revisarse antes de ejecutarse.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Generación, Revisión y Debugging de Código», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Las pruebas deben cubrir casos normales, límites y fallos esperados.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Generación, Revisión y Debugging de Código», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Las dependencias sugeridas deben comprobarse en fuentes confiables.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "En «Generación, Revisión y Debugging de Código», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Los secretos no deben pegarse en prompts ni en el código.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Generación, Revisión y Debugging de Código», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Un programa que compila todavía puede tener errores lógicos o de seguridad.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Generación, Revisión y Debugging de Código», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: El código generado debe revisarse antes de ejecutarse.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Generación, Revisión y Debugging de Código», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las pruebas deben cubrir casos normales, límites y fallos esperados.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al trabajar con «Generación, Revisión y Debugging de Código», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Las dependencias sugeridas deben comprobarse en fuentes confiables.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Generación, Revisión y Debugging de Código», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los secretos no deben pegarse en prompts ni en el código.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Generación, Revisión y Debugging de Código», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Un programa que compila todavía puede tener errores lógicos o de seguridad.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Generación, Revisión y Debugging de Código», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: El código generado debe revisarse antes de ejecutarse.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Generación, Revisión y Debugging de Código», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Las pruebas deben cubrir casos normales, límites y fallos esperados.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Generación, Revisión y Debugging de Código», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Las dependencias sugeridas deben comprobarse en fuentes confiables.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Generación, Revisión y Debugging de Código», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los secretos no deben pegarse en prompts ni en el código.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Generación, Revisión y Debugging de Código», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Un programa que compila todavía puede tener errores lógicos o de seguridad.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 13,
    "modulo": "Intermedio",
    "nombre": "Automatización de Minutas y Correos Complejos",
    "legacy": "intermedio-9",
    "teoria": "## Automatización de Minutas y Correos Complejos\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Una minuta debe distinguir acuerdos, responsables y fechas confirmadas.\n2. **Criterio 2:** Cuando un responsable no está definido debe indicarse en lugar de inventarlo.\n3. **Criterio 3:** Los correos deben revisarse antes de enviarse a sus destinatarios.\n4. **Criterio 4:** La información confidencial requiere herramientas y permisos autorizados.\n5. **Criterio 5:** Separar hechos de propuestas evita presentar sugerencias como acuerdos.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Automatización de Minutas y Correos Complejos», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Una minuta debe distinguir acuerdos, responsables y fechas confirmadas.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Automatización de Minutas y Correos Complejos», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Cuando un responsable no está definido debe indicarse en lugar de inventarlo.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Automatización de Minutas y Correos Complejos», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los correos deben revisarse antes de enviarse a sus destinatarios.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "En «Automatización de Minutas y Correos Complejos», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "La información confidencial requiere herramientas y permisos autorizados.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Automatización de Minutas y Correos Complejos», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Separar hechos de propuestas evita presentar sugerencias como acuerdos.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Automatización de Minutas y Correos Complejos», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Una minuta debe distinguir acuerdos, responsables y fechas confirmadas.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Automatización de Minutas y Correos Complejos», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Cuando un responsable no está definido debe indicarse en lugar de inventarlo.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al trabajar con «Automatización de Minutas y Correos Complejos», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Los correos deben revisarse antes de enviarse a sus destinatarios.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Automatización de Minutas y Correos Complejos», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La información confidencial requiere herramientas y permisos autorizados.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Automatización de Minutas y Correos Complejos», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Separar hechos de propuestas evita presentar sugerencias como acuerdos.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Automatización de Minutas y Correos Complejos», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Una minuta debe distinguir acuerdos, responsables y fechas confirmadas.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Automatización de Minutas y Correos Complejos», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Cuando un responsable no está definido debe indicarse en lugar de inventarlo.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Automatización de Minutas y Correos Complejos», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los correos deben revisarse antes de enviarse a sus destinatarios.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Automatización de Minutas y Correos Complejos», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La información confidencial requiere herramientas y permisos autorizados.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Automatización de Minutas y Correos Complejos», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Separar hechos de propuestas evita presentar sugerencias como acuerdos.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 14,
    "modulo": "Intermedio",
    "nombre": "Creación de Plantillas Dinámicas Multiuso",
    "legacy": "intermedio-10",
    "teoria": "## Creación de Plantillas Dinámicas Multiuso\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Una plantilla separa instrucciones estables de variables de entrada.\n2. **Criterio 2:** Los campos obligatorios deben validarse antes de generar.\n3. **Criterio 3:** Los valores del usuario deben tratarse como datos y no como instrucciones privilegiadas.\n4. **Criterio 4:** El formato de salida puede validarse mediante un esquema.\n5. **Criterio 5:** Versionar y probar plantillas reduce regresiones entre usos.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Creación de Plantillas Dinámicas Multiuso», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Una plantilla separa instrucciones estables de variables de entrada.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Creación de Plantillas Dinámicas Multiuso», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los campos obligatorios deben validarse antes de generar.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Creación de Plantillas Dinámicas Multiuso», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los valores del usuario deben tratarse como datos y no como instrucciones privilegiadas.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "En «Creación de Plantillas Dinámicas Multiuso», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "El formato de salida puede validarse mediante un esquema.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Creación de Plantillas Dinámicas Multiuso», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Versionar y probar plantillas reduce regresiones entre usos.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Creación de Plantillas Dinámicas Multiuso», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Una plantilla separa instrucciones estables de variables de entrada.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Creación de Plantillas Dinámicas Multiuso», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los campos obligatorios deben validarse antes de generar.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al trabajar con «Creación de Plantillas Dinámicas Multiuso», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Los valores del usuario deben tratarse como datos y no como instrucciones privilegiadas.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Creación de Plantillas Dinámicas Multiuso», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: El formato de salida puede validarse mediante un esquema.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Creación de Plantillas Dinámicas Multiuso», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Versionar y probar plantillas reduce regresiones entre usos.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Creación de Plantillas Dinámicas Multiuso», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Una plantilla separa instrucciones estables de variables de entrada.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Creación de Plantillas Dinámicas Multiuso», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Los campos obligatorios deben validarse antes de generar.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Creación de Plantillas Dinámicas Multiuso», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los valores del usuario deben tratarse como datos y no como instrucciones privilegiadas.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Creación de Plantillas Dinámicas Multiuso», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: El formato de salida puede validarse mediante un esquema.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Creación de Plantillas Dinámicas Multiuso», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Versionar y probar plantillas reduce regresiones entre usos.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 15,
    "modulo": "Intermedio",
    "nombre": "Interpretabilidad Básica de Modelos",
    "legacy": null,
    "teoria": "## Interpretabilidad Básica de Modelos\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Una explicación legible no garantiza fidelidad al funcionamiento del modelo.\n2. **Criterio 2:** Las medidas de importancia dependen del método y del contexto.\n3. **Criterio 3:** Un cambio de entrada permite explorar sensibilidad sin demostrar causalidad.\n4. **Criterio 4:** La incertidumbre y las limitaciones deben comunicarse junto al resultado.\n5. **Criterio 5:** Las decisiones sensibles requieren evidencia y revisión humana además de explicaciones.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Interpretabilidad Básica de Modelos», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Una explicación legible no garantiza fidelidad al funcionamiento del modelo.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Interpretabilidad Básica de Modelos», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Las medidas de importancia dependen del método y del contexto.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Interpretabilidad Básica de Modelos», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Un cambio de entrada permite explorar sensibilidad sin demostrar causalidad.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "En «Interpretabilidad Básica de Modelos», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "La incertidumbre y las limitaciones deben comunicarse junto al resultado.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Interpretabilidad Básica de Modelos», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Las decisiones sensibles requieren evidencia y revisión humana además de explicaciones.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Interpretabilidad Básica de Modelos», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Una explicación legible no garantiza fidelidad al funcionamiento del modelo.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Interpretabilidad Básica de Modelos», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las medidas de importancia dependen del método y del contexto.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al trabajar con «Interpretabilidad Básica de Modelos», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Un cambio de entrada permite explorar sensibilidad sin demostrar causalidad.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Interpretabilidad Básica de Modelos», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La incertidumbre y las limitaciones deben comunicarse junto al resultado.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Interpretabilidad Básica de Modelos», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las decisiones sensibles requieren evidencia y revisión humana además de explicaciones.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Interpretabilidad Básica de Modelos», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Una explicación legible no garantiza fidelidad al funcionamiento del modelo.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Interpretabilidad Básica de Modelos», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Las medidas de importancia dependen del método y del contexto.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Interpretabilidad Básica de Modelos», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Un cambio de entrada permite explorar sensibilidad sin demostrar causalidad.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Interpretabilidad Básica de Modelos», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La incertidumbre y las limitaciones deben comunicarse junto al resultado.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Interpretabilidad Básica de Modelos», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Las decisiones sensibles requieren evidencia y revisión humana además de explicaciones.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 16,
    "modulo": "Intermedio",
    "nombre": "Evaluación Final: Nivel Intermedio",
    "legacy": "intermedio-15",
    "teoria": "## Evaluación Final: Nivel Intermedio\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Un buen análisis verifica datos, unidades y cálculos antes de concluir.\n2. **Criterio 2:** Los prompts deben incluir objetivo, contexto y criterios de salida.\n3. **Criterio 3:** Las alucinaciones y los sesgos deben evaluarse con casos representativos.\n4. **Criterio 4:** Los resultados de automatización necesitan revisión antes de acciones externas.\n5. **Criterio 5:** La evaluación final debe aplicar una rúbrica definida previamente.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Evaluación Final: Nivel Intermedio», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Un buen análisis verifica datos, unidades y cálculos antes de concluir.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Evaluación Final: Nivel Intermedio», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los prompts deben incluir objetivo, contexto y criterios de salida.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Evaluación Final: Nivel Intermedio», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Las alucinaciones y los sesgos deben evaluarse con casos representativos.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "En «Evaluación Final: Nivel Intermedio», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Los resultados de automatización necesitan revisión antes de acciones externas.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Evaluación Final: Nivel Intermedio», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La evaluación final debe aplicar una rúbrica definida previamente.",
            "puntos": 20
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Evaluación Final: Nivel Intermedio», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Un buen análisis verifica datos, unidades y cálculos antes de concluir.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Evaluación Final: Nivel Intermedio», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los prompts deben incluir objetivo, contexto y criterios de salida.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al trabajar con «Evaluación Final: Nivel Intermedio», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Las alucinaciones y los sesgos deben evaluarse con casos representativos.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Evaluación Final: Nivel Intermedio», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los resultados de automatización necesitan revisión antes de acciones externas.",
            "puntos": 20
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Evaluación Final: Nivel Intermedio», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La evaluación final debe aplicar una rúbrica definida previamente.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Evaluación Final: Nivel Intermedio», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Un buen análisis verifica datos, unidades y cálculos antes de concluir.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Evaluación Final: Nivel Intermedio», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Los prompts deben incluir objetivo, contexto y criterios de salida.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Evaluación Final: Nivel Intermedio», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Las alucinaciones y los sesgos deben evaluarse con casos representativos.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Evaluación Final: Nivel Intermedio», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los resultados de automatización necesitan revisión antes de acciones externas.",
            "puntos": 20
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Evaluación Final: Nivel Intermedio», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: La evaluación final debe aplicar una rúbrica definida previamente.",
            "puntos": 20
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 17,
    "modulo": "Básico",
    "nombre": "Anatomía y Estructura del Prompt",
    "legacy": "basico-2",
    "teoria": "## Anatomía y Estructura del Prompt\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Un prompt útil incluye objetivo, contexto y formato deseado.\n2. **Criterio 2:** El rol orienta la respuesta sin garantizar conocimientos correctos.\n3. **Criterio 3:** Las restricciones deben ser claras y no contradictorias.\n4. **Criterio 4:** Un ejemplo puede mostrar la estructura esperada de salida.\n5. **Criterio 5:** Las instrucciones pueden refinarse cuando la respuesta no cumple el objetivo.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Anatomía y Estructura del Prompt», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Un prompt útil incluye objetivo, contexto y formato deseado.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Anatomía y Estructura del Prompt», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "El rol orienta la respuesta sin garantizar conocimientos correctos.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Anatomía y Estructura del Prompt», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Las restricciones deben ser claras y no contradictorias.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "En «Anatomía y Estructura del Prompt», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Un ejemplo puede mostrar la estructura esperada de salida.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Anatomía y Estructura del Prompt», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Las instrucciones pueden refinarse cuando la respuesta no cumple el objetivo.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Anatomía y Estructura del Prompt», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Un prompt útil incluye objetivo, contexto y formato deseado.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Anatomía y Estructura del Prompt», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: El rol orienta la respuesta sin garantizar conocimientos correctos.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al trabajar con «Anatomía y Estructura del Prompt», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Las restricciones deben ser claras y no contradictorias.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Anatomía y Estructura del Prompt», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Un ejemplo puede mostrar la estructura esperada de salida.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Anatomía y Estructura del Prompt», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las instrucciones pueden refinarse cuando la respuesta no cumple el objetivo.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Anatomía y Estructura del Prompt», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Un prompt útil incluye objetivo, contexto y formato deseado.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Anatomía y Estructura del Prompt», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: El rol orienta la respuesta sin garantizar conocimientos correctos.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Anatomía y Estructura del Prompt», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Las restricciones deben ser claras y no contradictorias.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Anatomía y Estructura del Prompt», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Un ejemplo puede mostrar la estructura esperada de salida.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Anatomía y Estructura del Prompt», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Las instrucciones pueden refinarse cuando la respuesta no cumple el objetivo.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 18,
    "modulo": "Básico",
    "nombre": "Privacidad y Reglas de Seguridad Básicas",
    "legacy": "basico-3",
    "teoria": "## Privacidad y Reglas de Seguridad Básicas\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Las contraseñas y las claves de API nunca deben compartirse en herramientas públicas.\n2. **Criterio 2:** Los datos de clientes requieren autorización y controles de privacidad.\n3. **Criterio 3:** Los ejemplos ficticios pueden sustituir información sensible durante el aprendizaje.\n4. **Criterio 4:** Quitar un nombre no garantiza que un documento esté anonimizado.\n5. **Criterio 5:** Ante dudas sobre confidencialidad debe consultarse la política corporativa.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Privacidad y Reglas de Seguridad Básicas», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Las contraseñas y las claves de API nunca deben compartirse en herramientas públicas.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Privacidad y Reglas de Seguridad Básicas», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los datos de clientes requieren autorización y controles de privacidad.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Privacidad y Reglas de Seguridad Básicas», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los ejemplos ficticios pueden sustituir información sensible durante el aprendizaje.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "En «Privacidad y Reglas de Seguridad Básicas», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Quitar un nombre no garantiza que un documento esté anonimizado.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Privacidad y Reglas de Seguridad Básicas», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Ante dudas sobre confidencialidad debe consultarse la política corporativa.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Privacidad y Reglas de Seguridad Básicas», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las contraseñas y las claves de API nunca deben compartirse en herramientas públicas.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Privacidad y Reglas de Seguridad Básicas», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los datos de clientes requieren autorización y controles de privacidad.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al trabajar con «Privacidad y Reglas de Seguridad Básicas», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Los ejemplos ficticios pueden sustituir información sensible durante el aprendizaje.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Privacidad y Reglas de Seguridad Básicas», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Quitar un nombre no garantiza que un documento esté anonimizado.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Privacidad y Reglas de Seguridad Básicas», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Ante dudas sobre confidencialidad debe consultarse la política corporativa.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Privacidad y Reglas de Seguridad Básicas», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Las contraseñas y las claves de API nunca deben compartirse en herramientas públicas.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Privacidad y Reglas de Seguridad Básicas», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Los datos de clientes requieren autorización y controles de privacidad.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Privacidad y Reglas de Seguridad Básicas», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los ejemplos ficticios pueden sustituir información sensible durante el aprendizaje.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Privacidad y Reglas de Seguridad Básicas», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Quitar un nombre no garantiza que un documento esté anonimizado.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Privacidad y Reglas de Seguridad Básicas», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Ante dudas sobre confidencialidad debe consultarse la política corporativa.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 19,
    "modulo": "Básico",
    "nombre": "Buscadores Tradicionales vs. IA Generativa",
    "legacy": "basico-4",
    "teoria": "## Buscadores Tradicionales vs. IA Generativa\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Un buscador recupera información y un modelo generativo produce respuestas.\n2. **Criterio 2:** Algunas aplicaciones de IA combinan generación con herramientas de búsqueda.\n3. **Criterio 3:** Una respuesta generada puede no utilizar información actualizada.\n4. **Criterio 4:** Las fuentes y fechas deben verificarse cuando importan hechos actuales.\n5. **Criterio 5:** Una cita aparente no demuestra que la fuente exista o respalde la respuesta.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Buscadores Tradicionales vs. IA Generativa», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Un buscador recupera información y un modelo generativo produce respuestas.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Buscadores Tradicionales vs. IA Generativa», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Algunas aplicaciones de IA combinan generación con herramientas de búsqueda.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Buscadores Tradicionales vs. IA Generativa», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Una respuesta generada puede no utilizar información actualizada.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "En «Buscadores Tradicionales vs. IA Generativa», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Las fuentes y fechas deben verificarse cuando importan hechos actuales.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Buscadores Tradicionales vs. IA Generativa», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Una cita aparente no demuestra que la fuente exista o respalde la respuesta.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Buscadores Tradicionales vs. IA Generativa», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Un buscador recupera información y un modelo generativo produce respuestas.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Buscadores Tradicionales vs. IA Generativa», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Algunas aplicaciones de IA combinan generación con herramientas de búsqueda.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al trabajar con «Buscadores Tradicionales vs. IA Generativa», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Una respuesta generada puede no utilizar información actualizada.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Buscadores Tradicionales vs. IA Generativa», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las fuentes y fechas deben verificarse cuando importan hechos actuales.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Buscadores Tradicionales vs. IA Generativa», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Una cita aparente no demuestra que la fuente exista o respalde la respuesta.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Buscadores Tradicionales vs. IA Generativa», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Un buscador recupera información y un modelo generativo produce respuestas.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Buscadores Tradicionales vs. IA Generativa», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Algunas aplicaciones de IA combinan generación con herramientas de búsqueda.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Buscadores Tradicionales vs. IA Generativa», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Una respuesta generada puede no utilizar información actualizada.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Buscadores Tradicionales vs. IA Generativa», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Las fuentes y fechas deben verificarse cuando importan hechos actuales.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Buscadores Tradicionales vs. IA Generativa», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Una cita aparente no demuestra que la fuente exista o respalde la respuesta.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 20,
    "modulo": "Básico",
    "nombre": "Formateo y Estructuración de Salidas (JSON, Markdown)",
    "legacy": "basico-5",
    "teoria": "## Formateo y Estructuración de Salidas (JSON, Markdown)\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** El formato de salida debe especificarse con campos y estructura esperados.\n2. **Criterio 2:** JSON usa claves y valores con una sintaxis que debe validarse.\n3. **Criterio 3:** Markdown permite representar títulos, listas y tablas en texto.\n4. **Criterio 4:** Una salida bien formateada todavía puede contener información incorrecta.\n5. **Criterio 5:** El esquema y los tipos de datos ayudan a validar una salida estructurada.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Formateo y Estructuración de Salidas (JSON, Markdown)», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "El formato de salida debe especificarse con campos y estructura esperados.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Formateo y Estructuración de Salidas (JSON, Markdown)», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "JSON usa claves y valores con una sintaxis que debe validarse.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Formateo y Estructuración de Salidas (JSON, Markdown)», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Markdown permite representar títulos, listas y tablas en texto.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "En «Formateo y Estructuración de Salidas (JSON, Markdown)», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Una salida bien formateada todavía puede contener información incorrecta.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Formateo y Estructuración de Salidas (JSON, Markdown)», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "El esquema y los tipos de datos ayudan a validar una salida estructurada.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Formateo y Estructuración de Salidas (JSON, Markdown)», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: El formato de salida debe especificarse con campos y estructura esperados.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Formateo y Estructuración de Salidas (JSON, Markdown)», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: JSON usa claves y valores con una sintaxis que debe validarse.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al trabajar con «Formateo y Estructuración de Salidas (JSON, Markdown)», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Markdown permite representar títulos, listas y tablas en texto.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Formateo y Estructuración de Salidas (JSON, Markdown)», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Una salida bien formateada todavía puede contener información incorrecta.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Formateo y Estructuración de Salidas (JSON, Markdown)», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: El esquema y los tipos de datos ayudan a validar una salida estructurada.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Formateo y Estructuración de Salidas (JSON, Markdown)», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: El formato de salida debe especificarse con campos y estructura esperados.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Formateo y Estructuración de Salidas (JSON, Markdown)», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: JSON usa claves y valores con una sintaxis que debe validarse.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Formateo y Estructuración de Salidas (JSON, Markdown)», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Markdown permite representar títulos, listas y tablas en texto.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Formateo y Estructuración de Salidas (JSON, Markdown)», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Una salida bien formateada todavía puede contener información incorrecta.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Formateo y Estructuración de Salidas (JSON, Markdown)», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: El esquema y los tipos de datos ayudan a validar una salida estructurada.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 21,
    "modulo": "Básico",
    "nombre": "Técnicas de Resumen y Extracción de Información",
    "legacy": "basico-6",
    "teoria": "## Técnicas de Resumen y Extracción de Información\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Un resumen conserva ideas principales sin añadir hechos nuevos.\n2. **Criterio 2:** La extensión y la audiencia deben indicarse en la instrucción.\n3. **Criterio 3:** Extraer un dato requiere comprobarlo contra el documento original.\n4. **Criterio 4:** Las omisiones relevantes deben revisarse antes de compartir el resumen.\n5. **Criterio 5:** Si un dato no aparece en la fuente debe señalarse como no disponible.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Técnicas de Resumen y Extracción de Información», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Un resumen conserva ideas principales sin añadir hechos nuevos.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Técnicas de Resumen y Extracción de Información», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La extensión y la audiencia deben indicarse en la instrucción.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Técnicas de Resumen y Extracción de Información», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Extraer un dato requiere comprobarlo contra el documento original.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "En «Técnicas de Resumen y Extracción de Información», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Las omisiones relevantes deben revisarse antes de compartir el resumen.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Técnicas de Resumen y Extracción de Información», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Si un dato no aparece en la fuente debe señalarse como no disponible.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Técnicas de Resumen y Extracción de Información», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Un resumen conserva ideas principales sin añadir hechos nuevos.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Técnicas de Resumen y Extracción de Información», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La extensión y la audiencia deben indicarse en la instrucción.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al trabajar con «Técnicas de Resumen y Extracción de Información», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Extraer un dato requiere comprobarlo contra el documento original.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Técnicas de Resumen y Extracción de Información», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las omisiones relevantes deben revisarse antes de compartir el resumen.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Técnicas de Resumen y Extracción de Información», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Si un dato no aparece en la fuente debe señalarse como no disponible.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Técnicas de Resumen y Extracción de Información», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Un resumen conserva ideas principales sin añadir hechos nuevos.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Técnicas de Resumen y Extracción de Información», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: La extensión y la audiencia deben indicarse en la instrucción.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Técnicas de Resumen y Extracción de Información», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Extraer un dato requiere comprobarlo contra el documento original.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Técnicas de Resumen y Extracción de Información», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Las omisiones relevantes deben revisarse antes de compartir el resumen.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Técnicas de Resumen y Extracción de Información», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Si un dato no aparece en la fuente debe señalarse como no disponible.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 22,
    "modulo": "Básico",
    "nombre": "Ajuste de Tono y Traducción Contextual",
    "legacy": "basico-7",
    "teoria": "## Ajuste de Tono y Traducción Contextual\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** El tono debe adaptarse a la audiencia sin alterar el significado.\n2. **Criterio 2:** Las traducciones requieren revisar terminología especializada.\n3. **Criterio 3:** Un tono corporativo claro no necesita expresiones innecesariamente complejas.\n4. **Criterio 4:** Un glosario autorizado ayuda a mantener consistencia terminológica.\n5. **Criterio 5:** Los documentos legales o sensibles requieren revisión competente de la traducción.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Ajuste de Tono y Traducción Contextual», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "El tono debe adaptarse a la audiencia sin alterar el significado.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Ajuste de Tono y Traducción Contextual», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Las traducciones requieren revisar terminología especializada.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Ajuste de Tono y Traducción Contextual», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Un tono corporativo claro no necesita expresiones innecesariamente complejas.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "En «Ajuste de Tono y Traducción Contextual», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Un glosario autorizado ayuda a mantener consistencia terminológica.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Ajuste de Tono y Traducción Contextual», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los documentos legales o sensibles requieren revisión competente de la traducción.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Ajuste de Tono y Traducción Contextual», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: El tono debe adaptarse a la audiencia sin alterar el significado.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Ajuste de Tono y Traducción Contextual», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las traducciones requieren revisar terminología especializada.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al trabajar con «Ajuste de Tono y Traducción Contextual», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Un tono corporativo claro no necesita expresiones innecesariamente complejas.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Ajuste de Tono y Traducción Contextual», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Un glosario autorizado ayuda a mantener consistencia terminológica.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Ajuste de Tono y Traducción Contextual», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los documentos legales o sensibles requieren revisión competente de la traducción.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Ajuste de Tono y Traducción Contextual», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: El tono debe adaptarse a la audiencia sin alterar el significado.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Ajuste de Tono y Traducción Contextual», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Las traducciones requieren revisar terminología especializada.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Ajuste de Tono y Traducción Contextual», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Un tono corporativo claro no necesita expresiones innecesariamente complejas.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Ajuste de Tono y Traducción Contextual», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Un glosario autorizado ayuda a mantener consistencia terminológica.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Ajuste de Tono y Traducción Contextual», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Los documentos legales o sensibles requieren revisión competente de la traducción.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 23,
    "modulo": "Básico",
    "nombre": "Brainstorming y Lluvia de Ideas Asistida",
    "legacy": "basico-8",
    "teoria": "## Brainstorming y Lluvia de Ideas Asistida\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** La lluvia de ideas genera alternativas que aún requieren evaluación.\n2. **Criterio 2:** Definir restricciones y objetivos ayuda a obtener propuestas pertinentes.\n3. **Criterio 3:** La diversidad de propuestas puede aumentar al pedir enfoques diferentes.\n4. **Criterio 4:** La viabilidad de una idea debe contrastarse con recursos y requisitos reales.\n5. **Criterio 5:** Una propuesta creativa no implica que sea segura, legal o eficaz.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Brainstorming y Lluvia de Ideas Asistida», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "La lluvia de ideas genera alternativas que aún requieren evaluación.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Brainstorming y Lluvia de Ideas Asistida», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Definir restricciones y objetivos ayuda a obtener propuestas pertinentes.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Brainstorming y Lluvia de Ideas Asistida», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La diversidad de propuestas puede aumentar al pedir enfoques diferentes.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "En «Brainstorming y Lluvia de Ideas Asistida», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "La viabilidad de una idea debe contrastarse con recursos y requisitos reales.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Brainstorming y Lluvia de Ideas Asistida», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Una propuesta creativa no implica que sea segura, legal o eficaz.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Brainstorming y Lluvia de Ideas Asistida», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La lluvia de ideas genera alternativas que aún requieren evaluación.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Brainstorming y Lluvia de Ideas Asistida», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Definir restricciones y objetivos ayuda a obtener propuestas pertinentes.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al trabajar con «Brainstorming y Lluvia de Ideas Asistida», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: La diversidad de propuestas puede aumentar al pedir enfoques diferentes.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Brainstorming y Lluvia de Ideas Asistida», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La viabilidad de una idea debe contrastarse con recursos y requisitos reales.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Brainstorming y Lluvia de Ideas Asistida», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Una propuesta creativa no implica que sea segura, legal o eficaz.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Brainstorming y Lluvia de Ideas Asistida», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La lluvia de ideas genera alternativas que aún requieren evaluación.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Brainstorming y Lluvia de Ideas Asistida», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Definir restricciones y objetivos ayuda a obtener propuestas pertinentes.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Brainstorming y Lluvia de Ideas Asistida», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La diversidad de propuestas puede aumentar al pedir enfoques diferentes.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Brainstorming y Lluvia de Ideas Asistida», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La viabilidad de una idea debe contrastarse con recursos y requisitos reales.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Brainstorming y Lluvia de Ideas Asistida», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Una propuesta creativa no implica que sea segura, legal o eficaz.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 24,
    "modulo": "Básico",
    "nombre": "Automatización de Tareas Administrativas",
    "legacy": "basico-9",
    "teoria": "## Automatización de Tareas Administrativas\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** La IA puede apoyar borradores de correos y documentos administrativos.\n2. **Criterio 2:** Los nombres, fechas y cantidades deben revisarse antes del envío.\n3. **Criterio 3:** Los datos sensibles solo deben usarse en herramientas autorizadas.\n4. **Criterio 4:** La revisión humana es necesaria antes de acciones que afecten a terceros.\n5. **Criterio 5:** Una plantilla clara permite reutilizar la tarea sin copiar datos de otros clientes.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Automatización de Tareas Administrativas», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "La IA puede apoyar borradores de correos y documentos administrativos.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Automatización de Tareas Administrativas», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los nombres, fechas y cantidades deben revisarse antes del envío.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Automatización de Tareas Administrativas», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los datos sensibles solo deben usarse en herramientas autorizadas.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "En «Automatización de Tareas Administrativas», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "La revisión humana es necesaria antes de acciones que afecten a terceros.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Automatización de Tareas Administrativas», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Una plantilla clara permite reutilizar la tarea sin copiar datos de otros clientes.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Automatización de Tareas Administrativas», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La IA puede apoyar borradores de correos y documentos administrativos.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Automatización de Tareas Administrativas», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los nombres, fechas y cantidades deben revisarse antes del envío.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al trabajar con «Automatización de Tareas Administrativas», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Los datos sensibles solo deben usarse en herramientas autorizadas.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Automatización de Tareas Administrativas», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La revisión humana es necesaria antes de acciones que afecten a terceros.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Automatización de Tareas Administrativas», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Una plantilla clara permite reutilizar la tarea sin copiar datos de otros clientes.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Automatización de Tareas Administrativas», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La IA puede apoyar borradores de correos y documentos administrativos.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Automatización de Tareas Administrativas», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Los nombres, fechas y cantidades deben revisarse antes del envío.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Automatización de Tareas Administrativas», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los datos sensibles solo deben usarse en herramientas autorizadas.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Automatización de Tareas Administrativas», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La revisión humana es necesaria antes de acciones que afecten a terceros.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Automatización de Tareas Administrativas», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Una plantilla clara permite reutilizar la tarea sin copiar datos de otros clientes.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 25,
    "modulo": "Básico",
    "nombre": "Evaluación Final: Nivel Básico",
    "legacy": "basico-10",
    "teoria": "## Evaluación Final: Nivel Básico\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Un prompt claro combina tarea, contexto y formato de salida.\n2. **Criterio 2:** La información confidencial no debe exponerse en una IA pública.\n3. **Criterio 3:** La exactitud de una respuesta debe verificarse antes de utilizarla.\n4. **Criterio 4:** Los resúmenes y traducciones deben conservar el significado de la fuente.\n5. **Criterio 5:** El uso responsable mantiene supervisión humana y políticas de la empresa.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Evaluación Final: Nivel Básico», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Un prompt claro combina tarea, contexto y formato de salida.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Evaluación Final: Nivel Básico», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La información confidencial no debe exponerse en una IA pública.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Evaluación Final: Nivel Básico», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La exactitud de una respuesta debe verificarse antes de utilizarla.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "En «Evaluación Final: Nivel Básico», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Los resúmenes y traducciones deben conservar el significado de la fuente.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Evaluación Final: Nivel Básico», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "El uso responsable mantiene supervisión humana y políticas de la empresa.",
            "puntos": 10
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Evaluación Final: Nivel Básico», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Un prompt claro combina tarea, contexto y formato de salida.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Evaluación Final: Nivel Básico», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La información confidencial no debe exponerse en una IA pública.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al trabajar con «Evaluación Final: Nivel Básico», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: La exactitud de una respuesta debe verificarse antes de utilizarla.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Evaluación Final: Nivel Básico», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los resúmenes y traducciones deben conservar el significado de la fuente.",
            "puntos": 10
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Evaluación Final: Nivel Básico», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: El uso responsable mantiene supervisión humana y políticas de la empresa.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Evaluación Final: Nivel Básico», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Un prompt claro combina tarea, contexto y formato de salida.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Evaluación Final: Nivel Básico», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: La información confidencial no debe exponerse en una IA pública.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Evaluación Final: Nivel Básico», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La exactitud de una respuesta debe verificarse antes de utilizarla.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Evaluación Final: Nivel Básico», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los resúmenes y traducciones deben conservar el significado de la fuente.",
            "puntos": 10
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Evaluación Final: Nivel Básico», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: El uso responsable mantiene supervisión humana y políticas de la empresa.",
            "puntos": 10
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 26,
    "modulo": "Avanzado",
    "nombre": "Arquitecturas RAG (Retrieval-Augmented Generation)",
    "legacy": "avanzado-2",
    "teoria": "## Arquitecturas RAG (Retrieval-Augmented Generation)\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** RAG recupera información y la incorpora al contexto de generación.\n2. **Criterio 2:** La fragmentación y los metadatos influyen en la calidad de recuperación.\n3. **Criterio 3:** Los permisos deben aplicarse antes de recuperar documentos para un usuario.\n4. **Criterio 4:** La evaluación debe separar recuperación y generación de respuestas.\n5. **Criterio 5:** RAG reduce ciertos riesgos de falta de contexto pero no elimina alucinaciones.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Arquitecturas RAG (Retrieval-Augmented Generation)», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "RAG recupera información y la incorpora al contexto de generación.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Arquitecturas RAG (Retrieval-Augmented Generation)», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La fragmentación y los metadatos influyen en la calidad de recuperación.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Arquitecturas RAG (Retrieval-Augmented Generation)», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los permisos deben aplicarse antes de recuperar documentos para un usuario.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "En «Arquitecturas RAG (Retrieval-Augmented Generation)», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "La evaluación debe separar recuperación y generación de respuestas.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Arquitecturas RAG (Retrieval-Augmented Generation)», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "RAG reduce ciertos riesgos de falta de contexto pero no elimina alucinaciones.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Arquitecturas RAG (Retrieval-Augmented Generation)», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: RAG recupera información y la incorpora al contexto de generación.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Arquitecturas RAG (Retrieval-Augmented Generation)», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La fragmentación y los metadatos influyen en la calidad de recuperación.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al trabajar con «Arquitecturas RAG (Retrieval-Augmented Generation)», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Los permisos deben aplicarse antes de recuperar documentos para un usuario.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Arquitecturas RAG (Retrieval-Augmented Generation)», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La evaluación debe separar recuperación y generación de respuestas.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Arquitecturas RAG (Retrieval-Augmented Generation)», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: RAG reduce ciertos riesgos de falta de contexto pero no elimina alucinaciones.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Arquitecturas RAG (Retrieval-Augmented Generation)», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: RAG recupera información y la incorpora al contexto de generación.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Arquitecturas RAG (Retrieval-Augmented Generation)», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: La fragmentación y los metadatos influyen en la calidad de recuperación.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Arquitecturas RAG (Retrieval-Augmented Generation)», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los permisos deben aplicarse antes de recuperar documentos para un usuario.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Arquitecturas RAG (Retrieval-Augmented Generation)», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La evaluación debe separar recuperación y generación de respuestas.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Arquitecturas RAG (Retrieval-Augmented Generation)», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: RAG reduce ciertos riesgos de falta de contexto pero no elimina alucinaciones.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 27,
    "modulo": "Avanzado",
    "nombre": "Fine-Tuning vs. Prompt Engineering Avanzado",
    "legacy": "avanzado-1",
    "teoria": "## Fine-Tuning vs. Prompt Engineering Avanzado\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Fine-tuning ajusta parámetros del modelo mediante datos de entrenamiento.\n2. **Criterio 2:** Prompt engineering modifica instrucciones y contexto sin ajustar parámetros.\n3. **Criterio 3:** La elección depende del objetivo, los datos, la evaluación y el coste.\n4. **Criterio 4:** Los cambios frecuentes de conocimiento pueden gestionarse mediante recuperación en lugar de reentrenar.\n5. **Criterio 5:** Un conjunto de evaluación separado permite comprobar la generalización del ajuste.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Fine-Tuning vs. Prompt Engineering Avanzado», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Fine-tuning ajusta parámetros del modelo mediante datos de entrenamiento.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Fine-Tuning vs. Prompt Engineering Avanzado», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Prompt engineering modifica instrucciones y contexto sin ajustar parámetros.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Fine-Tuning vs. Prompt Engineering Avanzado», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La elección depende del objetivo, los datos, la evaluación y el coste.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "En «Fine-Tuning vs. Prompt Engineering Avanzado», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Los cambios frecuentes de conocimiento pueden gestionarse mediante recuperación en lugar de reentrenar.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Fine-Tuning vs. Prompt Engineering Avanzado», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Un conjunto de evaluación separado permite comprobar la generalización del ajuste.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Fine-Tuning vs. Prompt Engineering Avanzado», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Fine-tuning ajusta parámetros del modelo mediante datos de entrenamiento.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Fine-Tuning vs. Prompt Engineering Avanzado», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Prompt engineering modifica instrucciones y contexto sin ajustar parámetros.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al trabajar con «Fine-Tuning vs. Prompt Engineering Avanzado», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: La elección depende del objetivo, los datos, la evaluación y el coste.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Fine-Tuning vs. Prompt Engineering Avanzado», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los cambios frecuentes de conocimiento pueden gestionarse mediante recuperación en lugar de reentrenar.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Fine-Tuning vs. Prompt Engineering Avanzado», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Un conjunto de evaluación separado permite comprobar la generalización del ajuste.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Fine-Tuning vs. Prompt Engineering Avanzado», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Fine-tuning ajusta parámetros del modelo mediante datos de entrenamiento.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Fine-Tuning vs. Prompt Engineering Avanzado», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Prompt engineering modifica instrucciones y contexto sin ajustar parámetros.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Fine-Tuning vs. Prompt Engineering Avanzado», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La elección depende del objetivo, los datos, la evaluación y el coste.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Fine-Tuning vs. Prompt Engineering Avanzado», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los cambios frecuentes de conocimiento pueden gestionarse mediante recuperación en lugar de reentrenar.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Fine-Tuning vs. Prompt Engineering Avanzado», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Un conjunto de evaluación separado permite comprobar la generalización del ajuste.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 28,
    "modulo": "Avanzado",
    "nombre": "Acuerdos Zero Data Retention y Compliance",
    "legacy": "avanzado-4",
    "teoria": "## Acuerdos Zero Data Retention y Compliance\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** La retención cero depende del contrato, los servicios y las excepciones aplicables.\n2. **Criterio 2:** Retención de datos y uso para entrenamiento son condiciones diferentes.\n3. **Criterio 3:** El cumplimiento requiere revisar también logs, subprocesadores y jurisdicción.\n4. **Criterio 4:** Las garantías deben verificarse en documentación y acuerdos vigentes.\n5. **Criterio 5:** Los controles de la empresa siguen siendo necesarios aunque exista un acuerdo de retención cero.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Acuerdos Zero Data Retention y Compliance», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "La retención cero depende del contrato, los servicios y las excepciones aplicables.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Acuerdos Zero Data Retention y Compliance», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Retención de datos y uso para entrenamiento son condiciones diferentes.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Acuerdos Zero Data Retention y Compliance», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "El cumplimiento requiere revisar también logs, subprocesadores y jurisdicción.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "En «Acuerdos Zero Data Retention y Compliance», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Las garantías deben verificarse en documentación y acuerdos vigentes.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Acuerdos Zero Data Retention y Compliance», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los controles de la empresa siguen siendo necesarios aunque exista un acuerdo de retención cero.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Acuerdos Zero Data Retention y Compliance», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La retención cero depende del contrato, los servicios y las excepciones aplicables.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Acuerdos Zero Data Retention y Compliance», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Retención de datos y uso para entrenamiento son condiciones diferentes.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al trabajar con «Acuerdos Zero Data Retention y Compliance», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: El cumplimiento requiere revisar también logs, subprocesadores y jurisdicción.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Acuerdos Zero Data Retention y Compliance», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las garantías deben verificarse en documentación y acuerdos vigentes.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Acuerdos Zero Data Retention y Compliance», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los controles de la empresa siguen siendo necesarios aunque exista un acuerdo de retención cero.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Acuerdos Zero Data Retention y Compliance», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La retención cero depende del contrato, los servicios y las excepciones aplicables.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Acuerdos Zero Data Retention y Compliance», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Retención de datos y uso para entrenamiento son condiciones diferentes.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Acuerdos Zero Data Retention y Compliance», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: El cumplimiento requiere revisar también logs, subprocesadores y jurisdicción.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Acuerdos Zero Data Retention y Compliance», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Las garantías deben verificarse en documentación y acuerdos vigentes.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Acuerdos Zero Data Retention y Compliance», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Los controles de la empresa siguen siendo necesarios aunque exista un acuerdo de retención cero.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 29,
    "modulo": "Avanzado",
    "nombre": "Vulnerabilidades I: Prompt Injection",
    "legacy": "avanzado-7",
    "teoria": "## Vulnerabilidades I: Prompt Injection\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Una inyección intenta alterar el comportamiento mediante contenido no confiable.\n2. **Criterio 2:** Los documentos recuperados deben tratarse como datos y no como instrucciones de sistema.\n3. **Criterio 3:** Los mínimos privilegios limitan el impacto de acciones inducidas.\n4. **Criterio 4:** Las acciones sensibles requieren validación y autorización fuera del modelo.\n5. **Criterio 5:** Una instrucción defensiva en el prompt no garantiza inmunidad a ataques.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Vulnerabilidades I: Prompt Injection», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Una inyección intenta alterar el comportamiento mediante contenido no confiable.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Vulnerabilidades I: Prompt Injection», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los documentos recuperados deben tratarse como datos y no como instrucciones de sistema.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Vulnerabilidades I: Prompt Injection», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los mínimos privilegios limitan el impacto de acciones inducidas.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "En «Vulnerabilidades I: Prompt Injection», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Las acciones sensibles requieren validación y autorización fuera del modelo.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Vulnerabilidades I: Prompt Injection», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Una instrucción defensiva en el prompt no garantiza inmunidad a ataques.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Vulnerabilidades I: Prompt Injection», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Una inyección intenta alterar el comportamiento mediante contenido no confiable.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Vulnerabilidades I: Prompt Injection», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los documentos recuperados deben tratarse como datos y no como instrucciones de sistema.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al trabajar con «Vulnerabilidades I: Prompt Injection», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Los mínimos privilegios limitan el impacto de acciones inducidas.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Vulnerabilidades I: Prompt Injection», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las acciones sensibles requieren validación y autorización fuera del modelo.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Vulnerabilidades I: Prompt Injection», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Una instrucción defensiva en el prompt no garantiza inmunidad a ataques.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Vulnerabilidades I: Prompt Injection», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Una inyección intenta alterar el comportamiento mediante contenido no confiable.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Vulnerabilidades I: Prompt Injection», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Los documentos recuperados deben tratarse como datos y no como instrucciones de sistema.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Vulnerabilidades I: Prompt Injection», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los mínimos privilegios limitan el impacto de acciones inducidas.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Vulnerabilidades I: Prompt Injection», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Las acciones sensibles requieren validación y autorización fuera del modelo.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Vulnerabilidades I: Prompt Injection», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Una instrucción defensiva en el prompt no garantiza inmunidad a ataques.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 30,
    "modulo": "Avanzado",
    "nombre": "Vulnerabilidades II: Prompt Leaking y Jailbreaking",
    "legacy": null,
    "teoria": "## Vulnerabilidades II: Prompt Leaking y Jailbreaking\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Los prompts de sistema no son un almacén seguro para secretos.\n2. **Criterio 2:** Un jailbreak intenta eludir restricciones de comportamiento del modelo.\n3. **Criterio 3:** La autorización y los permisos deben aplicarse en la aplicación.\n4. **Criterio 4:** Las pruebas adversariales deben realizarse en entornos autorizados y controlados.\n5. **Criterio 5:** Los filtros deben evaluarse por evasiones y también por falsos positivos.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Vulnerabilidades II: Prompt Leaking y Jailbreaking», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Los prompts de sistema no son un almacén seguro para secretos.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Vulnerabilidades II: Prompt Leaking y Jailbreaking», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Un jailbreak intenta eludir restricciones de comportamiento del modelo.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Vulnerabilidades II: Prompt Leaking y Jailbreaking», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La autorización y los permisos deben aplicarse en la aplicación.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "En «Vulnerabilidades II: Prompt Leaking y Jailbreaking», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Las pruebas adversariales deben realizarse en entornos autorizados y controlados.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Vulnerabilidades II: Prompt Leaking y Jailbreaking», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los filtros deben evaluarse por evasiones y también por falsos positivos.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Vulnerabilidades II: Prompt Leaking y Jailbreaking», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los prompts de sistema no son un almacén seguro para secretos.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Vulnerabilidades II: Prompt Leaking y Jailbreaking», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Un jailbreak intenta eludir restricciones de comportamiento del modelo.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al trabajar con «Vulnerabilidades II: Prompt Leaking y Jailbreaking», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: La autorización y los permisos deben aplicarse en la aplicación.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Vulnerabilidades II: Prompt Leaking y Jailbreaking», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las pruebas adversariales deben realizarse en entornos autorizados y controlados.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Vulnerabilidades II: Prompt Leaking y Jailbreaking», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los filtros deben evaluarse por evasiones y también por falsos positivos.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Vulnerabilidades II: Prompt Leaking y Jailbreaking», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los prompts de sistema no son un almacén seguro para secretos.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Vulnerabilidades II: Prompt Leaking y Jailbreaking», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Un jailbreak intenta eludir restricciones de comportamiento del modelo.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Vulnerabilidades II: Prompt Leaking y Jailbreaking», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La autorización y los permisos deben aplicarse en la aplicación.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Vulnerabilidades II: Prompt Leaking y Jailbreaking», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Las pruebas adversariales deben realizarse en entornos autorizados y controlados.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Vulnerabilidades II: Prompt Leaking y Jailbreaking», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Los filtros deben evaluarse por evasiones y también por falsos positivos.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 31,
    "modulo": "Avanzado",
    "nombre": "Diseño de System Prompts Defensivos",
    "legacy": "avanzado-9",
    "teoria": "## Diseño de System Prompts Defensivos\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Las políticas deben definir alcance, prioridades y comportamiento ante incertidumbre.\n2. **Criterio 2:** La separación entre instrucciones y datos reduce ambigüedades.\n3. **Criterio 3:** Las restricciones comerciales requieren validación de salida además del prompt.\n4. **Criterio 4:** Los secretos y las credenciales deben mantenerse fuera de los prompts.\n5. **Criterio 5:** Las políticas deben probarse con casos legítimos, límites y ataques controlados.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Diseño de System Prompts Defensivos», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Las políticas deben definir alcance, prioridades y comportamiento ante incertidumbre.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Diseño de System Prompts Defensivos», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La separación entre instrucciones y datos reduce ambigüedades.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Diseño de System Prompts Defensivos», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Las restricciones comerciales requieren validación de salida además del prompt.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "En «Diseño de System Prompts Defensivos», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Los secretos y las credenciales deben mantenerse fuera de los prompts.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Diseño de System Prompts Defensivos», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Las políticas deben probarse con casos legítimos, límites y ataques controlados.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Diseño de System Prompts Defensivos», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las políticas deben definir alcance, prioridades y comportamiento ante incertidumbre.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Diseño de System Prompts Defensivos», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La separación entre instrucciones y datos reduce ambigüedades.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al trabajar con «Diseño de System Prompts Defensivos», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Las restricciones comerciales requieren validación de salida además del prompt.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Diseño de System Prompts Defensivos», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los secretos y las credenciales deben mantenerse fuera de los prompts.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Diseño de System Prompts Defensivos», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las políticas deben probarse con casos legítimos, límites y ataques controlados.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Diseño de System Prompts Defensivos», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Las políticas deben definir alcance, prioridades y comportamiento ante incertidumbre.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Diseño de System Prompts Defensivos», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: La separación entre instrucciones y datos reduce ambigüedades.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Diseño de System Prompts Defensivos», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Las restricciones comerciales requieren validación de salida además del prompt.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Diseño de System Prompts Defensivos», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los secretos y las credenciales deben mantenerse fuera de los prompts.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Diseño de System Prompts Defensivos», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Las políticas deben probarse con casos legítimos, límites y ataques controlados.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 32,
    "modulo": "Avanzado",
    "nombre": "Agentes Autónomos y Sistemas Multi-Agente",
    "legacy": "avanzado-11",
    "teoria": "## Agentes Autónomos y Sistemas Multi-Agente\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Un agente combina decisiones del modelo con herramientas y ejecución de tareas.\n2. **Criterio 2:** Los ciclos necesitan límites de pasos, tiempo y presupuesto.\n3. **Criterio 3:** Cada agente debe tener permisos mínimos adecuados a su función.\n4. **Criterio 4:** Las acciones sensibles deben incluir confirmación humana.\n5. **Criterio 5:** Varios agentes pueden compartir errores si no existe verificación independiente.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Agentes Autónomos y Sistemas Multi-Agente», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Un agente combina decisiones del modelo con herramientas y ejecución de tareas.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Agentes Autónomos y Sistemas Multi-Agente», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los ciclos necesitan límites de pasos, tiempo y presupuesto.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Agentes Autónomos y Sistemas Multi-Agente», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Cada agente debe tener permisos mínimos adecuados a su función.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "En «Agentes Autónomos y Sistemas Multi-Agente», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Las acciones sensibles deben incluir confirmación humana.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Agentes Autónomos y Sistemas Multi-Agente», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Varios agentes pueden compartir errores si no existe verificación independiente.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Agentes Autónomos y Sistemas Multi-Agente», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Un agente combina decisiones del modelo con herramientas y ejecución de tareas.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Agentes Autónomos y Sistemas Multi-Agente», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los ciclos necesitan límites de pasos, tiempo y presupuesto.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al trabajar con «Agentes Autónomos y Sistemas Multi-Agente», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Cada agente debe tener permisos mínimos adecuados a su función.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Agentes Autónomos y Sistemas Multi-Agente», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las acciones sensibles deben incluir confirmación humana.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Agentes Autónomos y Sistemas Multi-Agente», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Varios agentes pueden compartir errores si no existe verificación independiente.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Agentes Autónomos y Sistemas Multi-Agente», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Un agente combina decisiones del modelo con herramientas y ejecución de tareas.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Agentes Autónomos y Sistemas Multi-Agente», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Los ciclos necesitan límites de pasos, tiempo y presupuesto.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Agentes Autónomos y Sistemas Multi-Agente», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Cada agente debe tener permisos mínimos adecuados a su función.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Agentes Autónomos y Sistemas Multi-Agente», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Las acciones sensibles deben incluir confirmación humana.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Agentes Autónomos y Sistemas Multi-Agente», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Varios agentes pueden compartir errores si no existe verificación independiente.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 33,
    "modulo": "Avanzado",
    "nombre": "Seguridad Empresarial y Enmascaramiento de PII",
    "legacy": "avanzado-13",
    "teoria": "## Seguridad Empresarial y Enmascaramiento de PII\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Los datos personales deben identificarse y minimizarse antes del procesamiento.\n2. **Criterio 2:** El enmascaramiento no siempre equivale a anonimización irreversible.\n3. **Criterio 3:** Las claves de API deben almacenarse en el servidor con controles de acceso.\n4. **Criterio 4:** La autorización debe comprobarse en cada operación sobre datos.\n5. **Criterio 5:** Los registros de auditoría deben evitar almacenar información sensible innecesaria.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Seguridad Empresarial y Enmascaramiento de PII», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Los datos personales deben identificarse y minimizarse antes del procesamiento.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Seguridad Empresarial y Enmascaramiento de PII», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "El enmascaramiento no siempre equivale a anonimización irreversible.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Seguridad Empresarial y Enmascaramiento de PII», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Las claves de API deben almacenarse en el servidor con controles de acceso.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "En «Seguridad Empresarial y Enmascaramiento de PII», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "La autorización debe comprobarse en cada operación sobre datos.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Seguridad Empresarial y Enmascaramiento de PII», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los registros de auditoría deben evitar almacenar información sensible innecesaria.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Seguridad Empresarial y Enmascaramiento de PII», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los datos personales deben identificarse y minimizarse antes del procesamiento.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Seguridad Empresarial y Enmascaramiento de PII», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: El enmascaramiento no siempre equivale a anonimización irreversible.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al trabajar con «Seguridad Empresarial y Enmascaramiento de PII», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Las claves de API deben almacenarse en el servidor con controles de acceso.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Seguridad Empresarial y Enmascaramiento de PII», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La autorización debe comprobarse en cada operación sobre datos.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Seguridad Empresarial y Enmascaramiento de PII», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los registros de auditoría deben evitar almacenar información sensible innecesaria.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Seguridad Empresarial y Enmascaramiento de PII», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los datos personales deben identificarse y minimizarse antes del procesamiento.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Seguridad Empresarial y Enmascaramiento de PII», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: El enmascaramiento no siempre equivale a anonimización irreversible.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Seguridad Empresarial y Enmascaramiento de PII», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Las claves de API deben almacenarse en el servidor con controles de acceso.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Seguridad Empresarial y Enmascaramiento de PII», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La autorización debe comprobarse en cada operación sobre datos.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Seguridad Empresarial y Enmascaramiento de PII», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Los registros de auditoría deben evitar almacenar información sensible innecesaria.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 34,
    "modulo": "Avanzado",
    "nombre": "Optimización Avanzada de Costos de API",
    "legacy": "avanzado-15",
    "teoria": "## Optimización Avanzada de Costos de API\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** El coste depende del modelo, los tokens y las operaciones ejecutadas.\n2. **Criterio 2:** Los presupuestos deben limitar el consumo por usuario o tarea.\n3. **Criterio 3:** La selección de modelos debe equilibrar coste y calidad medida.\n4. **Criterio 4:** La caché requiere aislamiento y políticas de privacidad.\n5. **Criterio 5:** Los reintentos ilimitados pueden multiplicar costes sin resolver el fallo.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Optimización Avanzada de Costos de API», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "El coste depende del modelo, los tokens y las operaciones ejecutadas.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Optimización Avanzada de Costos de API», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los presupuestos deben limitar el consumo por usuario o tarea.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Optimización Avanzada de Costos de API», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La selección de modelos debe equilibrar coste y calidad medida.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "En «Optimización Avanzada de Costos de API», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "La caché requiere aislamiento y políticas de privacidad.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Optimización Avanzada de Costos de API», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los reintentos ilimitados pueden multiplicar costes sin resolver el fallo.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Optimización Avanzada de Costos de API», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: El coste depende del modelo, los tokens y las operaciones ejecutadas.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Optimización Avanzada de Costos de API», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los presupuestos deben limitar el consumo por usuario o tarea.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al trabajar con «Optimización Avanzada de Costos de API», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: La selección de modelos debe equilibrar coste y calidad medida.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Optimización Avanzada de Costos de API», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La caché requiere aislamiento y políticas de privacidad.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Optimización Avanzada de Costos de API», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los reintentos ilimitados pueden multiplicar costes sin resolver el fallo.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Optimización Avanzada de Costos de API», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: El coste depende del modelo, los tokens y las operaciones ejecutadas.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Optimización Avanzada de Costos de API», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Los presupuestos deben limitar el consumo por usuario o tarea.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Optimización Avanzada de Costos de API», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La selección de modelos debe equilibrar coste y calidad medida.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Optimización Avanzada de Costos de API», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La caché requiere aislamiento y políticas de privacidad.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Optimización Avanzada de Costos de API», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Los reintentos ilimitados pueden multiplicar costes sin resolver el fallo.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 35,
    "modulo": "Avanzado",
    "nombre": "Modelos Open Source vs. Propietarios",
    "legacy": null,
    "teoria": "## Modelos Open Source vs. Propietarios\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** La licencia debe comprobarse antes de utilizar un modelo comercialmente.\n2. **Criterio 2:** Pesos disponibles no implican necesariamente ausencia de restricciones.\n3. **Criterio 3:** La comparación debe considerar calidad, latencia, seguridad y coste total.\n4. **Criterio 4:** Hospedar un modelo local requiere recursos y mantenimiento propios.\n5. **Criterio 5:** La privacidad depende de la arquitectura y los controles, no solo del tipo de licencia.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Modelos Open Source vs. Propietarios», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "La licencia debe comprobarse antes de utilizar un modelo comercialmente.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Modelos Open Source vs. Propietarios», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Pesos disponibles no implican necesariamente ausencia de restricciones.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Modelos Open Source vs. Propietarios», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La comparación debe considerar calidad, latencia, seguridad y coste total.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "En «Modelos Open Source vs. Propietarios», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Hospedar un modelo local requiere recursos y mantenimiento propios.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Modelos Open Source vs. Propietarios», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La privacidad depende de la arquitectura y los controles, no solo del tipo de licencia.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Modelos Open Source vs. Propietarios», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La licencia debe comprobarse antes de utilizar un modelo comercialmente.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Modelos Open Source vs. Propietarios», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Pesos disponibles no implican necesariamente ausencia de restricciones.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al trabajar con «Modelos Open Source vs. Propietarios», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: La comparación debe considerar calidad, latencia, seguridad y coste total.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Modelos Open Source vs. Propietarios», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Hospedar un modelo local requiere recursos y mantenimiento propios.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Modelos Open Source vs. Propietarios», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La privacidad depende de la arquitectura y los controles, no solo del tipo de licencia.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Modelos Open Source vs. Propietarios», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La licencia debe comprobarse antes de utilizar un modelo comercialmente.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Modelos Open Source vs. Propietarios», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Pesos disponibles no implican necesariamente ausencia de restricciones.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Modelos Open Source vs. Propietarios», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La comparación debe considerar calidad, latencia, seguridad y coste total.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Modelos Open Source vs. Propietarios», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Hospedar un modelo local requiere recursos y mantenimiento propios.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Modelos Open Source vs. Propietarios», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: La privacidad depende de la arquitectura y los controles, no solo del tipo de licencia.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 36,
    "modulo": "Avanzado",
    "nombre": "Embeddings y Bases de Datos Vectoriales",
    "legacy": null,
    "teoria": "## Embeddings y Bases de Datos Vectoriales\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Un embedding representa información mediante un vector numérico.\n2. **Criterio 2:** La similitud vectorial ayuda a recuperar contenido semánticamente relacionado.\n3. **Criterio 3:** Usar el mismo espacio de embeddings mantiene comparables los vectores.\n4. **Criterio 4:** Los filtros de permisos deben aplicarse en la recuperación vectorial.\n5. **Criterio 5:** La proximidad de vectores no garantiza que una fuente sea verdadera o suficiente.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Embeddings y Bases de Datos Vectoriales», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Un embedding representa información mediante un vector numérico.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Embeddings y Bases de Datos Vectoriales», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La similitud vectorial ayuda a recuperar contenido semánticamente relacionado.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Embeddings y Bases de Datos Vectoriales», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Usar el mismo espacio de embeddings mantiene comparables los vectores.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "En «Embeddings y Bases de Datos Vectoriales», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Los filtros de permisos deben aplicarse en la recuperación vectorial.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Embeddings y Bases de Datos Vectoriales», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La proximidad de vectores no garantiza que una fuente sea verdadera o suficiente.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Embeddings y Bases de Datos Vectoriales», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Un embedding representa información mediante un vector numérico.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Embeddings y Bases de Datos Vectoriales», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La similitud vectorial ayuda a recuperar contenido semánticamente relacionado.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al trabajar con «Embeddings y Bases de Datos Vectoriales», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Usar el mismo espacio de embeddings mantiene comparables los vectores.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Embeddings y Bases de Datos Vectoriales», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los filtros de permisos deben aplicarse en la recuperación vectorial.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Embeddings y Bases de Datos Vectoriales», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La proximidad de vectores no garantiza que una fuente sea verdadera o suficiente.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Embeddings y Bases de Datos Vectoriales», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Un embedding representa información mediante un vector numérico.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Embeddings y Bases de Datos Vectoriales», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: La similitud vectorial ayuda a recuperar contenido semánticamente relacionado.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Embeddings y Bases de Datos Vectoriales», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Usar el mismo espacio de embeddings mantiene comparables los vectores.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Embeddings y Bases de Datos Vectoriales», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los filtros de permisos deben aplicarse en la recuperación vectorial.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Embeddings y Bases de Datos Vectoriales», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: La proximidad de vectores no garantiza que una fuente sea verdadera o suficiente.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 37,
    "modulo": "Avanzado",
    "nombre": "Integración de APIs de Streaming",
    "legacy": null,
    "teoria": "## Integración de APIs de Streaming\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** El streaming entrega partes de la respuesta antes de completar la generación.\n2. **Criterio 2:** Los fragmentos parciales pueden no formar todavía un JSON válido.\n3. **Criterio 3:** La cancelación debe propagarse para evitar trabajo y consumo innecesarios.\n4. **Criterio 4:** El cliente debe gestionar eventos finales y errores durante la transmisión.\n5. **Criterio 5:** Las acciones sensibles no deben ejecutarse a partir de fragmentos sin validar.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Integración de APIs de Streaming», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "El streaming entrega partes de la respuesta antes de completar la generación.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Integración de APIs de Streaming», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los fragmentos parciales pueden no formar todavía un JSON válido.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Integración de APIs de Streaming», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La cancelación debe propagarse para evitar trabajo y consumo innecesarios.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "En «Integración de APIs de Streaming», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "El cliente debe gestionar eventos finales y errores durante la transmisión.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Integración de APIs de Streaming», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Las acciones sensibles no deben ejecutarse a partir de fragmentos sin validar.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Integración de APIs de Streaming», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: El streaming entrega partes de la respuesta antes de completar la generación.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Integración de APIs de Streaming», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los fragmentos parciales pueden no formar todavía un JSON válido.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al trabajar con «Integración de APIs de Streaming», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: La cancelación debe propagarse para evitar trabajo y consumo innecesarios.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Integración de APIs de Streaming», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: El cliente debe gestionar eventos finales y errores durante la transmisión.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Integración de APIs de Streaming», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las acciones sensibles no deben ejecutarse a partir de fragmentos sin validar.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Integración de APIs de Streaming», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: El streaming entrega partes de la respuesta antes de completar la generación.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Integración de APIs de Streaming», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Los fragmentos parciales pueden no formar todavía un JSON válido.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Integración de APIs de Streaming», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La cancelación debe propagarse para evitar trabajo y consumo innecesarios.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Integración de APIs de Streaming», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: El cliente debe gestionar eventos finales y errores durante la transmisión.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Integración de APIs de Streaming», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Las acciones sensibles no deben ejecutarse a partir de fragmentos sin validar.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 38,
    "modulo": "Avanzado",
    "nombre": "Orquestación con Frameworks (LangChain / LlamaIndex)",
    "legacy": null,
    "teoria": "## Orquestación con Frameworks (LangChain / LlamaIndex)\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Los frameworks facilitan integrar modelos, recuperación y herramientas.\n2. **Criterio 2:** Usar un framework no sustituye controles de acceso ni evaluación.\n3. **Criterio 3:** Las versiones y dependencias deben mantenerse controladas.\n4. **Criterio 4:** La observabilidad ayuda a localizar errores entre componentes.\n5. **Criterio 5:** Los límites de ejecución y las contingencias deben diseñarse explícitamente.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Orquestación con Frameworks (LangChain / LlamaIndex)», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Los frameworks facilitan integrar modelos, recuperación y herramientas.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Orquestación con Frameworks (LangChain / LlamaIndex)», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Usar un framework no sustituye controles de acceso ni evaluación.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Orquestación con Frameworks (LangChain / LlamaIndex)», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Las versiones y dependencias deben mantenerse controladas.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "En «Orquestación con Frameworks (LangChain / LlamaIndex)», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "La observabilidad ayuda a localizar errores entre componentes.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Orquestación con Frameworks (LangChain / LlamaIndex)», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los límites de ejecución y las contingencias deben diseñarse explícitamente.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Orquestación con Frameworks (LangChain / LlamaIndex)», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los frameworks facilitan integrar modelos, recuperación y herramientas.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Orquestación con Frameworks (LangChain / LlamaIndex)», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Usar un framework no sustituye controles de acceso ni evaluación.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al trabajar con «Orquestación con Frameworks (LangChain / LlamaIndex)», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Las versiones y dependencias deben mantenerse controladas.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Orquestación con Frameworks (LangChain / LlamaIndex)», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La observabilidad ayuda a localizar errores entre componentes.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Orquestación con Frameworks (LangChain / LlamaIndex)», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los límites de ejecución y las contingencias deben diseñarse explícitamente.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Orquestación con Frameworks (LangChain / LlamaIndex)», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los frameworks facilitan integrar modelos, recuperación y herramientas.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Orquestación con Frameworks (LangChain / LlamaIndex)», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Usar un framework no sustituye controles de acceso ni evaluación.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Orquestación con Frameworks (LangChain / LlamaIndex)», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Las versiones y dependencias deben mantenerse controladas.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Orquestación con Frameworks (LangChain / LlamaIndex)», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La observabilidad ayuda a localizar errores entre componentes.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Orquestación con Frameworks (LangChain / LlamaIndex)», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Los límites de ejecución y las contingencias deben diseñarse explícitamente.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 39,
    "modulo": "Avanzado",
    "nombre": "Casos de Uso Multi-Modal (Visión y Audio)",
    "legacy": null,
    "teoria": "## Casos de Uso Multi-Modal (Visión y Audio)\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Un sistema multimodal procesa más de un tipo de entrada o salida.\n2. **Criterio 2:** Las transcripciones y el reconocimiento visual pueden contener errores.\n3. **Criterio 3:** El uso de voz e imágenes requiere revisar permisos y datos personales.\n4. **Criterio 4:** Las capacidades y límites varían según el modelo utilizado.\n5. **Criterio 5:** Las decisiones críticas requieren comprobación independiente de lo detectado.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Casos de Uso Multi-Modal (Visión y Audio)», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Un sistema multimodal procesa más de un tipo de entrada o salida.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Casos de Uso Multi-Modal (Visión y Audio)», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Las transcripciones y el reconocimiento visual pueden contener errores.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Casos de Uso Multi-Modal (Visión y Audio)», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "El uso de voz e imágenes requiere revisar permisos y datos personales.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "En «Casos de Uso Multi-Modal (Visión y Audio)», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Las capacidades y límites varían según el modelo utilizado.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Casos de Uso Multi-Modal (Visión y Audio)», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Las decisiones críticas requieren comprobación independiente de lo detectado.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Casos de Uso Multi-Modal (Visión y Audio)», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Un sistema multimodal procesa más de un tipo de entrada o salida.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Casos de Uso Multi-Modal (Visión y Audio)», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las transcripciones y el reconocimiento visual pueden contener errores.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al trabajar con «Casos de Uso Multi-Modal (Visión y Audio)», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: El uso de voz e imágenes requiere revisar permisos y datos personales.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Casos de Uso Multi-Modal (Visión y Audio)», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las capacidades y límites varían según el modelo utilizado.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Casos de Uso Multi-Modal (Visión y Audio)», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las decisiones críticas requieren comprobación independiente de lo detectado.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Casos de Uso Multi-Modal (Visión y Audio)», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Un sistema multimodal procesa más de un tipo de entrada o salida.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Casos de Uso Multi-Modal (Visión y Audio)», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Las transcripciones y el reconocimiento visual pueden contener errores.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Casos de Uso Multi-Modal (Visión y Audio)», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: El uso de voz e imágenes requiere revisar permisos y datos personales.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Casos de Uso Multi-Modal (Visión y Audio)», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Las capacidades y límites varían según el modelo utilizado.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Casos de Uso Multi-Modal (Visión y Audio)», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Las decisiones críticas requieren comprobación independiente de lo detectado.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 40,
    "modulo": "Avanzado",
    "nombre": "Evaluación de Modelos (Benchmarks y Métricas)",
    "legacy": null,
    "teoria": "## Evaluación de Modelos (Benchmarks y Métricas)\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Un benchmark debe representar el caso de uso y sus riesgos reales.\n2. **Criterio 2:** La calidad debe medirse junto con latencia, coste y seguridad.\n3. **Criterio 3:** Los datos de evaluación no deben contaminar el entrenamiento.\n4. **Criterio 4:** Una media alta puede ocultar fallos graves en grupos o casos específicos.\n5. **Criterio 5:** La comparación necesita condiciones y criterios consistentes.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Evaluación de Modelos (Benchmarks y Métricas)», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Un benchmark debe representar el caso de uso y sus riesgos reales.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Evaluación de Modelos (Benchmarks y Métricas)», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La calidad debe medirse junto con latencia, coste y seguridad.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Evaluación de Modelos (Benchmarks y Métricas)», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los datos de evaluación no deben contaminar el entrenamiento.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "En «Evaluación de Modelos (Benchmarks y Métricas)», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Una media alta puede ocultar fallos graves en grupos o casos específicos.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Evaluación de Modelos (Benchmarks y Métricas)», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La comparación necesita condiciones y criterios consistentes.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Evaluación de Modelos (Benchmarks y Métricas)», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Un benchmark debe representar el caso de uso y sus riesgos reales.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Evaluación de Modelos (Benchmarks y Métricas)», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La calidad debe medirse junto con latencia, coste y seguridad.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al trabajar con «Evaluación de Modelos (Benchmarks y Métricas)», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Los datos de evaluación no deben contaminar el entrenamiento.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Evaluación de Modelos (Benchmarks y Métricas)», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Una media alta puede ocultar fallos graves en grupos o casos específicos.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Evaluación de Modelos (Benchmarks y Métricas)», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La comparación necesita condiciones y criterios consistentes.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Evaluación de Modelos (Benchmarks y Métricas)», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Un benchmark debe representar el caso de uso y sus riesgos reales.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Evaluación de Modelos (Benchmarks y Métricas)», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: La calidad debe medirse junto con latencia, coste y seguridad.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Evaluación de Modelos (Benchmarks y Métricas)», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los datos de evaluación no deben contaminar el entrenamiento.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Evaluación de Modelos (Benchmarks y Métricas)», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Una media alta puede ocultar fallos graves en grupos o casos específicos.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Evaluación de Modelos (Benchmarks y Métricas)», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: La comparación necesita condiciones y criterios consistentes.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 41,
    "modulo": "Avanzado",
    "nombre": "Gestión de Alucinaciones en Entornos de Producción",
    "legacy": null,
    "teoria": "## Gestión de Alucinaciones en Entornos de Producción\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Las respuestas deben fundamentarse en fuentes verificables cuando la tarea lo exige.\n2. **Criterio 2:** Un sistema debe poder abstenerse cuando la evidencia es insuficiente.\n3. **Criterio 3:** La monitorización debe detectar errores después del despliegue.\n4. **Criterio 4:** La recuperación de documentos no garantiza veracidad por sí sola.\n5. **Criterio 5:** Los incidentes requieren análisis, corrección y evaluación de regresiones.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Gestión de Alucinaciones en Entornos de Producción», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Las respuestas deben fundamentarse en fuentes verificables cuando la tarea lo exige.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Gestión de Alucinaciones en Entornos de Producción», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Un sistema debe poder abstenerse cuando la evidencia es insuficiente.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Gestión de Alucinaciones en Entornos de Producción», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La monitorización debe detectar errores después del despliegue.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "En «Gestión de Alucinaciones en Entornos de Producción», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "La recuperación de documentos no garantiza veracidad por sí sola.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Gestión de Alucinaciones en Entornos de Producción», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los incidentes requieren análisis, corrección y evaluación de regresiones.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Gestión de Alucinaciones en Entornos de Producción», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las respuestas deben fundamentarse en fuentes verificables cuando la tarea lo exige.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Gestión de Alucinaciones en Entornos de Producción», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Un sistema debe poder abstenerse cuando la evidencia es insuficiente.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al trabajar con «Gestión de Alucinaciones en Entornos de Producción», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: La monitorización debe detectar errores después del despliegue.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Gestión de Alucinaciones en Entornos de Producción», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La recuperación de documentos no garantiza veracidad por sí sola.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Gestión de Alucinaciones en Entornos de Producción», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los incidentes requieren análisis, corrección y evaluación de regresiones.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Gestión de Alucinaciones en Entornos de Producción», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Las respuestas deben fundamentarse en fuentes verificables cuando la tarea lo exige.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Gestión de Alucinaciones en Entornos de Producción», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Un sistema debe poder abstenerse cuando la evidencia es insuficiente.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Gestión de Alucinaciones en Entornos de Producción», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La monitorización debe detectar errores después del despliegue.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Gestión de Alucinaciones en Entornos de Producción», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La recuperación de documentos no garantiza veracidad por sí sola.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Gestión de Alucinaciones en Entornos de Producción», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Los incidentes requieren análisis, corrección y evaluación de regresiones.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 42,
    "modulo": "Avanzado",
    "nombre": "Gobernanza de IA en la Empresa",
    "legacy": "avanzado-5",
    "teoria": "## Gobernanza de IA en la Empresa\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** La gobernanza define responsabilidades, políticas y controles de uso.\n2. **Criterio 2:** Un inventario de sistemas ayuda a conocer riesgos y responsables.\n3. **Criterio 3:** Las políticas deben cubrir datos, acceso, evaluación y respuesta a incidentes.\n4. **Criterio 4:** La supervisión debe adaptarse al impacto y al riesgo del caso de uso.\n5. **Criterio 5:** La adopción necesita formación y revisiones periódicas de cumplimiento.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Gobernanza de IA en la Empresa», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "La gobernanza define responsabilidades, políticas y controles de uso.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Gobernanza de IA en la Empresa», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Un inventario de sistemas ayuda a conocer riesgos y responsables.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Gobernanza de IA en la Empresa», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Las políticas deben cubrir datos, acceso, evaluación y respuesta a incidentes.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "En «Gobernanza de IA en la Empresa», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "La supervisión debe adaptarse al impacto y al riesgo del caso de uso.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Gobernanza de IA en la Empresa», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La adopción necesita formación y revisiones periódicas de cumplimiento.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Gobernanza de IA en la Empresa», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La gobernanza define responsabilidades, políticas y controles de uso.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Gobernanza de IA en la Empresa», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Un inventario de sistemas ayuda a conocer riesgos y responsables.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al trabajar con «Gobernanza de IA en la Empresa», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Las políticas deben cubrir datos, acceso, evaluación y respuesta a incidentes.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Gobernanza de IA en la Empresa», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La supervisión debe adaptarse al impacto y al riesgo del caso de uso.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Gobernanza de IA en la Empresa», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La adopción necesita formación y revisiones periódicas de cumplimiento.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Gobernanza de IA en la Empresa», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La gobernanza define responsabilidades, políticas y controles de uso.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Gobernanza de IA en la Empresa», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Un inventario de sistemas ayuda a conocer riesgos y responsables.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Gobernanza de IA en la Empresa», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Las políticas deben cubrir datos, acceso, evaluación y respuesta a incidentes.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Gobernanza de IA en la Empresa», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La supervisión debe adaptarse al impacto y al riesgo del caso de uso.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Gobernanza de IA en la Empresa», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: La adopción necesita formación y revisiones periódicas de cumplimiento.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 43,
    "modulo": "Avanzado",
    "nombre": "Despliegue Local de Modelos (Edge AI)",
    "legacy": null,
    "teoria": "## Despliegue Local de Modelos (Edge AI)\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** El despliegue local puede reducir transferencias de datos sin eliminar todos los riesgos.\n2. **Criterio 2:** La memoria y la capacidad de cómputo condicionan el modelo viable.\n3. **Criterio 3:** La cuantización reduce recursos pero puede modificar la calidad.\n4. **Criterio 4:** Las actualizaciones y la seguridad del dispositivo requieren mantenimiento.\n5. **Criterio 5:** La evaluación debe realizarse en el hardware real de destino.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Despliegue Local de Modelos (Edge AI)», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "El despliegue local puede reducir transferencias de datos sin eliminar todos los riesgos.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Despliegue Local de Modelos (Edge AI)», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La memoria y la capacidad de cómputo condicionan el modelo viable.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Despliegue Local de Modelos (Edge AI)», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La cuantización reduce recursos pero puede modificar la calidad.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "En «Despliegue Local de Modelos (Edge AI)», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Las actualizaciones y la seguridad del dispositivo requieren mantenimiento.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Despliegue Local de Modelos (Edge AI)», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La evaluación debe realizarse en el hardware real de destino.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Despliegue Local de Modelos (Edge AI)», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: El despliegue local puede reducir transferencias de datos sin eliminar todos los riesgos.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Despliegue Local de Modelos (Edge AI)», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La memoria y la capacidad de cómputo condicionan el modelo viable.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al trabajar con «Despliegue Local de Modelos (Edge AI)», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: La cuantización reduce recursos pero puede modificar la calidad.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Despliegue Local de Modelos (Edge AI)», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las actualizaciones y la seguridad del dispositivo requieren mantenimiento.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Despliegue Local de Modelos (Edge AI)», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La evaluación debe realizarse en el hardware real de destino.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Despliegue Local de Modelos (Edge AI)», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: El despliegue local puede reducir transferencias de datos sin eliminar todos los riesgos.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Despliegue Local de Modelos (Edge AI)», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: La memoria y la capacidad de cómputo condicionan el modelo viable.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Despliegue Local de Modelos (Edge AI)», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: La cuantización reduce recursos pero puede modificar la calidad.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Despliegue Local de Modelos (Edge AI)», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Las actualizaciones y la seguridad del dispositivo requieren mantenimiento.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Despliegue Local de Modelos (Edge AI)», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: La evaluación debe realizarse en el hardware real de destino.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 44,
    "modulo": "Avanzado",
    "nombre": "Casos de Uso Híbridos (Sistemas Legados + IA)",
    "legacy": null,
    "teoria": "## Casos de Uso Híbridos (Sistemas Legados + IA)\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Una integración híbrida conserva reglas y contratos de los sistemas existentes.\n2. **Criterio 2:** Las interfaces deben validar datos entre el modelo y los servicios legados.\n3. **Criterio 3:** Las acciones repetidas necesitan idempotencia para evitar duplicados.\n4. **Criterio 4:** Las contingencias deben permitir continuar cuando el componente de IA falla.\n5. **Criterio 5:** Los permisos y la auditoría deben abarcar toda la cadena de integración.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Casos de Uso Híbridos (Sistemas Legados + IA)», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Una integración híbrida conserva reglas y contratos de los sistemas existentes.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Casos de Uso Híbridos (Sistemas Legados + IA)», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Las interfaces deben validar datos entre el modelo y los servicios legados.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Casos de Uso Híbridos (Sistemas Legados + IA)», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Las acciones repetidas necesitan idempotencia para evitar duplicados.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "En «Casos de Uso Híbridos (Sistemas Legados + IA)», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Las contingencias deben permitir continuar cuando el componente de IA falla.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Casos de Uso Híbridos (Sistemas Legados + IA)», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los permisos y la auditoría deben abarcar toda la cadena de integración.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Casos de Uso Híbridos (Sistemas Legados + IA)», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Una integración híbrida conserva reglas y contratos de los sistemas existentes.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Casos de Uso Híbridos (Sistemas Legados + IA)», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las interfaces deben validar datos entre el modelo y los servicios legados.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al trabajar con «Casos de Uso Híbridos (Sistemas Legados + IA)», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Las acciones repetidas necesitan idempotencia para evitar duplicados.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Casos de Uso Híbridos (Sistemas Legados + IA)», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Las contingencias deben permitir continuar cuando el componente de IA falla.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Casos de Uso Híbridos (Sistemas Legados + IA)», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los permisos y la auditoría deben abarcar toda la cadena de integración.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Casos de Uso Híbridos (Sistemas Legados + IA)», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Una integración híbrida conserva reglas y contratos de los sistemas existentes.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Casos de Uso Híbridos (Sistemas Legados + IA)», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Las interfaces deben validar datos entre el modelo y los servicios legados.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Casos de Uso Híbridos (Sistemas Legados + IA)», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Las acciones repetidas necesitan idempotencia para evitar duplicados.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Casos de Uso Híbridos (Sistemas Legados + IA)», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Las contingencias deben permitir continuar cuando el componente de IA falla.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Casos de Uso Híbridos (Sistemas Legados + IA)», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Los permisos y la auditoría deben abarcar toda la cadena de integración.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  },
  {
    "id": 45,
    "modulo": "Avanzado",
    "nombre": "Evaluación Final: Nivel Avanzado (Arquitecto IA)",
    "legacy": "avanzado-20",
    "teoria": "## Evaluación Final: Nivel Avanzado (Arquitecto IA)\n\n### Objetivo\nAplicar este tema de manera responsable en el trabajo, distinguiendo capacidades, limitaciones y controles necesarios.\n\n### Conceptos y criterios\n1. **Criterio 1:** Una arquitectura empresarial debe integrar permisos, evaluación y observabilidad.\n2. **Criterio 2:** La elección entre RAG y fine-tuning debe justificarse por requisitos medidos.\n3. **Criterio 3:** Los agentes necesitan límites y autorización para acciones sensibles.\n4. **Criterio 4:** Los costes y la fiabilidad deben evaluarse antes de ampliar el despliegue.\n5. **Criterio 5:** Un diseño responsable incluye recuperación ante fallos y revisión humana.\n\n### Práctica guiada\nElige una tarea empresarial con datos ficticios o autorizados. Describe sus requisitos, aplica los cinco criterios anteriores y registra qué evidencia utilizarías para validar el resultado. No introduzcas contraseñas, claves ni información confidencial en herramientas no autorizadas.\n\n### Antes de continuar\nComprueba que puedes explicar cada criterio y detectar un caso donde no se cumple. El cuestionario combina reconocimiento, aplicación y revisión de estos conceptos.\n",
    "preguntas": [
      {
        "texto": "En «Evaluación Final: Nivel Avanzado (Arquitecto IA)», ¿qué criterio debes conocer sobre el concepto 1?",
        "opciones": [
          {
            "texto": "Una arquitectura empresarial debe integrar permisos, evaluación y observabilidad.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Evaluación Final: Nivel Avanzado (Arquitecto IA)», ¿qué criterio debes conocer sobre el concepto 2?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "La elección entre RAG y fine-tuning debe justificarse por requisitos medidos.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Evaluación Final: Nivel Avanzado (Arquitecto IA)», ¿qué criterio debes conocer sobre el concepto 3?",
        "opciones": [
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Los agentes necesitan límites y autorización para acciones sensibles.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "En «Evaluación Final: Nivel Avanzado (Arquitecto IA)», ¿qué criterio debes conocer sobre el concepto 4?",
        "opciones": [
          {
            "texto": "Los costes y la fiabilidad deben evaluarse antes de ampliar el despliegue.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          },
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "En «Evaluación Final: Nivel Avanzado (Arquitecto IA)», ¿qué criterio debes conocer sobre el concepto 5?",
        "opciones": [
          {
            "texto": "La herramienta aplica automáticamente todos los controles de la empresa.",
            "puntos": 0
          },
          {
            "texto": "Un diseño responsable incluye recuperación ante fallos y revisión humana.",
            "puntos": 30
          },
          {
            "texto": "La respuesta del modelo siempre es correcta y no necesita revisión.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Evaluación Final: Nivel Avanzado (Arquitecto IA)», ¿qué decisión respeta el criterio 1?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Una arquitectura empresarial debe integrar permisos, evaluación y observabilidad.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Evaluación Final: Nivel Avanzado (Arquitecto IA)», ¿qué decisión respeta el criterio 2?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: La elección entre RAG y fine-tuning debe justificarse por requisitos medidos.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al trabajar con «Evaluación Final: Nivel Avanzado (Arquitecto IA)», ¿qué decisión respeta el criterio 3?",
        "opciones": [
          {
            "texto": "Aplicar esta regla: Los agentes necesitan límites y autorización para acciones sensibles.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Evaluación Final: Nivel Avanzado (Arquitecto IA)», ¿qué decisión respeta el criterio 4?",
        "opciones": [
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Los costes y la fiabilidad deben evaluarse antes de ampliar el despliegue.",
            "puntos": 30
          },
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al trabajar con «Evaluación Final: Nivel Avanzado (Arquitecto IA)», ¿qué decisión respeta el criterio 5?",
        "opciones": [
          {
            "texto": "Usar el resultado sin verificar los requisitos ni las fuentes.",
            "puntos": 0
          },
          {
            "texto": "Eliminar las restricciones de seguridad para agilizar la tarea.",
            "puntos": 0
          },
          {
            "texto": "Aplicar esta regla: Un diseño responsable incluye recuperación ante fallos y revisión humana.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Evaluación Final: Nivel Avanzado (Arquitecto IA)», ¿qué afirmación permite comprobar el criterio 1?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Una arquitectura empresarial debe integrar permisos, evaluación y observabilidad.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Evaluación Final: Nivel Avanzado (Arquitecto IA)», ¿qué afirmación permite comprobar el criterio 2?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: La elección entre RAG y fine-tuning debe justificarse por requisitos medidos.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Evaluación Final: Nivel Avanzado (Arquitecto IA)», ¿qué afirmación permite comprobar el criterio 3?",
        "opciones": [
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los agentes necesitan límites y autorización para acciones sensibles.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Evaluación Final: Nivel Avanzado (Arquitecto IA)», ¿qué afirmación permite comprobar el criterio 4?",
        "opciones": [
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          },
          {
            "texto": "Usar como referencia verificable esta regla: Los costes y la fiabilidad deben evaluarse antes de ampliar el despliegue.",
            "puntos": 30
          }
        ]
      },
      {
        "texto": "Al revisar un resultado de «Evaluación Final: Nivel Avanzado (Arquitecto IA)», ¿qué afirmación permite comprobar el criterio 5?",
        "opciones": [
          {
            "texto": "Usar como referencia verificable esta regla: Un diseño responsable incluye recuperación ante fallos y revisión humana.",
            "puntos": 30
          },
          {
            "texto": "Dar por válido el resultado por su tono convincente.",
            "puntos": 0
          },
          {
            "texto": "Considerar que una respuesta bien redactada garantiza cumplimiento.",
            "puntos": 0
          }
        ]
      }
    ]
  }
]$contenido$::jsonb;
  rama jsonb;
  pregunta jsonb;
  opcion jsonb;
  actual ramas%ROWTYPE;
  destino text;
  total integer;
  siguiente_pregunta integer;
  siguiente_opcion integer;
  nuevas integer := 0;
  reasignadas integer := 0;
  afectadas integer;
  secuencia text;
  ultimo bigint;
  maximo bigint;
  tabla text;
BEGIN
  IF (SELECT count(*) FROM preguntas WHERE rama_id::text = '1') <> 15 THEN
    RAISE EXCEPTION 'La rama 1 debe conservar sus 15 preguntas. Revisa los datos antes de continuar.';
  END IF;
  -- Verificar todos los destinos antes de modificar contenido.
  FOR rama IN SELECT value FROM jsonb_array_elements(banco) LOOP
    SELECT * INTO actual FROM ramas WHERE id = (rama->>'id')::integer;
    IF NOT FOUND OR btrim(actual.nombre) <> rama->>'nombre'
       OR btrim(actual.modulo) <> rama->>'modulo' THEN
      RAISE EXCEPTION 'La rama % no coincide con el inventario confirmado: %.', rama->>'id', rama->>'nombre';
    END IF;
    IF (SELECT count(*) FROM preguntas WHERE rama_id::text = rama->>'id') > 15 THEN
      RAISE EXCEPTION 'La rama % tiene más de 15 preguntas; no se eliminarán datos.', rama->>'id';
    END IF;
  END LOOP;
  SELECT COALESCE(MAX(id),0) INTO siguiente_pregunta FROM preguntas;
  SELECT COALESCE(MAX(id),0) INTO siguiente_opcion FROM opciones;
  FOR rama IN SELECT value FROM jsonb_array_elements(banco) LOOP
    destino := rama->>'id';
    UPDATE ramas SET contenido_teorico = rama->>'teoria'
      WHERE id = destino::integer AND
      (contenido_teorico IS NULL OR btrim(contenido_teorico) = ''
       OR lower(btrim(contenido_teorico)) LIKE 'contenido en desarrollo%');
    SELECT count(*) INTO total FROM preguntas WHERE rama_id::text = destino;
    -- Cada grupo legado solo se migra si cabe íntegro y el tema está mapeado.
    IF rama->>'legacy' IS NOT NULL THEN
      SELECT count(*) INTO afectadas FROM preguntas WHERE rama_id::text = rama->>'legacy';
      IF total + afectadas > 15 THEN
        RAISE EXCEPTION 'La migración de % a rama % excedería 15 preguntas.', rama->>'legacy', destino;
      END IF;
      UPDATE preguntas SET rama_id = destino
        WHERE rama_id::text = rama->>'legacy'
          AND translate(lower(btrim(modulo)), 'áéíóú', 'aeiou') =
              'modulo ' || translate(lower(rama->>'modulo'), 'áéíóú', 'aeiou');
      GET DIAGNOSTICS afectadas = ROW_COUNT;
      reasignadas := reasignadas + afectadas;
    END IF;
    SELECT count(*) INTO total FROM preguntas WHERE rama_id::text = destino;
    FOR pregunta IN SELECT value FROM jsonb_array_elements(rama->'preguntas') LOOP
      EXIT WHEN total = 15;
      IF EXISTS (SELECT 1 FROM preguntas WHERE rama_id::text = destino AND texto = pregunta->>'texto') THEN
        CONTINUE;
      END IF;
      siguiente_pregunta := siguiente_pregunta + 1;
      INSERT INTO preguntas(id,texto,dificultad,modulo,rama_id)
        VALUES(siguiente_pregunta,pregunta->>'texto',rama->>'modulo','Módulo ' || (rama->>'modulo'),destino);
      FOR opcion IN SELECT value FROM jsonb_array_elements(pregunta->'opciones') LOOP
        siguiente_opcion := siguiente_opcion + 1;
        INSERT INTO opciones(id,pregunta_id,texto,puntos)
          VALUES(siguiente_opcion,siguiente_pregunta,opcion->>'texto',(opcion->>'puntos')::integer);
      END LOOP;
      total := total + 1;
      nuevas := nuevas + 1;
    END LOOP;
    IF total <> 15 THEN RAISE EXCEPTION 'No se completó la rama %.', destino; END IF;
  END LOOP;
  -- Verificación de opciones para las 45 ramas antes de confirmar cambios.
  IF EXISTS (
    SELECT p.id FROM preguntas p
    JOIN ramas r ON r.id::text = p.rama_id::text
    LEFT JOIN opciones o ON o.pregunta_id = p.id
    WHERE r.id BETWEEN 1 AND 45
    GROUP BY p.id
    HAVING count(o.id) < 2 OR count(*) FILTER (WHERE o.puntos > 0) = 0
       OR count(*) FILTER (WHERE o.puntos IS NULL OR o.puntos < 0 OR o.texto IS NULL OR btrim(o.texto) = '') > 0
  ) THEN RAISE EXCEPTION 'Hay preguntas con opciones incompletas o inválidas; se revierte la recuperación.'; END IF;
  -- Sincronizar secuencias sin retroceder su valor actual.
  FOREACH tabla IN ARRAY ARRAY['preguntas','opciones'] LOOP
    secuencia := pg_get_serial_sequence(tabla,'id');
    IF secuencia IS NOT NULL THEN
      EXECUTE format('SELECT last_value FROM %s', secuencia::regclass) INTO ultimo;
      EXECUTE format('SELECT MAX(id) FROM %I', tabla) INTO maximo;
      IF maximo IS NOT NULL THEN PERFORM setval(secuencia::regclass,GREATEST(ultimo,maximo),true); END IF;
    END IF;
  END LOOP;
  RAISE NOTICE 'Preguntas antiguas asociadas: %. Preguntas nuevas: %.', reasignadas,nuevas;
END;
$recuperacion$;
COMMIT;

-- Esperado: 45 filas, todas con 15 preguntas; 10 Básico, 15 Intermedio, 20 Avanzado.
SELECT r.id,r.modulo,r.nombre,count(DISTINCT p.id) AS preguntas,count(o.id) AS opciones
FROM ramas r LEFT JOIN preguntas p ON p.rama_id::text = r.id::text
LEFT JOIN opciones o ON o.pregunta_id = p.id
GROUP BY r.id,r.modulo,r.nombre ORDER BY r.id;

-- Estos grupos antiguos se conservan, pero no se asignan automáticamente
-- porque su tema no coincide de forma inequívoca con las ramas actuales.
SELECT p.rama_id,count(*) AS preguntas_sin_rama
FROM preguntas p LEFT JOIN ramas r ON r.id::text = p.rama_id::text
WHERE p.rama_id IS NOT NULL AND r.id IS NULL
GROUP BY p.rama_id ORDER BY p.rama_id;
