import { Pool } from 'pg';

// Next.js carga .env automáticamente. Nunca expongas estas variables con NEXT_PUBLIC_.
const globalDb = globalThis as typeof globalThis & { postgresPool?: Pool };
export function getPool(): Pool {
  if (!process.env.DATABASE_URL && (!process.env.PGDATABASE || !process.env.PGUSER)) {
    throw new Error('Falta configurar DATABASE_URL o PGDATABASE y PGUSER.');
  }
  if (!globalDb.postgresPool) {
    globalDb.postgresPool = new Pool({
      ...(process.env.DATABASE_URL ? { connectionString: process.env.DATABASE_URL } : {
        host: process.env.PGHOST ?? 'localhost',
        port: Number(process.env.PGPORT ?? 5432),
        database: process.env.PGDATABASE,
        user: process.env.PGUSER,
        password: process.env.PGPASSWORD,
      }),
      max: 10,
      connectionTimeoutMillis: 5000,
      idleTimeoutMillis: 30000,
      // Si tu proveedor requiere TLS, configura PGSSLMODE=verify-full.
    });
    globalDb.postgresPool.on('error', () => console.error('Error en una conexión PostgreSQL inactiva.'));
  }
  return globalDb.postgresPool;
}
