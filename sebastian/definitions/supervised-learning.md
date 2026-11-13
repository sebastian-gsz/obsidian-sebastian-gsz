---
def-type: atomic
version: 1.0
id: def-aprendizaje-supervisado
status: estandar
category: aprendizaje-automático
contexto: ciencia-de-datos
date: 2026-06-26
tags:
  - ml
  - entrenamiento
  - datos-etiquetados
aliases:
  - supervised learning
  - aprendizaje supervisado
---
El aprendizaje supervisado es el paradigma fundamental en el _Machine Learning_ donde el algoritmo se entrena utilizando un conjunto de datos etiquetados (_labeled data_). En este contexto, el "supervisor" es el conjunto de datos de entrenamiento que contiene tanto la entrada (características) como la salida deseada (etiqueta o valor objetivo).

#### Mecanismo de aprendizaje

El objetivo del modelo es aprender una función de mapeo $f(x) = y$, donde $x$ es la entrada y $y$ la salida esperada. El proceso ocurre mediante la minimización iterativa de una **función de pérdida** (_loss function_):

1. **Predicción:** El modelo procesa la entrada y genera una salida estimada.
2. **Evaluación:** El error (diferencia entre la predicción y la etiqueta real) es calculado.
3. **Optimización:** Mediante algoritmos como el gradiente descendente (_gradient descent_), el modelo ajusta sus parámetros internos para reducir ese error en la siguiente iteración.

#### Aplicación técnica: Ciberseguridad

En arquitecturas de seguridad, el aprendizaje supervisado es crítico para la clasificación de datos:

-  **Clasificación de tráfico:** El sistema recibe ejemplos de flujos de red ya etiquetados como "seguro" o "malicioso".
-  **Extracción de patrones:** El modelo aprende las características distintivas (vectores de ataque, frecuencias de conexión, tamaños de carga útil) que definen a cada categoría.
-  **Generalización:** Una vez entrenado, el modelo puede identificar amenazas en tráfico nunca antes visto, categorizando nuevas conexiones basándose en las similitudes aprendidas con los datos de entrenamiento.

#### Tipos de tareas

-  **Clasificación:** Cuando la etiqueta es categórica (ej. "spam" o "no spam", "malicioso" o "benigno").
-  **Regresión:** Cuando la etiqueta es un valor continuo (ej. predecir el tiempo de latencia de una red o el consumo de ancho de banda futuro).

A diferencia del aprendizaje no supervisado, el aprendizaje supervisado requiere una inversión inicial alta en la preparación y limpieza de los datos (etiquetado), pero ofrece resultados mucho más precisos y fáciles de validar para problemas donde se conoce la respuesta esperada.