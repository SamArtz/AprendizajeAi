// Búsqueda interna de diagnóstico. No habilita documentos ni genera asesoría.
export function parseLegalSearch(input) {
  const query = input.trim();
  if (!query || query.length > 500) throw new Error('Escribe una búsqueda de entre 1 y 500 caracteres.');
  // Reconoce la referencia dentro de una pregunta, no solo como comando aislado.
  const references = [...query.matchAll(/\bart(?:[íi]culos?|\.)?\s*(\d+(?:\s*-\s*[a-z])?)\b/giu)]
    .map(match => match[1].replace(/\s/g, '').toUpperCase());
  const generic = new Set(['que','como','cual','cuales','cuanto','cuantos','cuanta','cuantas',
    'establece','establecen','dice','dicen','explica','explicame','puedes','podrias','favor',
    'calcula','calculan','calcular','calculo','necesito','saber','sobre','respecto']);
  const terms = query.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '')
    .match(/[\p{L}\p{N}]+/gu)?.filter(word => !generic.has(word)).join(' ') ?? '';
  return { references: [...new Set(references)], terms };
}
export async function searchLibrary(client, input) {
  const { references, terms } = parseLegalSearch(input);
  const latest = await client.query(`SELECT id,titulo,edicion,estado_revision,habilitada_consultas,
    documento_original->'fuente' AS fuente
    FROM biblioteca_juridica.versiones WHERE documento_id = $1 ORDER BY id DESC LIMIT 1`, ['codigo-trabajo']);
  const version = latest.rows[0];
  if (!version) return { version: null, matches: [], mode: 'sin-biblioteca' };
  if (references.length) {
    const result = await client.query(`SELECT id,articulo,parte,total_partes,texto,paginas_pdf,
      encabezado_precedente FROM biblioteca_juridica.fragmentos
      WHERE version_id=$1 AND articulo = ANY($2::text[])
      ORDER BY array_position($2::text[],articulo),parte`, [version.id, references]);
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
    ORDER BY coincide_todo DESC,relevancia DESC,f.articulo,f.parte LIMIT 5`, [version.id, terms]);
  return { version, matches: result.rows, mode: 'texto' };
}
