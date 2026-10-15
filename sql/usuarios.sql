-- Ejecutar completo en adaptia. No modifica ramas, preguntas ni opciones.
BEGIN;
CREATE TABLE IF NOT EXISTS public.usuarios (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  email VARCHAR(254) NOT NULL UNIQUE CHECK (email = lower(btrim(email))),
  password_hash TEXT NOT NULL,
  creado_en TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE TABLE IF NOT EXISTS public.sesiones (
  token_hash TEXT PRIMARY KEY,
  usuario_id INTEGER NOT NULL REFERENCES public.usuarios(id) ON DELETE CASCADE,
  expira_en TIMESTAMPTZ NOT NULL,
  creado_en TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS sesiones_usuario_idx ON public.sesiones(usuario_id);
CREATE INDEX IF NOT EXISTS sesiones_expira_idx ON public.sesiones(expira_en);
CREATE TABLE IF NOT EXISTS public.auth_limites (
  clave TEXT PRIMARY KEY,
  intentos INTEGER NOT NULL,
  reinicia_en TIMESTAMPTZ NOT NULL
);
COMMIT;
