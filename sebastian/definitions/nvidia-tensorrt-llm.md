---
def-type: atomic
version: 1
id: def-tensorrt-llm
status: estandar
category: inteligencia-artificial
date: 2026-08-23
tags:
  - inteligencia-artificial
  - llm
  - tensorrt
  - nvidia
  - inferencia
  - rendimiento
  - tensorrt-llm
aliases:
  - nvidia tensorrt-llm
---
TensorRT-LLM es una biblioteca avanzada desarrollada por NVIDIA diseñada para compilar, acelerar y optimizar de forma integral el rendimiento de la inferencia en modelos de lenguaje grande (LLMs) sobre unidades de procesamiento gráfico (GPUs).

### Características principales

-  **Kernels de atención optimizados**: Incorpora núcleos especializados para acelerar el rendimiento del cálculo de inferencia utilizando formatos de menor precisión.
-  **Batching en proceso (_In-flight batching_)**: Permite agrupar y gestionar las solicitudes de manera dinámica durante la ejecución para maximizar la capacidad de rendimiento del sistema.
-  **Gestión de caché KV**: Optimiza el uso de la memoria mediante el manejo eficiente de la caché de claves y valores, reduciendo la sobrecarga computacional.

### Integración y despliegue

-  **Soporte de cuantización**: Se integra estrechamente con el TensorRT Model Optimizer para dar soporte a recetas de cuantización avanzadas (como FP8 e INT4 AWQ), permitiendo reducir costes y optimizar la latencia.
-  **Alto rendimiento operativo**: Ofrece soluciones optimizadas tanto para escenarios orientados a minimizar la latencia como para maximizar el rendimiento (_throughput_) en producción