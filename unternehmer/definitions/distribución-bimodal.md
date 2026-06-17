---
def-type: atomic
aliases:
  - distribución-bimodal
  - multimodal
  - distribución bimodal
  - Bimodal
tags:
  - estadística
  - análisis-de-datos
  - ciencia-de-datos
  - eda
category: estadística-descriptiva
contexto: análisis-de-datos
version: 1
date: 2026-06-17
status: estandar
---
Se refiere a una distribución de probabilidad o conjunto de datos que presenta dos picos o modas claramente definidos en su histograma, donde la frecuencia de los valores alcanza su máximo en dos puntos distintos.

* **Faceta de análisis**: En estadística, la presencia de una distribución bimodal suele ser un indicador clave de **heterogeneidad** en los datos; sugiere que la muestra no proviene de una sola población, sino de la combinación de dos subgrupos distintos.
* **Faceta de ciencia de datos**: Durante el proceso de Análisis Exploratorio de Datos (EDA), detectar un comportamiento bimodal justifica realizar una segmentación o clustering, ya que tratar todo el conjunto de datos como uno solo podría enmascarar patrones opuestos.
* **Ejemplo práctico**: Si analizamos los tiempos de respuesta de un servidor y observamos dos picos (uno en milisegundos y otro en segundos), esto indica la existencia de dos perfiles de carga distintos (ej. peticiones ligeras vs. procesos pesados o "timeout").
* **Propósito**: Actuar como una señal de alerta para el analista, indicando que el modelo de datos debe separarse o analizarse considerando las dos poblaciones subyacentes.