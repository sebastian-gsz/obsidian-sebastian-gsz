---
def-type: atomic
version: 1.0
id: def-regresion
status: estandar
category: modelos-predictivos
contexto: ciencia-de-datos
date: 2026-06-20
tags:
  - estadística
  - machine-learning
aliases:
  - regresión
  - regresión lineal
  - linear regression
  - regression
---
La regresión es un tipo de modelo de aprendizaje supervisado cuyo objetivo fundamental es predecir un valor numérico continuo. A diferencia de los modelos de clasificación, que asignan una etiqueta discreta a una entrada (ej. "spam" o "no spam"), la regresión cuantifica una magnitud (ej. cuánto costará una vivienda, qué temperatura hará, o qué ingresos proyectará una empresa).

#### Conceptos Fundamentales

-  **Diferenciación Clave:** Mientras que la clasificación se enfoca en "qué es" el objeto, la regresión responde a la pregunta de "cuánto".
-  **Relación entre variables:** El modelo busca establecer una relación matemática (generalmente una función) entre las variables independientes ($X$, características) y una variable dependiente continua ($Y$, el objetivo).
-  **Optimización:** En la regresión lineal, se busca encontrar la "línea de mejor ajuste" (o hiperplano en dimensiones superiores) que minimice la diferencia entre los valores predichos por el modelo y los valores reales observados en los datos de entrenamiento (comúnmente usando el método de Mínimos Cuadrados Ordinarios).

#### Tipos Comunes

-  **Regresión Lineal Simple:** Analiza la relación entre una sola variable independiente y una dependiente usando una línea recta ($y = mx + b$).
-  **Regresión Lineal Múltiple:** Utiliza múltiples variables independientes para predecir la dependiente, permitiendo modelar problemas más complejos.
-  **Regresiones No Lineales:** Modelos donde la relación entre las variables no sigue una línea recta, permitiendo capturar curvas o relaciones más complejas en los datos (ej. regresión polinómica).

#### Aplicabilidad

Es la piedra angular de la ciencia de datos para tareas de pronóstico (_forecasting_), análisis de tendencias, y cuantificación de impacto de variables específicas sobre un resultado final.