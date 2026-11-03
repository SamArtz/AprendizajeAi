import nextEnv from '@next/env';
import pg from 'pg';
import { readFile } from 'node:fs/promises';
import { validateLibrary, importLibrary } from './biblioteca-juridica.mjs';

const validateOnly = process.argv.includes('--validar');
if (process.argv.slice(2).some(a => a !== '--validar')) {
  console.error('Uso: npm run db:juridica [-- --validar]');
  process.exit(1);
}
let validated;
try {
  const [document, prepared] = await Promise.all([
    readFile('datos-juridicos/leyes/codigo-trabajo.json', 'utf8'),
    readFile('datos-juridicos/fragmentos/codigo-trabajo.json', 'utf8'),
  ]);
  validated = validateLibrary(JSON.parse(document), JSON.parse(prepared));
} catch (error) {
  console.error(error.code === 'ENOENT' ? 'Falta un JSON. Revisa datos-juridicos/leyes y datos-juridicos/fragmentos.' : `Validación fallida: ${error.message}`);
  process.exit(1);
}
console.log(`Validados ${validated.articleCount} artículos y ${validated.fragmentCount} fragmentos.`);
if (validateOnly) {
  console.log('Solo validación: no se abrió conexión a PostgreSQL.');
  process.exit(0);
}
nextEnv.loadEnvConfig(process.cwd(), process.env.NODE_ENV !== 'production');
if (!process.env.DATABASE_URL && !process.env.PGUSER) {
  console.error('Configura DATABASE_URL o PGUSER y las credenciales de PostgreSQL en .env.');
  process.exit(1);
}
const pool = new pg.Pool({
  ...(process.env.DATABASE_URL ? { connectionString: process.env.DATABASE_URL } : {
    host: process.env.PGHOST ?? 'localhost', port: Number(process.env.PGPORT ?? 5432),
    database: process.env.PGDATABASE ?? 'adaptia', user: process.env.PGUSER, password: process.env.PGPASSWORD,
  }), max: 1, connectionTimeoutMillis: 5000,
});
let client;
try {
  const schema = await readFile(new URL('../sql/biblioteca-juridica.sql', import.meta.url), 'utf8');
  client = await pool.connect();
  const result = await importLibrary(client, schema, validated);
  console.log(result.imported ? `Versión ${result.version} importada: ${result.articles} artículos y ${result.fragments} fragmentos.` : 'Esta misma versión ya estaba cargada; no se duplicó.');
  console.log('Biblioteca de prueba: pendiente de revisión y deshabilitada para consultas de IA.');
} catch (error) {
  console.error('Carga revertida o no iniciada. Revisa PostgreSQL, .env y permisos. Código:', error.code ?? 'desconocido');
  process.exitCode = 1;
} finally {
  client?.release();
  await pool.end();
}
