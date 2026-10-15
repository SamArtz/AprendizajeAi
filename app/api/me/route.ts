import { NextResponse } from 'next/server';
import { getCurrentUser } from '../../../lib/auth';
import { unavailable } from '../../../lib/auth-request';
export const runtime = 'nodejs';
export async function GET() {
  try { const user=await getCurrentUser();return NextResponse.json({user},{status:user?200:401,headers:{'Cache-Control':'no-store'}}); } catch { return unavailable(); }
}
