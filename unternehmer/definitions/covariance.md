---
def-type: atomic
version: 1.0
id: def-covarianza
status: estandar
category: estadística-inferencial
contexto: ciencia-de-datos
date: 2026-06-18
tags:
  - estadística
  - probabilidad
  - análisis-multivariado
aliases:
  - covarianza
  - covariance
---
La covarianza es una medida estadística fundamental que indica la dirección de la relación lineal existente entre dos variables aleatorias. A diferencia de otras métricas de asociación, este valor permite determinar si las variables se comportan de manera sincrónica en términos de su dispersión respecto a sus medias.

El cálculo de la covarianza se obtiene promediando el producto de las desviaciones de cada variable respecto a su respectiva media. La interpretación de los resultados obtenidos es la siguiente:

-  **Positiva (Cov > 0):** Indica que ambas variables tienden a aumentar o disminuir de forma simultánea, lo que denota una relación directa.
-  **Negativa (Cov < 0):** Señala que, ante el aumento de una variable, la otra tiende a disminuir, reflejando una relación inversa.
-  **Cero (Cov = 0):** Indica que no existe una relación lineal definida entre las variables evaluadas.
-  **Limitación principal:** Este indicador carece de estandarización; su magnitud depende directamente de las unidades de medida de las variables originales, lo cual impide comparar la "fuerza" o intensidad de la relación entre diferentes pares de variables.