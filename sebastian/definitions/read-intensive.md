---
def-type: atomic
version: 1.0
id: def-carga-lectura
status: estandar
category: tipos-de-carga
contexto: arquitectura-de-datos
date: 2026-06-26
tags:
  - arquitectura
  - rendimiento
  - bases-de-datos
  - optimizacion
aliases:
  - carga de lectura
  - alta concurrencia de lectura
  - carga de trabajo intensiva en lectura
  - intensiva en lectura
---
Una carga de trabajo intensiva en lectura define arquitecturas donde la frecuencia de operaciones de acceso a datos (SELECT/GET) es significativamente superior a la de operaciones de escritura o actualización (INSERT/UPDATE/DELETE). En este escenario, el desafío de diseño no es la integridad transaccional compleja, sino la baja latencia y la escalabilidad bajo alta concurrencia.