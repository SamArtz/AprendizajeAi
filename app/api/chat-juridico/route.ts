import { NextResponse } from 'next/server';
import { getCurrentUser } from '../../../lib/auth';
import { getPool } from '../../../lib/db';
import { checkOrigin, isRateLimited } from '../../../lib/auth-request';
import { canUseLegalChat, canGenerateLegalAnswer, readLegalQuestion, generateLegalAnswer, type LegalSource } from '../../../lib/legal-chat';
import { searchLibrary } from '../../../scripts/busqueda-juridica.mjs';
export const runtime = 'nodejs';
export const maxDuration = 60;
const json = (body: unknown, status = 200) => NextResponse.json(body, { status, headers: { 'Cache-Control': 'no-store' } });
export async function POST(request: Request) {
  if (!checkOrigin(request)) return json({ error: 'Origen no permitido.' }, 403);
  try {
    const user = await getCurrentUser();
    if (!user) return json({ error: 'Inicia sesión para continuar.' }, 401);
    if (!canUseLegalChat(user.email)) return json({ error: 'El piloto jurídico todavía no está habilitado para esta cuenta.' }, 403);
    const question = await readLegalQuestion(request);
    if (!question) return json({ error: 'Escribe una pregunta de entre 3 y 500 caracteres.' }, 400);
    if (await isRateLimited('legal-chat', String(user.id))) return json({ error: 'Llegaste al límite de 10 consultas por 15 minutos. Intenta más tarde.' }, 429);
    const pool = getPool();
    const result = await searchLibrary(pool, question);
    if (!result.version) return json({ error: 'Primero importa la biblioteca con npm run db:juridica.' }, 503);
    const version = String(result.version.id);
    const sources: LegalSource[] = result.matches.slice(0, 8).map((f: LegalSource) => ({ id: f.id, articulo: f.articulo, parte: f.parte, total_partes: f.total_partes, texto: f.texto, paginas_pdf: f.paginas_pdf }));
    if (!sources.length) return json({ answer: 'No encontré fragmentos que respalden una respuesta. Prueba con términos como «aguinaldo», «vacaciones» o una referencia como «artículo 198». La ausencia de coincidencias no significa que no exista una norma.', sources: [], generated: false, version, notice: 'Búsqueda documental sin coincidencias.' });
    if (!canGenerateLegalAnswer(result.version.habilitada_consultas)) return json({ answer: 'Encontré estos fragmentos para revisión. La generación con IA está desactivada porque la biblioteca sigue pendiente de verificar.', sources, generated: false, version, notice: 'Modo documental: no se envió información a OpenAI.' });
    if (!process.env.OPENAI_API_KEY) return json({ answer: 'La búsqueda está lista. Falta configurar OPENAI_API_KEY en el servidor para generar una explicación con IA.', sources, generated: false, version, notice: 'OpenAI todavía no está configurado. No se realizó una llamada de pago.' });
    // Incluye las notas e inconstitucionalidades del mismo documento/versionado.
    const notes = await pool.query('SELECT documento_original->\'notas_legales\' AS notas FROM biblioteca_juridica.versiones WHERE id=$1', [result.version.id]);
    try {
      const generated = await generateLegalAnswer(question, sources, notes.rows[0]?.notas ?? []);
      return json({ answer: generated.answer, sources: generated.sources, generated: true, version, notice: generated.insufficient ? 'El material recuperado no permite una conclusión completa.' : 'Explicación del compendio; vigencia pendiente de verificar.' });
    } catch {
      return json({ answer: 'No se pudo obtener una respuesta verificable del proveedor. Puedes revisar los fragmentos recuperados y volver a intentarlo.', sources, generated: false, version, notice: 'No se presenta una respuesta de IA sin citas válidas.' });
    }
  } catch {
    return json({ error: 'No se pudo consultar la biblioteca. Revisa PostgreSQL y su configuración.' }, 503);
  }
}
