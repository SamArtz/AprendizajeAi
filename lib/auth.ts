import { cache } from 'react';
import { cookies } from 'next/headers';
import { randomBytes, createHash } from 'node:crypto';
import { getPool } from './db';
import type { PublicUser } from './auth-types';
export const SESSION_COOKIE = 'adaptia_session';
const SECONDS = 60 * 60 * 24 * 7;
export const tokenHash = (value: string) => createHash('sha256').update(value).digest('hex');
export const cookieOptions = { httpOnly: true, secure: process.env.NODE_ENV === 'production', sameSite: 'lax' as const, path: '/' };
export const getCurrentUser = cache(async (): Promise<PublicUser | null> => {
  const token = (await cookies()).get(SESSION_COOKIE)?.value;
  if (!token || !/^[a-f0-9]{64}$/.test(token)) return null;
  const { rows } = await getPool().query<PublicUser>(`SELECT u.id, u.nombre, u.email FROM public.sesiones s JOIN public.usuarios u ON u.id = s.usuario_id WHERE s.token_hash = $1 AND s.expira_en > now()`, [tokenHash(token)]);
  return rows[0] ?? null;
});
export async function createSession(userId: number) {
  const token = randomBytes(32).toString('hex');
  const jar = await cookies();
  const previous = jar.get(SESSION_COOKIE)?.value;
  await getPool().query('INSERT INTO public.sesiones (token_hash, usuario_id, expira_en) VALUES ($1,$2,now() + interval \'7 days\')', [tokenHash(token), userId]);
  if (previous) await getPool().query('DELETE FROM public.sesiones WHERE token_hash = $1', [tokenHash(previous)]);
  jar.set(SESSION_COOKIE, token, { ...cookieOptions, maxAge: SECONDS });
}
