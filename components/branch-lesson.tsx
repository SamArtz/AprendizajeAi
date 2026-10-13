'use client';

import { useMemo, useState } from 'react';
import ReactMarkdown from 'react-markdown';
import remarkGfm from 'remark-gfm';
import { ArrowLeft, ArrowRight, BookOpen, CheckCircle2 } from 'lucide-react';
import type { Branch } from '../lib/learning';
import type { Level } from '../lib/evaluation';
import { theorySlides } from '../lib/theory-slides';
import Questionnaire from './questionnaire';

export default function BranchLesson({ branch, module, onComplete, onCancel }: {
  branch: Branch;
  module: Level;
  onComplete: () => void;
  onCancel: () => void;
}) {
  const [quiz, setQuiz] = useState(false);
  const [currentSlide, setCurrentSlide] = useState(0);
  const slides = useMemo(() => theorySlides(branch.contenido_teorico, branch.title), [branch.contenido_teorico, branch.title]);
  const slide = Math.min(currentSlide, Math.max(slides.length - 1, 0));
  const lastSlide = slides.length > 0 && slide === slides.length - 1;

  if (quiz) return <Questionnaire module={module} branch={branch} onComplete={onComplete} onCancel={() => setQuiz(false)}/>;

  return (
    <section aria-labelledby="lesson-theory-title" className="mt-8 overflow-hidden rounded-2xl border border-blue-100 bg-white shadow-sm">
      <div className="border-b border-slate-100 px-6 py-6 sm:px-8">
        <div className="flex flex-wrap items-start justify-between gap-4">
          <div>
            <p className="flex items-center gap-2 text-xs font-semibold tracking-widest text-blue-700"><BookOpen size={15}/> APRENDE A TU RITMO</p>
            <h2 id="lesson-theory-title" className="mt-3 max-w-2xl text-xl font-semibold leading-8 text-slate-900 sm:text-2xl">{branch.title}</h2>
          </div>
          <button onClick={onCancel} className="text-sm font-medium text-slate-500 hover:text-blue-700">Volver a las lecciones</button>
        </div>
        <div className="mt-6 flex items-center justify-between gap-4 text-xs text-slate-500">
          <p aria-live="polite">{slides.length ? `Diapositiva ${slide + 1} de ${slides.length}` : 'Contenido pendiente'}</p>
          <span>Primero aprende, después practica</span>
        </div>
        <div role="progressbar" aria-label="Avance de lectura" aria-valuemin={0} aria-valuemax={slides.length || 1} aria-valuenow={slides.length ? slide + 1 : 0} className="mt-3 h-1.5 overflow-hidden rounded-full bg-slate-100">
          <div className="h-full rounded-full bg-blue-600 transition-[width] duration-300 motion-reduce:transition-none" style={{ width: `${slides.length ? (slide + 1) / slides.length * 100 : 0}%` }}/>
        </div>
      </div>
      <div className="px-6 py-8 sm:px-10 sm:py-10">
        <div aria-label={`Contenido de la diapositiva ${slide + 1}`} className="mx-auto min-h-56 max-w-3xl space-y-5 text-base leading-8 text-slate-600 sm:text-lg [&_h1]:text-2xl [&_h1]:font-semibold [&_h1]:text-slate-900 [&_h2]:text-xl [&_h2]:font-semibold [&_h2]:text-slate-900 [&_h3]:font-semibold [&_strong]:font-semibold [&_strong]:text-slate-800 [&_ul]:list-disc [&_ul]:space-y-2 [&_ul]:pl-6 [&_ol]:list-decimal [&_ol]:space-y-2 [&_ol]:pl-6 [&_a]:text-blue-700 [&_a]:underline [&_pre]:overflow-auto [&_pre]:rounded-lg [&_pre]:bg-slate-100 [&_pre]:p-4 [&_pre]:text-sm [&_table]:block [&_table]:overflow-auto [&_th]:border [&_th]:p-2 [&_td]:border [&_td]:p-2">
          {slides.length ? <ReactMarkdown remarkPlugins={[remarkGfm]}>{slides[slide]}</ReactMarkdown> : <p>No hay contenido informativo disponible para esta lección.</p>}
        </div>
        {lastSlide && <p className="mx-auto mt-8 flex max-w-3xl items-center gap-2 text-sm font-medium text-emerald-700"><CheckCircle2 size={17} className="shrink-0"/>Has llegado al final de la guía. Ahora puedes ponerlo en práctica.</p>}
      </div>
      <div className="flex flex-wrap items-center justify-between gap-4 border-t border-slate-100 bg-slate-50/60 px-6 py-5 sm:px-8">
        <button disabled={slide === 0} onClick={() => setCurrentSlide(slide - 1)} className="inline-flex items-center gap-2 rounded-lg border border-slate-200 bg-white px-5 py-3 text-sm font-medium text-slate-600 hover:bg-slate-50 disabled:cursor-not-allowed disabled:opacity-40"><ArrowLeft size={16}/>Anterior</button>
        {lastSlide ? <button onClick={() => setQuiz(true)} className="inline-flex items-center gap-2 rounded-lg bg-blue-950 px-6 py-3 text-sm font-semibold text-white hover:bg-blue-900">Comenzar lección<ArrowRight size={17}/></button> : <button disabled={!slides.length} onClick={() => setCurrentSlide(slide + 1)} className="inline-flex items-center gap-2 rounded-lg bg-blue-950 px-6 py-3 text-sm font-semibold text-white hover:bg-blue-900 disabled:cursor-not-allowed disabled:opacity-40">Siguiente<ArrowRight size={17}/></button>}
      </div>
    </section>
  );
}
