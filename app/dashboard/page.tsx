'use client';
import Link from 'next/link';
import Questionnaire from '../../components/questionnaire';
import RestartProgress from '../../components/restart-progress';
import { useEffect, useState } from 'react';
import type { Level } from '../../lib/evaluation';
import { modules, parseCompletedBranches } from '../../lib/learning';
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
export default function Dashboard(){
 const [userLevel, setUserLevel] = useState<Level | null>(null);
 const [loaded, setLoaded] = useState(false);
 const [storageError, setStorageError] = useState(false);
 const [completedBranches, setCompletedBranches] = useState<string[]>([]);
 const [branchesLoaded, setBranchesLoaded] = useState(false);
 const [branchStorageError, setBranchStorageError] = useState(false);
 const [activeBranchId, setActiveBranchId] = useState<string | null>(null);
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
     setActiveBranchId(null);
   }
   readLevel();
   function onStorage(event: StorageEvent) {
     if (event.key === 'userLevel' || event.key === null) readLevel();
   }
   window.addEventListener('storage', onStorage);
   return () => window.removeEventListener('storage', onStorage);
 }, []);
 useEffect(() => {
   function readBranches() {
     try {
       setCompletedBranches(parseCompletedBranches(localStorage.getItem('completedBranches')));
       setBranchStorageError(false);
     } catch { setCompletedBranches([]); setBranchStorageError(true); }
     setBranchesLoaded(true);
   }
   readBranches();
   function onStorage(event: StorageEvent) {
     if (event.key === 'completedBranches' || event.key === null) readBranches();
   }
   window.addEventListener('storage', onStorage);
   return () => window.removeEventListener('storage', onStorage);
 }, []);

 function completeBranch(id: string) {
   const module = modules.find(item => item.branches.some(branch => branch.id === id));
   if (!module || userLevel === null || levels.indexOf(module.level) > levels.indexOf(userLevel)) return;
   const index = module.branches.findIndex(branch => branch.id === id);
   if (!branchesLoaded || userLevel === null || index < 0 || completedBranches.includes(id)) return;
   if (index > 0 && !completedBranches.includes(module.branches[index - 1].id)) return;
   const updated = [...completedBranches, id];
   try {
     localStorage.setItem('completedBranches', JSON.stringify(updated));
     setBranchStorageError(false);
   } catch { setBranchStorageError(true); }
   setCompletedBranches(updated);
 }
 const levelIndex = userLevel === null ? -1 : levels.indexOf(userLevel);
 const selectedModule = modules.find(module => module.level === activeModule);
 const selectedBranch = selectedModule?.branches.find(branch => branch.id === activeBranchId);
 const completedModuleBranches = selectedModule?.branches.filter(branch => completedBranches.includes(branch.id)).length ?? 0;
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
<RestartProgress />
<section aria-labelledby="modules-title" className="border-t border-slate-200 pt-10 sm:pt-14">
 <div className="flex flex-wrap items-end justify-between gap-4"><div><p className="text-xs font-semibold tracking-widest text-blue-700">TU RUTA DE APRENDIZAJE</p><h2 id="modules-title" className="mt-2 text-2xl font-semibold">Módulos de estudio</h2></div><Link href="/evaluacion" className="text-sm font-semibold text-blue-700">{userLevel ? 'Actualizar mi nivel' : 'Evaluar mi nivel'}</Link></div>
 <p className="mt-3 text-sm leading-6 text-slate-500">Avanza desde los fundamentos: domina el módulo anterior y vuelve a evaluar tus conocimientos para desbloquear el siguiente nivel.</p>
 {loaded && !userLevel && <p className="mt-4 rounded-lg border border-blue-100 bg-blue-50 p-4 text-sm text-blue-900">{storageError ? 'No podemos leer tu nivel. Habilita el almacenamiento del navegador y completa la evaluación.' : 'Completa la evaluación inicial para conocer tu nivel y habilitar tus módulos.'}</p>}
 <div className="mt-6 grid gap-5 md:grid-cols-3">{modules.map((module, index) => {
   const locked = index > levelIndex;
   return <article key={module.level} aria-label={`Módulo ${module.level}`} className={`flex flex-col rounded-xl border border-slate-200 bg-white p-6 ${locked ? 'opacity-50 cursor-not-allowed' : ''}`}>
     <div className="flex items-center justify-between"><span className="rounded-lg bg-blue-50 p-3 text-blue-700">{locked ? <Lock aria-label="Bloqueado" size={22}/> : <BookOpen size={22}/>}</span><span className="text-xs font-medium text-slate-500">{locked ? 'Bloqueado' : 'Disponible'}</span></div>
     <h3 className="mt-5 text-xl font-semibold">{module.level}</h3><p className="mt-2 text-sm font-medium">{module.title}</p><p className="mt-3 text-sm leading-6 text-slate-500">{module.description}</p><p className="mt-3 text-xs font-medium text-blue-700">{module.branches.length} lecciones secuenciales</p>
     <p className="mb-5 mt-5 text-xs leading-5 text-slate-500">{locked ? (!userLevel ? 'Requiere evaluación inicial.' : `Supera el módulo ${levels[index - 1]} y acredita el nivel ${module.level} en la evaluación.`) : 'Acceso habilitado por tu nivel de evaluación.'}</p>
     <button disabled={locked} onClick={() => { setActiveModule(module.level); setActiveBranchId(null); }} className="mt-auto flex items-center justify-between gap-2 rounded-lg bg-blue-950 px-4 py-3 text-sm font-semibold text-white hover:bg-blue-900 disabled:cursor-not-allowed disabled:bg-slate-200 disabled:text-slate-600">{locked ? 'Módulo bloqueado' : 'Abrir módulo'}{locked ? <Lock size={16}/> : <ArrowRight size={16}/>}</button>
   </article>;
 })}</div>
 {selectedModule && <section aria-labelledby="active-module-title" className="mt-6 rounded-xl border border-blue-100 bg-white p-6"><div className="flex flex-wrap items-center justify-between gap-3"><h3 id="active-module-title" className="text-lg font-semibold">{selectedModule.level}: {selectedModule.title}</h3><button onClick={() => { setActiveModule(null); setActiveBranchId(null); }} className="text-sm text-slate-500">Cerrar módulo</button></div><p className="mt-2 text-xs text-slate-500">Ruta secuencial · Completar lecciones no modifica tu nivel de evaluación.</p><div className="mt-6">
   <div className="flex flex-wrap items-center justify-between gap-3"><h4 className="font-semibold">Tu recorrido {selectedModule.level}</h4><p aria-live="polite" className="text-sm text-slate-500">{completedModuleBranches} de {selectedModule.branches.length} lecciones completadas</p></div>
   <p className="mt-2 text-sm leading-6 text-slate-500">Completa cada lección para desbloquear la siguiente. Sigue el orden de tu ruta.</p>
   {branchStorageError && <p role="alert" className="mt-4 rounded-lg bg-amber-50 p-4 text-sm text-amber-800">No se pudo acceder al almacenamiento del navegador. Tu progreso queda solo en esta sesión hasta que puedas guardarlo.</p>}
   {!branchesLoaded ? <p className="mt-5 text-sm text-slate-500">Cargando tu recorrido…</p> : <ol className="mt-6 space-y-4">{selectedModule.branches.map((branch, index, branches) => {
     const completed = completedBranches.includes(branch.id);
     const locked = index > 0 && !completedBranches.includes(branches[index - 1].id);
     return <li key={branch.id} aria-label={branch.title} aria-disabled={locked} className={`rounded-xl border p-5 sm:p-6 ${locked ? 'opacity-50 pointer-events-none border-slate-200 bg-slate-100' : completed ? 'border-emerald-200 bg-emerald-50/40' : 'border-blue-200 bg-white shadow-sm'}`}>
       <div className="flex items-start gap-4"><span className={`flex h-10 w-10 shrink-0 items-center justify-center rounded-full ${locked ? 'bg-slate-200 text-slate-500' : completed ? 'bg-emerald-100 text-emerald-700' : 'bg-blue-50 text-blue-700'}`}>{locked ? <Lock aria-label="Lección bloqueada" size={19}/> : completed ? <CheckCircle2 aria-label="Lección completada" size={20}/> : <BookOpen size={20}/>}</span><div><p className="text-xs font-medium text-slate-500">LECCIÓN {index + 1} · {locked ? 'Bloqueada' : completed ? 'Completada' : 'Disponible'}</p><h5 className="mt-2 text-base font-semibold">{branch.title}</h5><p className="mt-2 text-sm leading-6 text-slate-600">{branch.description}</p></div></div>
       <div className="mt-5 flex flex-wrap items-center justify-between gap-3"><p className="text-xs text-slate-500">{locked ? `Completa «${branches[index - 1].title}» para continuar.` : completed ? 'Has completado esta etapa de tu ruta.' : 'Responde las preguntas de esta lección para seguir avanzando.'}</p><button disabled={locked || completed} onClick={() => { setActiveBranchId(branch.id); setTimeout(() => document.getElementById('lesson-questionnaire')?.scrollIntoView({ behavior: 'smooth', block: 'start' }), 0); }} className="inline-flex items-center gap-2 rounded-lg bg-blue-950 px-4 py-2.5 text-sm font-semibold text-white hover:bg-blue-900 disabled:cursor-not-allowed disabled:bg-slate-200 disabled:text-slate-600">{locked ? <Lock size={16}/> : completed ? <CheckCircle2 size={16}/> : <ArrowRight size={16}/>} {completed ? 'Lección completada' : 'Completar lección'}</button></div>
     </li>;
   })}</ol>}
   {completedModuleBranches === selectedModule.branches.length && <p role="status" className="mt-5 rounded-lg bg-emerald-50 p-4 text-sm font-medium text-emerald-800">¡Ruta {selectedModule.level} completada! Evalúa tus conocimientos para seguir avanzando.</p>}
 </div>{selectedBranch && <div id="lesson-questionnaire" className="mt-8 border-t border-slate-200"><Questionnaire key={selectedBranch.id} module={selectedModule.level} branch={selectedBranch} onCancel={() => setActiveBranchId(null)} onComplete={() => { completeBranch(selectedBranch.id); setActiveBranchId(null); }}/></div>}<Link href="/evaluacion" className="mt-6 inline-flex items-center gap-2 text-sm font-semibold text-blue-700">Evaluar mis conocimientos<ArrowRight size={16}/></Link></section>}
 </section>
  </main>
 );
}
