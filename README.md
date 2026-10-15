# Copia a .env y completa los datos reales. No subas .env a GitHub.
PGHOST=localhost
PGPORT=5432
PGDATABASE=adaptia
PGUSER=
PGPASSWORD=
# Alternativamente configura DATABASE_URL (tiene prioridad).
# DATABASE_URL=postgresql://usuario:password@localhost:5432/base

# Opcional: URL EXACTA que usas en el navegador (origen sin /register).
# En desarrollo puedes omitir APP_URL; se valida el Host de la petición.
# No descomentes el ejemplo sin sustituirlo por tu URL real.
# APP_URL=https://tu-dominio.com
# En producción la aplicación requiere HTTPS para la cookie de sesión.

Si registro/login devuelve 403 Origen no permitido: APP_URL, si está definida, debe coincidir exactamente con el origen del navegador (protocolo, dominio o IP y puerto, sin /register). En local puede omitirse y se comprobará Host, incluso si Next.js usa 0.0.0.0 internamente. Reinicia el servidor al cambiar .env. Nunca uses comodines ni desactives checkOrigin. No se aceptan X-Forwarded-Host arbitrarios; configura APP_URL para proxies que reescriben Host.
