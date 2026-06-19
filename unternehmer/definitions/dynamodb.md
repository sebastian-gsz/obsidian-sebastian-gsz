---
def-type: atomic
aliases:
  - Amazon DynamoDB
  - DynamoDB
tags:
  - aws
  - dynamodb
  - escalabilidad
  - bases-de-datos
category: patrones-de-escalado
contexto: arquitectura-cloud
version: 1
date: 2026-06-17
status: estandar
---

DynamoDB es un servicio administrado que escala exclusivamente mediante **escalabilidad horizontal (particionamiento)**. No admite escalado vertical por parte del usuario.

- **Mecanismo**: Utiliza particionamiento automático de datos en múltiples nodos físicos.
- **Escalabilidad**: Al aumentar el volumen de datos o la carga de tráfico, DynamoDB aprovisiona más particiones automáticamente.
- **Control del usuario**: El usuario solo gestiona la _capacidad aprovisionada_ (lectura/escritura) o habilita el _modo bajo demanda_, dejando la gestión de recursos físicos (CPU/RAM/Disco) totalmente bajo el control de AWS.
- **Regla de oro**: Si el sistema no rinde, el problema no es la falta de "escalado vertical", sino un diseño deficiente de la **Partition Key** o la falta de índices adecuados.
- **Si tus consultas son lentas:** No es que necesites una CPU más potente; probablemente necesitas **índices secundarios** (Global Secondary Indexes) para mejorar el acceso a los datos.
