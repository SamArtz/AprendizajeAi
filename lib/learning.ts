import type { Level } from './evaluation';
import { isQuestionnaire, type DatabaseQuestion } from './questionnaire';
export interface Branch {
  id: string;
  title: string;
  description: string;
  contenido_teorico: string;
  preguntas: DatabaseQuestion[];
  modulo: string;
  orden: number;
}
export interface LearningModule {
  level: Level;
  title: string;
  description: string;
  branches: Branch[];
}
export function moduleLevel(value: string): Level | null {
  const normalized = value.normalize('NFD').replace(/[\u0300-\u036f]/g, '').trim().toLowerCase().replace(/^modulo\s+/, '');
  return normalized === 'basico' ? 'Básico' : normalized === 'intermedio' ? 'Intermedio' : normalized === 'avanzado' ? 'Avanzado' : null;
}
export function isBranchList(value: unknown): value is Branch[] {
  if (!Array.isArray(value)) return false;
  const ids = new Set<string>();
  return value.every(branch => {
    if (!branch || typeof branch.id !== 'string' || !branch.id || ids.has(branch.id) || typeof branch.title !== 'string' || !branch.title.trim() || typeof branch.description !== 'string' || typeof branch.modulo !== 'string' || !moduleLevel(branch.modulo) || typeof branch.contenido_teorico !== 'string' || !branch.contenido_teorico.trim() || !Number.isFinite(branch.orden) || !isQuestionnaire(branch.preguntas) || branch.preguntas.length !== 15) return false;
    ids.add(branch.id);
    return true;
  });
}
export function groupModules(branches: Branch[]): LearningModule[] {
  return (['Básico', 'Intermedio', 'Avanzado'] as Level[]).map(level => ({
    level, title: `Ruta ${level}`, description: 'Contenido y preguntas cargados desde PostgreSQL.',
    branches: branches.filter(branch => moduleLevel(branch.modulo) === level).sort((a, b) => a.orden - b.orden || a.id.localeCompare(b.id, 'es', { numeric: true })),
  })).filter(module => module.branches.length > 0);
}
export function parseCompletedBranches(raw: string | null, modules: readonly LearningModule[]): string[] {
  if (!raw) return [];
  try {
    const saved: unknown = JSON.parse(raw);
    if (!Array.isArray(saved)) return [];
    return modules.flatMap(module => {
      const completed: string[] = [];
      for (const branch of module.branches) {
        if (!saved.includes(branch.id)) break;
        completed.push(branch.id);
      }
      return completed;
    });
  } catch { return []; }
}
