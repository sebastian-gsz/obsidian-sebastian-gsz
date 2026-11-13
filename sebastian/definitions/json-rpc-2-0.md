---
def-type: atomic
version: 1.0
id: def-json-rpc-2-0
status: estandar
category: desarrollo-software
contexto: protocolos-de-comunicacion
date: 2026-10-04
tags:
  - json-rpc
  - rpc
  - protocolos
  - api
  - desarrollo
aliases:
  - json-rpc 2.0
  - json rpc
  - json-rpc
---
JSON-RPC 2.0 es un protocolo ligero y sin estado de llamada a procedimientos remotos (RPC) que utiliza JSON como formato de codificación de datos. Su diseño minimalista permite a las aplicaciones invocar métodos en otro sistema, servidor o proceso de forma transparente, independientemente de la plataforma o el lenguaje de programación utilizado.

### Estructura de mensajes

-  **Solicitud (Request):** Objeto enviado para invocar un método, estructurado con los campos `jsonrpc` (establecido en "2.0"), `method` (nombre del procedimiento a ejecutar), `params` (parámetros o argumentos) e `id` (identificador único de la petición).
-  **Respuesta (Response):** Objeto devuelto por el receptor tras procesar una solicitud, que incluye el resultado de la ejecución (`result`) o un objeto descriptivo en caso de fallo (`error`), manteniendo el mismo `id` de la solicitud original.
-  **Notificación (Notification):** Una variante de solicitud que carece del campo `id`, indicando al receptor que se trata de un mensaje unidireccional y que no se debe generar ninguna respuesta.

### Características clave

-  **Independencia de transporte:** Al estar desacoplado de la capa de transporte, puede operar sobre múltiples canales de comunicación, tales como HTTP/HTTPS, WebSockets, sockets TCP o flujos estándar de entrada/salida (`stdin`/`stdout`).
-  **Simplicidad operativa:** Su especificación compacta facilita la implementación rápida de pasarelas de comunicación cliente-servidor y arquitecturas de microservicios o herramientas de desarrollo.

### Propósito fundamental

Proporcionar un estándar abierto, ligero y agnóstico de plataforma para la comunicación estructurada y bidireccional entre sistemas remotos o procesos concurrentes, siendo la base de protocolos avanzados como el Language Server Protocol (LSP) y el Agent Client Protocol (ACP).