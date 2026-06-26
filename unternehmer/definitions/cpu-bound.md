---
def-type: atomic
version: 1.0
id: def-cpu-bound
status: estandar
category: análisis-de-rendimiento
contexto: ingeniería-de-sistemas
date: 2026-06-19
tags:
  - rendimiento
  - arquitectura
  - optimización
aliases:
  - cpu bound
  - limitado por procesador
  - cpu limitada
  - proceso limitado por cpu
---
Un proceso o sistema se encuentra en estado _CPU-bound_ (limitado por procesador) cuando su rendimiento está condicionado directamente por la capacidad de cálculo de la unidad central de procesamiento. Esta condición surge cuando la carga de trabajo requiere una ejecución intensiva de operaciones matemáticas o lógicas, superando la capacidad del procesador para resolverlas en el tiempo esperado.

Las características operativas de este estado incluyen un uso constante y elevado de los ciclos de la CPU, mientras que los tiempos de espera por operaciones de entrada/salida (I/O) son mínimos o despreciables. Ejemplos comunes de este comportamiento incluyen el renderizado de gráficos, la ejecución de simulaciones matemáticas complejas, así como procesos de encriptación y compresión de archivos.

- **Estrategia de escalado:** Ante tareas limitadas por CPU, el escalado vertical (aumentar la potencia del procesador individual) es a menudo la solución primaria para reducir los tiempos de ejecución.
- **Paralelización:** La implementación de técnicas de _multithreading_ y procesamiento distribuido permite repartir la carga de trabajo entre múltiples núcleos, optimizando el rendimiento global del sistema.