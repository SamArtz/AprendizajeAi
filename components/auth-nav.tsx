'use client';
import { useState } from 'react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { LogOut, ArrowUpRight } from 'lucide-react';
import { useAuth } from './auth-provider';
export default function AuthNav() {
 const {user}=useAuth();const router=useRouter();const [busy,setBusy]=useState(false);const [error,setError]=useState(false);
 async function logout(){setBusy(true);setError(false);try{const response=await fetch('/api/logout',{method:'POST'});if(!response.ok)throw Error();router.replace('/login');router.refresh();}catch{setError(true)}finally{setBusy(false)}}
 return <div className="order-2 flex flex-wrap items-center gap-3 lg:order-3"><Link href={user?'/dashboard':'/login'} className="inline-flex items-center gap-2 rounded-lg bg-blue-950 px-4 py-2.5 text-sm font-medium text-white hover:bg-blue-900">{user?'Mi aprendizaje':'Iniciar sesión'}<ArrowUpRight size={16}/></Link>{user&&<button disabled={busy} onClick={logout} className="inline-flex items-center gap-2 text-xs text-slate-600 disabled:opacity-50"><LogOut size={15}/>{busy?'Cerrando…':'Cerrar sesión'}</button>}{error&&<span role="alert" className="text-xs text-red-700">No se pudo cerrar sesión. Reintenta.</span>}</div>;
}
