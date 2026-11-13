---
def-type: atomic
version: 1
id: def-metodos-http
status: estandar
category: desarrollo-web
date: 2026-08-17
tags:
  - http
  - rest
  - api
  - web
aliases:
  - métodos http
  - http methods
  - verbos http
  - get
  - push
  - patch
  - put
  - delete
  - post
---
Los métodos HTTP (también conocidos como verbos HTTP) indican la acción que se desea realizar sobre un recurso específico dentro de una arquitectura de API RESTful.
### Principales métodos

-  **GET**: Solicita la recuperación de la representación de un recurso específico. Las peticiones que utilizan este método solo deben extraer datos y carecen de efectos secundarios sobre el servidor (es una operación segura e idempotente).
-  **POST**: Envía datos para procesar hacia un recurso determinado, provocando habitualmente la creación de un nuevo recurso o cambios en el estado del servidor (no es idempotente).
-  **PUT**: Reemplaza de forma íntegra todas las representaciones actuales del recurso de destino con la información proporcionada en la petición (es idempotente).
-  **PATCH**: Aplica modificaciones o actualizaciones parciales sobre un recurso específico sin necesidad de reemplazarlo por completo.
-  **DELETE**: Elimina de forma permanente el recurso especificado en la URI de la petición (es idempotente).
### Características clave

-  **Idempotencia**: Propiedad por la cual realizar varias peticiones idénticas produce el mismo resultado final en el servidor que realizar una sola (aplicable a GET, PUT, PATCH y DELETE, mas no a POST).
-  **Seguridad**: Característica de los métodos de solo lectura (como GET) que garantizan que no se alterará el estado del recurso en el servidor.