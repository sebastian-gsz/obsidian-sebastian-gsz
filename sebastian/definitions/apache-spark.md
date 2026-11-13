---
def-type: atomic
version: 1.0
id: def-apache-spark
status: estandar
category: herramientas
contexto: ingeniería-de-datos
date: 2026-06-16
tags:
  - big-data
  - ingenieria-de-datos
  - procesamiento
aliases:
  - apache spark
  - distributed computing engine
  - motor de computación distribuida
  - large scale data processing
  - procesamiento de datos a gran escala
---
Motor de computación distribuida de código abierto, optimizado para el procesamiento de datos a gran escala (Big Data). Destaca por su capacidad para manejar volúmenes masivos de información con una velocidad superior a marcos tradicionales como MapReduce.

-  **Arquitectura de rendimiento:** * **In-memory computing:** Procesa datos directamente en la memoria RAM, minimizando las operaciones de lectura/escritura en disco (I/O).
    
    -  **DAG (Directed Acyclic Graph):** Utiliza un motor de ejecución basado en grafos para optimizar las etapas del plan de trabajo antes de su ejecución.
-  **Capacidades funcionales:**
    
    -  **Procesamiento híbrido:** Soporta procesamiento por lotes (Batch) y en tiempo real (Streaming) dentro de una misma arquitectura.
    -  **Versatilidad de lenguajes:** API nativa para Python (PySpark), Scala, Java, SQL y R.
-  **Componentes del ecosistema:**
    
    -  **Spark SQL:** Manipulación de datos estructurados mediante consultas SQL.
    -  **Spark Streaming:** Procesamiento de flujos de datos en tiempo real.
    -  **MLlib:** Biblioteca integrada para algoritmos de Machine Learning.
    -  **GraphX:** Procesamiento de grafos.
-  **Escalabilidad:** Diseñado para manejar conjuntos de datos a escala de petabytes distribuyendo la carga de trabajo de manera eficiente entre clústeres masivos.