---
def-type: atomic
aliases:
  - Bases de datos especializadas
  - Purpose-built databases
  - Purpose Built
  - Purpose-Built
tags:
  - arquitectura
  - optimización
  - rendimiento
  - nosql
category: modelo_datos
contexto: arquitectura de sistemas
version: 1
date: 2026-06-15
status: estandar
---
Las bases de datos "Purpose-Built" (diseñadas para un propósito específico) rompen con el modelo de "una sola herramienta para todo". Estas bases de datos sacrifican la versatilidad de una solución generalista (como PostgreSQL o SQL Server) para ofrecer rendimiento, escalabilidad o funcionalidad inigualable en un tipo de carga de trabajo concreta.

**Categorías y ejemplos clave**

* **Grafos (Graph)**: Optimizadas para navegar conexiones complejas entre entidades "``Neo4j``, ``AWS Neptune``"
* **Series temporales (Time-Series)**: Diseñadas para ingesta masiva y consulta de datos con marca de tiempo (logs, sensores IoT, métricas) "``InfluxDB``, ``TimescaleDB``, ``AWS Timestream``"
* **Clave-Valor (Key-Value)**: Optimizadas para lecturas y escrituras de latencia ultrabaja "``Redis``, ``Memcached``, ``AWS DynamoDB``"
* **Búsqueda (Search/Analytics)**: Indexación masiva de texto completo y análisis estadístico de grandes volúmenes "``Elasticsearch``, ``OpenSearch``, ``Solr``" 
* **Libro Mayor (Ledger)**: Historial inmutable, transparente y verificable criptográficamente "``immudb``"

**Por qué elegir Purpose-Built**

* **Eficiencia extrema**: Los algoritmos de almacenamiento y búsqueda están optimizados para el problema específico, superando a cualquier sistema generalista en ese nicho.
* **Simplicidad de modelo**: El modelo de datos es más intuitivo para el problema (ej: representar una red social como un grafo es nativo, hacerlo en SQL requiere múltiples JOINs costosos).
* **Escalabilidad**: Su arquitectura suele permitir escalar horizontalmente de manera mucho más eficiente para ese caso de uso particular.

**El riesgo (La "Proliferación de bases de datos")**

El costo de usar sistemas especializados es la complejidad operativa. Si utilizas una base de datos diferente para cada tarea, terminas con una arquitectura "polyglot persistence" que es difícil de mantener, con silos de datos, múltiples configuraciones, estrategias de backups y requisitos de seguridad independientes que gestionar.