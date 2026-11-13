---
def-type: atomic
version: 1
id: def-nvidia-tensorrt-model-optimizer
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
  - quantization
aliases:
  - NVIDIA TensorRT Model Optimizer
  - tensorrt model optimizer
---
El **NVIDIA TensorRT Model Optimizer** (`nvidia-modelopt`) es una biblioteca integral desarrollada por NVIDIA que proporciona técnicas avanzadas de optimización de modelos de aprendizaje profundo (tanto posteriores al entrenamiento [PTQ] como conscientes del entrenamiento [QAT]), con el objetivo de reducir la complejidad de las redes y acelerar la velocidad de inferencia en GPUs de NVIDIA de arquitecturas modernas como Hopper o Ada Lovelace.

### Técnicas principales de optimización

-  **Cuantización:** Reduce la precisión numérica de los pesos y activaciones empleando formatos avanzados.
    
    -  **Aceleración con FP8:** Utiliza de forma específica el formato `FP8E4M3` para acelerar la inferencia manteniendo un excelente equilibrio de precisión frente a formatos de 16 bits como BF16 o FP16.
    - **Recetas y perfiles:** Incluye configuraciones estándar como `mtq.FP8_DEFAULT_CFG` para aplicar cuantización simétrica en pesos y  activaciones. Permite configurar precisión mixta por capas (combinando bloques de atención con bloques MLP en NVFP4 o INT4), ajustar la granularidad del escalado (por tensor o por canal) y excluir módulos sensibles (como la capa de proyección final `lm_head` o las incrustaciones iniciales).
-  **Poda y destilación:** Facilita la eliminación de parámetros redundantes en arquitecturas sobredimensionadas y la transferencia de conocimiento hacia modelos más compactos sin pérdida crítica de precisión.
-  **Espaciosidad (sparsity):** Aprovecha la estructura de pesos dispersos para optimizar el rendimiento de cálculo en el hardware compatible.

### Integración y despliegue

-  **Compatibilidad con el ecosistema:** Se integra de forma nativa con motores de despliegue como TensorRT, TensorRT-LLM y vLLM, optimizando modelos de lenguaje grande (LLMs), modelos visuales y de difusión.
-  **APIs modulares:** Ofrece interfaces de programación en Python orientadas a combinar distintas estrategias de compresión de manera sencilla y reproducible.