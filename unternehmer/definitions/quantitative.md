---
def-type: atomic
version: 1.0
id: def-datos-cuantitativos
status: estandar
category: estadística-descriptiva
contexto: ciencia-de-datos
date: 2026-06-26
tags:
  - estadística
  - análisis-de-datos
  - métricas
aliases:
  - datos cuantitativos
  - tipos de datos
  - escalas de medición
  - quantitative
---
Los datos cuantitativos son mediciones o conteos que representan cantidades, magnitudes o volúmenes. Su característica definitoria es que son intrínsecamente numéricos, lo que permite la aplicación de operaciones aritméticas y técnicas de inferencia estadística para extraer conocimiento.

#### Clasificación por escalas de medición

La capacidad de operar con estos datos depende de la escala en la que fueron capturados:

-  **Escalas de Intervalo:**
    
    -  **Propiedad:** La distancia entre valores es constante y significativa.
    -  **Limitación:** El punto cero es **arbitrario** o relativo; no indica "ausencia total" de la variable.
    -  **Ejemplos:** Temperatura en grados Celsius o Fahrenheit, años calendario, puntuaciones en tests de coeficiente intelectual.
    -  **Operatividad:** Admiten suma y resta con significado preciso, pero carecen de una razón proporcional (ej. 20°C no es el doble de caliente que 10°C).
-  **Escalas de Razón (Ratio):**
    
    -  **Propiedad:** Poseen un **punto cero absoluto**, que representa la ausencia total de la propiedad medida.
    -  **Ejemplos:** Peso, altura, velocidad, ingresos monetarios, tiempo de reacción.
    -  **Operatividad:** Permiten todas las operaciones aritméticas (+, -, *, /). Es posible afirmar que una persona que pesa 80kg tiene el doble de masa que una que pesa 40kg.

#### Importancia analítica

En el contexto de la ciencia de datos, los datos cuantitativos son el insumo principal para:

1. **Modelado estadístico:** Cálculo de medidas de tendencia central (media, mediana) y dispersión (desviación estándar, varianza).
2. **Inferencia:** Realización de pruebas de hipótesis para determinar significancia estadística.
3. **Modelos predictivos:** Entrenamiento de algoritmos de _Machine Learning_ donde los datos actúan como variables independientes (_features_) para predecir variables dependientes (regresiones).

#### Diferenciación clave

A diferencia de los datos cualitativos (que categorizan), los cuantitativos **cuantifican**. Esta precisión permite no solo describir el estado de un sistema, sino proyectar tendencias futuras mediante modelos matemáticos robustos.