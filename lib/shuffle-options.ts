import type { DatabaseQuestion } from './questionnaire';

// Fisher–Yates: no usa puntos ni la posición de la respuesta correcta.
// Cada opción conserva juntos su ID, texto y puntuación.
export function shuffleOptions(questions: readonly DatabaseQuestion[], random: () => number = Math.random): DatabaseQuestion[] {
  return questions.map(question => {
    const opciones = [...question.opciones];
    for (let index = opciones.length - 1; index > 0; index--) {
      const target = Math.floor(random() * (index + 1));
      [opciones[index], opciones[target]] = [opciones[target], opciones[index]];
    }
    return { ...question, opciones };
  });
}
