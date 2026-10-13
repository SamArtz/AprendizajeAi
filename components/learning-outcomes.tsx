import Link from 'next/link';
import { ArrowRight, MessageSquareText, Workflow, Layers3, ShieldCheck } from 'lucide-react';

const outcomes = [
  {
    icon: MessageSquareText,
    title: 'Prompting con criterio',
    text: 'Estructura instrucciones claras con roles, contexto y ejemplos. Reconoce los límites de los modelos y verifica sus respuestas antes de utilizarlas.',
    label: 'FUNDAMENTOS',
  },
  {
    icon: Workflow,
    title: 'Automatización práctica',
    text: 'Aplica IA a correos, actas de reuniones, resúmenes y análisis de datos. Crea plantillas reutilizables y revisa los resultados con criterios de calidad.',
    label: 'APLICACIÓN',
  },
  {
    icon: Layers3,
    title: 'Arquitectura de IA',
    text: 'Comprende RAG, embeddings, bases vectoriales y agentes. Aprende a comparar enfoques e integrar modelos con APIs y sistemas de software.',
    label: 'INTEGRACIÓN',
  },
  {
    icon: ShieldCheck,
    title: 'Seguridad y gobernanza',
    text: 'Identifica riesgos de privacidad y prompt injection. Estudia permisos, retención de datos y controles para un uso responsable en entornos empresariales.',
    label: 'CONTROL',
  },
];

export default function LearningOutcomes() {
  return (
    <section aria-labelledby="outcomes-title" className="border-t border-blue-100 bg-blue-50/80">
      <div className="mx-auto max-w-7xl px-6 py-16 sm:py-24">
        <div className="mx-auto max-w-2xl text-center">
          <p className="text-xs font-semibold tracking-widest text-blue-700">CONOCIMIENTO QUE PUEDES APLICAR</p>
          <h2 id="outcomes-title" className="mt-4 text-3xl font-semibold leading-tight tracking-tight text-slate-950 sm:text-4xl">¿Qué aprenderás con Adaptia?</h2>
          <p className="mt-5 text-base leading-7 text-slate-500">De tus primeras instrucciones a la integración responsable de IA. Cada ruta conecta conceptos, práctica y evaluación.</p>
        </div>
        <div className="mt-12 grid gap-5 sm:grid-cols-2 xl:grid-cols-4">
          {outcomes.map(({ icon: Icon, title, text, label }) => (
            <article key={title} className="flex flex-col items-center rounded-2xl border border-blue-100 bg-white px-6 py-8 text-center shadow-sm transition-[border-color,box-shadow] duration-200 hover:border-blue-200 hover:shadow-md motion-reduce:transition-none">
              <span className="inline-flex h-16 w-16 items-center justify-center rounded-2xl bg-blue-600 text-white"><Icon size={27} strokeWidth={1.7} aria-hidden="true"/></span>
              <p className="mt-6 text-[10px] font-semibold tracking-[0.15em] text-blue-700">{label}</p>
              <h3 className="mt-3 text-lg font-semibold text-slate-900">{title}</h3>
              <p className="mt-4 text-sm leading-7 text-slate-600">{text}</p>
            </article>
          ))}
        </div>
        <div className="mt-10 flex justify-center">
          <Link href="/dashboard" className="inline-flex items-center gap-3 rounded-lg bg-blue-950 px-6 py-3.5 text-sm font-semibold text-white hover:bg-blue-900">Explorar las rutas de aprendizaje<ArrowRight size={17} aria-hidden="true"/></Link>
        </div>
      </div>
    </section>
  );
}
