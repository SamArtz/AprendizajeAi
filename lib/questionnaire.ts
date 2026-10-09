export interface Option { id: number; texto: string; puntos: number }
export interface DatabaseQuestion {
  pregunta_id: number;
  texto: string;
  dificultad: string;
  modulo: string;
  opciones: Option[];
}
export function isQuestionnaire(value: unknown): value is DatabaseQuestion[] {
  if (!Array.isArray(value)) return false;
  const ids = new Set<number>();
  return value.every(q => {
    if (!q || !Number.isInteger(q.pregunta_id) || ids.has(q.pregunta_id) || typeof q.texto !== 'string' || !q.texto.trim() || typeof q.dificultad !== 'string' || typeof q.modulo !== 'string' || !Array.isArray(q.opciones) || q.opciones.length < 2) return false;
    ids.add(q.pregunta_id);
    const options = new Set<number>();
    return q.opciones.every((o: Option) => {
      if (!o || !Number.isInteger(o.id) || options.has(o.id) || typeof o.texto !== 'string' || !o.texto.trim() || !Number.isInteger(o.puntos) || o.puntos < 0) return false;
      options.add(o.id);
      return true;
    }) && q.opciones.some((o: Option) => o.puntos > 0);
  });
}
