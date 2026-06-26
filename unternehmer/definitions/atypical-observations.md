---
def-type: atomic
version: 1.0
id: def-outliers
status: estandar
category: limpieza-de-datos
contexto: ciencia-de-datos
date: 2026-06-20
tags:
  - análisis-estadístico
  - diagramas-de-dispersión
aliases:
  - outliers
  - valores atípicos
  - anomalías
  - observaciones atípicas
  - atypical observations
---
Puntos de datos que se encuentran significativamente alejados del patrón, tendencia o rango general observado en el resto del dataset.

-  **Origen de las anomalías:**
    
    -  **Errores:** Fallos en la captura, sensores defectuosos o errores de entrada de datos.
    -  **Variabilidad natural:** Eventos excepcionales reales que, aunque estadísticamente lejanos, contienen información crítica (ej. detección de fraude).
-  **Impacto analítico:**
    
    -  **Distorsión de medidas:** Alteran significativamente estadísticas descriptivas como la media y la desviación estándar.
    -  **Sesgo en modelos:** Pueden reducir la capacidad de generalización de modelos de regresión y algoritmos de Machine Learning.
-  **Métodos de detección comunes:**
    
    -  **Z-Score:** Medición de cuántas desviaciones estándar está un punto respecto a la media.
    -  **Rango Intercuartílico (IQR):** Identificación de valores fuera de los límites definidos por $Q1 - 1.5 \times IQR$ y $Q3 + 1.5 \times IQR$.
    -  **Visualización:** Uso de diagramas de caja (_box plots_) y diagramas de dispersión (_scatter plots_).