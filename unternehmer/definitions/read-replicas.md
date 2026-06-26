---
def-type: atomic
version: 1.0
id: def-read-replicas
status: estandar
category: concepto
contexto: sistemas-distribuidos
date: 2026-06-26
tags:
  - arquitectura/bases-de-datos
  - escalabilidad
  - latencia
  - consistencia
aliases:
  - read replicas
  - replicación asíncrona
---
La replicación de lectura es un patrón arquitectónico diseñado para maximizar el rendimiento en sistemas con cargas de trabajo intensivas en lectura (_read-intensive_), desacoplando las operaciones de escritura de las de lectura mediante el uso de nodos dedicados.

#### Funcionamiento y estrategia

-  **Nodo maestro (Primary):** Es la autoridad única para operaciones de escritura (DML). Cualquier cambio en el estado de la base de datos ocurre exclusivamente aquí para garantizar la integridad y evitar conflictos de concurrencia.
-  **Nodos esclavos (Replicas):** Nodos secundarios que reciben actualizaciones del maestro de forma asíncrona. Estos están optimizados específicamente para atender consultas de lectura (SELECT).

#### Beneficios estratégicos

-  **Escalabilidad horizontal:** Es posible añadir réplicas dinámicamente para soportar picos de tráfico de lectura sin impactar la capacidad de escritura del maestro.
-  **Reducción de latencia:** Las réplicas pueden desplegarse en regiones geográficas cercanas al usuario final, reduciendo los tiempos de ida y vuelta (_round-trip time_).
-  **Alta disponibilidad:** La infraestructura gana resiliencia; ante un fallo del nodo maestro, un proceso de _failover_ puede promover a una de las réplicas para asegurar la continuidad del servicio.
