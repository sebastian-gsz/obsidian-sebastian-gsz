---
def-type: atomic
version: 1.0
id: def-rag
status: estandar
category: inteligencia-artificial
date: 2026-09-01
tags:
  - inteligencia-artificial
  - llm
  - recuperacion
  - generacion
  - arquitectura
aliases:
  - rag
  - retrieval-augmented generation
  - generación aumentada por recuperación
---
La generación aumentada por recuperación (RAG, por sus siglas en inglés, _Retrieval-Augmented Generation_) es una técnica de arquitectura en inteligencia artificial que combina un sistema de recuperación de información externa con un modelo de lenguaje grande (LLM) para generar respuestas precisas, contextualizadas y basadas en datos fidedignos o privativos.

### Componentes principales

-  **Fase de recuperación (_Retrieval_)**: Ante una consulta del usuario, el sistema busca fragmentos de texto relevantes dentro de una base de datos externa (generalmente una base de datos vectorial) utilizando similitud semántica.
-  **Fase de generación (_Augmented Generation_)**: Los fragmentos recuperados se combinan junto con la consulta original en un mensaje contextualizado que se envía al LLM, el cual formula la respuesta final basándose en esa información complementaria.

### Ventajas operativas

-  **Mitigación de alucinaciones**: Reduce de forma drástica la probabilidad de que el modelo invente información, al restringir la respuesta al contenido provisto en el contexto recuperado.
-  **Actualización de conocimientos**: Permite incorporar datos en tiempo real, documentación corporativa interna o bases de conocimiento dinámicas sin necesidad de someter al modelo a costosos procesos de reentrenamiento.