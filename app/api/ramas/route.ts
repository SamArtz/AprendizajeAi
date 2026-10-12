import { NextResponse } from 'next/server';
import { getPool } from '../../../lib/db';
import { isBranchList } from '../../../lib/learning';
export const runtime = 'nodejs';
export const dynamic = 'force-dynamic';

// Esquema confirmado: ramas(id SERIAL, modulo, nombre, contenido_teorico).
export const RAMAS_QUERY = `
  WITH preguntas_con_opciones AS (
    SELECT p.rama_id, p.id AS pregunta_id, p.texto, p.dificultad,
           COALESCE(p.modulo, r.modulo) AS modulo,
           COALESCE(jsonb_agg(jsonb_build_object(
             'id', o.id, 'texto', o.texto, 'puntos', o.puntos
           ) ORDER BY o.id) FILTER (WHERE o.id IS NOT NULL), '[]'::jsonb) AS opciones
    FROM preguntas p
    JOIN ramas r ON r.id::text = p.rama_id::text
    LEFT JOIN opciones o ON o.pregunta_id = p.id
    GROUP BY p.rama_id, p.id, p.texto, p.dificultad, p.modulo, r.modulo
  )
  SELECT r.id::text AS id, r.nombre AS title, ''::text AS description,
         r.contenido_teorico, r.modulo, r.id AS orden,
         COALESCE(jsonb_agg(jsonb_build_object(
           'pregunta_id', p.pregunta_id, 'texto', p.texto, 'dificultad', p.dificultad,
           'modulo', p.modulo, 'opciones', p.opciones
         ) ORDER BY p.pregunta_id) FILTER (WHERE p.pregunta_id IS NOT NULL), '[]'::jsonb) AS preguntas
  FROM ramas r LEFT JOIN preguntas_con_opciones p ON p.rama_id::text = r.id::text
  GROUP BY r.id, r.nombre, r.contenido_teorico, r.modulo
  ORDER BY r.id
`;
export async function GET() {
  try {
    const { rows } = await getPool().query(RAMAS_QUERY);
    if (!isBranchList(rows)) {
      return NextResponse.json({ error: 'Cada rama debe tener título, módulo, contenido teórico y exactamente 15 preguntas válidas con opciones.' }, { status: 422 });
    }
    return NextResponse.json(rows, { headers: { 'Cache-Control': 'no-store' } });
  } catch {
    console.error('No se pudieron consultar ramas, preguntas y opciones en PostgreSQL.');
    return NextResponse.json({ error: 'No se pudieron cargar las ramas. Revisa la conexión y la relación preguntas.rama_id → ramas.id.' }, { status: 503 });
  }
}
