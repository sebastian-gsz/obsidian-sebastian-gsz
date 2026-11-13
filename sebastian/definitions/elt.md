---
def-type: atomic
version: 1.0
id: def-elt
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
  - extracción, carga y transformación
  - extract load transform
  - extracción carga transformación
---
**ELT** (_Extract, Load, Transform_ — extracción, carga y transformación) es el patrón de integración de datos que invierte el orden clásico: extrae los datos de las fuentes, los **carga crudos** en el destino final — un _data lake_ o un _data warehouse_ moderno — y aplica las **transformaciones dentro del propio destino**, aprovechando su capacidad de cómputo.

#### Las Tres Fases

-  **Extract (E)**: igual que en ETL — se capturan los datos de APIs, bases de datos y archivos.
-  **Load (L)**: se escriben los datos **sin procesar** directamente en el almacén. Nada se descarta ni se reestructura en tránsito: el destino conserva el dato original tal como llegó.
-  **Transform (T)**: se ejecutan las reglas de limpieza y modelado dentro del almacén, normalmente en SQL declarativo gestionado con herramientas como _dbt_. Cada transformación queda versionada y reproducible.

#### Diferencia Crítica: ELT vs. ETL

-  **Dónde ocurre el cómputo**: en ETL, en un motor intermedio separado; en ELT, dentro del almacén, que escala elásticamente (y solo cobra por lo que ejecuta).
-  **Qué se conserva**: ELT mantiene el dato crudo cargado — si una regla de transformación estaba mal, se corrige y se reprocesa sin volver a extraer de la fuente. En ETL clásico, el dato original nunca llegó al destino.
-  **Cuándo conviene cada uno**: ELT brilla con almacenes elásticos y volúmenes masivos (_Snowflake_, _BigQuery_, _Redshift_); ETL sigue teniendo sentido cuando el destino es limitado, cuando hay que filtrar datos sensibles antes de moverlos (cumplimiento normativo) o con fuentes de ancho de banda caro.

#### Herramientas Representativas

-  **Replicación**: _Fivetran_, _Airbyte_, _Debezium_.
-  **Transformación in-destination**: _dbt_, SQL del propio almacén.

### Propósito fundamental

ELT apuesta por cargar primero y pensar después: al conservar el dato crudo en un destino con cómputo elástico, desacopla la captura de la lógica de negocio y permite corregir transformaciones sin repetir extracciones — la arquitectura dominante en la nube moderna.
