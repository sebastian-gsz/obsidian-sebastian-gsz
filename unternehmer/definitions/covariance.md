---
def-type: atomic
aliases:
  - covarianza
  - covariance
tags:
  - estadística
  - probabilidad
  - análisis-multivariado
category: estadística-inferencial
contexto: ciencia-de-datos
version: 1.0
date: 2026-06-18
status: estandar
---
Medida estadística que indica la dirección de la relación lineal entre dos variables aleatorias.

*  **Interpretación de valores**:
  
    * **Positiva (Cov > 0)**: Ambas variables tienden a aumentar o disminuir juntas (relación directa).
    * **Negativa (Cov < 0)**: Cuando una variable aumenta, la otra tiende a disminuir (relación inversa).
    * **Cero (Cov = 0)**: No existe una relación lineal definida entre las variables.
*  **Limitación**: No está estandarizada; su magnitud depende de las unidades de medida de las variables originales, lo que dificulta comparar la "fuerza" de la relación.
*  **Fórmula**: Se calcula promediando el producto de las desviaciones de cada variable respecto a su media.