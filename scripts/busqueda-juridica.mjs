// Búsqueda interna de diagnóstico. No habilita documentos ni genera asesoría.
export async function searchLibrary(client, input) {
  const query = input.trim();
  if (!query || query.length > 500) throw new Error('Escribe una búsqueda de entre 1 y 500 caracteres.');
  const reference = /^(?:art(?:ículo|iculo)?\.?\s*)(\d+(?:\s*-\s*[a-z])?)\s*$/iu.exec(query);
  const article = reference ? reference[1].replace(/\s/g, '').toUpperCase() : null;
  const latest = await client.query(`SELECT id,titulo,edicion,estado_revision,habilitada_consultas,
    documento_original->'fuente' AS fuente
    FROM biblioteca_juridica.versiones WHERE documento_id = $1 ORDER BY id DESC LIMIT 1`, ['codigo-trabajo']);
  const version = latest.rows[0];
  if (!version) return { version: null, matches: [], mode: 'sin-biblioteca' };
  if (article) {
    const result = await client.query(`SELECT id,articulo,parte,total_partes,texto,paginas_pdf,
      encabezado_precedente FROM biblioteca_juridica.fragmentos
      WHERE version_id=$1 AND articulo=$2 ORDER BY parte`, [version.id, article]);
    return { version, matches: result.rows, mode: 'articulo-exacto' };
  }
  // OR permite encontrar material aunque la pregunta tenga palabras ausentes del PDF.
  // Se priorizan coincidencias con todos los términos y después la relevancia textual.
  const result = await client.query(`WITH terminos AS (
      SELECT plainto_tsquery('spanish',$2) AS todos
    ), consulta AS (
      SELECT todos, replace(todos::text,' & ',' | ')::tsquery AS alguno FROM terminos
    )
    SELECT f.id,f.articulo,f.parte,f.total_partes,f.texto,f.paginas_pdf,f.encabezado_precedente,
      (to_tsvector('spanish',f.texto) @@ c.todos) AS coincide_todo,
      ts_rank_cd(to_tsvector('spanish',f.texto),c.alguno,32) AS relevancia
    FROM biblioteca_juridica.fragmentos f CROSS JOIN consulta c
    WHERE f.version_id=$1 AND to_tsvector('spanish',f.texto) @@ c.alguno
    ORDER BY coincide_todo DESC,relevancia DESC,f.articulo,f.parte LIMIT 5`, [version.id, query]);
  return { version, matches: result.rows, mode: 'texto' };
}
