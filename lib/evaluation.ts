export type Level = 'Básico' | 'Intermedio' | 'Avanzado';

// Escala de referencia para conservar los cortes de clasificación.
export const MAX_SCORE = 300;

export function evaluateScore(score: number): Level {
  if (!Number.isInteger(score) || score < 0 || score > MAX_SCORE) {
    throw new RangeError(`El puntaje debe ser un entero entre 0 y ${MAX_SCORE}.`);
  }
  if (score <= 100) return 'Básico';
  if (score <= 200) return 'Intermedio';
  return 'Avanzado';
}
