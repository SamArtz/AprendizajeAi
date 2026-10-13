import Link from 'next/link';
import { ArrowRight, Code2, Layers3, Route, ShieldCheck } from 'lucide-react';

const principles = [
  {
    title: 'Nuestro Enfoque',
    icon: Code2,
    number: '01',
    text: 'Entendemos que la tecnología debe resolver problemas de negocio tangibles. Por ello, nuestro contenido se centra en la aplicación técnica directa: desde la gestión de bases de datos vectoriales y orquestación de modelos, hasta la mitigación de vulnerabilidades y seguridad en entornos de producción.',
  },
  {
    title: 'Nuestra Metodología',
    icon: Route,
    number: '02',
    text: 'Creemos en el aprendizaje estructurado. A través de nuestras rutas progresivas, transformamos la complejidad algorítmica de los Modelos de Lenguaje Extensos en lecciones prácticas, guiando al estudiante desde los conceptos básicos de prompting hasta el despliegue seguro de agentes autónomos en producción.',
  },
];

export default function AboutAdaptia() {
  return (
    <section id="nosotros" aria-labelledby="about-title" className="scroll-mt-44 sm:scroll-mt-28 border-y border-slate-200 bg-white">
      <div className="mx-auto max-w-7xl px-6 py-16 sm:py-24">
        <div className="grid items-start gap-12 lg:grid-cols-[1fr_1.25fr] lg:gap-20">
          <div>
            <p className="flex items-center gap-2 text-xs font-semibold tracking-widest text-blue-700"><Layers3 size={16} aria-hidden="true"/> CONOCE ADAPTIA</p>
            <h2 id="about-title" className="mt-5 text-3xl font-semibold tracking-tight text-slate-950 sm:text-4xl">Quiénes Somos</h2>
            <p className="mt-5 text-xl font-medium leading-8 text-blue-950">Del conocimiento técnico a aplicaciones reales.</p>
            <p className="mt-6 text-base leading-8 text-slate-600">Somos una plataforma educativa especializada en la arquitectura y control de Inteligencia Artificial. Nuestro objetivo es brindar un entorno técnico estructurado donde los desarrolladores y profesionales puedan aprender a integrar modelos generativos en aplicaciones de software reales, dejando de lado la teoría superficial.</p>
            <div className="mt-8 flex flex-wrap gap-3">
              <span className="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-3 py-2 text-xs font-medium text-slate-600"><Code2 size={14} aria-hidden="true"/>Aplicación técnica</span>
              <span className="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-slate-50 px-3 py-2 text-xs font-medium text-slate-600"><ShieldCheck size={14} aria-hidden="true"/>Seguridad en producción</span>
            </div>
          </div>
          <div className="space-y-5">
            {principles.map(({ title, icon: Icon, number, text }) => (
              <article key={title} className="rounded-2xl border border-slate-200 bg-slate-50/70 p-6 sm:p-8">
                <div className="flex items-center justify-between gap-4">
                  <span className="inline-flex rounded-xl border border-blue-100 bg-white p-3 text-blue-700"><Icon size={23} aria-hidden="true"/></span>
                  <span className="text-xs font-medium tracking-widest text-slate-400">{number}</span>
                </div>
                <h3 className="mt-5 text-xl font-semibold text-slate-900">{title}</h3>
                <p className="mt-4 text-sm leading-7 text-slate-600">{text}</p>
              </article>
            ))}
          </div>
        </div>
        <div className="mt-12 flex flex-wrap items-center justify-between gap-6 rounded-2xl bg-blue-950 px-6 py-7 text-white sm:px-8">
          <div><p className="text-xs font-medium tracking-widest text-blue-300">UNA RUTA, PASO A PASO</p><p className="mt-2 text-lg font-medium">Fundamentos → Aplicación → Arquitectura y seguridad</p></div>
          <Link href="/dashboard" className="inline-flex items-center gap-3 rounded-lg bg-white px-5 py-3 text-sm font-semibold text-blue-950 hover:bg-blue-50">Explorar las rutas<ArrowRight size={17} aria-hidden="true"/></Link>
        </div>
      </div>
    </section>
  );
}
