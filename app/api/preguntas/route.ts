import { getCurrentUser } from '../../../lib/auth';
import { NextResponse } from 'next/server';
import { getPool } from '../../../lib/db';
import { isQuestionnaire } from '../../../lib/questionnaire';

export const runtime = 'nodejs';
export const dynamic = 'force-dynamic';

export async function GET(request: Request) {
  try { if (!await getCurrentUser()) return NextResponse.json({error:"Inicia sesión para acceder."},{status:401}); } catch { return NextResponse.json({error:"No se pudo verificar la sesión."},{status:503}); }
  const module = new URL(request.url).searchParams.get('modulo');
  const normalizedModule = module?.normalize('NFD').replace(/[\u0300-\u036f]/g, '').trim().toLowerCase().replace(/^modulo\s+/, '');
  if (normalizedModule && !['evaluacion inicial', 'basico', 'intermedio', 'avanzado', 'modulo basico', 'modulo intermedio', 'modulo avanzado'].includes(normalizedModule)) {
    return NextResponse.json({ error: 'Módulo inválido.' }, { status: 400 });
  }
  const branch = new URL(request.url).searchParams.get('rama');
  try {
    const { rows } = await getPool().query(`
      SELECT p.id AS pregunta_id, p.rama_id::text AS rama_id, p.texto, p.dificultad, COALESCE(p.modulo, r.modulo) AS modulo,
        COALESCE(
          jsonb_agg(jsonb_build_object(
            'id', o.id, 'texto', o.texto, 'puntos', o.puntos
          ) ORDER BY o.id) FILTER (WHERE o.id IS NOT NULL), '[]'::jsonb
        ) AS opciones
      FROM preguntas p
      LEFT JOIN ramas r ON r.id::text = p.rama_id::text
      LEFT JOIN opciones o ON o.pregunta_id = p.id
      WHERE ($1::text IS NULL OR translate(lower(trim(CASE WHEN $2::text IS NOT NULL THEN r.modulo ELSE COALESCE(p.modulo, r.modulo) END)), 'áéíóú', 'aeiou') = $1
        OR translate(lower(trim(CASE WHEN $2::text IS NOT NULL THEN r.modulo ELSE COALESCE(p.modulo, r.modulo) END)), 'áéíóú', 'aeiou') = 'modulo ' || $1
        OR regexp_replace(translate(lower(trim(CASE WHEN $2::text IS NOT NULL THEN r.modulo ELSE COALESCE(p.modulo, r.modulo) END)), 'áéíóú', 'aeiou'), '^modulo[[:space:]]+', '') = $1)
      AND ($2::text IS NULL OR p.rama_id::text = $2)
      GROUP BY p.id, p.rama_id, p.texto, p.dificultad, p.modulo, r.modulo
      ORDER BY p.id
    `, [normalizedModule ?? null, branch]);
    if (branch && rows.length !== 15) {
      return NextResponse.json({ error: `La rama ${branch} tiene ${rows.length} preguntas en PostgreSQL; debe contener exactamente 15.` }, { status: 422 });
    }
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
