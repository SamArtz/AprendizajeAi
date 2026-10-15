export interface PublicUser { id: number; nombre: string; email: string }
export function progressKey(userId: number, key: 'userLevel' | 'completedBranches') {
  return `adaptia:user:${userId}:${key}`;
}
