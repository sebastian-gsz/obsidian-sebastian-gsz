---
def-type: atomic
version: 1.0
id: def-etl
status: estandar
category: ciencia-de-datos
contexto: ingenieria-de-datos
date: 2026-11-11
tags:
  - ciencia-de-datos
  - ingenieria-de-datos
  - pipelines
  - data-warehouse
aliases:
  - extracción, transformación y carga
  - extract transform load
  - extracción transformación carga
---
**ETL** (_Extract, Transform, Load_ — extracción, transformación y carga) es el patrón de integración de datos en el que la información se extrae de los sistemas de origen, se **transforma** en un paso intermedio (limpieza, formato, enriquecimiento) y solo entonces se **carga** ya estructurada en el destino final, típicamente un _data warehouse_.

#### Las Tres Fases

-  **Extract (E)**: se conecta a las fuentes — bases de datos transaccionales, APIs, archivos planos, logs — y se copian los datos crudos hacia un área de preparación (_staging area_).
-  **Transform (T)**: se aplica la lógica de negocio: estandarizar tipos y unidades, deduplicar, validar reglas, unir tablas dispersas, calcular columnas derivadas. Aquí el dato "sucio" se convierte en dato analizable.
-  **Load (L)**: se escriben los datos ya transformados en el destino con el esquema definitivo, listos para consulta y _business intelligence_.

#### Diferencia Crítica: ETL vs. ELT

-  **ETL transforma ANTES de cargar**: exige capacidad de cómputo fuera del destino y define el esquema de antemano (_schema-on-write_). Fue el estándar cuando el almacenamiento era caro y los destinos no podían procesar transformaciones.
-  **ELT carga primero y transforma después**: invierte el orden y aprovecha el poder de cómputo del almacén moderno (_Snowflake_, _BigQuery_) o del _data lake_. Ventaja adicional: los datos crudos permanecen intactos en el destino, permitiendo reprocesar con lógica corregida.
-  La elección no es estética: define dónde vive la lógica, quién paga el cómputo y si se puede auditar el dato original.

#### Herramientas Representativas

-  **Orquestación**: _Apache Airflow_, _Azure Data Factory_, _AWS Glue_.
-  **Integración clásica**: _Talend_, _Informatica PowerCenter_, _SSIS_.

### Propósito fundamental

ETL es el embudo disciplinado que convierte datos dispersos y sucios de los sistemas operativos en un recurso confiable y estructurado: garantiza que lo que llega al almacén ya está limpio, coherente y alineado con el modelo de negocio, de modo que cualquier análisis posterior parta de cimientos sólidos.
