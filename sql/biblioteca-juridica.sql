-- Biblioteca aislada del contenido educativo y de los usuarios.
-- El importador ejecuta este esquema y la carga en una sola transacción.
CREATE SCHEMA IF NOT EXISTS biblioteca_juridica;
CREATE TABLE IF NOT EXISTS biblioteca_juridica.versiones (
  id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  documento_id text NOT NULL,
  titulo text NOT NULL,
  pais text NOT NULL,
  contenido_sha256 text NOT NULL CHECK (contenido_sha256 ~ '^[a-f0-9]{64}$'),
  edicion text NOT NULL,
  estado_revision text NOT NULL DEFAULT 'pendiente' CHECK (estado_revision = 'pendiente'),
  habilitada_consultas boolean NOT NULL DEFAULT false CHECK (NOT habilitada_consultas),
  documento_original jsonb NOT NULL,
  fragmentacion_original jsonb NOT NULL,
  importada_en timestamptz NOT NULL DEFAULT now(),
  UNIQUE (documento_id, contenido_sha256)
);
CREATE TABLE IF NOT EXISTS biblioteca_juridica.articulos (
  version_id bigint NOT NULL REFERENCES biblioteca_juridica.versiones(id),
  numero text NOT NULL,
  texto_original text NOT NULL CHECK (length(texto_original) > 0),
  paginas_pdf integer[] NOT NULL CHECK (cardinality(paginas_pdf) > 0),
  PRIMARY KEY (version_id, numero)
);
CREATE TABLE IF NOT EXISTS biblioteca_juridica.fragmentos (
  version_id bigint NOT NULL,
  id text NOT NULL,
  articulo text NOT NULL,
  parte integer NOT NULL CHECK (parte > 0),
  total_partes integer NOT NULL CHECK (total_partes >= parte),
  texto text NOT NULL CHECK (length(texto) > 0),
  paginas_pdf integer[] NOT NULL CHECK (cardinality(paginas_pdf) > 0),
  encabezado_precedente jsonb NOT NULL,
  PRIMARY KEY (version_id, id),
  UNIQUE (version_id, articulo, parte),
  FOREIGN KEY (version_id, articulo) REFERENCES biblioteca_juridica.articulos(version_id, numero)
);
CREATE INDEX IF NOT EXISTS fragmentos_busqueda_idx ON biblioteca_juridica.fragmentos
USING gin (to_tsvector('spanish', texto));
