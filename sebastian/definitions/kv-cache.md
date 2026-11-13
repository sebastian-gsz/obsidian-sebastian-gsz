---
def-type: atomic
version: 1.0
id: def-kv-cache
status: estandar
category: inteligencia-artificial
date: 2026-08-23
tags:
  - inteligencia-artificial
  - llm
  - rendimiento
  - memoria
aliases:
  - kv cache
  - caché kv
  - key-value cache
---
La caché KV (_Key-Value Cache_) es un componente y mecanismo de optimización clave en la arquitectura de inferencia de los modelos de lenguaje grande (LLMs) que gestiona y almacena los vectores de claves y valores de las capas de atención.
### Características principales

-  **Optimización de memoria**: Optimiza el uso de la memoria mediante el manejo eficiente de la caché de claves y valores, reduciendo significativamente la sobrecarga computacional durante la generación de texto.
-  **Reducción de recálculos**: Evita recalcular las representaciones de atención para los tokens ya procesados en pasos anteriores de la inferencia autoregresiva, mejorando la velocidad de respuesta.
### Evolución y optimización avanzada

-  **Cuantización de caché KV**: Marcos avanzados de optimización incorporan técnicas como la cuantización de la caché KV a formatos de precisión reducida (por ejemplo, FP8 KV), lo que permite comprimir su huella en la memoria de la GPU y escalar hacia contextos de mayor longitud