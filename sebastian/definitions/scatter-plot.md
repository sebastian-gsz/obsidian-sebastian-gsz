---
def-type: atomic
version: 1.0
id: def-scatter-plot
status: estandar
category: herramientas-de-visualización
contexto: ciencia-de-datos
date: 2026-06-26
tags:
  - visualizacion-de-datos
  - analisis-estadistico
aliases:
  - scatter plot
  - gráfico de dispersión
  - diagrama de dispersión
---
El gráfico de dispersión es una técnica de visualización que utiliza coordenadas cartesianas para representar la relación entre dos variables numéricas. Cada punto en el plano representa una observación individual, permitiendo mapear la distribución conjunta de los datos y detectar estructuras ocultas que no son evidentes en medidas estadísticas resumen (como la media o la desviación estándar).

#### Análisis de patrones y utilidad

El valor del gráfico de dispersión radica en su capacidad para revelar la naturaleza de la relación entre variables:

-  **Correlación:** La disposición de los puntos permite identificar rápidamente el tipo de relación:
    
    -  **Positiva:** A medida que la variable X aumenta, Y también aumenta.
    -  **Negativa:** A medida que la variable X aumenta, Y disminuye.
    -  **Nula:** Los puntos se distribuyen aleatoriamente sin una dirección definida.
-  **Observaciones atípicas (_Outliers_):** Identifica puntos aislados que se desvían significativamente del patrón general. Estos _outliers_ pueden ser indicadores críticos de errores en la captura de datos, fallos en sensores o, en contextos de detección de fraude/anomalías, eventos excepcionales que merecen una investigación profunda.

#### Rol en el _Pipeline_ de Ciencia de Datos

El gráfico de dispersión no es solo una herramienta descriptiva, sino una fase necesaria para la validación de hipótesis:

1. **Validación de supuestos:** Antes de aplicar modelos de regresión lineal, es imperativo verificar si la relación entre las variables es, efectivamente, lineal. Si el gráfico revela una curvatura (patrón no lineal), el analista sabe que debe aplicar transformaciones de datos o utilizar algoritmos de regresión no lineal.
2. **Detección de heterocedasticidad:** Permite visualizar si la varianza de los errores es constante a lo largo de los valores de la variable independiente. Si el gráfico muestra un patrón de "abanico" (la dispersión aumenta o disminuye con X), es necesario ajustar el modelo estadístico para evitar sesgos en las predicciones.
3. **Filtrado de ruido:** Al visualizar los datos, es posible descartar variables que claramente no muestran una relación informativa antes de incluirlas en el entrenamiento de modelos complejos.