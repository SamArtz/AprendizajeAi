'use client';

import { useMemo, useState } from 'react';
import ReactMarkdown from 'react-markdown';
import remarkGfm from 'remark-gfm';
import { ArrowLeft, ArrowRight, BookOpen, CheckCircle2, Lightbulb, Sparkles } from 'lucide-react';
import type { Branch } from '../lib/learning';
import type { Level } from '../lib/evaluation';
import { theorySlides } from '../lib/theory-slides';
import { hasPassed, type QuizResult } from '../lib/passing-score';
import Questionnaire from './questionnaire';

export default function BranchLesson({ branch, module, onComplete, onCancel }: {
  branch: Branch;
  module: Level;
  onComplete: (result: QuizResult) => void;
  onCancel: () => void;
}) {
  const [quiz, setQuiz] = useState(false);
  const [currentSlide, setCurrentSlide] = useState(0);
  const slides = useMemo(() => theorySlides(branch.contenido_teorico, branch.title), [branch.contenido_teorico, branch.title]);
  const slide = Math.min(currentSlide, Math.max(slides.length - 1, 0));
  const lastSlide = slides.length > 0 && slide === slides.length - 1;

  if (quiz) return <Questionnaire module={module} branch={branch} onComplete={result => { if (hasPassed(result)) onComplete(result); }} onCancel={() => setQuiz(false)}/>;

  return (
    <section aria-labelledby="lesson-theory-title" className="mt-8 overflow-hidden rounded-3xl border border-blue-100 bg-white shadow-lg shadow-blue-950/5">
      <div className="relative overflow-hidden border-b border-blue-100/70 bg-gradient-to-br from-blue-50 via-white to-indigo-50/60 px-6 py-7 sm:px-8">
        <div aria-hidden="true" className="pointer-events-none absolute -right-8 -top-16 h-52 w-52 rounded-full border-[24px] border-blue-100/40"/><div className="relative flex flex-wrap items-start justify-between gap-4">
          <div>
            <div className="flex flex-wrap items-center gap-3"><span className="inline-flex h-10 w-10 items-center justify-center rounded-xl border border-blue-100 bg-white text-blue-600 shadow-sm"><BookOpen size={20} aria-hidden="true"/></span><p className="text-xs font-semibold tracking-widest text-blue-700">APRENDE A TU RITMO</p><span className="rounded-full border border-blue-100 bg-white/80 px-3 py-1 text-xs font-medium text-blue-800">{module}</span></div>
            <h2 id="lesson-theory-title" className="mt-4 max-w-3xl text-xl font-semibold leading-8 text-slate-900 sm:text-2xl">{branch.title}</h2>
          </div>
          <button onClick={onCancel} className="relative rounded-lg border border-white bg-white/70 px-3 py-2 text-xs font-medium text-slate-600 transition-colors hover:bg-white hover:text-blue-700">Volver a las lecciones</button>
        </div>
        <div className="mt-6 flex items-center justify-between gap-4 text-xs text-slate-500">
          <p aria-live="polite">{slides.length ? `Diapositiva ${slide + 1} de ${slides.length}` : 'Contenido pendiente'}</p>
          <span className="hidden items-center gap-1.5 sm:inline-flex"><Sparkles size={13} aria-hidden="true"/>Un paso a la vez</span>
        </div>
        <div role="progressbar" aria-label="Avance de lectura" aria-valuemin={0} aria-valuemax={slides.length || 1} aria-valuenow={slides.length ? slide + 1 : 0} className="mt-3 h-1.5 overflow-hidden rounded-full bg-blue-100/70">
          <div className="h-full rounded-full bg-gradient-to-r from-blue-600 to-indigo-400 transition-[width] duration-300 motion-reduce:transition-none" style={{ width: `${slides.length ? (slide + 1) / slides.length * 100 : 0}%` }}/>
        </div>
      </div>
      <div className="bg-slate-50/60 px-4 py-6 sm:px-8 sm:py-8">
        <div key={slide} className="theory-slide-enter mx-auto max-w-4xl rounded-2xl border border-slate-200/80 bg-white p-5 shadow-sm sm:p-8">
          <div className="mb-6 flex items-center gap-3"><span className="inline-flex h-10 w-10 shrink-0 items-center justify-center rounded-xl bg-amber-50 text-amber-700"><Lightbulb size={20} aria-hidden="true"/></span><div><p className="text-[10px] font-semibold tracking-widest text-slate-500">TU ESPACIO PARA COMPRENDER</p><p className="mt-1 text-sm font-semibold text-slate-800">{lastSlide ? 'Una última idea antes de practicar' : slide === 0 ? 'Empecemos por lo esencial' : 'Sigamos construyendo el concepto'}</p></div><span aria-hidden="true" className="ml-auto text-3xl font-semibold tracking-tight text-blue-100">{String(slide+1).padStart(2,'0')}</span></div>
        <div aria-label={`Contenido de la diapositiva ${slide + 1}`} className="mx-auto min-h-48 max-w-3xl space-y-5 border-l-2 border-blue-100 pl-4 text-base leading-8 text-slate-600 sm:pl-6 sm:text-lg [&_h1]:text-2xl [&_h1]:font-semibold [&_h1]:text-slate-900 [&_h2]:text-xl [&_h2]:font-semibold [&_h2]:text-slate-900 [&_h3]:font-semibold [&_strong]:font-semibold [&_strong]:text-slate-800 [&_ul]:list-disc [&_ul]:space-y-2 [&_ul]:pl-6 [&_ol]:list-decimal [&_ol]:space-y-2 [&_ol]:pl-6 [&_a]:text-blue-700 [&_a]:underline [&_pre]:overflow-auto [&_pre]:rounded-lg [&_pre]:bg-slate-100 [&_pre]:p-4 [&_pre]:text-sm [&_table]:block [&_table]:overflow-auto [&_th]:border [&_th]:p-2 [&_td]:border [&_td]:p-2">
          {slides.length ? <ReactMarkdown remarkPlugins={[remarkGfm]}>{slides[slide]}</ReactMarkdown> : <p>No hay contenido informativo disponible para esta lección.</p>}
        </div>
        </div>
        {lastSlide && <p className="mx-auto mt-8 flex max-w-3xl items-center gap-2 text-sm font-medium text-emerald-700"><CheckCircle2 size={17} className="shrink-0"/>Has llegado al final de la guía. Ahora puedes ponerlo en práctica.</p>}
      </div>
      <div className="flex flex-wrap items-center justify-between gap-4 border-t border-slate-100 bg-slate-50/60 px-6 py-5 sm:px-8">
        <button disabled={slide === 0} onClick={() => setCurrentSlide(slide - 1)} className="inline-flex items-center gap-2 rounded-lg border border-slate-200 bg-white px-5 py-3 text-sm font-medium text-slate-600 hover:bg-slate-50 disabled:cursor-not-allowed disabled:opacity-40"><ArrowLeft size={16}/>Anterior</button>
        <div aria-hidden="true" className="hidden items-center gap-1.5 md:flex">{slides.map((_,index)=><span key={index} className={`h-1.5 rounded-full transition-all duration-200 motion-reduce:transition-none ${index===slide ? 'w-6 bg-blue-600' : index<slide ? 'w-1.5 bg-blue-300' : 'w-1.5 bg-slate-200'}`}/>)}</div>
        {lastSlide ? <button onClick={() => setQuiz(true)} className="inline-flex items-center gap-2 rounded-lg bg-blue-950 px-6 py-3 text-sm font-semibold text-white transition-[background-color,transform,box-shadow] hover:bg-blue-900 hover:shadow-md active:scale-[0.98] motion-reduce:transform-none motion-reduce:transition-none">Comenzar lección<ArrowRight size={17}/></button> : <button disabled={!slides.length} onClick={() => setCurrentSlide(slide + 1)} className="inline-flex items-center gap-2 rounded-lg bg-blue-950 px-6 py-3 text-sm font-semibold text-white transition-[background-color,transform,box-shadow] hover:bg-blue-900 hover:shadow-md active:scale-[0.98] motion-reduce:transform-none motion-reduce:transition-none disabled:cursor-not-allowed disabled:opacity-40">Siguiente<ArrowRight size={17}/></button>}
      </div>
    </section>
  );
}
