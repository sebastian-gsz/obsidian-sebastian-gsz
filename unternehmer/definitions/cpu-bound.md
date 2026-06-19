---
def-type: atomic
aliases:
  - cpu bound
  - limitado por procesador
  - CPU limitada
tags:
  - rendimiento
  - arquitectura
  - optimización
category: análisis-de-rendimiento
contexto: ingeniería-de-sistemas
version: 1
date: 2026-06-19
status: estandar
---
Estado de un proceso o sistema donde el rendimiento está limitado por la velocidad de la CPU, debido a que la carga de trabajo requiere una cantidad intensiva de cálculos.

* **Características**: El uso de la CPU es constante y elevado, mientras que las esperas por I/O (entrada/salida) son despreciables.
* **Ejemplos**: Renderizado de imágenes, simulaciones matemáticas complejas, encriptación/desencriptación de datos y compresión de archivos.
* **Estrategia de escalado**: Para tareas CPU-bound, la solución suele ser incrementar la potencia del procesador (escalado vertical) o paralelizar el cálculo entre múltiples núcleos (multithreading).