-- Extras: 135 preguntas / 405 opciones / 45 ramas.
-- Ejecutar después de tu script existente, en la misma base y esquema.
-- No borra ni cambia tus 20 preguntas existentes.
-- Reejecutable: omite preguntas existentes con igual rama_id y texto.
-- Los IDs se asignan por encima del máximo actual bajo bloqueo de tablas.
-- opciones.id conserva su valor por defecto, como en tu script original.
BEGIN;
ALTER TABLE preguntas ADD COLUMN IF NOT EXISTS rama_id text;
CREATE INDEX IF NOT EXISTS preguntas_rama_id_idx ON preguntas (rama_id);
LOCK TABLE preguntas, opciones IN SHARE ROW EXCLUSIVE MODE;

DO $seed$
DECLARE
  banco jsonb := $datos$[
  {
    "rama_id": "basico-1",
    "texto": "En «Fundamentos Generativos», ¿qué afirmación es correcta?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Un LLM genera texto prediciendo tokens a partir del contexto.",
        "puntos": 10
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "basico-1",
    "texto": "Al aplicar «Fundamentos Generativos» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Pedir un borrador y revisar sus afirmaciones antes de utilizarlo.",
        "puntos": 10
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "basico-1",
    "texto": "En «Fundamentos Generativos», ¿qué práctica debes evitar?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Suponer que el modelo comprende o verifica todo lo que escribe.",
        "puntos": 10
      }
    ]
  },
  {
    "rama_id": "basico-2",
    "texto": "En «Anatomía del Prompt», ¿qué afirmación es correcta?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Un prompt útil combina objetivo, contexto y formato de respuesta.",
        "puntos": 10
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "basico-2",
    "texto": "Al aplicar «Anatomía del Prompt» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Indicar el rol, la tarea y las restricciones de la respuesta.",
        "puntos": 10
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "basico-2",
    "texto": "En «Anatomía del Prompt», ¿qué práctica debes evitar?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Dar instrucciones contradictorias y esperar un resultado preciso.",
        "puntos": 10
      }
    ]
  },
  {
    "rama_id": "basico-3",
    "texto": "En «Privacidad y Seguridad», ¿qué afirmación es correcta?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Las credenciales y los datos confidenciales requieren protección.",
        "puntos": 10
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "basico-3",
    "texto": "Al aplicar «Privacidad y Seguridad» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Usar ejemplos ficticios en una herramienta pública.",
        "puntos": 10
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "basico-3",
    "texto": "En «Privacidad y Seguridad», ¿qué práctica debes evitar?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Pegar contraseñas o datos de clientes sin autorización.",
        "puntos": 10
      }
    ]
  },
  {
    "rama_id": "basico-4",
    "texto": "En «Buscador vs IA», ¿qué afirmación es correcta?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Un buscador recupera contenido; un modelo generativo produce respuestas que pueden requerir verificación.",
        "puntos": 10
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "basico-4",
    "texto": "Al aplicar «Buscador vs IA» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Contrastar hechos actuales con fuentes pertinentes y fechadas.",
        "puntos": 10
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "basico-4",
    "texto": "En «Buscador vs IA», ¿qué práctica debes evitar?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Asumir que toda respuesta generada procede de una búsqueda actualizada.",
        "puntos": 10
      }
    ]
  },
  {
    "rama_id": "basico-5",
    "texto": "En «Formateo de Salidas», ¿qué afirmación es correcta?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "El formato de salida puede especificarse mediante instrucciones y ejemplos.",
        "puntos": 10
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "basico-5",
    "texto": "Al aplicar «Formateo de Salidas» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Pedir una tabla con columnas, unidades y campos definidos.",
        "puntos": 10
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "basico-5",
    "texto": "En «Formateo de Salidas», ¿qué práctica debes evitar?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Asumir que un JSON generado siempre cumple el esquema esperado.",
        "puntos": 10
      }
    ]
  },
  {
    "rama_id": "basico-6",
    "texto": "En «Resúmenes Efectivos», ¿qué afirmación es correcta?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Un resumen debe conservar las ideas principales sin inventar hechos.",
        "puntos": 10
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "basico-6",
    "texto": "Al aplicar «Resúmenes Efectivos» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Indicar extensión, audiencia y contenido que no debe omitirse.",
        "puntos": 10
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "basico-6",
    "texto": "En «Resúmenes Efectivos», ¿qué práctica debes evitar?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Aceptar un resumen sin comprobarlo contra el texto original.",
        "puntos": 10
      }
    ]
  },
  {
    "rama_id": "basico-7",
    "texto": "En «Traducción y Tono», ¿qué afirmación es correcta?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "El tono puede adaptarse a la audiencia sin cambiar el significado.",
        "puntos": 10
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "basico-7",
    "texto": "Al aplicar «Traducción y Tono» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Solicitar lenguaje corporativo claro y revisar términos especializados.",
        "puntos": 10
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "basico-7",
    "texto": "En «Traducción y Tono», ¿qué práctica debes evitar?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Aceptar una traducción jurídica sin revisión competente.",
        "puntos": 10
      }
    ]
  },
  {
    "rama_id": "basico-8",
    "texto": "En «Lluvia de Ideas», ¿qué afirmación es correcta?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "La IA puede proponer ideas que deben evaluarse con criterios humanos.",
        "puntos": 10
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "basico-8",
    "texto": "Al aplicar «Lluvia de Ideas» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Pedir alternativas diversas y compararlas por viabilidad.",
        "puntos": 10
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "basico-8",
    "texto": "En «Lluvia de Ideas», ¿qué práctica debes evitar?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Confundir una idea novedosa con una solución ya validada.",
        "puntos": 10
      }
    ]
  },
  {
    "rama_id": "basico-9",
    "texto": "En «Tareas Administrativas», ¿qué afirmación es correcta?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "La IA puede apoyar borradores administrativos sujetos a revisión.",
        "puntos": 10
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "basico-9",
    "texto": "Al aplicar «Tareas Administrativas» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Generar un correo con datos autorizados y revisar destinatario y contenido.",
        "puntos": 10
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "basico-9",
    "texto": "En «Tareas Administrativas», ¿qué práctica debes evitar?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Enviar automáticamente un oficio sin comprobar sus datos.",
        "puntos": 10
      }
    ]
  },
  {
    "rama_id": "basico-10",
    "texto": "En «Evaluación Básica», ¿qué afirmación es correcta?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "El uso responsable integra instrucciones claras, privacidad y verificación.",
        "puntos": 10
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "basico-10",
    "texto": "Al aplicar «Evaluación Básica» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Resolver el reto con datos ficticios y contrastar el resultado.",
        "puntos": 10
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "basico-10",
    "texto": "En «Evaluación Básica», ¿qué práctica debes evitar?",
    "dificultad": "Básico",
    "modulo": "Módulo Básico",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Priorizar la rapidez por encima de la confidencialidad.",
        "puntos": 10
      }
    ]
  },
  {
    "rama_id": "intermedio-1",
    "texto": "En «Alucinaciones de la IA», ¿qué afirmación es correcta?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Una alucinación es una afirmación plausible pero falsa o sin fundamento.",
        "puntos": 20
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-1",
    "texto": "Al aplicar «Alucinaciones de la IA» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Verificar una referencia citada en su fuente original.",
        "puntos": 20
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-1",
    "texto": "En «Alucinaciones de la IA», ¿qué práctica debes evitar?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Confiar en una cita solo porque tiene un formato convincente.",
        "puntos": 20
      }
    ]
  },
  {
    "rama_id": "intermedio-2",
    "texto": "En «Roles y Personas», ¿qué afirmación es correcta?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Un system prompt orienta el comportamiento, pero no garantiza exactitud.",
        "puntos": 20
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-2",
    "texto": "Al aplicar «Roles y Personas» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Definir un rol, objetivos y límites claros para la tarea.",
        "puntos": 20
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-2",
    "texto": "En «Roles y Personas», ¿qué práctica debes evitar?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Tratar el rol de experto como sustituto de una revisión profesional.",
        "puntos": 20
      }
    ]
  },
  {
    "rama_id": "intermedio-3",
    "texto": "En «Límites de Tokens», ¿qué afirmación es correcta?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Los tokens son unidades de procesamiento que no equivalen siempre a palabras.",
        "puntos": 20
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-3",
    "texto": "Al aplicar «Límites de Tokens» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Estimar tokens de entrada y salida antes de enviar un documento extenso.",
        "puntos": 20
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-3",
    "texto": "En «Límites de Tokens», ¿qué práctica debes evitar?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Suponer que cada palabra consume exactamente un token.",
        "puntos": 20
      }
    ]
  },
  {
    "rama_id": "intermedio-4",
    "texto": "En «Ventanas de Contexto», ¿qué afirmación es correcta?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "La ventana de contexto limita la información disponible en una solicitud.",
        "puntos": 20
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-4",
    "texto": "Al aplicar «Ventanas de Contexto» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Seleccionar fragmentos relevantes y reservar espacio para la respuesta.",
        "puntos": 20
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-4",
    "texto": "En «Ventanas de Contexto», ¿qué práctica debes evitar?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Asumir que el modelo conserva todas las conversaciones anteriores.",
        "puntos": 20
      }
    ]
  },
  {
    "rama_id": "intermedio-5",
    "texto": "En «Sesgos y Discriminación», ¿qué afirmación es correcta?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "El sesgo puede surgir de datos, diseño y decisiones de uso.",
        "puntos": 20
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-5",
    "texto": "Al aplicar «Sesgos y Discriminación» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Comparar resultados entre grupos con criterios y datos adecuados.",
        "puntos": 20
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-5",
    "texto": "En «Sesgos y Discriminación», ¿qué práctica debes evitar?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Suponer que un sistema automatizado es neutral por definición.",
        "puntos": 20
      }
    ]
  },
  {
    "rama_id": "intermedio-6",
    "texto": "En «Iteración de Prompts», ¿qué afirmación es correcta?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Iterar consiste en ajustar instrucciones usando evidencia del resultado anterior.",
        "puntos": 20
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-6",
    "texto": "Al aplicar «Iteración de Prompts» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Cambiar una instrucción concreta y comparar los resultados.",
        "puntos": 20
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-6",
    "texto": "En «Iteración de Prompts», ¿qué práctica debes evitar?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Modificar todas las variables a la vez sin registrar los efectos.",
        "puntos": 20
      }
    ]
  },
  {
    "rama_id": "intermedio-7",
    "texto": "En «Análisis de Datos», ¿qué afirmación es correcta?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Un análisis generado requiere comprobar cálculos y procedencia de los datos.",
        "puntos": 20
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-7",
    "texto": "Al aplicar «Análisis de Datos» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Verificar totales y unidades con herramientas de cálculo fiables.",
        "puntos": 20
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-7",
    "texto": "En «Análisis de Datos», ¿qué práctica debes evitar?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Aceptar una correlación como prueba de causalidad.",
        "puntos": 20
      }
    ]
  },
  {
    "rama_id": "intermedio-8",
    "texto": "En «Detección de Errores», ¿qué afirmación es correcta?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "La revisión sistemática puede detectar errores, contradicciones y omisiones.",
        "puntos": 20
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-8",
    "texto": "Al aplicar «Detección de Errores» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Comprobar afirmaciones clave contra evidencia independiente.",
        "puntos": 20
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-8",
    "texto": "En «Detección de Errores», ¿qué práctica debes evitar?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Pedir a la misma IA que confirme su respuesta y tomarlo como prueba suficiente.",
        "puntos": 20
      }
    ]
  },
  {
    "rama_id": "intermedio-9",
    "texto": "En «Automatización de Minutas», ¿qué afirmación es correcta?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Una minuta debe distinguir decisiones, responsables y tareas pendientes.",
        "puntos": 20
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-9",
    "texto": "Al aplicar «Automatización de Minutas» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Usar notas autorizadas e indicar cuando un responsable no está definido.",
        "puntos": 20
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-9",
    "texto": "En «Automatización de Minutas», ¿qué práctica debes evitar?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Inventar acuerdos que no constan en las notas.",
        "puntos": 20
      }
    ]
  },
  {
    "rama_id": "intermedio-10",
    "texto": "En «Creación de Plantillas», ¿qué afirmación es correcta?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Una plantilla reutilizable separa instrucciones de variables de entrada.",
        "puntos": 20
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-10",
    "texto": "Al aplicar «Creación de Plantillas» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Definir campos obligatorios, ejemplos y criterios de salida.",
        "puntos": 20
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-10",
    "texto": "En «Creación de Plantillas», ¿qué práctica debes evitar?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Reutilizar datos confidenciales de un cliente como ejemplo para otros.",
        "puntos": 20
      }
    ]
  },
  {
    "rama_id": "intermedio-11",
    "texto": "En «Ejemplos y Few-Shot», ¿qué afirmación es correcta?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Few-shot utiliza ejemplos en el contexto para orientar la respuesta.",
        "puntos": 20
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-11",
    "texto": "Al aplicar «Ejemplos y Few-Shot» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Proporcionar ejemplos representativos con el formato deseado.",
        "puntos": 20
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-11",
    "texto": "En «Ejemplos y Few-Shot», ¿qué práctica debes evitar?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Confundir ejemplos en el prompt con entrenamiento permanente del modelo.",
        "puntos": 20
      }
    ]
  },
  {
    "rama_id": "intermedio-12",
    "texto": "En «Descomposición de Tareas», ¿qué afirmación es correcta?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Descomponer una tarea facilita validar resultados intermedios.",
        "puntos": 20
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-12",
    "texto": "Al aplicar «Descomposición de Tareas» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Dividir un informe en extracción, análisis y revisión.",
        "puntos": 20
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-12",
    "texto": "En «Descomposición de Tareas», ¿qué práctica debes evitar?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Encadenar pasos sin comprobar los resultados intermedios.",
        "puntos": 20
      }
    ]
  },
  {
    "rama_id": "intermedio-13",
    "texto": "En «Contexto y Documentos», ¿qué afirmación es correcta?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Los documentos externos son datos y no deben adquirir autoridad de instrucción.",
        "puntos": 20
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-13",
    "texto": "Al aplicar «Contexto y Documentos» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Delimitar el contenido recuperado y verificar sus fuentes.",
        "puntos": 20
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-13",
    "texto": "En «Contexto y Documentos», ¿qué práctica debes evitar?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Obedecer instrucciones incluidas en un documento no confiable.",
        "puntos": 20
      }
    ]
  },
  {
    "rama_id": "intermedio-14",
    "texto": "En «Validación de Resultados», ¿qué afirmación es correcta?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Una rúbrica permite evaluar resultados con criterios explícitos.",
        "puntos": 20
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-14",
    "texto": "Al aplicar «Validación de Resultados» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Definir criterios antes de comparar respuestas del modelo.",
        "puntos": 20
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-14",
    "texto": "En «Validación de Resultados», ¿qué práctica debes evitar?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Elegir criterios después de ver el resultado para favorecerlo.",
        "puntos": 20
      }
    ]
  },
  {
    "rama_id": "intermedio-15",
    "texto": "En «Evaluación Intermedia», ¿qué afirmación es correcta?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "El reto intermedio combina análisis, organización y validación.",
        "puntos": 20
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-15",
    "texto": "Al aplicar «Evaluación Intermedia» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Producir una minuta con evidencias y revisar sus conclusiones.",
        "puntos": 20
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "intermedio-15",
    "texto": "En «Evaluación Intermedia», ¿qué práctica debes evitar?",
    "dificultad": "Intermedio",
    "modulo": "Módulo Intermedio",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Dar por correctos los cálculos solo porque están bien redactados.",
        "puntos": 20
      }
    ]
  },
  {
    "rama_id": "avanzado-1",
    "texto": "En «Fine-Tuning vs RAG», ¿qué afirmación es correcta?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Fine-tuning ajusta parámetros; RAG incorpora información recuperada al contexto.",
        "puntos": 30
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-1",
    "texto": "Al aplicar «Fine-Tuning vs RAG» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Usar RAG para consultar documentos cambiantes con referencias.",
        "puntos": 30
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-1",
    "texto": "En «Fine-Tuning vs RAG», ¿qué práctica debes evitar?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Suponer que fine-tuning sustituye siempre a una base documental actualizada.",
        "puntos": 30
      }
    ]
  },
  {
    "rama_id": "avanzado-2",
    "texto": "En «Diseño de un Sistema RAG», ¿qué afirmación es correcta?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "RAG requiere preparar documentos y recuperar fragmentos relevantes.",
        "puntos": 30
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-2",
    "texto": "Al aplicar «Diseño de un Sistema RAG» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Fragmentar documentos y conservar metadatos y permisos de acceso.",
        "puntos": 30
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-2",
    "texto": "En «Diseño de un Sistema RAG», ¿qué práctica debes evitar?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Recuperar documentos privados sin verificar permisos del usuario.",
        "puntos": 30
      }
    ]
  },
  {
    "rama_id": "avanzado-3",
    "texto": "En «Evaluación de Recuperación», ¿qué afirmación es correcta?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "La calidad de recuperación y el fundamento de la respuesta se evalúan por separado.",
        "puntos": 30
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-3",
    "texto": "Al aplicar «Evaluación de Recuperación» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Medir relevancia de los fragmentos y comprobar las citas de la respuesta.",
        "puntos": 30
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-3",
    "texto": "En «Evaluación de Recuperación», ¿qué práctica debes evitar?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Considerar que una respuesta fluida demuestra que la recuperación fue correcta.",
        "puntos": 30
      }
    ]
  },
  {
    "rama_id": "avanzado-4",
    "texto": "En «Acuerdos Zero Data Retention», ¿qué afirmación es correcta?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Zero Data Retention depende del contrato, servicio y excepciones aplicables.",
        "puntos": 30
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-4",
    "texto": "Al aplicar «Acuerdos Zero Data Retention» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Verificar condiciones de retención, logs y uso para entrenamiento por separado.",
        "puntos": 30
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-4",
    "texto": "En «Acuerdos Zero Data Retention», ¿qué práctica debes evitar?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Asumir que retención cero cubre todos los servicios y excepciones.",
        "puntos": 30
      }
    ]
  },
  {
    "rama_id": "avanzado-5",
    "texto": "En «Gobernanza de Datos», ¿qué afirmación es correcta?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "La gobernanza define clasificación, acceso y responsabilidades sobre los datos.",
        "puntos": 30
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-5",
    "texto": "Al aplicar «Gobernanza de Datos» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Aplicar mínimos privilegios y políticas de uso por sensibilidad.",
        "puntos": 30
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-5",
    "texto": "En «Gobernanza de Datos», ¿qué práctica debes evitar?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Permitir que todo empleado acceda a toda la información por comodidad.",
        "puntos": 30
      }
    ]
  },
  {
    "rama_id": "avanzado-6",
    "texto": "En «Parámetro de Temperatura», ¿qué afirmación es correcta?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "La temperatura modifica la distribución de muestreo, no garantiza veracidad.",
        "puntos": 30
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-6",
    "texto": "Al aplicar «Parámetro de Temperatura» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Ajustar la variabilidad y evaluar calidad con pruebas.",
        "puntos": 30
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-6",
    "texto": "En «Parámetro de Temperatura», ¿qué práctica debes evitar?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Suponer que temperatura cero elimina alucinaciones y todos los errores.",
        "puntos": 30
      }
    ]
  },
  {
    "rama_id": "avanzado-7",
    "texto": "En «Detección de Prompt Injection», ¿qué afirmación es correcta?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Una prompt injection intenta alterar el comportamiento mediante entradas no confiables.",
        "puntos": 30
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-7",
    "texto": "Al aplicar «Detección de Prompt Injection» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Detectar instrucciones externas que solicitan ignorar reglas o revelar secretos.",
        "puntos": 30
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-7",
    "texto": "En «Detección de Prompt Injection», ¿qué práctica debes evitar?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Dar autoridad de sistema al contenido de un documento recuperado.",
        "puntos": 30
      }
    ]
  },
  {
    "rama_id": "avanzado-8",
    "texto": "En «Mitigación de Prompt Injection», ¿qué afirmación es correcta?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Mitigar inyecciones requiere controles además de instrucciones al modelo.",
        "puntos": 30
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-8",
    "texto": "Al aplicar «Mitigación de Prompt Injection» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Limitar permisos, validar acciones y separar instrucciones de datos.",
        "puntos": 30
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-8",
    "texto": "En «Mitigación de Prompt Injection», ¿qué práctica debes evitar?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Confiar exclusivamente en una frase que diga no obedecer ataques.",
        "puntos": 30
      }
    ]
  },
  {
    "rama_id": "avanzado-9",
    "texto": "En «System Prompts de Política Comercial», ¿qué afirmación es correcta?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Una política comercial puede orientar menciones de competidores con límites claros.",
        "puntos": 30
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-9",
    "texto": "Al aplicar «System Prompts de Política Comercial» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Definir el alcance de la política y una respuesta neutral para casos restringidos.",
        "puntos": 30
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-9",
    "texto": "En «System Prompts de Política Comercial», ¿qué práctica debes evitar?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Asumir que mencionar una prohibición en el prompt garantiza cumplimiento.",
        "puntos": 30
      }
    ]
  },
  {
    "rama_id": "avanzado-10",
    "texto": "En «Validación de Políticas de Salida», ¿qué afirmación es correcta?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Las políticas de salida requieren pruebas y validaciones independientes.",
        "puntos": 30
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-10",
    "texto": "Al aplicar «Validación de Políticas de Salida» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Probar variantes, evasiones y falsos positivos antes del despliegue.",
        "puntos": 30
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-10",
    "texto": "En «Validación de Políticas de Salida», ¿qué práctica debes evitar?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Evaluar el filtro únicamente con un ejemplo que cumple la política.",
        "puntos": 30
      }
    ]
  },
  {
    "rama_id": "avanzado-11",
    "texto": "En «Agentes Autónomos», ¿qué afirmación es correcta?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Un agente combina decisiones del modelo con herramientas y un ciclo de ejecución.",
        "puntos": 30
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-11",
    "texto": "Al aplicar «Agentes Autónomos» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Definir límites de pasos, presupuesto y condiciones de parada.",
        "puntos": 30
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-11",
    "texto": "En «Agentes Autónomos», ¿qué práctica debes evitar?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Permitir ejecución indefinida de acciones sin supervisión.",
        "puntos": 30
      }
    ]
  },
  {
    "rama_id": "avanzado-12",
    "texto": "En «Herramientas y Permisos de Agentes», ¿qué afirmación es correcta?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Los permisos de herramientas deben corresponder a la tarea autorizada.",
        "puntos": 30
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-12",
    "texto": "Al aplicar «Herramientas y Permisos de Agentes» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Exigir revisión humana antes de transferencias o borrados sensibles.",
        "puntos": 30
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-12",
    "texto": "En «Herramientas y Permisos de Agentes», ¿qué práctica debes evitar?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Entregar credenciales administrativas a cualquier herramienta del agente.",
        "puntos": 30
      }
    ]
  },
  {
    "rama_id": "avanzado-13",
    "texto": "En «Seguridad Empresarial», ¿qué afirmación es correcta?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "La seguridad empresarial combina acceso, aislamiento y gestión de secretos.",
        "puntos": 30
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-13",
    "texto": "Al aplicar «Seguridad Empresarial» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Mantener credenciales en el servidor y comprobar autorización en cada operación.",
        "puntos": 30
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-13",
    "texto": "En «Seguridad Empresarial», ¿qué práctica debes evitar?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Exponer claves de API en variables públicas del frontend.",
        "puntos": 30
      }
    ]
  },
  {
    "rama_id": "avanzado-14",
    "texto": "En «Auditoría y Observabilidad», ¿qué afirmación es correcta?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "La observabilidad registra eventos útiles sin revelar información sensible.",
        "puntos": 30
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-14",
    "texto": "Al aplicar «Auditoría y Observabilidad» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Redactar secretos y aplicar controles de acceso y retención a los logs.",
        "puntos": 30
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-14",
    "texto": "En «Auditoría y Observabilidad», ¿qué práctica debes evitar?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Guardar prompts con contraseñas en logs accesibles para todos.",
        "puntos": 30
      }
    ]
  },
  {
    "rama_id": "avanzado-15",
    "texto": "En «Optimización de Costos de API», ¿qué afirmación es correcta?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "El coste de API depende del modelo, tokens y operaciones realizadas.",
        "puntos": 30
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-15",
    "texto": "Al aplicar «Optimización de Costos de API» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Medir entrada y salida y fijar presupuestos por tarea.",
        "puntos": 30
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-15",
    "texto": "En «Optimización de Costos de API», ¿qué práctica debes evitar?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Medir costes únicamente por el número de usuarios registrados.",
        "puntos": 30
      }
    ]
  },
  {
    "rama_id": "avanzado-16",
    "texto": "En «Selección de Modelos y Caché», ¿qué afirmación es correcta?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "La selección de modelos y caché puede reducir costes con controles de privacidad.",
        "puntos": 30
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-16",
    "texto": "Al aplicar «Selección de Modelos y Caché» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Usar un modelo adecuado y aislar la caché por usuario o autorización.",
        "puntos": 30
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-16",
    "texto": "En «Selección de Modelos y Caché», ¿qué práctica debes evitar?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Compartir respuestas privadas en una caché global sin controles.",
        "puntos": 30
      }
    ]
  },
  {
    "rama_id": "avanzado-17",
    "texto": "En «Arquitecturas Complejas», ¿qué afirmación es correcta?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Una arquitectura desacoplada separa recuperación, generación y herramientas.",
        "puntos": 30
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-17",
    "texto": "Al aplicar «Arquitecturas Complejas» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Definir interfaces y permisos entre componentes.",
        "puntos": 30
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-17",
    "texto": "En «Arquitecturas Complejas», ¿qué práctica debes evitar?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Acoplar todos los servicios sin manejo de fallos ni límites de acceso.",
        "puntos": 30
      }
    ]
  },
  {
    "rama_id": "avanzado-18",
    "texto": "En «Orquestación y Fiabilidad», ¿qué afirmación es correcta?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "La fiabilidad necesita tiempos de espera, reintentos limitados y contingencias.",
        "puntos": 30
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-18",
    "texto": "Al aplicar «Orquestación y Fiabilidad» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Usar reintentos con espera y evitar duplicar acciones no idempotentes.",
        "puntos": 30
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-18",
    "texto": "En «Orquestación y Fiabilidad», ¿qué práctica debes evitar?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Reintentar indefinidamente una operación de pago sin control de duplicados.",
        "puntos": 30
      }
    ]
  },
  {
    "rama_id": "avanzado-19",
    "texto": "En «Evaluación y Despliegue Controlado», ¿qué afirmación es correcta?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "El despliegue controlado valida calidad, seguridad y costes antes de ampliar uso.",
        "puntos": 30
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-19",
    "texto": "Al aplicar «Evaluación y Despliegue Controlado» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Evaluar casos representativos y desplegar gradualmente con posibilidad de reversión.",
        "puntos": 30
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-19",
    "texto": "En «Evaluación y Despliegue Controlado», ¿qué práctica debes evitar?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Cambiar el modelo en producción sin ejecutar evaluaciones previas.",
        "puntos": 30
      }
    ]
  },
  {
    "rama_id": "avanzado-20",
    "texto": "En «Evaluación Avanzada», ¿qué afirmación es correcta?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Una arquitectura empresarial debe integrar RAG, agentes y controles verificables.",
        "puntos": 30
      },
      {
        "texto": "El uso de IA garantiza resultados exactos sin revisión.",
        "puntos": 0
      },
      {
        "texto": "Toda herramienta de IA tiene acceso automático a información actualizada.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-20",
    "texto": "Al aplicar «Evaluación Avanzada» en la empresa, ¿qué acción es adecuada?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Utilizar la primera respuesta sin comprobar los requisitos.",
        "puntos": 0
      },
      {
        "texto": "Diseñar permisos, métricas, revisión humana y límites de gasto en el reto final.",
        "puntos": 30
      },
      {
        "texto": "Omitir los controles establecidos para ahorrar tiempo.",
        "puntos": 0
      }
    ]
  },
  {
    "rama_id": "avanzado-20",
    "texto": "En «Evaluación Avanzada», ¿qué práctica debes evitar?",
    "dificultad": "Avanzado",
    "modulo": "Módulo Avanzado",
    "opciones": [
      {
        "texto": "Definir criterios de revisión antes de usar el resultado.",
        "puntos": 0
      },
      {
        "texto": "Comprobar que el uso de datos está autorizado.",
        "puntos": 0
      },
      {
        "texto": "Priorizar autonomía total sin mecanismos de auditoría o recuperación.",
        "puntos": 30
      }
    ]
  }
]$datos$::jsonb;
  pregunta jsonb;
  opcion jsonb;
  nueva_id integer;
  secuencia text;
  insertadas integer := 0;
