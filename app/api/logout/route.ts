import { cookies } from 'next/headers';
import { NextResponse } from 'next/server';
import { getPool } from '../../../lib/db';
import { SESSION_COOKIE, cookieOptions, tokenHash } from '../../../lib/auth';
import { checkOrigin, unavailable } from '../../../lib/auth-request';
export const runtime = 'nodejs';
export async function POST(request: Request) {
  if (!checkOrigin(request)) return NextResponse.json({error:'Origen no permitido.'},{status:403});
  try {
    const jar=await cookies();const token=jar.get(SESSION_COOKIE)?.value;
    if(token) await getPool().query('DELETE FROM public.sesiones WHERE token_hash=$1',[tokenHash(token)]);
    jar.set(SESSION_COOKIE,'',{...cookieOptions,maxAge:0});
    return NextResponse.json({ok:true});
  } catch { return unavailable(); }
}
