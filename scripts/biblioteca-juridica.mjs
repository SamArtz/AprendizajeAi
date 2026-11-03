import { createHash } from 'node:crypto';

const sha = value => createHash('sha256').update(value).digest('hex');
const fail = message => { throw new Error(message); };
const pagesValid = pages => Array.isArray(pages) && pages.length > 0 && pages.every((p, i) => Number.isInteger(p) && p >= 11 && p <= 126 && (i === 0 || p > pages[i - 1]));
const words = text => text.trim().split(/\s+/u).filter(Boolean);

export function validateLibrary(document, prepared) {
  if (document?.id !== 'codigo-trabajo' || !Array.isArray(document.articulos) || document.articulos.length !== 641) fail('Se esperaba codigo-trabajo.json con 641 artículos.');
  if (document.fuente?.edicion !== '2025' || !Array.isArray(prepared?.fragmentos) || !prepared.fragmentos.length) fail('Edición o fragmentos inválidos.');
  const articles = new Map();
  for (const article of document.articulos) {
    if (typeof article.numero !== 'string' || articles.has(article.numero) || typeof article.texto !== 'string' || !article.texto.trim() || !pagesValid(article.paginas_pdf)) fail('Artículo inválido o repetido.');
    articles.set(article.numero, article);
  }
  const expected = [...Array.from({ length: 637 }, (_, i) => String(i + 1)), '1-A', '113-A', '308-A', '308-B'];
  if (expected.some(n => !articles.has(n))) fail('La numeración de artículos está incompleta.');
  const ids = new Set();
  const groups = new Map();
  for (const f of prepared.fragmentos) {
    if (!articles.has(f.articulo) || f.documento_id !== document.id || typeof f.id !== 'string' || ids.has(f.id) || typeof f.texto !== 'string' || !f.texto.trim() || f.texto.length > 10000 || !pagesValid(f.paginas_pdf) || !Number.isInteger(f.parte) || !Number.isInteger(f.total_partes) || f.parte < 1 || f.total_partes < f.parte || !Array.isArray(f.encabezado_precedente)) fail('Fragmento inválido o duplicado.');
    const article = articles.get(f.articulo);
    if (f.paginas_pdf.some(p => !article.paginas_pdf.includes(p))) fail('Un fragmento apunta fuera de las páginas de su artículo.');
    ids.add(f.id);
    groups.set(f.articulo, [...(groups.get(f.articulo) ?? []), f]);
  }
  // Compara palabras y su multiplicidad: cuerpos + encabezados deben conservar el original.
  for (const [number, article] of articles) {
    const group = (groups.get(number) ?? []).sort((a, b) => a.parte - b.parte);
    if (!group.length || group.some((f, i) => f.parte !== i + 1 || f.total_partes !== group.length)) fail(`Partes incompletas en artículo ${number}.`);
    const headings = (prepared.encabezados_reubicados ?? []).filter(h => h.desde_articulo === number).flatMap(h => h.encabezados);
    const counts = new Map();
    for (const w of words(article.texto)) counts.set(w, (counts.get(w) ?? 0) + 1);
    for (const w of words([...group.map(f => f.texto), ...headings.map(h => h.texto)].join(' '))) counts.set(w, (counts.get(w) ?? 0) - 1);
    if ([...counts.values()].some(n => n !== 0)) fail(`El texto del artículo ${number} no coincide con los fragmentos y encabezados.`);
  }
  const fingerprint = sha(JSON.stringify({ document, prepared }));
  return { document, prepared, fingerprint, articleCount: articles.size, fragmentCount: ids.size };
}

export async function importLibrary(client, schema, validated) {
  const { document: d, prepared: p, fingerprint } = validated;
  await client.query('BEGIN');
  try {
    // Evita carreras entre importadores, incluso al crear el esquema por primera vez.
    await client.query("SELECT pg_advisory_xact_lock(6150271)");
    await client.query(schema);
    const inserted = await client.query(`INSERT INTO biblioteca_juridica.versiones
      (documento_id,titulo,pais,contenido_sha256,edicion,documento_original,fragmentacion_original)
      VALUES ($1,$2,$3,$4,$5,$6::jsonb,$7::jsonb)
      ON CONFLICT (documento_id,contenido_sha256) DO NOTHING RETURNING id`,
    [d.id, d.titulo, d.pais, fingerprint, d.fuente.edicion, JSON.stringify(d), JSON.stringify(p)]);
    if (!inserted.rows.length) {
      await client.query('COMMIT');
      return { imported: false, ...validatedSummary(validated) };
    }
    const version = inserted.rows[0].id;
    for (const a of d.articulos) await client.query(`INSERT INTO biblioteca_juridica.articulos
      (version_id,numero,texto_original,paginas_pdf) VALUES ($1,$2,$3,$4)`, [version, a.numero, a.texto, a.paginas_pdf]);
    for (const f of p.fragmentos) await client.query(`INSERT INTO biblioteca_juridica.fragmentos
      (version_id,id,articulo,parte,total_partes,texto,paginas_pdf,encabezado_precedente)
      VALUES ($1,$2,$3,$4,$5,$6,$7,$8::jsonb)`,
    [version,f.id,f.articulo,f.parte,f.total_partes,f.texto,f.paginas_pdf,JSON.stringify(f.encabezado_precedente)]);
    await client.query('COMMIT');
    return { imported: true, version, ...validatedSummary(validated) };
  } catch (error) {
    await client.query('ROLLBACK');
    throw error;
  }
}
function validatedSummary(v) { return { articles: v.articleCount, fragments: v.fragmentCount }; }
