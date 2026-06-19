---
def-type: atomic
aliases:
  - wide-column store
  - almacén de columna ancha
  - Base de datos de Columna ancha
  - wide column store
  - Columna ancha
tags:
  - base-de-datos
  - nosql
  - escalabilidad
  - bigdata
category: modelos-de-datos
contexto: almacenamiento
version: 1
status: estandar
---
Modelo que almacena datos en columnas en lugar de filas, permitiendo tener una estructura flexible donde cada fila puede tener diferentes columnas.

* **Faceta de escalabilidad**: Diseñada para escalabilidad horizontal masiva (sharding nativo).
* **Faceta de consulta**: Extremadamente rápida para leer rangos de datos específicos de una sola columna a través de millones de filas.
* **Propósito**: Análisis de grandes volúmenes de datos (Big Data) y aplicaciones que requieren escritura masiva distribuida (ej. Cassandra/HBase).