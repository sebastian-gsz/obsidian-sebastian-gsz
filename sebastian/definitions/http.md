---
def-type: atomic
version: 1.0
id: def-http
status: estandar
category: protocolos-de-red
contexto: web
date: 2026-11-11
tags:
  - http
  - web
  - protocolos
  - redes
aliases:
  - hypertext transfer protocol
  - protocolo de transferencia de hipertexto
  - http
---
**HTTP** (_Hypertext Transfer Protocol_ — protocolo de transferencia de hipertexto) es el protocolo de la **capa de aplicación** mediante el cual se **piden y transfieren datos y recursos en la web**: es el idioma que un navegador habla con un servidor web para pedir una página, una imagen o una API, y el que el servidor usa para responderlas.

#### Cómo Funciona

-  **Modelo petición-respuesta**: el cliente envía una petición (método + ruta + cabeceras + cuerpo opcional) y el servidor devuelve una respuesta (código de estado + cabeceras + recurso).
-  **Métodos**: cada petición declara su intención — `GET` (obtener), `POST` (crear/enviar), `PUT` (reemplazar), `DELETE` (eliminar), entre otros.
-  **Códigos de estado**: la respuesta informa el resultado — `200` éxito, `301` redirección, `404` no encontrado, `500` error del servidor.
-  **Sin estado (_stateless_)**: cada petición es independiente — el protocolo no recuerda la anterior; la "sesión" la reconstruyen las cabeceras (cookies, tokens) por encima de HTTP.

#### Evolución

HTTP/1.1 dominó dos décadas (texto plano, una petición por conexión con reutilización); HTTP/2 añadió multiplexación binaria sobre TCP; HTTP/3 migró el transporte a QUIC sobre UDP para eliminar la latencia y el bloqueo de cabeza de línea. El modelo de petición-respuesta y los métodos se mantienen: cambia el transporte, no el idioma.

#### Diferencia Crítica: HTTP vs. HTTPS

-  HTTP **transmite todo en texto sin cifrar**: cualquier punto intermedio de la red puede leer las peticiones, las respuestas y — lo grave — las contraseñas.
-  **HTTPS** es HTTP ejecutado sobre TLS: mismo idioma, canal cifrado y servidor autenticado por certificado. Hoy es el estándar de facto; el HTTP plano sobrevive en entornos de laboratorio y como punto de partida que redirige a HTTPS.

### Propósito fundamental

HTTP es el contrato que hizo posible la web: un idioma simple y sin estado para pedir recursos y recibirlos, suficientemente genérico para servir documentos, APIs y streaming por igual — y cuya evolución de transporte (1.1 → 2 → 3) muestra cómo se optimiza un protocolo sin romper su contrato.
