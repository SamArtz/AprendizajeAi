import { redirect } from 'next/navigation';
import { getCurrentUser } from '../../lib/auth';
import { canUseLegalChat } from '../../lib/legal-chat';
import LegalChat from '../../components/legal-chat';
export default async function LegalChatPage() {
  const user = await getCurrentUser();
  if (!user) redirect('/login?next=/chat-juridico');
  return <LegalChat allowed={canUseLegalChat(user.email)} />;
}
