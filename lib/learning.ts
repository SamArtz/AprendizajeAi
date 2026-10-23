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
// Orden pedagógico independiente de los IDs: las preguntas siguen unidas a su rama.
const basicIntroduction = [
  'Anatomía y Estructura del Prompt',
  'Privacidad y Reglas de Seguridad Básicas',
  'Buscadores Tradicionales vs. IA Generativa',
  'Fundamentos de Modelos Generativos (LLMs)',
];
const normalizeTitle = (value: string) => value.normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase().replace(/[^a-z0-9]+/g, ' ').trim();
const introductionPriority = new Map(basicIntroduction.map((title, index) => [normalizeTitle(title), index]));
function databaseOrder(a: Branch, b: Branch) {
  return a.orden - b.orden || a.id.localeCompare(b.id, 'es', { numeric: true });
}
export function groupModules(branches: Branch[]): LearningModule[] {
  return (['Básico', 'Intermedio', 'Avanzado'] as Level[]).map(level => ({
    level, title: `Ruta ${level}`, description: 'Contenido y preguntas cargados desde PostgreSQL.',
    branches: branches.filter(branch => moduleLevel(branch.modulo) === level).sort((a, b) => {
      if (level === 'Básico') {
        const priority = (introductionPriority.get(normalizeTitle(a.title)) ?? basicIntroduction.length) - (introductionPriority.get(normalizeTitle(b.title)) ?? basicIntroduction.length);
        if (priority) return priority;
      }
      return databaseOrder(a, b);
    }),
  })).filter(module => module.branches.length > 0);
}
export function canStartBranch(branches: readonly Branch[], index: number, completed: readonly string[]): boolean {
  return index >= 0 && index < branches.length && branches.slice(0, index).every(branch => completed.includes(branch.id));
}
export function parseCompletedBranches(raw: string | null, modules: readonly LearningModule[]): string[] {
  if (!raw) return [];
  try {
    const saved: unknown = JSON.parse(raw);
    if (!Array.isArray(saved)) return [];
    return modules.flatMap(module => {
      const accepted = new Set<string>();
      // Conserva aprobaciones de la secuencia anterior y de la nueva.
      // El acceso exige todos los prerrequisitos del orden actual.
      for (const sequence of [module.branches, [...module.branches].sort(databaseOrder)]) {
        for (const branch of sequence) {
          if (!saved.includes(branch.id)) break;
          accepted.add(branch.id);
        }
      }
      return module.branches.filter(branch => accepted.has(branch.id)).map(branch => branch.id);
    });
  } catch { return []; }
}
