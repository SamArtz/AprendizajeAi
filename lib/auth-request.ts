import { NextResponse } from 'next/server';
import { getPool } from './db';
import { tokenHash } from './auth';
export function checkOrigin(request: Request) {
  const expected = new URL(process.env.APP_URL || request.url).origin;
  return request.headers.get('origin') === expected;
}
export async function readCredentials(request: Request) {
  if (!request.headers.get('content-type')?.includes('application/json')) return null;
  // Un límite acotado antes de procesar JSON o calcular el hash.
  const reader = request.body?.getReader();
  if (!reader) return null;
  let length = 0; const chunks: Uint8Array[] = [];
  while (true) {
    const {done,value} = await reader.read();
    if (done) break;
    length += value.length;
    if (length > 4096) { await reader.cancel(); return null; }
    chunks.push(value);
  }
  try {
    const body = JSON.parse(Buffer.concat(chunks).toString('utf8'));
    if (!body || typeof body.email !== 'string' || typeof body.password !== 'string') return null;
    const email = body.email.trim().toLowerCase();
    if (email.length > 254 || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email) || body.password.length > 128 || Buffer.byteLength(body.password) > 512) return null;
    return { email, password: body.password as string, nombre: typeof body.nombre === 'string' ? body.nombre.trim() : '' };
  } catch { return null; }
}
export async function isRateLimited(action: string, email: string) {
  const { rows } = await getPool().query<{intentos:number}>(`INSERT INTO public.auth_limites(clave,intentos,reinicia_en) VALUES($1,1,now()+interval '15 minutes') ON CONFLICT(clave) DO UPDATE SET intentos=CASE WHEN auth_limites.reinicia_en <= now() THEN 1 ELSE auth_limites.intentos+1 END, reinicia_en=CASE WHEN auth_limites.reinicia_en <= now() THEN now()+interval '15 minutes' ELSE auth_limites.reinicia_en END RETURNING intentos`, [tokenHash(`${action}:${email}`)]);
  return rows[0].intentos > 10;
}
export const unavailable = () => NextResponse.json({error:'No se pudo completar la operación. Revisa PostgreSQL y que ejecutaste sql/usuarios.sql.'},{status:503});
