---
def-type: atomic
version: 1.0
id: def-uri
status: estandar
category: desarrollo-software
contexto: web
date: 2026-11-12
tags:
  - web
  - uri
  - protocolos
aliases:
  - uri
  - identificador de recursos uniformes
  - uniform resource identifier
---
Una **URI** (_Uniform Resource Identifier_ — identificador de recursos uniformes) es una **dirección que te dice dónde encontrar algo**: el identificador estándar de cualquier recurso en la web — y su tipo más común es la **URL**, que además de identificar el recurso **te dice cómo acceder a él** (por ejemplo, usando el protocolo HTTP).

#### La Jerarquía URI → URL → URN

-  **URI** es el concepto paraguas: CUALQUIER cadena que identifica un recurso.
-  **URL** (_Uniform Resource Locator_) es el subtipo más famoso: identifica Y LOCALIZA — incluye el esquema de acceso: `https://miempresa.com/documentos/informe.pdf` dice el protocolo (https), el host y la ruta.
-  **URN** (_Uniform Resource Name_): identifica por NOMBRE persistente, sin decir dónde ni cómo — `urn:isbn:978-84-...` — el identificador que no depende de la ubicación.

#### Anatomía de una URL (el caso dominante)

`https://miempresa.com:443/documentos/informe.pdf?pagina=2#resumen`

-  **Esquema**: `https` — el protocolo de acceso.
-  **Host**: `miempresa.com` (con puerto opcional `:443`).
-  **Ruta**: `/documentos/informe.pdf` — el recurso dentro del servidor.
-  **Query**: `?pagina=2` — parámetros para el servidor.
-  **Fragmento**: `#resumen` — ancla dentro del recurso (no viaja al servidor).

#### Diferencia Crítica: URI vs. URL

-  En la práctica diaria se usan como sinónimos — y casi todo lo que ves es una URL.
-  La distinción formal: toda URL es una URI, pero no toda URI es URL — la URN identifica sin localizar. La regla práctica: si la cadena dice CÓMO llegar (protocolo + host), es URL; si solo nombra, es URN; ambas son URI.

### Propósito fundamental

La URI es el sistema de direccionamiento de la web: cada recurso — página, imagen, API, documento — identificado por una cadena estándar que el mundo entero sabe leer — y su forma más común, la URL, es la dirección que convierte "quiero eso" en una petición que cualquier navegador de cualquier lugar puede ejecutar.
