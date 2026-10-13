export interface QuizResult { score: number; maxScore: number }
export const PASS_PERCENT = 80;
export function hasPassed({ score, maxScore }: QuizResult): boolean {
  return Number.isFinite(score) && Number.isFinite(maxScore) && maxScore > 0 && score >= 0 && score <= maxScore && score * 100 >= maxScore * PASS_PERCENT;
}
