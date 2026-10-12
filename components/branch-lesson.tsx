'use client';
import { useState } from 'react';
import ReactMarkdown from 'react-markdown';
import remarkGfm from 'remark-gfm';
import { ArrowRight } from 'lucide-react';
import type { Branch } from '../lib/learning';
import type { Level } from '../lib/evaluation';
import Questionnaire from './questionnaire';
export default function BranchLesson({ branch, module, onComplete, onCancel }: { branch: Branch; module: Level; onComplete: () => void; onCancel: () => void }) {
  const [quiz, setQuiz] = useState(false);
  if (quiz) return <Questionnaire module={module} branch={branch} onComplete={onComplete} onCancel={() => setQuiz(false)}/>;
  return <section className="mt-8 rounded-xl border border-blue-100 bg-white p-6 sm:p-8"><div className="flex flex-wrap items-start justify-between gap-4"><div><p className="text-xs font-semibold tracking-widest text-blue-700">CONTENIDO TEÓRICO</p><h2 className="mt-3 text-2xl font-semibold">{branch.title}</h2></div><button onClick={onCancel} className="text-sm text-slate-500">Volver a las lecciones</button></div><div className="mt-6 space-y-4 leading-7 text-slate-600 [&_h1]:text-2xl [&_h1]:font-semibold [&_h2]:mt-6 [&_h2]:text-xl [&_h2]:font-semibold [&_h3]:font-semibold [&_ul]:list-disc [&_ul]:pl-6 [&_ol]:list-decimal [&_ol]:pl-6 [&_a]:text-blue-700 [&_a]:underline [&_pre]:overflow-auto [&_pre]:rounded-lg [&_pre]:bg-slate-100 [&_pre]:p-4 [&_table]:block [&_table]:overflow-auto [&_th]:border [&_th]:p-2 [&_td]:border [&_td]:p-2"><ReactMarkdown remarkPlugins={[remarkGfm]}>{branch.contenido_teorico}</ReactMarkdown></div><button onClick={() => setQuiz(true)} className="mt-8 inline-flex items-center gap-2 rounded-lg bg-blue-950 px-5 py-3 text-sm font-semibold text-white">Continuar al cuestionario · {branch.preguntas.length} preguntas<ArrowRight size={16}/></button></section>;
}
