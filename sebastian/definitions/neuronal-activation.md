---
def-type: atomic
version: 1.0
id: def-activacion-neuronal
status: estandar
category: fundamentos-matemáticos
contexto: aprendizaje-profundo
date: 2026-06-26
tags:
  - ia
  - redes-neuronales
aliases:
  - activación neuronal
  - neuronal activation
---
La función de activación es el componente matemático aplicado a la salida ponderada de una neurona artificial. Su propósito es introducir una transformación no lineal a los datos antes de que la señal sea transmitida a la siguiente capa de la red.

#### Importancia de la no linealidad

Sin funciones de activación no lineales, una red neuronal, independientemente de la cantidad de capas o neuronas que contenga, se comportaría matemáticamente como un único modelo de regresión lineal.

La no linealidad es lo que permite a la red:

-  **Modelar complejidad:** Aprender patrones complejos y no lineales presentes en datos del mundo real, como la detección de objetos en imágenes, la traducción de lenguaje natural o la generación de voz.
-  **Aproximación universal:** Según el teorema de aproximación universal, una red neuronal con al menos una capa oculta y una función de activación no lineal puede aproximar cualquier función continua, permitiendo el aprendizaje de funciones de decisión altamente complejas.

#### Tipos comunes

-  **ReLU (Rectified Linear Unit):** Es la más utilizada en arquitecturas profundas debido a su eficiencia computacional y a que ayuda a mitigar el problema del desvanecimiento del gradiente.
-  **Sigmoid:** Comprime la salida en un rango de (0, 1). Fue muy popular en redes antiguas, pero se usa menos en capas ocultas debido a que satura el gradiente.
-  **Tanh (Tangente hiperbólica):** Similar a Sigmoid, pero centra la salida en el rango (-1, 1), lo que a menudo ayuda a que la red converja más rápido durante el entrenamiento.