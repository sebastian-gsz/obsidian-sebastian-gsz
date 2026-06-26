---
def-type: atomic
version: 1.0
id: def-desviacion-estandar
status: estandar
category: estadística-descriptiva
contexto: ciencia-de-datos
date: 2026-06-26
tags:
  - estadística
  - medidas-de-dispersión
  - análisis-de-datos
aliases:
  - desviación típica
  - standard deviation
  - desviación estándar
---
La desviación estándar ($\sigma$) es la medida de dispersión más utilizada en estadística y ciencia de datos. Representa la raíz cuadrada de la varianza y cuantifica el grado de dispersión de los datos con respecto a su media aritmética ($\mu$). Su principal ventaja frente a la varianza es que se expresa en las mismas unidades que la variable original, lo que facilita su interpretación directa.

#### Interpretación estadística

-  **Baja desviación estándar:** Los datos se encuentran agrupados muy cerca de la media, lo que indica un conjunto de datos consistente, predecible y con poca variabilidad.
-  **Alta desviación estándar:** Los datos están ampliamente dispersos, lo que sugiere una mayor heterogeneidad o "ruido" en las observaciones.

#### Fundamento matemático

Para una población, la fórmula es:

$$\sigma = \sqrt{\frac{\sum_{i=1}^{N} (x_i - \mu)^2}{N}}$$

Donde:

- $N$ es el tamaño de la población.
- $x_i$ es cada valor individual.
- $\mu$ es la media de la población.

Para una muestra (donde se utiliza el divisor $n-1$ para corregir el sesgo, conocido como la _Corrección de Bessel_):

$$s = \sqrt{\frac{\sum_{i=1}^{n} (x_i - \bar{x})^2}{n-1}}$$

#### Aplicación en el análisis de datos

1. **Detección de valores atípicos (_Outliers_):** En una distribución normal, aproximadamente el 99.7% de los datos se encuentran dentro de $\pm 3\sigma$ respecto a la media. Cualquier valor fuera de este rango es estadísticamente sospechoso.
2. **Estandarización de variables (Z-score):** La desviación estándar permite normalizar datos mediante la fórmula $z = \frac{x - \mu}{\sigma}$, transformando diferentes escalas de medición a una métrica común, lo cual es un paso obligatorio en muchos algoritmos de _Machine Learning_ (ej. SVM, Regresión Lineal).
3. **Evaluación de riesgo:** En finanzas y operaciones, una mayor desviación estándar suele interpretarse como mayor volatilidad o riesgo de incertidumbre en el sistema.