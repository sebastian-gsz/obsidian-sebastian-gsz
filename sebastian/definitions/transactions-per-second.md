---
def-type: atomic
version: 1
id: def-transactions-per-second
status: estandar
category: rendimiento
date: 2026-08-17
tags:
  - rendimiento
  - arquitectura
  - bases-de-datos
  - tps
aliases:
  - transactions per second
  - transacciones por segundo
  - TPS
---
Las transacciones por segundo (TPS, por sus siglas en inglés, _Transactions Per Second_) son una métrica de rendimiento que mide la cantidad de operaciones o transacciones procesadas exitosamente por un sistema, base de datos, red o aplicación dentro de un intervalo de un segundo.
### Métrica de rendimiento

Sirve como un indicador fundamental para evaluar la capacidad de carga, la escalabilidad y la velocidad de respuesta de infraestructuras tecnológicas bajo escenarios de alta concurrencia.
### Factores determinantes

-  **Capacidad de hardware**: La potencia de procesamiento (CPU), la velocidad de almacenamiento (I/O) y la asignación de memoria RAM influyen directamente en el volumen máximo de TPS soportado.
-  **Optimización del software**: La eficiencia en las consultas a bases de datos, el uso de índices, la gestión de bloqueos (locks) y la arquitectura de la aplicación condicionan el rendimiento global.
-  **Latencia de red**: Los tiempos de comunicación entre los componentes distribuidos pueden limitar la tasa efectiva de transacciones completadas por unidad de tiempo.