---
def-type: atomic
aliases:
  - Read replicas
  - Replicación asíncrona
tags:
  - arquitectura/bases-de-datos
  - escalabilidad
  - latencia
  - consistencia
category: concepto
contexto: sistemas-distribuidos
version: 1
date: 2026-06-14
status: estandar
---
La replicación de lectura es una técnica arquitectónica para mejorar el rendimiento de aplicaciones con alta carga de lectura, separando el tráfico de escritura del de lectura.

-  **Funcionamiento**

	- **Nodo maestro (Primary)**: Es el único encargado de procesar las operaciones de escritura. Garantiza la consistencia fuerte para evitar conflictos de datos.
	- **Nodos esclavos (Replicas)**: Reciben los datos actualizados del maestro de forma asíncrona. Están optimizados para servir consultas de lectura rápidamente.
-  **Ventajas**

	- **Escalabilidad horizontal de lectura**: Puedes añadir múltiples nodos de lectura para soportar picos de tráfico sin sobrecargar el maestro.
	- **Alta disponibilidad**: Si el nodo maestro falla, una de las réplicas puede ser promovida a maestro (failover).
	- **Distribución geográfica**: Las réplicas pueden colocarse cerca de los usuarios finales para reducir la latencia de lectura.
-  **Comandos de monitoreo**

	- Para verificar el estado de la replicación en MySQL/MariaDB: **``SHOW SLAVE STATUS\G``**
	- Para forzar la sincronización en una sesión de PostgreSQL (verificando el lag): **``SELECT pg_last_wal_receive_lsn(), pg_last_wal_replay_lsn();``**
