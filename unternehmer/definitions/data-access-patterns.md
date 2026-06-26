---
def-type: atomic
version: 1.0
id: def-data-access-patterns
status: estandar
category: conceptos-de-diseño
contexto: arquitectura-de-datos
date: 2026-06-16
tags:
  - arquitectura
  - diseño-de-sistemas
  - optimización
  - bases-de-datos
aliases:
  - patrones de acceso a los datos
  - data access patterns
  - query patterns
---
Los patrones de acceso a los datos representan el análisis y la definición de cómo, cuándo y con qué frecuencia una aplicación interactúa con sus recursos de información. Este proceso es el paso previo y más crítico antes de seleccionar el motor de base de datos o definir el esquema lógico de los datos.

El diseño se divide en dos facetas principales:

-  **Faceta de análisis:** Define la naturaleza técnica de la interacción, incluyendo la proporción de operaciones CRUD (Create, Read, Update, Delete). Evalúa si el acceso es secuencial, como en logs o series temporales, o aleatorio, típico en catálogos mediante claves únicas. Considera además los niveles de concurrencia para determinar cuántos procesos intentan modificar el mismo dato simultáneamente.
-  **Faceta de diseño:** Determina la infraestructura necesaria según el comportamiento detectado. Los patrones _Read-Heavy_ exigen el uso de caché, replicación y CDN, mientras que los _Write-Heavy_ requieren estrategias como colas de mensajes (_buffering_), _sharding_ y estructuras _append-only_.
-  **Propósito estratégico:** Garantiza que el modelo de datos y la tecnología elegida (SQL vs NoSQL, almacenamiento en disco o memoria) estén alineados con las necesidades reales de la aplicación. Esto previene cuellos de botella críticos y optimiza el costo operativo total.
-  **Impacto en el escalado:** Si los patrones de acceso evolucionan con el tiempo, por ejemplo, pasando de una carga intensiva en lectura a una en escritura, la arquitectura debe poseer la flexibilidad necesaria para permitir su refactorización.