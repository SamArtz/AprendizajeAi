// Host es la dirección a la que el navegador envía la petición; puede ser
// localhost, una IP de red o el dominio público, aunque Next use otra URL interna.
// No se confía en X-Forwarded-Host enviado libremente por clientes.
export function checkOrigin(request: Request, configuredUrl = process.env.APP_URL): boolean {
  try {
    const value = request.headers.get('origin');
    if (!value || value === 'null') return false;
    const origin = new URL(value);
    if (!['http:', 'https:'].includes(origin.protocol) || value !== origin.origin) return false;

    if (configuredUrl?.trim()) {
      const canonical = new URL(configuredUrl.trim());
      if (!['http:', 'https:'].includes(canonical.protocol) || canonical.username || canonical.password) return false;
      return origin.origin === canonical.origin;
    }

    const target = new URL(request.url);
    const host = request.headers.get('host');
    if (host) {
      const address = new URL(`${target.protocol}//${host}`);
      if (address.host !== host.toLowerCase() || address.pathname !== '/' || address.username || address.password) return false;
      return origin.origin === address.origin;
    }
    return origin.origin === target.origin;
  } catch { return false; }
}
