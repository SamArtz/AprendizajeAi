# Biblioteca jurídica de prueba

Este primer importador admite únicamente el Código de Trabajo del compendio CNJ
2025 previamente separado y fragmentado. No certifica vigencia ni alimenta un
chat. El estado pendiente y la deshabilitación para consultas se imponen también
en PostgreSQL; su habilitación futura requiere una migración deliberada.

Desde la raíz del proyecto, conserva estos dos archivos locales:

- `datos-juridicos/leyes/codigo-trabajo.json`
- `datos-juridicos/fragmentos/codigo-trabajo.json`

Usa las mismas credenciales `.env` de Adaptia (`DATABASE_URL` o `PGHOST`,
`PGPORT`, `PGDATABASE`, `PGUSER`, `PGPASSWORD`). No subas credenciales a GitHub.
No se requiere instalar Python adicionalmente para la importación: usa Node y
las dependencias existentes del proyecto. Si faltan, ejecuta `npm ci`.

Primero valida sin conectarte a PostgreSQL:

```powershell
npm run db:juridica -- --validar
```

Después carga:

```powershell
npm run db:juridica
```

El script ejecuta automáticamente `sql/biblioteca-juridica.sql`; no es necesario
pegar SQL en DBeaver. Crea el esquema `biblioteca_juridica` y conserva el JSON
original completo, las notas y fuentes, los artículos y los fragmentos. No
modifica usuarios ni lecciones. Repetir los mismos archivos no duplica la versión;
si el contenido cambia, conserva una versión nueva sin borrar la anterior.
Cualquier fallo durante la transacción revierte esa carga completa.

Comprueba los resultados en DBeaver:

```sql
SELECT v.id, v.titulo, v.edicion, v.estado_revision, v.habilitada_consultas,
       (SELECT count(*) FROM biblioteca_juridica.articulos a
        WHERE a.version_id = v.id) AS articulos,
       (SELECT count(*) FROM biblioteca_juridica.fragmentos f
        WHERE f.version_id = v.id) AS fragmentos
FROM biblioteca_juridica.versiones v
ORDER BY v.id;
```

Para los archivos iniciales revisados: 641 artículos, 699 fragmentos,
`estado_revision = 'pendiente'`, `habilitada_consultas = false`.

Verificado en una base temporal PGlite: carga completa, repetición sin duplicados,
rollback tras fallo intermedio y conservación de tablas ajenas. Esto no prueba
la conectividad ni los permisos de tu instancia PostgreSQL: la primera carga
local los comprueba. Pendientes: cotejo visual de tablas, verificación de reformas,
URL oficial de procedencia y evaluación jurídica. Esta etapa no requiere clave
API, embeddings ni `pgvector`.
