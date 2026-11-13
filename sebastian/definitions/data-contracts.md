---
def-type: atomic
version: 1.0
id: def-data-contracts
status: estandar
category: ingenieria-de-datos
date: 2026-09-21
tags:
  - data-contracts
  - gobernanza
  - calidad-de-datos
  - data-engineering
  - dataops
aliases:
  - data contracts
  - contratos de datos
---
Un **contrato de datos** (_Data Contract_) es un acuerdo explícito y ejecutable entre los productores de datos (sistemas de origen, aplicaciones de software) y los consumidores (analistas, ingenieros de datos, científicos de datos) que define de forma formal la estructura, el esquema, la semántica, la calidad y los niveles de servicio (SLAs) esperados de un conjunto de datos. Su propósito principal es tratar los flujos de datos como productos profesionales de alta calidad, previniendo que modificaciones imprevistas en los sistemas operativos rompan las canalizaciones (_pipelines_) analíticas o los modelos de inteligencia artificial en producción.

###### Componentes principales

-  **Esquema y tipos de datos:** Especificación estricta de las tablas, columnas, tipos de datos permitidos y restricciones estructurales para evitar cambios rupturistas (_breaking changes_).
-  **Métricas de calidad:** Reglas automatizadas y verificaciones continuas que aseguran la integridad, exactitud y consistencia de la información antes de su consumo.
-  **Acuerdos de nivel de servicio (SLAs):** Compromisos formales sobre la disponibilidad, frecuencia de actualización (_freshness_) y plazos de entrega de los datos.
-  **Propiedad y linaje:** Identificación clara de los equipos responsables del dominio de datos y trazabilidad de sus dependencias dentro de la arquitectura corporativa.

###### Beneficios operativos

-  **Prevención proactiva de errores:** Detecta anomalías o cambios de esquema en los sistemas de origen antes de que corrompan los almacenes de datos (_data warehouses_) o los tableros de reporting.
-  **Alineación entre equipos:** Fomenta la colaboración y la responsabilidad compartida entre los desarrolladores de software y los ingenieros de datos, rompiendo los silos organizativos.
-  **Confiabilidad analítica y de IA:** Garantiza que los datos que alimentan procesos de negocio críticos y modelos de machine learning sean seguros, predecibles y fidedignos.