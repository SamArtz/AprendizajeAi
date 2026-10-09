'use client';
import Link from 'next/link';
import { useEffect, useState } from 'react';
import type { Level } from '../../lib/evaluation';
import { ResponsiveContainer, LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip } from 'recharts';
import { ShieldCheck, Clock3, ChartNoAxesCombined, ArrowRight, BookOpen, Sparkles, Lock, CheckCircle2 } from 'lucide-react';
interface LevelMetrics {
  maturity: number;
  hours: number;
  progress: number;
  efficiency: readonly number[];
  description: string;
}
const metricsByLevel: Record<Level, LevelMetrics> = {
  Básico: { maturity: 25, hours: 1.5, progress: 10, efficiency: [8, 10, 12, 14, 16], description: 'Estás construyendo las bases para incorporar IA a tu trabajo.' },
  Intermedio: { maturity: 55, hours: 4.5, progress: 45, efficiency: [30, 38, 46, 54, 62], description: 'Ya puedes aplicar IA para automatizar tareas con criterio.' },
  Avanzado: { maturity: 92, hours: 8.5, progress: 85, efficiency: [86, 89, 88, 92, 94], description: 'Consolida tus conocimientos y explora integraciones avanzadas.' },
};
const days = ['Lun', 'Mar', 'Mié', 'Jue', 'Vie'];
const levels: Level[] = ['Básico', 'Intermedio', 'Avanzado'];
const modules = [
  { level: 'Básico' as const, title: 'Fundamentos y uso responsable', description: 'Comprende la IA, crea tus primeros prompts y protege la información.', lessons: ['Define una tarea concreta, proporciona contexto y solicita un formato de respuesta.', 'Evita introducir credenciales o datos confidenciales en herramientas públicas.', 'Contrasta las respuestas con fuentes fiables antes de utilizarlas.'] },
  { level: 'Intermedio' as const, title: 'IA aplicada a tu trabajo', description: 'Mejora tus instrucciones y evalúa la calidad de las respuestas.', lessons: ['Divide las tareas complejas en pasos y añade ejemplos de resultados esperados.', 'Evalúa posibles alucinaciones y sesgos con casos representativos.', 'Compara resultados usando criterios de calidad definidos antes de generar.'] },
  { level: 'Avanzado' as const, title: 'Integración y gobernanza', description: 'Explora RAG, agentes y controles para adoptar IA de forma responsable.', lessons: ['Utiliza RAG para aportar información pertinente y verifica las fuentes recuperadas.', 'Limita los permisos de los agentes y trata el contenido externo como no confiable.', 'Monitoriza el rendimiento con datos no vistos y considera el coste de los errores.'] },
];
export default function Dashboard(){
 const [userLevel, setUserLevel] = useState<Level | null>(null);
 const [loaded, setLoaded] = useState(false);
 const [storageError, setStorageError] = useState(false);
 const [activeModule, setActiveModule] = useState<Level | null>(null);
 useEffect(() => {
   function readLevel() {
     try {
       const saved = localStorage.getItem('userLevel');
       setUserLevel(levels.includes(saved as Level) ? saved as Level : null);
       setStorageError(false);
     } catch { setUserLevel(null); setStorageError(true); }
     setLoaded(true);
     setActiveModule(null);
   }
   readLevel();
   function onStorage(event: StorageEvent) {
     if (event.key === 'userLevel' || event.key === null) readLevel();
   }
   window.addEventListener('storage', onStorage);
   return () => window.removeEventListener('storage', onStorage);
 }, []);
 const levelIndex = userLevel === null ? -1 : levels.indexOf(userLevel);
 const selectedModule = modules.find(module => module.level === activeModule);
 const metrics = userLevel ? metricsByLevel[userLevel] : null;
 const chartData = metrics ? days.map((day, index) => ({ day, score: metrics.efficiency[index] })) : [];
 const chartDescription = chartData.map(point => `${point.day}: ${point.score}%`).join(', ');
 return (
  <main className="mx-auto max-w-7xl space-y-12 px-6 py-10 sm:space-y-16 sm:py-12">
   <section aria-labelledby="analytics-title" className="space-y-8">
    <div className="flex flex-wrap items-center justify-between gap-4">
     <p className="text-xs font-semibold tracking-widest text-slate-500">PANEL ANALÍTICO EJECUTIVO</p>
     <span className="flex items-center gap-2 rounded-full bg-emerald-50 px-4 py-2 text-xs text-emerald-700"><ShieldCheck size={14}/>Conexión Segura SSO · Demo</span>
    </div>
    <div className="flex flex-wrap items-center justify-between gap-6">
     <div><h1 id="analytics-title" className="text-4xl font-semibold tracking-tight">Hola, Alex<span className="text-blue-600">.</span></h1><p className="mt-3 max-w-xl leading-7 text-slate-500">{metrics?.description ?? 'Completa tu evaluación para descubrir tu punto de partida.'}</p></div>
     <div className="min-w-56 rounded-xl border border-slate-200 bg-white p-5 shadow-sm">
      <p className="text-xs text-slate-500">Tu nivel de conocimiento</p>
      <div className="mt-3 flex items-center gap-4"><Sparkles size={18} className="text-blue-600"/><strong className="text-base" aria-live="polite">{!loaded ? 'Cargando nivel…' : userLevel ?? 'Sin evaluar'}</strong><span aria-label={userLevel ? `Nivel ${levelIndex + 1} de 3` : 'Nivel pendiente de evaluación'} className="flex gap-1">{levels.map((level, index) => <span key={level} className={`h-2 w-4 rounded-full ${index <= levelIndex ? 'bg-blue-600' : 'bg-slate-200'}`}/>)}</span></div>
     </div>
    </div>
    <div className="grid gap-6 md:grid-cols-3">
     <article aria-label="Madurez en IA" className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">
      <div className="flex items-center justify-between gap-3 text-sm text-slate-500"><h2>Madurez en IA</h2><ChartNoAxesCombined size={20} className="text-blue-600"/></div>
      <p className="mt-5 text-4xl font-semibold tracking-tight">{metrics ? `${metrics.maturity}%` : '—'}</p>
      <div role="progressbar" aria-label="Madurez en IA" aria-valuenow={metrics?.maturity ?? 0} aria-valuemin={0} aria-valuemax={100} className="mt-5 h-2 overflow-hidden rounded-full bg-slate-100"><div className="h-full rounded-full bg-blue-600 transition-all" style={{ width: `${metrics?.maturity ?? 0}%` }}/></div>
      <p className="mt-4 text-xs text-slate-500">{metrics ? 'Índice simulado según tu nivel' : 'Pendiente de evaluación'}</p>
     </article>
     <article aria-label="Horas Ahorradas Estimadas" className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">
      <div className="flex items-center justify-between gap-3 text-sm text-slate-500"><h2>Horas Ahorradas Estimadas</h2><Clock3 size={20} className="text-blue-600"/></div>
      <p className="mt-5 text-4xl font-semibold tracking-tight">{metrics?.hours ?? '—'} <span className="text-base font-normal text-slate-500">hrs</span></p>
      <p className="mt-5 text-sm leading-6 text-slate-500">Más tiempo para el trabajo que aporta valor.</p>
      <p className="mt-4 text-xs text-slate-500">{metrics ? 'Estimación ilustrativa según tu nivel' : 'Pendiente de evaluación'}</p>
     </article>
     <article aria-label="Progreso del Módulo Actual" className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">
      <div className="flex items-center justify-between gap-3 text-sm text-slate-500"><h2>Progreso del Módulo Actual</h2><BookOpen size={20} className="text-blue-600"/></div>
      <p className="mt-5 text-4xl font-semibold tracking-tight">{metrics ? `${metrics.progress}%` : '—'}</p>
      <div role="progressbar" aria-label="Progreso del módulo" aria-valuenow={metrics?.progress ?? 0} aria-valuemin={0} aria-valuemax={100} className="mt-5 h-2 overflow-hidden rounded-full bg-slate-100"><div className="h-full rounded-full bg-blue-600 transition-all" style={{ width: `${metrics?.progress ?? 0}%` }}/></div>
      <p className="mt-4 text-xs text-slate-500">{userLevel ? `Módulo ${userLevel} · Progreso simulado` : 'Pendiente de evaluación'}</p>
     </article>
    </div>
    <section aria-labelledby="efficiency-title" className="min-w-0 rounded-xl border border-slate-200 bg-white p-6 shadow-sm sm:p-8">
     <div className="flex flex-wrap items-start justify-between gap-4"><div><h2 id="efficiency-title" className="text-xl font-semibold">Curva de Eficiencia</h2><p className="mt-2 text-sm text-slate-500">Evolución simulada en los últimos 5 días</p></div><span className="rounded-full bg-blue-50 px-3 py-1.5 text-xs font-medium text-blue-700">{userLevel ?? 'Evaluación pendiente'}</span></div>
     {metrics ? <div className="mt-8 h-72 sm:h-80" role="img" aria-label={`Curva de Eficiencia del nivel ${userLevel}. ${chartDescription}`}>
      <ResponsiveContainer width="100%" height="100%"><LineChart data={chartData} margin={{ top: 10, right: 15, left: -10, bottom: 5 }}><CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#e2e8f0"/><XAxis dataKey="day" axisLine={false} tickLine={false} tick={{ fill: '#64748b', fontSize: 12 }} dy={10}/><YAxis domain={[0, 100]} ticks={[0, 25, 50, 75, 100]} tickFormatter={value => `${value}%`} axisLine={false} tickLine={false} tick={{ fill: '#64748b', fontSize: 12 }}/><Tooltip formatter={value => [`${value}%`, 'Eficiencia simulada']} contentStyle={{ borderRadius: 12, borderColor: '#e2e8f0' }}/><Line type="monotone" dataKey="score" stroke="#2563eb" strokeWidth={3} dot={{ r: 4, fill: '#fff', strokeWidth: 2 }} activeDot={{ r: 6 }}/></LineChart></ResponsiveContainer>
     </div> : <div className="mt-8 flex min-h-64 flex-col items-center justify-center gap-4 rounded-xl bg-slate-50 px-6 text-center"><ChartNoAxesCombined size={32} className="text-slate-400"/><p className="text-sm text-slate-500">{loaded ? 'Completa la evaluación para visualizar tu curva de eficiencia.' : 'Cargando tus indicadores…'}</p>{loaded && <Link href="/evaluacion" className="inline-flex items-center gap-2 text-sm font-semibold text-blue-700">Iniciar evaluación<ArrowRight size={16}/></Link>}</div>}
    </section>
    <p className="text-xs leading-6 text-slate-400">Las métricas y la curva son simulaciones basadas en tu nivel de conocimiento; no representan mediciones de actividad real. SSO de demostración.</p>
   </section>
<section aria-labelledby="modules-title" className="border-t border-slate-200 pt-10 sm:pt-14">
 <div className="flex flex-wrap items-end justify-between gap-4"><div><p className="text-xs font-semibold tracking-widest text-blue-700">TU RUTA DE APRENDIZAJE</p><h2 id="modules-title" className="mt-2 text-2xl font-semibold">Módulos de estudio</h2></div><Link href="/evaluacion" className="text-sm font-semibold text-blue-700">{userLevel ? 'Actualizar mi nivel' : 'Evaluar mi nivel'}</Link></div>
 <p className="mt-3 text-sm leading-6 text-slate-500">Avanza desde los fundamentos: domina el módulo anterior y vuelve a evaluar tus conocimientos para desbloquear el siguiente nivel.</p>
 {loaded && !userLevel && <p className="mt-4 rounded-lg border border-blue-100 bg-blue-50 p-4 text-sm text-blue-900">{storageError ? 'No podemos leer tu nivel. Habilita el almacenamiento del navegador y completa la evaluación.' : 'Completa la evaluación inicial para conocer tu nivel y habilitar tus módulos.'}</p>}
 <div className="mt-6 grid gap-5 md:grid-cols-3">{modules.map((module, index) => {
   const locked = index > levelIndex;
   return <article key={module.level} aria-label={`Módulo ${module.level}`} className={`flex flex-col rounded-xl border border-slate-200 bg-white p-6 ${locked ? 'opacity-50 cursor-not-allowed' : ''}`}>
     <div className="flex items-center justify-between"><span className="rounded-lg bg-blue-50 p-3 text-blue-700">{locked ? <Lock aria-label="Bloqueado" size={22}/> : <BookOpen size={22}/>}</span><span className="text-xs font-medium text-slate-500">{locked ? 'Bloqueado' : 'Disponible'}</span></div>
     <h3 className="mt-5 text-xl font-semibold">{module.level}</h3><p className="mt-2 text-sm font-medium">{module.title}</p><p className="mt-3 text-sm leading-6 text-slate-500">{module.description}</p>
     <p className="mb-5 mt-5 text-xs leading-5 text-slate-500">{locked ? (!userLevel ? 'Requiere evaluación inicial.' : `Supera el módulo ${levels[index - 1]} y acredita el nivel ${module.level} en la evaluación.`) : 'Acceso habilitado por tu nivel de evaluación.'}</p>
     <button disabled={locked} onClick={() => setActiveModule(module.level)} className="mt-auto flex items-center justify-between gap-2 rounded-lg bg-blue-950 px-4 py-3 text-sm font-semibold text-white hover:bg-blue-900 disabled:cursor-not-allowed disabled:bg-slate-200 disabled:text-slate-600">{locked ? 'Módulo bloqueado' : 'Abrir módulo'}{locked ? <Lock size={16}/> : <ArrowRight size={16}/>}</button>
   </article>;
 })}</div>
 {selectedModule && <section aria-labelledby="active-module-title" className="mt-6 rounded-xl border border-blue-100 bg-white p-6"><div className="flex flex-wrap items-center justify-between gap-3"><h3 id="active-module-title" className="text-lg font-semibold">{selectedModule.level}: {selectedModule.title}</h3><button onClick={() => setActiveModule(null)} className="text-sm text-slate-500">Cerrar módulo</button></div><p className="mt-2 text-xs text-slate-500">Guía introductoria · La lectura no modifica tu nivel de evaluación.</p><ul className="mt-5 space-y-4">{selectedModule.lessons.map(lesson=><li key={lesson} className="flex gap-3 text-sm leading-6 text-slate-600"><CheckCircle2 size={18} className="mt-1 shrink-0 text-blue-600"/>{lesson}</li>)}</ul><Link href="/evaluacion" className="mt-6 inline-flex items-center gap-2 text-sm font-semibold text-blue-700">Evaluar mis conocimientos<ArrowRight size={16}/></Link></section>}
 </section>
  </main>
 );
}
