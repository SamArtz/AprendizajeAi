'use client';
import { useEffect, useRef, useState } from 'react';
import Link from 'next/link';
import { ArrowLeft, ArrowUp, BookOpen, Check, FileText, LoaderCircle, LockKeyhole, Scale, Sparkles, Trash2 } from 'lucide-react';
import type { LegalReply } from '../lib/legal-chat';

type Exchange = { question: string; reply: LegalReply };
const examples = ['¿Cómo se calcula el aguinaldo?', 'vacaciones anuales', 'artículo 198'];
export default function LegalChat({ allowed }: { allowed: boolean }) {
  const [question, setQuestion] = useState('');
  const [exchanges, setExchanges] = useState<Exchange[]>([]);
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState('');
  const end = useRef<HTMLDivElement>(null);
  const controller = useRef<AbortController | null>(null);
  useEffect(() => () => controller.current?.abort(), []);
  useEffect(() => { if (exchanges.length) end.current?.scrollIntoView({ behavior: window.matchMedia('(prefers-reduced-motion: reduce)').matches ? 'instant' : 'smooth', block: 'end' }); }, [exchanges.length]);
  async function send(value = question) {
    const text = value.trim(); if (busy || text.length < 3 || text.length > 500) return;
    setBusy(true); setError('');
    controller.current = new AbortController();
    try {
      const response = await fetch('/api/chat-juridico', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ question: text }), signal: controller.current.signal });
      const data = await response.json();
      if (!response.ok) throw new Error(data.error || 'No se pudo completar la consulta.');
      setExchanges(previous => [...previous, { question: text, reply: data }]); setQuestion('');
    } catch (e) {
      if (!(e instanceof Error && e.name === 'AbortError')) setError(e instanceof Error ? e.message : 'No se pudo conectar.');
    } finally { setBusy(false); }
  }
  return <main className="mx-auto max-w-7xl px-4 py-8 sm:px-6 sm:py-12">
    <Link href="/dashboard" className="inline-flex items-center gap-2 text-sm text-blue-700 hover:underline"><ArrowLeft size={16} />Volver a mi aprendizaje</Link>
    <div className="mt-6 grid overflow-hidden rounded-3xl border border-blue-200 bg-white shadow-xl shadow-blue-950/5 lg:grid-cols-[280px_1fr]">
      <aside className="bg-gradient-to-br from-blue-950 via-blue-900 to-blue-800 p-7 text-white">
        <span className="inline-flex rounded-2xl bg-white/10 p-3"><Scale size={27} /></span>
        <p className="mt-6 text-xs font-medium uppercase tracking-[.2em] text-blue-200">Adaptia · Jurídico</p>
        <h1 className="mt-3 text-3xl font-semibold tracking-tight">Investiga con una fuente a la vista.</h1>
        <p className="mt-4 text-sm leading-7 text-blue-100">Explora el Código de Trabajo de El Salvador y revisa los artículos detrás de cada consulta.</p>
        <div className="mt-8 space-y-4 border-t border-white/15 pt-6 text-sm text-blue-100">
          <p className="flex items-start gap-3"><BookOpen size={19} className="mt-0.5 shrink-0" />Compendio CNJ · edición 2025</p>
          <p className="flex items-start gap-3"><FileText size={19} className="mt-0.5 shrink-0" />Referencias a artículos y páginas del PDF</p>
          <p className="flex items-start gap-3"><LockKeyhole size={19} className="mt-0.5 shrink-0" />Piloto con acceso por cuenta</p>
        </div>
        <p className="mt-8 rounded-xl border border-white/15 bg-white/5 p-4 text-xs leading-6 text-blue-100">Biblioteca pendiente de revisión. Esta prueba no acredita la vigencia actual de las normas ni sustituye el análisis profesional.</p>
      </aside>
      <section aria-label="Consultas jurídicas" className="flex min-w-0 flex-col bg-gradient-to-b from-blue-50/70 to-white">
        <header className="flex flex-wrap items-center justify-between gap-3 border-b border-blue-100 px-5 py-5 sm:px-8">
          <div><h2 className="font-semibold text-blue-950">Tu espacio de consulta</h2><p className="mt-1 text-xs text-slate-500">Código de Trabajo · Piloto interno</p></div>
          {exchanges.length > 0 && <button disabled={busy} onClick={() => { setExchanges([]); setError(''); }} className="inline-flex items-center gap-2 rounded-lg border border-blue-100 bg-white px-3 py-2 text-xs text-slate-600 disabled:opacity-50"><Trash2 size={14} />Limpiar conversación</button>}
        </header>
        {!allowed ? <div className="m-8 rounded-2xl border border-blue-200 bg-white p-8"><LockKeyhole className="text-blue-600" /><h2 className="mt-4 text-xl font-semibold">El piloto todavía no está habilitado para esta cuenta.</h2><p className="mt-3 text-sm leading-7 text-slate-600">El administrador debe añadir tu correo a las cuentas autorizadas del servidor.</p></div> : <>
          <div className="flex-1 space-y-7 px-5 py-8 sm:px-8" aria-live="polite" aria-relevant="additions">
            {exchanges.length === 0 && <div className="mx-auto max-w-xl py-8 sm:py-14"><Sparkles size={29} className="text-blue-600" /><h2 className="mt-5 text-2xl font-semibold text-blue-950">Empieza por una pregunta.</h2><p className="mt-3 text-sm leading-7 text-slate-600">Plantea una consulta completa o indica un artículo. Primero recuperamos documentos; la explicación con IA depende de la configuración del piloto.</p><div className="mt-6 flex flex-wrap gap-3">{examples.map(example => <button key={example} disabled={busy} onClick={() => send(example)} className="rounded-xl border border-blue-200 bg-white px-4 py-3 text-left text-sm text-blue-800 transition hover:border-blue-400 hover:bg-blue-50 disabled:opacity-50">{example}</button>)}</div></div>}
            {exchanges.map((exchange, index) => <article key={index} className="space-y-4">
              <div className="ml-auto max-w-xl rounded-2xl rounded-tr-sm bg-blue-900 px-5 py-4 text-sm leading-7 text-white"><span className="sr-only">Tu pregunta: </span>{exchange.question}</div>
              <div className="rounded-2xl border border-blue-100 bg-white p-5 shadow-sm sm:p-6">
                <p className="flex items-center gap-2 text-xs font-semibold text-blue-700">{exchange.reply.generated ? <Sparkles size={15} /> : <BookOpen size={15} />}{exchange.reply.generated ? 'Explicación con IA' : 'Consulta documental'}</p>
                <p className="mt-4 whitespace-pre-wrap text-sm leading-7 text-slate-700">{exchange.reply.answer}</p>
                <p className="mt-4 text-xs leading-6 text-amber-800">{exchange.reply.notice}</p>
                {exchange.reply.sources.length > 0 && <div className="mt-5 border-t border-blue-100 pt-5"><h3 className="flex items-center gap-2 text-xs font-semibold text-blue-950"><Check size={15} />Fuentes recuperadas · versión {exchange.reply.version}</h3><div className="mt-3 space-y-2">{exchange.reply.sources.map(source => <details key={source.id} className="rounded-xl border border-blue-100 bg-blue-50/50"><summary className="cursor-pointer px-4 py-3 text-sm font-medium text-blue-900">Artículo {source.articulo}<span className="ml-2 text-xs font-normal text-slate-500">PDF p. {source.paginas_pdf.join(', ')} · parte {source.parte}/{source.total_partes}</span></summary><p className="whitespace-pre-wrap border-t border-blue-100 px-4 py-4 text-sm leading-7 text-slate-600">{source.texto}</p></details>)}</div></div>}
              </div>
            </article>)}
            {busy && <p role="status" className="flex items-center gap-2 text-sm text-blue-700"><LoaderCircle size={18} className="animate-spin motion-reduce:animate-none" />Buscando fuentes y preparando la consulta…</p>}
            <div ref={end} />
          </div>
          <form onSubmit={e => { e.preventDefault(); void send(); }} className="border-t border-blue-100 bg-white px-5 py-5 sm:px-8">
            {error && <p role="alert" className="mb-3 rounded-xl bg-red-50 p-3 text-sm text-red-700">{error}</p>}
            <label htmlFor="legal-question" className="sr-only">Pregunta sobre el Código de Trabajo</label>
            <div className="flex items-end gap-3 rounded-2xl border border-blue-200 bg-blue-50/40 p-3 focus-within:ring-2 focus-within:ring-blue-500"><textarea id="legal-question" value={question} onChange={e => setQuestion(e.target.value)} disabled={busy} maxLength={500} rows={2} placeholder="Escribe tu consulta sobre el Código de Trabajo…" className="min-w-0 flex-1 resize-y bg-transparent px-2 py-1 text-sm leading-6 outline-none disabled:opacity-60" /><button type="submit" disabled={busy || question.trim().length < 3} aria-label="Enviar consulta" className="rounded-xl bg-blue-800 p-3 text-white transition hover:bg-blue-900 disabled:opacity-40"><ArrowUp size={20} /></button></div>
            <div className="mt-2 flex justify-end text-xs text-slate-400">{question.length}/500</div>
            <p className="mt-2 text-xs leading-6 text-slate-500">Cada consulta es independiente. El historial solo permanece mientras esta página esté abierta. Con IA activada, se envían tu pregunta y las fuentes a OpenAI. Usa casos ficticios, sin datos de clientes.</p>
          </form>
        </>}
      </section>
    </div>
  </main>;
}
