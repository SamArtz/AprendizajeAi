'use client';
import { useEffect, useRef } from 'react';
import { CheckCircle2, XCircle, X } from 'lucide-react';
import type { DatabaseQuestion } from '../lib/questionnaire';
export default function QuizReview({ questions, answers, onClose }: { questions: DatabaseQuestion[]; answers: number[]; onClose: () => void }) {
  const ref = useRef<HTMLDialogElement>(null);
  // En Strict Mode la limpieza del efecto cierra y reabre el dialog.
  // Ese cierre técnico no debe cambiar el estado del padre.
  useEffect(() => { const dialog = ref.current; dialog?.showModal(); return () => { dialog?.close(); }; }, []);
  const mistakes = questions.flatMap((question, index) => {
    const selected = question.opciones[answers[index]];
    const maximum = Math.max(...question.opciones.map(option => option.puntos));
    return selected && selected.puntos < maximum ? [{ question, index, selected, correct: question.opciones.filter(option => option.puntos === maximum) }] : [];
  });
  return <dialog ref={ref} onCancel={event => { event.preventDefault(); onClose(); }} aria-labelledby="review-title" className="fixed inset-0 m-auto max-h-[85dvh] w-[calc(100%_-_2rem)] max-w-2xl overflow-y-auto rounded-2xl border border-slate-200 bg-white p-6 text-slate-900 shadow-2xl backdrop:bg-slate-950/60 sm:p-8">
    <div className="flex items-start justify-between gap-4"><div><h2 id="review-title" className="text-xl font-semibold">Revisión de tu test</h2><p className="mt-2 text-sm text-slate-500">{mistakes.length ? `${mistakes.length} preguntas para reforzar. Aprende de cada respuesta.` : '¡Todas tus respuestas son correctas!'}</p></div><button autoFocus onClick={onClose} aria-label="Cerrar revisión" className="rounded-lg p-2 text-slate-500 hover:bg-slate-100"><X size={20}/></button></div>
    <div className="mt-6 space-y-5">{mistakes.map(({question,index,selected,correct}) => <article key={question.pregunta_id} className="rounded-xl border border-slate-200 p-4"><h3 className="text-sm font-semibold leading-6">{index+1}. {question.texto}</h3><div className="mt-3 rounded-lg border border-red-200 bg-red-50 p-3 text-sm text-red-800"><p className="mb-1 flex items-center gap-2 font-semibold"><XCircle size={16}/>Tu respuesta incorrecta</p>{selected.texto}</div>{correct.map(option => <div key={option.id} className="mt-3 rounded-lg border border-emerald-200 bg-emerald-50 p-3 text-sm text-emerald-800"><p className="mb-1 flex items-center gap-2 font-semibold"><CheckCircle2 size={16}/>Respuesta correcta</p>{option.texto}</div>)}</article>)}</div><button onClick={onClose} className="mt-6 rounded-lg bg-blue-950 px-5 py-3 text-sm font-semibold text-white">Volver al resultado</button>
  </dialog>;
}
