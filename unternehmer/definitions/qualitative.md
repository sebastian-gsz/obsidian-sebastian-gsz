---
def-type: atomic
version: 1.0
id: def-datos-cualitativos
status: estandar
category: estadística-descriptiva
contexto: ciencia-de-datos
date: 2026-06-26
tags:
  - estadística
  - investigación
  - datos
aliases:
  - datos cualitativos
  - datos categóricos
  - qualitative
  - cualitativos
---
Los datos cualitativos representan variables que describen cualidades, características o atributos de un fenómeno. A diferencia de los datos cuantitativos, no se miden numéricamente, sino que se categorizan en grupos o clases, expresándose mediante texto, imágenes, audio o video.

#### Propiedades fundamentales

- **Inoperabilidad aritmética:** Por naturaleza, no admiten operaciones matemáticas directas (suma, promedio). El análisis se centra en la frecuencia, la proporción, la moda y la identificación de patrones, temas o estructuras subyacentes.
- **Naturaleza subjetiva/descriptiva:** Buscan capturar la esencia o el "por qué" de un fenómeno, en lugar del "cuánto".

#### Clasificación jerárquica

La distinción entre estas subcategorías define el poder estadístico y el tipo de análisis que se puede realizar:

-  **Nominales:** Etiquetas o nombres que no poseen un orden lógico o jerarquía intrínseca. La relación entre categorías es de igualdad o diferencia (ej. sexo, país de origen, color de ojos).
-  **Ordinales:** Categorías que mantienen un orden lógico, jerárquico o de rango, aunque la distancia entre valores no sea necesariamente cuantificable o constante (ej. niveles de satisfacción "bajo, medio, alto", rangos académicos, intensidad del dolor).

#### Metodología de análisis

En la ciencia de datos moderna, el tratamiento de estos datos implica técnicas de:

-  **Codificación temática:** Conversión de texto no estructurado en categorías analizables.
-  **Análisis de sentimiento:** Asignación de valores cualitativos a opiniones textuales.
-  **Transformación (Encoding):** Preparación para modelos de _Machine Learning_ mediante técnicas como _One-Hot Encoding_ (para nominales) o _Label Encoding_ (para ordinales), permitiendo que los algoritmos procesen esta información como vectores matemáticos.

