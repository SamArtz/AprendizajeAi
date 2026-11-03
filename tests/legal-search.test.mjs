import { test } from 'node:test';
import assert from 'node:assert/strict';
import { parseLegalSearch } from '../scripts/busqueda-juridica.mjs';
test('finds references inside complete Spanish questions and preserves letter suffixes', () => {
  for (const [query, expected] of [
    ['¿Qué establece el artículo 198 sobre el aguinaldo?', ['198']],
    ['Explícame el art. 308-A por favor', ['308-A']],
    ['¿Qué dicen el artículo 198 y el artículo 200?', ['198', '200']],
    ['art.198', ['198']],
    ['artículo 198, artículo 198', ['198']],
  ]) assert.deepEqual(parseLegalSearch(query).references, expected);
});
test('removes generic question verbs while retaining legal topics and amounts', () => {
  assert.equal(parseLegalSearch('¿Cómo se calcula el aguinaldo?').terms, 'se el aguinaldo');
  assert.equal(parseLegalSearch('aguinaldo').terms, 'aguinaldo');
  assert.equal(parseLegalSearch('salario de 500 dólares').terms, 'salario de 500 dolares');
  assert.deepEqual(parseLegalSearch('parte de mi salario').references, []);
});
