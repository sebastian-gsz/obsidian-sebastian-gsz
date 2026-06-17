---
def-type: atomic
aliases:
  - patrones de acceso a los datos
  - data access patterns
  - query patterns
tags:
  - arquitectura
  - diseño-de-sistemas
  - optimización
  - bases-de-datos
category: conceptos-de-diseño
contexto: arquitectura-de-datos
version: 1
date: 2026-06-16
status: estandar
---
Es el análisis y definición de cómo, cuándo y con qué frecuencia una aplicación interactúa con sus datos. Determinar el patrón de acceso es el paso previo y más crítico antes de seleccionar el motor de base de datos o definir el modelo de datos.

*  **Faceta de análisis**: Define la naturaleza de la interacción:
  
    * **Operaciones CRUD**: (Create, Read, Update, Delete) y su proporción.
    * **Acceso secuencial vs. aleatorio**: ¿Necesitamos leer datos en orden (logs/series temporales) o acceder a registros individuales por clave (catálogos)?
    * **Concurrencia**: ¿Cuántos procesos intentan acceder o modificar el mismo dato simultáneamente?
*  **Faceta de diseño**: Dicta la estrategia de infraestructura necesaria:
  
    * **Patrones Read-Heavy**: Requieren caché, replicación y CDN.
    * **Patrones Write-Heavy**: Requieren colas de mensajes (buffering), sharding y estrategias de *append-only*.
*  **Propósito**: Garantizar que el modelo de datos y la tecnología seleccionada (SQL vs NoSQL, caché, almacenamiento en disco) estén alineados con las necesidades reales de la aplicación, evitando cuellos de botella y optimizando el costo operativo.
*  **Impacto en el escalado**: Si un patrón de acceso cambia con el tiempo (ej. una app que empieza siendo read-intensive y se vuelve write-intensive), la arquitectura debe ser lo suficientemente flexible para evolucionar o refactorizarse.