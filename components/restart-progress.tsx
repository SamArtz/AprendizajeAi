'use client';
import { useState } from 'react';
import { RotateCcw } from 'lucide-react';
export default function RestartProgress() {
  const [error, setError] = useState(false);
  function restart() {
    if (!window.confirm('Se borrarán tu nivel y las lecciones completadas de este navegador. ¿Empezar desde cero?')) return;
    try {
      localStorage.removeItem('userLevel');
      localStorage.removeItem('completedBranches');
      window.location.assign('/evaluacion');
    } catch { setError(true); }
  }
  return <div><button onClick={restart} className="inline-flex items-center gap-2 rounded-lg border border-slate-200 bg-white px-4 py-2.5 text-sm font-medium text-slate-600 hover:bg-slate-50"><RotateCcw size={16}/>Empezar desde cero</button>{error && <p role="alert" className="mt-2 text-sm text-amber-700">Habilita el almacenamiento del navegador para reiniciar tu progreso.</p>}</div>;
}
