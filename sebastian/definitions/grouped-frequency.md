---
def-type: atomic
version: 1.0
id: def-frecuencia-intervalos
status: estandar
category: ciencia-de-datos
contexto: estadistica-descriptiva
date: 2026-11-11
tags:
  - estadistica
  - datos
  - histograma
aliases:
  - frecuencia de intervalos
  - frecuencia agrupada
  - grouped frequency
---
La **frecuencia de intervalos** es la forma de contar **datos agrupados en intervalos**: los datos se dividen en rangos de igual tamaño y se cuenta cuántas observaciones caen en cada uno. Es la técnica estándar cuando hay demasiados valores distintos para contarlos uno a uno — el caso típico de las variables continuas.

#### Cómo Se Construye

1.  Se decide el **número de intervalos** y su **tamaño** (iguales entre sí, sin solaparse, cubriendo todo el rango: por ejemplo, alturas en rangos de 10 cm: 150–159, 160–169...).
2.  Se cuenta cuántas observaciones caen en **cada intervalo** — esa es su frecuencia de intervalos.
3.  El resultado alimenta la **tabla de frecuencias de intervalos**, el **histograma** (barras pegadas, donde la altura de cada barra es la frecuencia del intervalo) o el **polígono de frecuencias**.

#### Para Qué Sirve

Es especialmente útil para describir datos distribuidos de manera uniforme o continua — la altura de los estudiantes de una clase, las puntuaciones de un examen. Sus beneficios:

-  **Identificar valores atípicos**: un intervalo casi vacío rodeado de llenos delata observaciones anómalas.
-  **Detectar tendencias**: la forma de la distribución (campana, sesgada, bimodal) emerge al agrupar.
-  **Comparar conjuntos de datos**: dos histogramas con los mismos intervalos son directamente comparables.

#### Diferencia Crítica: Intervalos vs. Categorías

Con pocas categorías naturales (marcas de coche, colores), se cuenta **por valor** — agrupar en intervalos destruiría información. Con variables continuas o cientos de valores posibles (alturas, salarios, tiempos), contar **por valor** produce una tabla inusable: el intervalo es la única granularidad legible. La elección depende de cuántos valores distintos tenga la variable.

### Propósito fundamental

La frecuencia de intervalos hace contable lo continuo: al trocear el rango en bandas iguales, convierte miles de valores únicos en una distribución legible — la base del histograma y la primera imagen honesta de cómo se distribuye una variable numérica.
