import type { Metadata } from 'next';
import Link from 'next/link';
import { Layers, ArrowUpRight } from 'lucide-react';
import './globals.css';
export const metadata: Metadata = { title: 'Adaptia | Inteligencia que evoluciona contigo', description: 'Adopción adaptativa de inteligencia artificial para equipos empresariales.' };
export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return <html lang="es"><body><header className="border-b border-slate-200 bg-white"><nav aria-label="Navegación principal" className="mx-auto flex max-w-7xl flex-wrap items-center justify-between gap-4 px-6 py-5"><Link href="/" className="flex items-center gap-2 text-xl font-bold tracking-tight"><span className="rounded-lg bg-blue-950 p-2 text-white"><Layers size={20}/></span>adaptia<span className="text-blue-600">.</span></Link><div className="flex items-center gap-5 text-sm font-medium text-slate-600"><Link href="/dashboard" className="hover:text-blue-700">Dashboard</Link><Link href="/evaluacion" className="hover:text-blue-700">Evaluación</Link><Link href="/dashboard" className="flex items-center gap-2 rounded-lg bg-blue-950 px-4 py-2.5 text-white">Acceder <ArrowUpRight size={16}/></Link></div></nav></header>{children}<footer className="mx-auto flex max-w-7xl flex-wrap justify-between gap-3 px-6 py-8 text-xs text-slate-500"><span>© {new Date().getFullYear()} Adaptia. Inteligencia con propósito.</span><span>Prototipo · Datos ilustrativos · Sin autenticación real</span></footer></body></html>;
}
