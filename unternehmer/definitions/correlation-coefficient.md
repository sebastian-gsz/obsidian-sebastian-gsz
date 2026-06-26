---
def-type: atomic
version: 1.0
id: def-pearson-correlation
status: estandar
category: estadística-inferencial
contexto: ciencia-de-datos
date: 2026-06-18
tags:
  - estadística
  - ciencia-de-datos
  - correlación
aliases:
  - coeficiente de correlación
  - correlación de pearson
  - r de pearson
  - correlation coefficient
  - pearson r
---
El coeficiente de correlación de Pearson es una medida estandarizada que cuantifica la fuerza y la dirección de la relación lineal entre dos variables cuantitativas. Su valor oscila estrictamente en el intervalo $[-1, 1]$, lo que permite una interpretación normalizada independientemente de las unidades de medida originales.

Este coeficiente se calcula como el cociente entre la covarianza de las dos variables y el producto de sus respectivas desviaciones estándar. Al ser una magnitud adimensional, supera las limitaciones de la covarianza, facilitando la comparación directa de la intensidad de la relación entre diferentes pares de variables, sin importar sus escalas de magnitud.

-  **Interpretación de valores extremos:** * **+1:** Indica una correlación positiva perfecta, donde ambas variables aumentan o disminuyen al unísono.
    
    - **0:** Señala una ausencia total de relación lineal entre las variables.
    - **-1:** Representa una correlación negativa perfecta, donde una variable aumenta en la misma proporción que la otra disminuye.
        
-  **Utilidad analítica:** Es fundamental en el análisis exploratorio de datos y en la fase de selección de características (feature selection) para identificar dependencias lineales entre los datos.