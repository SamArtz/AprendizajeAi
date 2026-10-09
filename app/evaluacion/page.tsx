'use client';

import { useState } from 'react';
import Link from 'next/link';
import { ArrowLeft, ArrowRight, ShieldCheck, BrainCircuit, CheckCircle2, RotateCcw } from 'lucide-react';
import { questions, pointsByDifficulty, MAX_SCORE, evaluateScore } from '../../lib/evaluation';

export default function Evaluation() {
  const [currentStep, setCurrentStep] = useState(0);
  const [selected, setSelected] = useState<number | null>(null);
  const [score, setScore] = useState(0);
  const [answers, setAnswers] = useState<number[]>([]);
  const isFinished = currentStep === questions.length;
  const question = questions[currentStep];
  const progress = currentStep / questions.length * 100;

  function next() {
    if (selected === null || isFinished) return;
    setScore(previous => previous + (selected === question.correct ? pointsByDifficulty[question.difficulty] : 0));
    setAnswers(previous => [...previous, selected]);
    setCurrentStep(previous => previous + 1);
    setSelected(null);
  }

  function reset() {
    setCurrentStep(0);
    setSelected(null);
    setScore(0);
    setAnswers([]);
  }

  return (
    <main className="mx-auto max-w-3xl px-6 py-10">
      <Link href="/dashboard" className="inline-flex items-center gap-2 text-sm text-slate-500"><ArrowLeft size={16}/>Volver al dashboard</Link>
      <p className="mt-10 text-xs font-semibold tracking-widest text-blue-700">EVALUACIÓN DE CONOCIMIENTOS EN IA</p>
      <h1 className="mt-3 text-3xl font-semibold">{isFinished ? 'Tu análisis está listo.' : 'Tu próximo paso hacia la IA.'}</h1>
      <p className="mt-3 leading-7 text-slate-500">15 preguntas. Tres dificultades. Conoce tu nivel y descubre qué puedes reforzar.</p>
      <section className="mt-8 rounded-2xl border border-slate-200 bg-white p-6 shadow-sm sm:p-9">
        <div className="flex flex-wrap justify-between gap-2 text-xs">
          <span>{isFinished ? 'Evaluación completada' : `Pregunta ${currentStep + 1} de ${questions.length}`}</span>
          <span className="text-slate-500">{isFinished ? '15 de 15 respuestas' : `${question.difficulty} · ${pointsByDifficulty[question.difficulty]} puntos`}</span>
        </div>
        <div role="progressbar" aria-label="Preguntas completadas" aria-valuenow={currentStep} aria-valuemin={0} aria-valuemax={questions.length} className="mt-3 h-1.5 overflow-hidden rounded-full bg-slate-100">
          <div className="h-full rounded-full bg-blue-600 transition-all" style={{ width: `${progress}%` }}/>
        </div>
        {!isFinished ? <>
          <BrainCircuit className="mb-6 mt-9 text-blue-600" size={28}/>
          <fieldset>
            <legend className="mb-6 text-xl font-semibold leading-8">{question.title}</legend>
            <div className="space-y-3">{question.options.map((option, index) => (
              <label key={`${currentStep}-${index}`} className={`flex cursor-pointer items-center gap-4 rounded-xl border p-5 text-sm leading-6 ${selected === index ? 'border-blue-600 bg-blue-50' : 'border-slate-200 hover:bg-slate-50'}`}>
                <input type="radio" name={`question-${currentStep}`} value={index} checked={selected === index} onChange={() => setSelected(index)} className="h-4 w-4 shrink-0 accent-blue-600"/>{option}
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
            <p className="mt-6 text-xs font-semibold tracking-widest text-slate-500">ANÁLISIS COMPLETADO · TU NIVEL DE IA</p>
            <h2 className="mt-3 text-4xl font-semibold tracking-tight text-blue-950 sm:text-5xl">{evaluateScore(score)}</h2>
            <p className="mt-5 text-2xl font-semibold">{score} <span className="text-base font-normal text-slate-500">/ {MAX_SCORE} puntos</span></p>
            <p className="mt-2 text-sm text-slate-500">{answers.filter((answer, index) => answer === questions[index].correct).length} de {questions.length} respuestas correctas</p>
            <p className="mt-4 text-xs leading-6 text-slate-400">Resultado orientativo; no constituye una certificación profesional.</p>
          </div>
          <div className="mt-8 flex flex-wrap justify-center gap-3">
            <Link href="/dashboard" className="flex items-center gap-2 rounded-lg bg-blue-950 px-5 py-3 text-sm font-semibold text-white hover:bg-blue-900">Continuar al Dashboard<ArrowRight size={16}/></Link>
            <button onClick={reset} className="flex items-center gap-2 rounded-lg border border-slate-200 px-5 py-3 text-sm hover:bg-slate-50"><RotateCcw size={16}/>Repetir evaluación</button>
          </div>
          <details className="mt-9 border-t border-slate-100 pt-6">
            <summary className="text-sm font-semibold text-slate-600">Revisar respuestas y recomendaciones</summary>
            <div className="mt-5 space-y-4">{questions.map((item, index) => (
              <article key={item.title} className="rounded-lg bg-slate-50 p-4">
                <h3 className="text-sm font-medium">{index + 1}. {item.title}</h3>
                <p className={`mt-2 text-xs font-semibold ${answers[index] === item.correct ? 'text-emerald-700' : 'text-amber-700'}`}>{answers[index] === item.correct ? `Correcto · +${pointsByDifficulty[item.difficulty]} puntos` : 'Para reforzar · 0 puntos'}</p>
                <p className="mt-2 text-sm leading-6 text-slate-500">{item.explanation}</p>
              </article>
            ))}</div>
          </details>
        </div>}
      </section>
      <p className="mt-6 flex items-center justify-center gap-2 text-xs text-slate-400"><ShieldCheck size={14}/>Respuestas solo en memoria. No se envían ni se guardan.</p>
    </main>
  );
}
