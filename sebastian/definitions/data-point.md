---
def-type: atomic
version: 1.0
id: def-punto-de-datos
status: estandar
category: ciencia-de-datos
contexto: analisis-de-datos
date: 2026-11-11
tags:
  - datos
  - estadistica
  - analisis
aliases:
  - punto de datos
  - data point
  - dato individual
---
Un **punto de datos** es **una pieza de información específica**: el valor individual más pequeño que existe en un conjunto de datos — un solo número, una sola medida, una única respuesta. Es el átomo del análisis: todo dataset es una colección de puntos de datos.

#### Ubicarlo en el Dataset

-  En una tabla, un punto de datos ocupa **una celda exacta**: la intersección de UNA observación (fila) con UNA variable (columna).
-  La edad de UN cliente concreto, la temperatura de UN sensor a UN instante, las ventas de UN día para UN producto — cada uno es un punto de datos.
-  La jerarquía completa: **punto de datos** (una celda) → **observación** (una fila completa) → **dataset** (todas las filas y columnas).

#### Por Qué el Concepto Importa

-  **La calidad se juzga punto a punto**: un outlier es UN punto de datos; un error de captura es UN punto — la limpieza del dataset es la curación de sus puntos.
-  **Cada punto tiene contexto**: un dato sin su observación y su variable es un número huérfano — "47" no dice nada; "47 °C del sensor 3 a las 14:02" es un punto de datos accionable.
-  **Las visualizaciones los colocan**: en un gráfico de dispersión, cada punto dibujado ES un punto de datos — ver la nube de puntos es ver la colección completa de la variable.

#### Diferencia Crítica: Punto de Datos vs. Observación

-  La **observación** es la fila: TODAS las variables medidas de UN caso.
-  El **punto de datos** es una celda: UNA sola variable de UN caso.
-  La pregunta que distingue: "¿todo lo que sabemos de este cliente?" (observación) frente a "¿cuánto gastó este cliente este mes?" (punto de datos) — el punto es el valor; la observación, el expediente.

### Propósito fundamental

El punto de datos es la unidad mínima de la información analizable: una pieza específica con su contexto — y todo lo demás (observaciones, datasets, estadísticos, visualizaciones) son solo formas de organizar y agregar millones de estos átomos individuales hasta que cuentan una historia.
