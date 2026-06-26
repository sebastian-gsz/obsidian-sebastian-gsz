---
def-type: atomic
version: 1.0
id: def-dynamodb
status: estandar
category: patrones-de-escalado
contexto: arquitectura-cloud
date: 2026-06-17
tags:
  - aws
  - dynamodb
  - escalabilidad
  - bases-de-datos
aliases:
  - amazon dynamodb
  - dynamodb
---

Amazon DynamoDB es un servicio de base de datos NoSQL totalmente administrado que escala exclusivamente mediante particionamiento horizontal, sin ofrecer opciones de escalado vertical. Su arquitectura está diseñada para gestionar volúmenes masivos de datos y tráfico, abstrayendo completamente la gestión de recursos físicos como CPU, memoria o almacenamiento, los cuales son administrados automáticamente por AWS.

-  **Mecanismo de particionamiento:** El sistema distribuye los datos automáticamente en múltiples nodos físicos. A medida que el volumen de datos o la carga de tráfico se incrementan, DynamoDB aprovisiona nuevas particiones sin intervención del usuario.
-  **Control de capacidad:** El usuario gestiona únicamente la capacidad aprovisionada (unidades de lectura/escritura) o habilita el modo bajo demanda, delegando toda la complejidad de la infraestructura subyacente al proveedor.
-  **Diseño centrado en datos:** La "regla de oro" para el rendimiento en DynamoDB dicta que los problemas de latencia no suelen deberse a una limitación de recursos físicos, sino a un diseño deficiente de la _Partition Key_ o a una estrategia de indexación insuficiente.
-  **Optimización de consultas:** Si se experimenta lentitud en los accesos, la solución arquitectónica correcta no es aumentar la potencia del servidor, sino optimizar el esquema de datos o implementar Índices Secundarios Globales (_Global Secondary Indexes_) para permitir consultas eficientes.
