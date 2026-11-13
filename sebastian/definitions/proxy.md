---
def-type: atomic
version: 1.0
id: def-proxy
status: estandar
category: redes
contexto: servicios-de-red
date: 2026-11-11
tags:
  - redes
  - proxy
  - web
aliases:
  - proxy
  - proxy directo
  - servidor proxy
---
Un **proxy** actúa como **intermediario entre un cliente y otro servidor**: las solicitudes del cliente (por ejemplo, un navegador) se envían **a través del proxy antes de llegar al servidor de destino** — y de ese paso, el proxy puede **modificar, filtrar o registrar** las solicitudes y sus respuestas, según su configuración.

#### Qué Gana Cada Lado

-  **Para la organización que lo despliega**: control central — filtro de contenido (bloquear categorías), registro de uso (auditoría del tráfico web), caché (respuestas repetidas servidas una sola vez), y una única identidad de salida hacia internet.
-  **Para el cliente que lo usa**: anonimato parcial frente al destino (el servidor ve la IP del proxy), acceso a recursos restringidos por geografía, y en el caso ofensivo — herramientas como proxychains — una cadena de saltos que fragmenta el rastro.
-  **El precio**: un punto de inspección... y un punto de fallo y de confianza — todo el tráfico del cliente pasa por él, y debe ser un intermediario digno de confianza.

#### Cómo Funciona

-  El cliente envía su petición AL PROXY (no al destino): el proxy la evalúa contra sus reglas — permitir, bloquear, registrar, cachear.
-  Si procede, el proxy la reenvía al servidor REAL como si fuera suya; la respuesta vuelve al proxy y este la entrega al cliente.
-  El destino solo conoce al proxy; el cliente solo conoce al proxy — la asimetría es su negocio.

#### Diferencia Crítica: Proxy (directo) vs. Proxy Inverso

-  La dirección del servicio: el **proxy directo** trabaja para el CLIENTE — sale con su tráfico, filtra, anonimiza; el **proxy inverso** trabaja para el SERVIDOR — recibe el tráfico del mundo, protege y balancea la infraestructura interna.
-  El proxy directo oculta al cliente; el inverso oculta al servidor — dos caras del mismo intermediario, desplegadas en lados opuestos de la red.
-  Entre ellos, las herramientas de cadena (proxychains) encadenan proxies directos para fragmentar el rastro del cliente ofensivo.

### Propósito fundamental

El proxy es el intermediario que convierte el tráfico directo en tráfico administrado: para el despliegue corporativo es control, registro y caché; para el operador ofensivo es anonimato y salto — el patrón común es uno: nunca dejar que cliente y servidor hablen sin que un tercero con criterio esté en medio.
