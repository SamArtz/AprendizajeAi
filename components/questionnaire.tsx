'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { ArrowLeft, ArrowRight, ShieldCheck, BrainCircuit, CheckCircle2, RotateCcw } from 'lucide-react';
import { evaluateScore, type Level } from '../lib/evaluation';
import type { Branch } from '../lib/learning';
import { isQuestionnaire, type DatabaseQuestion } from '../lib/questionnaire';

export default function Questionnaire({ module, branch, onComplete, onCancel }: { module?: Level; branch?: Branch; onComplete?: () => void; onCancel?: () => void }) {
  const [questions, setQuestions] = useState<DatabaseQuestion[]>([]);
  const [loading, setLoading] = useState(true);
  const [loadError, setLoadError] = useState<string | null>(null);
  const [retry, setRetry] = useState(0);
  useEffect(() => {
    const controller = new AbortController();
    async function load() {
      setLoading(true);
      setLoadError(null);
      try {
        const response = await fetch(`/api/preguntas?modulo=${encodeURIComponent(module ? `Módulo ${module}` : 'Evaluacion Inicial')}${branch ? `&rama=${encodeURIComponent(branch.id)}` : ''}`, { signal: controller.signal, cache: 'no-store' });
        if (!response.ok) throw new Error('No se pudieron cargar las preguntas. Revisa la conexión y vuelve a intentarlo.');
        const data: unknown = await response.json();
        if (!isQuestionnaire(data)) throw new Error('El cuestionario contiene preguntas u opciones inválidas.');
        if (!data.length) throw new Error('No hay preguntas disponibles para esta lección. Comprueba que ejecutaste el seed y que su rama_id coincide.');
        if (!controller.signal.aborted) setQuestions(data);
      } catch (error) {
        if (!controller.signal.aborted) setLoadError(error instanceof Error ? error.message : 'Error al cargar el cuestionario.');
      } finally { if (!controller.signal.aborted) setLoading(false); }
    }
    void load();
      return () => controller.abort();
  }, [retry, module, branch]);
  const maxScore = questions.reduce((sum, item) => sum + Math.max(...item.opciones.map(option => option.puntos)), 0);
  // Mantiene los cortes históricos sobre 300 aunque cambie el tamaño del banco.
  const getLevel = (points: number) => evaluateScore(Math.round(points / maxScore * 300));
  const [currentStep, setCurrentStep] = useState(0);
  const [selected, setSelected] = useState<number | null>(null);
  const [score, setScore] = useState(0);
  const [storageError, setStorageError] = useState(false);
  const [answers, setAnswers] = useState<number[]>([]);
  const isFinished = questions.length > 0 && currentStep === questions.length;
  const question = questions[currentStep];
  const progress = questions.length ? currentStep / questions.length * 100 : 0;

  function next() {
    if (selected === null || isFinished || !question) return;
    const finalScore = score + question.opciones[selected].puntos;
    if (currentStep === questions.length - 1) {
      try {
        if (!module) localStorage.setItem('userLevel', getLevel(finalScore));
        setStorageError(false);
      } catch {
        setStorageError(true);
      }
    }
    setScore(finalScore);
    setAnswers(previous => [...previous, selected]);
    setCurrentStep(previous => previous + 1);
    setSelected(null);
  }

  function reset() {
    setCurrentStep(0);
    setSelected(null);
    setScore(0);
    setAnswers([]);
    setStorageError(false);
  }

    if (loading || loadError) return (
    <section className="mx-auto max-w-3xl px-6 py-12"><Link href="/dashboard" className="text-sm text-blue-700">Volver al dashboard</Link><section className="mt-8 rounded-xl border border-slate-200 bg-white p-8"><h1 className="text-2xl font-semibold">Evaluación de IA</h1>{loading ? <p role="status" className="mt-4 text-slate-500">Cargando preguntas…</p> : <><p role="alert" className="mt-4 text-slate-600">{loadError}</p><button onClick={() => setRetry(value => value + 1)} className="mt-6 rounded-lg bg-blue-950 px-5 py-3 text-sm text-white">Reintentar</button></>}</section></section>
  );
  return (
    <section className="mx-auto max-w-3xl px-6 py-10">
      <Link href="/dashboard" className="inline-flex items-center gap-2 text-sm text-slate-500"><ArrowLeft size={16}/>Volver al dashboard</Link>
      {onCancel && <button onClick={onCancel} className="ml-4 text-sm font-medium text-blue-700">Volver a las lecciones</button>}
      <p className="mt-10 text-xs font-semibold tracking-widest text-blue-700">{module ? `PRÁCTICA DEL MÓDULO ${module.toUpperCase()}` : 'EVALUACIÓN INICIAL DE CONOCIMIENTOS EN IA'}</p>
      <h1 className="mt-3 text-3xl font-semibold">{isFinished ? 'Tu análisis está listo.' : branch ? branch.title : module ? `Practica el módulo ${module}` : 'Tu próximo paso hacia la IA.'}</h1>
      <p className="mt-3 leading-7 text-slate-500">{questions.length} preguntas. Conoce tu nivel y descubre qué puedes reforzar.</p>
      <section className="mt-8 rounded-2xl border border-slate-200 bg-white p-6 shadow-sm sm:p-9">
        <div className="flex flex-wrap justify-between gap-2 text-xs">
          <span>{isFinished ? 'Evaluación completada' : `Pregunta ${currentStep + 1} de ${questions.length}`}</span>
          <span className="text-slate-500">{isFinished ? `${questions.length} de ${questions.length} respuestas` : `${question.dificultad} · ${Math.max(...question.opciones.map(option => option.puntos))} puntos`}</span>
        </div>
        <div role="progressbar" aria-label="Preguntas completadas" aria-valuenow={currentStep} aria-valuemin={0} aria-valuemax={questions.length} className="mt-3 h-1.5 overflow-hidden rounded-full bg-slate-100">
          <div className="h-full rounded-full bg-blue-600 transition-all" style={{ width: `${progress}%` }}/>
        </div>
        {!isFinished ? <>
          <BrainCircuit className="mb-6 mt-9 text-blue-600" size={28}/>
          <fieldset>
            <legend className="mb-6 text-xl font-semibold leading-8">{question.texto}</legend>
            <div className="space-y-3">{question.opciones.map((option, index) => (
              <label key={`${currentStep}-${index}`} className={`flex cursor-pointer items-center gap-4 rounded-xl border p-5 text-sm leading-6 ${selected === index ? 'border-blue-600 bg-blue-50' : 'border-slate-200 hover:bg-slate-50'}`}>
                <input type="radio" name={`question-${currentStep}`} value={index} checked={selected === index} onChange={() => setSelected(index)} className="h-4 w-4 shrink-0 accent-blue-600"/>{option.texto}
              </label>
            ))}</div>
          </fieldset>
          <div className="mt-8 flex flex-wrap items-center justify-between gap-4 border-t border-slate-100 pt-6">
            <p className="text-xs text-slate-400">Selecciona una respuesta para continuar.</p>
            <button disabled={selected === null} onClick={next} className="flex items-center gap-3 rounded-lg bg-blue-950 px-5 py-3 text-sm font-semibold text-white hover:bg-blue-900 disabled:cursor-not-allowed disabled:bg-slate-200 disabled:text-slate-400">
              {currentStep === questions.length - 1 ? 'Completar análisis' : 'Siguiente pregunta'}<ArrowRight size={16}/>
            </button>
          </div>
        </> : <div aria-live="polite" className="pt-10">
          <div className="text-center">
            <CheckCircle2 className="mx-auto text-emerald-600" size={48}/>
            <p className="mt-6 text-xs font-semibold tracking-widest text-slate-500">{module ? 'PRÁCTICA COMPLETADA' : 'ANÁLISIS COMPLETADO · TU NIVEL DE IA'}</p>
            <h2 className="mt-3 text-4xl font-semibold tracking-tight text-blue-950 sm:text-5xl">{module ? `${Math.round(score / maxScore * 100)}%` : getLevel(score)}</h2>
            <p className="mt-5 text-2xl font-semibold">{score} <span className="text-base font-normal text-slate-500">/ {maxScore} puntos</span></p>
            <p className="mt-2 text-sm text-slate-500">{answers.filter((answer, index) => questions[index].opciones[answer].puntos === Math.max(...questions[index].opciones.map(option => option.puntos))).length} de {questions.length} respuestas correctas</p>
            <p className="mt-4 text-xs leading-6 text-slate-400">{module ? 'Esta práctica no modifica tu nivel inicial ni desbloquea módulos automáticamente.' : 'Resultado orientativo; no constituye una certificación profesional.'}</p>
          </div>
          {storageError && <p role="alert" className="mt-6 rounded-lg bg-amber-50 p-4 text-sm text-amber-800">No se pudo guardar tu nivel. Habilita el almacenamiento del navegador y repite la evaluación para conectarlo con el Dashboard.</p>}
          <div className="mt-8 flex flex-wrap justify-center gap-3">
            {onComplete ? <button onClick={onComplete} className="flex items-center gap-2 rounded-lg bg-blue-950 px-5 py-3 text-sm font-semibold text-white">Guardar lección completada<CheckCircle2 size={16}/></button> : <Link href="/dashboard" className="flex items-center gap-2 rounded-lg bg-blue-950 px-5 py-3 text-sm font-semibold text-white hover:bg-blue-900">Continuar al Dashboard<ArrowRight size={16}/></Link>}
            <button onClick={reset} className="flex items-center gap-2 rounded-lg border border-slate-200 px-5 py-3 text-sm hover:bg-slate-50"><RotateCcw size={16}/>Repetir evaluación</button>
          </div>
          <details className="mt-9 border-t border-slate-100 pt-6">
            <summary className="text-sm font-semibold text-slate-600">Revisar respuestas y recomendaciones</summary>
            <div className="mt-5 space-y-4">{questions.map((item, index) => (
              <article key={item.pregunta_id} className="rounded-lg bg-slate-50 p-4">
                <h3 className="text-sm font-medium">{index + 1}. {item.texto}</h3>
                <p className={`mt-2 text-xs font-semibold ${item.opciones[answers[index]].puntos > 0 ? 'text-emerald-700' : 'text-amber-700'}`}>{item.opciones[answers[index]].puntos > 0 ? `Correcto · +${item.opciones[answers[index]].puntos} puntos` : 'Para reforzar · 0 puntos'}</p>
                <p className="mt-2 text-sm leading-6 text-slate-500">Tu respuesta: {item.opciones[answers[index]].texto}</p>
              </article>
            ))}</div>
          </details>
        </div>}
      </section>
      <p className="mt-6 flex items-center justify-center gap-2 text-xs text-slate-400"><ShieldCheck size={14}/>{module ? 'Tus respuestas de práctica no se envían ni se guardan.' : 'Solo tu nivel se guarda en este navegador. Tus respuestas no se envían ni se guardan.'}</p>
    </section>
  );
}
