export type Level = 'Básico' | 'Intermedio' | 'Avanzado';
export const pointsByDifficulty = { Básico: 10, Intermedio: 20, Avanzado: 30 } as const;
export interface Question {
  title: string;
  difficulty: Level;
  options: readonly [string, string, string];
  correct: number;
  explanation: string;
}

// Cinco ciclos de dificultad: básico, intermedio y avanzado.
export const questions: readonly Question[] = [
  { difficulty: 'Básico', title: '¿Qué es un prompt?', options: ['Un programa que entrena una IA.', 'Una instrucción o pregunta que damos a una IA.', 'Un archivo de contraseñas.'], correct: 1, explanation: 'Un prompt orienta la respuesta de la IA mediante una instrucción o pregunta.' },
  { difficulty: 'Intermedio', title: '¿Qué caracteriza al aprendizaje supervisado?', options: ['Aprende a partir de ejemplos con etiquetas o resultados conocidos.', 'No utiliza datos para aprender.', 'Solo funciona sin intervención humana.'], correct: 0, explanation: 'El aprendizaje supervisado utiliza ejemplos etiquetados para aprender a predecir resultados.' },
  { difficulty: 'Avanzado', title: '¿Cómo detectarías el sobreajuste de un modelo?', options: ['Comprobando únicamente la velocidad de inferencia.', 'Contando los parámetros del modelo.', 'Observando buen rendimiento en entrenamiento y peor rendimiento en datos no vistos.'], correct: 2, explanation: 'El sobreajuste limita la generalización: el modelo aprende demasiado los detalles del entrenamiento.' },
  { difficulty: 'Básico', title: '¿Qué datos no debes compartir con una IA pública sin autorización?', options: ['Información pública sobre el clima.', 'Un ejemplo inventado.', 'Contraseñas, datos personales o información confidencial.'], correct: 2, explanation: 'Protege las credenciales y la información sensible de tu organización.' },
  { difficulty: 'Intermedio', title: '¿Qué es una alucinación en una IA generativa?', options: ['Una respuesta falsa o sin fundamento presentada como plausible.', 'Una garantía de exactitud.', 'Una actualización de seguridad.'], correct: 0, explanation: 'Una respuesta convincente puede ser incorrecta; contrasta sus afirmaciones con fuentes fiables.' },
  { difficulty: 'Avanzado', title: '¿Qué aporta RAG a una aplicación con un modelo de lenguaje?', options: ['Garantiza que nunca haya errores.', 'Recupera información relevante y la incorpora al contexto de generación.', 'Entrena de nuevo el modelo en cada consulta.'], correct: 1, explanation: 'RAG combina recuperación de información con generación; no garantiza por sí solo respuestas correctas.' },
  { difficulty: 'Básico', title: '¿Qué debes hacer antes de utilizar una respuesta de IA?', options: ['Verificar su exactitud y contrastar fuentes.', 'Asumir que siempre es correcta.', 'Publicarla sin revisarla.'], correct: 0, explanation: 'La IA puede cometer errores; verifica sus respuestas.' },
  { difficulty: 'Intermedio', title: '¿Qué significa que un modelo presenta sesgo?', options: ['Que responde siempre lentamente.', 'Que puede producir resultados sistemáticamente desfavorables para ciertos grupos.', 'Que no necesita evaluación.'], correct: 1, explanation: 'Los sesgos pueden originarse en los datos, el diseño o el uso del sistema y requieren evaluación.' },
  { difficulty: 'Avanzado', title: '¿Cómo evitas la fuga de información al evaluar un modelo predictivo?', options: ['Entrenando también con el conjunto de prueba.', 'Eligiendo el mejor resultado sobre los mismos datos de entrenamiento.', 'Separando los datos y ajustando el preprocesamiento solo con el conjunto de entrenamiento.'], correct: 2, explanation: 'La información del conjunto de prueba no debe influir en el entrenamiento ni en el ajuste del preprocesamiento.' },
  { difficulty: 'Básico', title: '¿Cómo obtienes una respuesta más útil?', options: ['Escribir una palabra sin contexto.', 'Dar contexto, un objetivo y el formato deseado.', 'Compartir todos los documentos confidenciales.'], correct: 1, explanation: 'El contexto, el objetivo y el formato mejoran la pertinencia de la respuesta.' },
  { difficulty: 'Intermedio', title: '¿Qué representa un embedding?', options: ['Una copia literal del documento.', 'Una contraseña para acceder al modelo.', 'Una representación numérica que permite comparar similitudes.'], correct: 2, explanation: 'Los embeddings representan información como vectores y se utilizan, por ejemplo, en búsquedas semánticas.' },
  { difficulty: 'Avanzado', title: '¿Qué estrategia ayuda a mitigar la inyección de prompts en un agente?', options: ['Tratar contenido externo como no confiable y limitar permisos y acciones.', 'Dar permisos ilimitados al agente.', 'Ejecutar cualquier instrucción encontrada en documentos.'], correct: 0, explanation: 'Separar instrucciones de contenido externo y aplicar mínimos privilegios reduce el riesgo; no lo elimina completamente.' },
  { difficulty: 'Básico', title: '¿Cuál es un uso responsable de IA en el trabajo?', options: ['Delegar todas las decisiones sin supervisión.', 'Evitar los controles de seguridad.', 'Usarla como apoyo y mantener la revisión humana.'], correct: 2, explanation: 'Las personas mantienen la responsabilidad y supervisión de las decisiones.' },
  { difficulty: 'Intermedio', title: '¿Qué suele ocurrir al aumentar la temperatura de generación?', options: ['Las respuestas tienden a ser más variadas, sin garantizar exactitud.', 'Todas las respuestas se vuelven verificadas.', 'El modelo obtiene automáticamente datos actualizados.'], correct: 0, explanation: 'La temperatura influye en la aleatoriedad del muestreo; no es una medida de veracidad.' },
  { difficulty: 'Avanzado', title: 'En una detección de fraude con pocos casos positivos, ¿qué evaluación es más útil que la exactitud por sí sola?', options: ['El número de filas del conjunto de datos.', 'Precisión y exhaustividad, considerando el coste de falsos positivos y negativos.', 'El tamaño del archivo del modelo.'], correct: 1, explanation: 'Con clases desbalanceadas, la exactitud puede ocultar fallos; precisión y exhaustividad muestran los compromisos relevantes.' },
];
export const MAX_SCORE = questions.reduce((sum, question) => sum + pointsByDifficulty[question.difficulty], 0);
export function evaluateScore(score: number): Level {
  if (!Number.isInteger(score) || score < 0 || score > MAX_SCORE) {
    throw new RangeError(`El puntaje debe ser un entero entre 0 y ${MAX_SCORE}.`);
  }
  if (score <= 100) return 'Básico';
  if (score <= 200) return 'Intermedio';
  return 'Avanzado';
}
