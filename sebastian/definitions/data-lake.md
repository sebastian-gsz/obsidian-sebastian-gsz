---
def-type: atomic
version: 1.0
id: def-data-lake
status: estandar
category: almacenamiento
contexto: arquitectura-de-datos
date: 2026-06-26
tags:
  - bigdata
  - almacenamiento
  - no-estructurado
  - datos
aliases:
  - data lake
  - lago de datos
---
Un data lake es un repositorio centralizado que permite almacenar grandes volúmenes de datos crudos (en su formato nativo) a escala. A diferencia de un almacén de datos (data warehouse) tradicional, no requiere que los datos estén estructurados o definidos previamente al momento de la ingesta, lo que permite capturar información de múltiples fuentes (estructuradas, semiestructuradas y no estructuradas) sin fricción inmediata.

#### Filosofía de almacenamiento

La esencia de un data lake es el paradigma _schema-on-read_. Los datos se almacenan tal cual se reciben; la estructura y el esquema se aplican únicamente en el momento en que se leen para realizar análisis, lo que brinda una agilidad operativa superior para científicos de datos y analistas que requieren acceso a los datos originales para modelos de aprendizaje automático o analítica avanzada.

#### Ventajas arquitectónicas

-  **Costo-efectividad:** Utilizan almacenamiento de objetos (como S3, GCS o Azure Blob Storage), que es significativamente más económico que el almacenamiento en bases de datos relacionales tradicionales.
-  **Escalabilidad horizontal:** Están diseñados para separar el almacenamiento del cómputo, permitiendo escalar la capacidad de almacenamiento de forma independiente y masiva.
-  **Flexibilidad:** Permiten el procesamiento de diversas tipologías de datos, desde logs de aplicaciones y telemetría de sensores (IoT) hasta documentos multimedia y flujos de redes sociales.

#### Desafíos operativos

La mayor debilidad es la posibilidad de convertirse en un _data swamp_ (pantano de datos) si no se implementa una estrategia robusta de gobernanza, catalogación y gestión de metadatos. Sin un catálogo centralizado que permita a los usuarios entender qué datos existen, su calidad y su procedencia, la utilidad del sistema disminuye drásticamente.

![[data-werehouse-architect.jpg]]