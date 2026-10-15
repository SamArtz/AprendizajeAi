import { redirect } from 'next/navigation';
import { getCurrentUser } from '../../lib/auth';
import AuthForm from '../../components/auth-form';
export default async function Login(){if(await getCurrentUser())redirect('/dashboard');return <AuthForm mode="login"/>;}