BEGIN
  SELECT COALESCE(MAX(id), 0) INTO nueva_id FROM preguntas;
  FOR pregunta IN SELECT value FROM jsonb_array_elements(banco) LOOP
    IF EXISTS (
      SELECT 1 FROM preguntas p
      WHERE p.rama_id = pregunta->>'rama_id' AND p.texto = pregunta->>'texto'
    ) THEN CONTINUE; END IF;
    nueva_id := nueva_id + 1;
    INSERT INTO preguntas (id, texto, dificultad, modulo, rama_id)
    VALUES (nueva_id, pregunta->>'texto', pregunta->>'dificultad', pregunta->>'modulo', pregunta->>'rama_id');
    FOR opcion IN SELECT value FROM jsonb_array_elements(pregunta->'opciones') LOOP
      INSERT INTO opciones (pregunta_id, texto, puntos)
      VALUES (nueva_id, opcion->>'texto', (opcion->>'puntos')::integer);
    END LOOP;
    insertadas := insertadas + 1;
  END LOOP;
  -- Si preguntas.id es SERIAL/IDENTITY, evita colisiones en futuras inserciones.
  secuencia := pg_get_serial_sequence('preguntas', 'id');
  IF secuencia IS NOT NULL THEN
    PERFORM setval(secuencia::regclass, (SELECT MAX(id) FROM preguntas), true);
  END IF;
  RAISE NOTICE 'Preguntas nuevas insertadas: %', insertadas;
END;
$seed$;
COMMIT;

-- Verificación: cada rama recibe 3 preguntas nuevas, cada una con 3 opciones.
SELECT p.modulo, p.rama_id, COUNT(DISTINCT p.id) AS preguntas,
       COUNT(o.id) AS opciones
FROM preguntas p
LEFT JOIN opciones o ON o.pregunta_id = p.id
WHERE p.rama_id IS NOT NULL
GROUP BY p.modulo, p.rama_id
ORDER BY p.modulo, split_part(p.rama_id, '-', 2)::integer;
