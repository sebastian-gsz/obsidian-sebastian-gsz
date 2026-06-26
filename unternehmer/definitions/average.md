---
def-type: atomic
version: 1.0
id: def-average
status: estandar
category: herramientas
contexto: análisis-de-datos
date: 2026-06-16
tags:
  - hojas-de-calculo
  - funciones
aliases:
  - average
  - media
  - promedio
  - arithmetic mean
  - media aritmética
---
Función estadística fundamental en software de hojas de cálculo (Excel, Google Sheets, LibreOffice Calc) que calcula la media aritmética de un rango de valores numéricos.

-  **Sintaxis operativa:** `AVERAGE(rango)` o `PROMEDIO(rango)`.
-  **Fundamento matemático:** Calcula el promedio mediante la fórmula:

    $$\bar{x} = \frac{\sum_{i=1}^{n} x_i}{n}$$
    
    Donde $\sum x_i$ es la suma de los valores y $n$ es el número total de elementos.
-  **Comportamiento de la función:**

    -  **Celdas vacías:** Son ignoradas automáticamente por la función.
    -  **Texto y valores lógicos:** Generalmente omitidos en el cálculo si se encuentran dentro del rango.
    -  **Ceros:** Son tratados como valores numéricos y sí influyen en el resultado final.
-  **Consideración analítica:** La media es una medida de tendencia central muy sensible a **outliers** (valores atípicos), los cuales pueden sesgar el resultado significativamente en comparación con la mediana.