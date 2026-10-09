import type { Level } from './evaluation';

export interface Branch {
  id: string;
  title: string;
  description: string;
}
export interface LearningModule {
  level: Level;
  title: string;
  description: string;
  branches: readonly Branch[];
}

const basicBranches: readonly Branch[] = [
  {"id": "basico-1", "title": "Fundamentos Generativos", "description": "Qué es un LLM y su procesamiento."},
  {"id": "basico-2", "title": "Anatomía del Prompt", "description": "Estructura de instrucciones claras."},
  {"id": "basico-3", "title": "Privacidad y Seguridad", "description": "Qué datos nunca compartir."},
  {"id": "basico-4", "title": "Buscador vs IA", "description": "Diferencias de recuperación de datos."},
  {"id": "basico-5", "title": "Formateo de Salidas", "description": "Tablas, listas y estructuras."},
  {"id": "basico-6", "title": "Resúmenes Efectivos", "description": "Extracción de ideas principales."},
  {"id": "basico-7", "title": "Traducción y Tono", "description": "Ajuste de lenguaje corporativo."},
  {"id": "basico-8", "title": "Lluvia de Ideas", "description": "Uso de IA para brainstorming."},
  {"id": "basico-9", "title": "Tareas Administrativas", "description": "Redacción de correos y oficios."},
  {"id": "basico-10", "title": "Evaluación Básica", "description": "Reto final del módulo."},
];

const intermediateBranches: readonly Branch[] = [
  {"id": "intermedio-1", "title": "Alucinaciones de la IA", "description": "Identifica afirmaciones inventadas y contrasta sus fuentes antes de utilizarlas."},
  {"id": "intermedio-2", "title": "Roles y Personas", "description": "Define roles y objetivos mediante system prompts básicos."},
  {"id": "intermedio-3", "title": "Límites de Tokens", "description": "Comprende cómo los tokens limitan las entradas y las respuestas."},
  {"id": "intermedio-4", "title": "Ventanas de Contexto", "description": "Gestiona la información disponible dentro de la context window."},
  {"id": "intermedio-5", "title": "Sesgos y Discriminación", "description": "Detecta resultados sesgados y evalúa su impacto en las personas."},
  {"id": "intermedio-6", "title": "Iteración de Prompts", "description": "Refina instrucciones mediante pruebas y retroalimentación."},
  {"id": "intermedio-7", "title": "Análisis de Datos", "description": "Formula preguntas sobre datos autorizados y verifica los resultados."},
  {"id": "intermedio-8", "title": "Detección de Errores", "description": "Revisa cálculos, contradicciones y omisiones en respuestas generadas."},
  {"id": "intermedio-9", "title": "Automatización de Minutas", "description": "Convierte notas autorizadas en acuerdos, responsables y tareas verificables."},
  {"id": "intermedio-10", "title": "Creación de Plantillas", "description": "Diseña prompts reutilizables con variables y criterios de salida."},
  {"id": "intermedio-11", "title": "Ejemplos y Few-Shot", "description": "Usa ejemplos para orientar el estilo y la estructura de las respuestas."},
  {"id": "intermedio-12", "title": "Descomposición de Tareas", "description": "Divide problemas complejos en pasos que puedas comprobar."},
  {"id": "intermedio-13", "title": "Contexto y Documentos", "description": "Selecciona información pertinente y diferencia instrucciones de contenido externo."},
  {"id": "intermedio-14", "title": "Validación de Resultados", "description": "Evalúa respuestas con rúbricas y casos representativos del negocio."},
  {"id": "intermedio-15", "title": "Evaluación Intermedia", "description": "Reto final: analiza datos, genera una minuta y valida sus conclusiones."},
];

