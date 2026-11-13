---
def-type: atomic
version: 1.0
id: def-aprendizaje-no-supervisado
status: estandar
category: aprendizaje-automático
contexto: ciencia-de-datos
date: 2026-06-26
tags:
  - ml
  - patrones
  - deteccion-de-anomalias
aliases:
  - unsupervised learning
  - aprendizaje no supervisado
---
El aprendizaje no supervisado es un paradigma de entrenamiento donde el sistema recibe datos sin etiquetas ni respuestas correctas predefinidas. El algoritmo debe explorar el conjunto de datos de forma autónoma para descubrir estructuras ocultas, agrupaciones (_clustering_) o asociaciones latentes, sin la intervención de una variable objetivo externa.

#### Mecanismo de descubrimiento

A diferencia del aprendizaje supervisado, el modelo no busca minimizar el error contra una respuesta conocida, sino maximizar la coherencia estructural interna de los datos:

-  **Agrupación (_clustering_):** Segmenta los datos basándose en similitudes intrínsecas, agrupando elementos que comparten características comunes en el espacio vectorial.
-  **Reducción de dimensionalidad:** Simplifica conjuntos de datos complejos proyectándolos en dimensiones menores, preservando la estructura esencial de la información.
-  **Asociación:** Identifica reglas que describen grandes porciones de datos, detectando relaciones de co-ocurrencia entre eventos.

#### Aplicación en ciberseguridad

Es la herramienta fundamental para la **detección de anomalías** (_anomaly detection_):

-  **Definición de línea base:** El modelo aprende qué constituye el comportamiento "normal" mediante la exposición continua a tráfico o actividad estándar.
-  **Identificación de desviaciones:** Al modelar la normalidad sin etiquetas previas, el sistema dispara alertas ante patrones de tráfico inusuales que se desvían de dicha norma estadística.
-  **Detección de Zero-day:** Esta capacidad es crítica para descubrir ataques desconocidos o variantes de malware que no cuentan con firmas de seguridad. El sistema identifica la amenaza basándose en la anomalía del comportamiento, no en la coincidencia con patrones de ataque conocidos.

#### Algoritmos clave

-  **K-means:** Utilizado para la segmentación efectiva de datos en _clusters_.
-  **Isolation Forest:** Ampliamente aplicado en ciberseguridad para aislar _outliers_ y anomalías en grandes volúmenes de datos.
-  **PCA (Principal Component Analysis):** Empleado para la simplificación y visualización de estructuras complejas.

Este enfoque es esencial en entornos donde el etiquetado de datos es costoso o inexistente, permitiendo al sistema descubrir amenazas o patrones emergentes que el conocimiento humano aún no ha formalizado.

![[machine-learning-task.jpg]]