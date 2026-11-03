import nextEnv from '@next/env';
import pg from 'pg';
import { searchLibrary } from './busqueda-juridica.mjs';

const query = process.argv.slice(2).join(' ').trim();
if (!query || query.length > 500) {
  console.error('Uso: npm run juridica:buscar -- "vacaciones" (máximo 500 caracteres).');
  process.exit(1);
}
nextEnv.loadEnvConfig(process.cwd(), process.env.NODE_ENV !== 'production');
if (!process.env.DATABASE_URL && !process.env.PGUSER) {
  console.error('Configura las credenciales PostgreSQL de Adaptia en .env.');
  process.exit(1);
}
const pool = new pg.Pool({
  ...(process.env.DATABASE_URL ? { connectionString: process.env.DATABASE_URL } : {
    host: process.env.PGHOST ?? 'localhost', port: Number(process.env.PGPORT ?? 5432),
    database: process.env.PGDATABASE ?? 'adaptia', user: process.env.PGUSER, password: process.env.PGPASSWORD,
  }), max: 1, connectionTimeoutMillis: 5000, statement_timeout: 10000,
});
try {
  const result = await searchLibrary(pool, query);
  console.log('\nBÚSQUEDA DE PRUEBA — texto documental, sin respuesta de IA.');
  if (!result.version) {
    console.log('No hay una versión importada. Ejecuta npm run db:juridica.');
  } else {
    const v = result.version;
    console.log(`${v.titulo} | versión ${v.id} | edición ${v.edicion} | revisión: ${v.estado_revision}`);
    console.log('Vigencia pendiente de verificar. Los resultados no acreditan exhaustividad jurídica.');
    console.log(`Fuente: ${v.fuente?.documento ?? 'No indicada'}; URL: ${v.fuente?.url_oficial ?? 'pendiente de registrar'}`);
    if (!result.matches.length) console.log('Sin coincidencias. Prueba términos del documento; esto no significa que no exista una norma.');
    for (const f of result.matches) {
      console.log(`\nArtículo ${f.articulo} · fragmento ${f.parte}/${f.total_partes} · páginas PDF ${f.paginas_pdf.join(', ')}`);
      console.log(f.texto);
    }
  }
} catch (error) {
  console.error('No se pudo buscar. Revisa PostgreSQL, la importación y .env. Código:', error.code ?? 'desconocido');
  process.exitCode = 1;
} finally {
  await pool.end();
}
