import { NextResponse } from 'next/server';
import { getPool } from '../../../lib/db';
import { isQuestionnaire } from '../../../lib/questionnaire';

export const runtime = 'nodejs';
export const dynamic = 'force-dynamic';

export async function GET(request: Request) {
  const module = new URL(request.url).searchParams.get('modulo');
  const normalizedModule = module?.normalize('NFD').replace(/[\u0300-\u036f]/g, '').trim().toLowerCase();
  if (normalizedModule && !['evaluacion inicial', 'basico', 'intermedio', 'avanzado', 'modulo basico', 'modulo intermedio', 'modulo avanzado'].includes(normalizedModule)) {
    return NextResponse.json({ error: 'Módulo inválido.' }, { status: 400 });
  }
  const branch = new URL(request.url).searchParams.get('rama');
  try {
    const { rows } = await getPool().query(`
      SELECT p.id AS pregunta_id, p.texto, p.dificultad, COALESCE(p.modulo, r.modulo) AS modulo,
        COALESCE(
          jsonb_agg(jsonb_build_object(
            'id', o.id, 'texto', o.texto, 'puntos', o.puntos
          ) ORDER BY o.id) FILTER (WHERE o.id IS NOT NULL), '[]'::jsonb
        ) AS opciones
      FROM preguntas p
      LEFT JOIN ramas r ON r.id = p.rama_id
      LEFT JOIN opciones o ON o.pregunta_id = p.id
      WHERE ($1::text IS NULL OR translate(lower(trim(COALESCE(p.modulo, r.modulo))), 'áéíóú', 'aeiou') = $1
        OR translate(lower(trim(COALESCE(p.modulo, r.modulo))), 'áéíóú', 'aeiou') = 'modulo ' || $1)
      ${branch ? 'AND p.rama_id::text = $2' : ''}
      GROUP BY p.id, p.texto, p.dificultad, p.modulo, r.modulo
      ORDER BY p.id
    `, branch ? [normalizedModule ?? null, branch] : [normalizedModule ?? null]);
    if (!isQuestionnaire(rows)) {
      return NextResponse.json({ error: 'Hay preguntas incompletas o puntos inválidos en la base de datos.' }, { status: 422 });
    }
    return NextResponse.json(rows, { headers: { 'Cache-Control': 'no-store' } });
  } catch {
    // No devolver credenciales, SQL ni detalles internos al navegador.
    console.error('No se pudieron consultar las preguntas en PostgreSQL.');
    return NextResponse.json({ error: 'No se pudieron cargar las preguntas. Revisa la conexión a PostgreSQL.' }, { status: 503 });
  }
}
