import { NextResponse } from 'next/server';
import { getPool } from '../../../lib/db';
import { createSession } from '../../../lib/auth';
import { hashPassword } from '../../../lib/password';
import { checkOrigin, readCredentials, isRateLimited, unavailable } from '../../../lib/auth-request';
export const runtime = 'nodejs';
export async function POST(request: Request) {
  if (!checkOrigin(request)) return NextResponse.json({error:'Origen no permitido.'},{status:403});
  const data = await readCredentials(request);
  if (!data || data.nombre.length < 2 || data.nombre.length > 100 || data.password.length < 12) return NextResponse.json({error:'Indica tu nombre (2–100 caracteres), correo válido y contraseña de 12–128 caracteres.'},{status:400});
  try {
    if (await isRateLimited('register',data.email)) return NextResponse.json({error:'Demasiados intentos. Vuelve a intentarlo en 15 minutos.'},{status:429});
    const hash = await hashPassword(data.password);
    const { rows } = await getPool().query('INSERT INTO public.usuarios(nombre,email,password_hash) VALUES($1,$2,$3) ON CONFLICT(email) DO NOTHING RETURNING id,nombre,email',[data.nombre,data.email,hash]);
    if (!rows.length) return NextResponse.json({error:'No se pudo registrar ese correo. Si ya tienes cuenta, inicia sesión.'},{status:409});
    await createSession(rows[0].id);
    return NextResponse.json({user:rows[0]},{status:201});
  } catch { return unavailable(); }
}
