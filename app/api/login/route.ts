import { NextResponse } from 'next/server';
import { getPool } from '../../../lib/db';
import { createSession } from '../../../lib/auth';
import { DUMMY_HASH, verifyPassword } from '../../../lib/password';
import { checkOrigin, readCredentials, isRateLimited, unavailable } from '../../../lib/auth-request';
export const runtime = 'nodejs';
export async function POST(request: Request) {
  if (!checkOrigin(request)) return NextResponse.json({error:'Origen no permitido.'},{status:403});
  const data = await readCredentials(request);
  if (!data || !data.password) return NextResponse.json({error:'Indica un correo y una contraseña válidos.'},{status:400});
  try {
    if (await isRateLimited('login',data.email)) return NextResponse.json({error:'Demasiados intentos. Vuelve a intentarlo en 15 minutos.'},{status:429});
    const {rows} = await getPool().query('SELECT id,nombre,email,password_hash FROM public.usuarios WHERE email=$1',[data.email]);
    const user = rows[0];
    const valid = await verifyPassword(data.password,user?.password_hash ?? DUMMY_HASH);
    if (!valid || !user) return NextResponse.json({error:'Correo o contraseña incorrectos.'},{status:401});
    await createSession(user.id);
    return NextResponse.json({user:{id:user.id,nombre:user.nombre,email:user.email}});
  } catch { return unavailable(); }
}
