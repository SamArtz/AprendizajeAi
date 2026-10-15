import nextEnv from '@next/env';
import pg from 'pg';
import { readFile } from 'node:fs/promises';
nextEnv.loadEnvConfig(process.cwd(), process.env.NODE_ENV !== 'production');
if (!process.env.DATABASE_URL && !process.env.PGUSER) {
  console.error('Configura DATABASE_URL o PGUSER y las credenciales de PostgreSQL en .env.');
  process.exit(1);
}
const pool = new pg.Pool({
  ...(process.env.DATABASE_URL ? { connectionString: process.env.DATABASE_URL } : {
    host: process.env.PGHOST ?? 'localhost', port: Number(process.env.PGPORT ?? 5432),
    database: process.env.PGDATABASE ?? 'adaptia', user: process.env.PGUSER, password: process.env.PGPASSWORD,
  }),
  max: 1, connectionTimeoutMillis: 5000,
});
try {
  const sql = await readFile(new URL('../sql/usuarios.sql', import.meta.url), 'utf8');
  await pool.query(sql);
  console.log('Tablas de usuarios, sesiones y límites preparadas. No se modificó el contenido educativo.');
} catch (error) {
  console.error('No se pudo preparar autenticación. Comprueba PostgreSQL, .env y los permisos del usuario. Código:', error.code ?? 'desconocido');
  process.exitCode = 1;
} finally { await pool.end(); }
