import { redirect } from 'next/navigation';
import { getCurrentUser } from '../../lib/auth';
export default async function EvaluationLayout({children}:{children:React.ReactNode}){if(!await getCurrentUser())redirect('/login?next=/evaluacion');return children;}
