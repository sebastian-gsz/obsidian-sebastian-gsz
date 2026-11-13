---
def-type: atomic
version: 1.0
id: def-step-functions
status: estandar
category: servicios-cloud
contexto: computación-sin-servidor
date: 2026-06-26
tags:
  - aws
  - serverless
  - orquestacion
  - workflow
aliases:
  - step functions
  - aws step functions
  - state machine
  - orquestador serverless
---
Step Functions es un servicio de orquestación _serverless_ que permite coordinar múltiples servicios de AWS en flujos de trabajo (workflows) visuales. Utiliza máquinas de estados para gestionar la lógica de ejecución, permitiendo crear aplicaciones distribuidas complejas, automatizar procesos de TI y manejar la lógica de negocio sin gestionar servidores.

#### Conceptos operativos

La arquitectura se basa en la definición de máquinas de estados, las cuales dictan cómo se ejecutan las tareas:

-  **Tareas (Tasks):** Unidades de trabajo que realizan una función (ej. invocar una función Lambda, insertar datos en DynamoDB, o esperar una respuesta humana).
-  **Control de flujo:** Permite definir lógica condicional (`Choice`), paralelismo (`Parallel`), bucles sobre colecciones (`Map`) y esperas temporales (`Wait`).
-  **Manejo de errores:** Integración nativa de `Retry` y `Catch` para gestionar reintentos automáticos (con _exponential backoff_) y capturar errores específicos, eliminando la necesidad de gestionar esta lógica dentro del código de las funciones individuales.

#### Propósito arquitectónico

Step Functions desvincula la lógica de orquestación de la lógica de negocio. En lugar de tener una función "monolítica" que llama a otras funciones, se delega la coordinación al servicio, permitiendo que cada componente (microservicio) sea independiente, reemplazable y altamente escalable.

#### Casos de uso

-  **Orquestación de microservicios:** Coordinación de múltiples servicios en procesos de larga duración (ej. checkout de un e-commerce).
-  **Procesamiento de datos:** Pipelines de ETL donde se ejecutan pasos secuenciales o paralelos (ej. procesamiento de video o archivos).
-  **Intervención humana:** Flujos donde se requiere una aprobación externa antes de continuar con la ejecución (callback tokens).