const advancedBranches: readonly Branch[] = [
  {"id": "avanzado-1", "title": "Fine-Tuning vs RAG", "description": "Compara el ajuste del modelo con la recuperación de información según el caso de uso."},
  {"id": "avanzado-2", "title": "Diseño de un Sistema RAG", "description": "Organiza documentos, fragmentos y recuperación para aportar contexto relevante."},
  {"id": "avanzado-3", "title": "Evaluación de Recuperación", "description": "Mide la pertinencia de las fuentes y verifica el fundamento de las respuestas."},
  {"id": "avanzado-4", "title": "Acuerdos Zero Data Retention", "description": "Revisa alcance, excepciones y condiciones contractuales de retención cero."},
  {"id": "avanzado-5", "title": "Gobernanza de Datos", "description": "Define permisos, clasificación y políticas de uso de información empresarial."},
  {"id": "avanzado-6", "title": "Parámetro de Temperatura", "description": "Ajusta la variabilidad de generación sin confundirla con exactitud."},
  {"id": "avanzado-7", "title": "Detección de Prompt Injection", "description": "Reconoce instrucciones maliciosas insertadas en entradas o documentos."},
  {"id": "avanzado-8", "title": "Mitigación de Prompt Injection", "description": "Aplica separación de instrucciones, mínimos privilegios y validación de acciones."},
  {"id": "avanzado-9", "title": "System Prompts de Política Comercial", "description": "Define restricciones sobre menciones de competidores sin depender solo del prompt."},
  {"id": "avanzado-10", "title": "Validación de Políticas de Salida", "description": "Comprueba el cumplimiento de las políticas comerciales con filtros y pruebas."},
  {"id": "avanzado-11", "title": "Agentes Autónomos", "description": "Diseña ciclos de planificación y ejecución con límites explícitos."},
  {"id": "avanzado-12", "title": "Herramientas y Permisos de Agentes", "description": "Restringe herramientas y exige autorización humana para acciones sensibles."},
  {"id": "avanzado-13", "title": "Seguridad Empresarial", "description": "Integra controles de acceso, aislamiento y gestión segura de credenciales."},
  {"id": "avanzado-14", "title": "Auditoría y Observabilidad", "description": "Registra eventos sin exponer secretos y monitoriza fallos y decisiones."},
  {"id": "avanzado-15", "title": "Optimización de Costos de API", "description": "Calcula consumo de tokens y establece presupuestos por tarea."},
  {"id": "avanzado-16", "title": "Selección de Modelos y Caché", "description": "Reduce costes con modelos adecuados y caché compatible con la privacidad."},
  {"id": "avanzado-17", "title": "Arquitecturas Complejas", "description": "Combina recuperación, modelos y herramientas mediante componentes desacoplados."},
  {"id": "avanzado-18", "title": "Orquestación y Fiabilidad", "description": "Gestiona tiempos de espera, reintentos limitados y respuestas de contingencia."},
  {"id": "avanzado-19", "title": "Evaluación y Despliegue Controlado", "description": "Valida calidad, seguridad y costes antes de ampliar el uso en producción."},
  {"id": "avanzado-20", "title": "Evaluación Avanzada", "description": "Reto final: diseña una arquitectura empresarial con RAG, agentes y controles de seguridad."},
];

export const modules: readonly LearningModule[] = [
  { level: 'Básico', title: 'Fundamentos y uso responsable', description: 'Comprende la IA, crea tus primeros prompts y protege la información.', branches: basicBranches },
  { level: 'Intermedio', title: 'IA aplicada a tu trabajo', description: 'Mejora tus instrucciones y evalúa la calidad de las respuestas.', branches: intermediateBranches },
  { level: 'Avanzado', title: 'Integración y gobernanza', description: 'Explora RAG, agentes y controles para adoptar IA de forma responsable.', branches: advancedBranches },
];

// Valida un prefijo consecutivo por módulo, sin duplicados ni IDs desconocidos.
export function parseCompletedBranches(raw: string | null): string[] {
  if (!raw) return [];
  try {
    const saved: unknown = JSON.parse(raw);
    if (!Array.isArray(saved)) return [];
    return modules.flatMap(module => {
      const completed: string[] = [];
      for (const branch of module.branches) {
        if (!saved.includes(branch.id)) break;
        completed.push(branch.id);
      }
      return completed;
    });
  } catch { return []; }
}
