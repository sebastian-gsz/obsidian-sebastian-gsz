---
def-type: atomic
version: 1.0
id: def-elasticsearch
status: estandar
category: ciberseguridad
contexto: monitoreo-y-observabilidad
date: 2026-11-11
tags:
  - elastic-stack
  - buscador
  - logs
  - ciberseguridad
aliases:
  - elastic search
  - motor de búsqueda elástico
  - búsqueda elástica
---
**Elasticsearch** es un motor de búsqueda y análisis distribuido de código abierto, construido sobre _Apache Lucene_, capaz de ingerir, indexar y consultar enormes volúmenes de datos (registros, documentos, métricas) en tiempo casi real mediante una API REST con JSON. Es el corazón del _Elastic Stack_: todo lo que los Beats recolectan y Logstash procesa termina almacenado y consultable aquí.

#### Mecánica Técnica

-  **Índice invertido**: en lugar de buscar dentro de cada documento uno por uno (como una base de datos relacional escaneando filas), Lucene construye un mapa "término → documentos que lo contienen". Buscar se convierte en mirar una lista, no en recorrer el archivo completo.
-  **Distribución por _shards_**: un índice se divide en fragmentos replicados repartidos entre nodos del clúster. La búsqueda escala horizontalmente: más nodos, más consultas por segundo y más almacenamiento sin cambiar la arquitectura.
-  **_Near real-time_**: un documento es buscable aproximadamente un segundo después de ser indexado, lo que lo hace apto para monitoreo de logs en vivo.

#### Diferencia Crítica: Elasticsearch vs. base de datos relacional

-  **SQL (PostgreSQL, MySQL)**: modelo rígido de tablas y esquemas, optimizado para transacciones exactas (ACID). Pregunta: "¿cuál es el registro con este id?".
-  **Elasticsearch**: esquema flexible (JSON), optimizado para búsquedas difusas, agregaciones y texto completo. Pregunta: "¿qué documentos se parecen a esto y qué patrones muestran?".

#### Uso en Ciberseguridad

En un _SIEM_ es el almacén central: firewalls, antivirus, proxies y sistemas operativos envían sus logs hacia Elasticsearch, donde un analista busca con Kibana (dashboard) o ElastAlert (alertado) señales de compromiso como escaneos de puertos, intentos de login fallidos masivos o exfiltración de datos.

### Propósito fundamental

Elasticsearch convierte datos masivos y desordenados en información buscable en milisegundos: su índice invertido y su arquitectura distribuida permiten a un analista interrogar millones de eventos en segundos, que es la diferencia entre detectar un ataque y descubrirlo meses después en un archivo.
