---
def-type: atomic
aliases:
  - redis
  - key-value-store
  - in-memory-data-structure-store
  - Remote Dictionary Server
tags:
  - redis
  - cache
  - in-memory
  - performance
category: tecnologías-de-almacenamiento
contexto: caché-y-rendimiento
version: 1
date: 2026-06-17
status: estandar
---
Sistema de almacenamiento de estructuras de datos en memoria, utilizado como base de datos, caché y bróker de mensajes.

* **Faceta de estándar**: Su protocolo de comunicación (RESP) se ha convertido en un estándar de la industria. Muchos servicios de caché alternativos ofrecen "compatibilidad con Redis" para facilitar la migración y adopción.
* **Faceta de alto rendimiento**: Al operar en RAM, ofrece latencias de sub-milisegundos, siendo la tecnología de elección para *read-intensive* y *write-heavy* donde la velocidad es crítica.
* **Versatilidad**: A diferencia de otros sistemas clave-valor básicos, soporta estructuras complejas (listas, sets, sorted sets, bitfields), permitiendo resolver problemas algorítmicos dentro de la memoria (ej. rankings en tiempo real).
* **Propósito**: Eliminar el cuello de botella del disco en arquitecturas de alto rendimiento, sirviendo como capa de aceleración para bases de datos transaccionales (OLTP).