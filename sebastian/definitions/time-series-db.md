---
def-type: atomic
version: 1.0
id: def-time-series-db
status: estandar
category: modelos-de-datos
contexto: almacenamiento
date: 2026-06-26
tags:
  - base-de-datos
  - monitoreo
  - iot
  - metricas
aliases:
  - time-series db
  - base de datos de series temporales
  - base de datos de serie temporal
  - serie temporal
---
Las bases de datos de series temporales (TSDB) están optimizadas específicamente para almacenar, recuperar y analizar secuencias de datos indexadas por marcas de tiempo (_timestamps_). A diferencia de las bases de datos relacionales (RDBMS) o de documentos, las TSDB están diseñadas para manejar flujos de datos donde el tiempo es la dimensión principal.

#### Características operacionales

-  **Faceta de ingesta:** Optimizadas para una ingesta de alta velocidad (_write-heavy_). La arquitectura está diseñada para gestionar volúmenes masivos de datos secuenciales que llegan de forma constante y ordenada temporalmente, minimizando el impacto de los índices pesados en la escritura.
-  **Faceta de consulta:** Eficiencia superior en operaciones de agregación sobre intervalos de tiempo. Permiten realizar cálculos complejos como promedios móviles, tendencias, remuestreo (_downsampling_) y cálculos de tasa de cambio de forma nativa y performante.
-  **Políticas de retención:** Integran la gestión del ciclo de vida de los datos. Dado que los datos antiguos de series temporales pierden relevancia, estas bases de datos permiten configurar políticas de expiración automática (_TTL - Time to Live_) o consolidación de datos históricos.

#### Diferenciación técnica

Mientras que una base de datos relacional almacena el estado actual de un registro (o una versión de él), una TSDB almacena el **historial completo** de cambios de una métrica a lo largo del tiempo. Esto permite no solo saber qué valor tiene un sensor _ahora_, sino visualizar su comportamiento en cualquier ventana temporal del pasado.

#### Casos de uso típicos

-  **Monitoreo de infraestructura:** Recopilación de telemetría de sistemas (CPU, RAM, red, IOPS) para alertado y análisis de capacidad.
-  **Internet de las Cosas (IoT):** Ingesta de datos provenientes de miles de sensores remotos (temperatura, presión, vibración) con granulosidad de milisegundos.
-  **Analítica financiera:** Almacenamiento de datos de mercado (_tick data_), cotizaciones y registros de alta frecuencia para análisis de algoritmos de trading.

#### Consideración de diseño

Para maximizar el rendimiento, es crucial definir correctamente la **granularidad** y la **cardinalidad**. Una cardinalidad excesiva (demasiadas etiquetas únicas o series temporales distintas) puede impactar el rendimiento del índice, por lo que el diseño del esquema debe equilibrar la capacidad de consulta con el coste de almacenamiento.