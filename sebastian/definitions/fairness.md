---
def-type: atomic
version: 1.0
id: def-equidad
status: estandar
category: inteligencia-artificial
contexto: analisis-de-datos
date: 2026-11-11
tags:
  - machine-learning
  - sesgos
  - etica
  - ciencia-de-datos
aliases:
  - equidad
  - equidad algorítmica
  - fairness
---
La **equidad** (_fairness_) es la cualidad de un análisis de datos o modelo de _machine learning_ que **no genera sesgos ni reafirma los ya existentes** en los datos con los que fue construido. Un sistema equitativo no otorga ventajas ni desventajas sistemáticas a grupos de personas por atributos como género, etnia o edad, salvo que exista una justificación legítima y medible.

#### De Dónde Nacen los Sesgos

-  **Sesgo de muestreo**: los datos de entrenamiento no representan a toda la población (entrenar un detector de rostros solo con un tipo de fisionomía).
-  **Sesgo histórico**: los datos reflejan decisiones pasadas injustas — si históricamente se concedieron menos préstamos a un barrio, un modelo entrenado con eso aprende a discriminarlo.
-  **Sesgo de medición y etiquetado**: las variables o etiquetas se miden con mayor error para ciertos grupos.

#### Formas de Medirla

-  **Equidad por ceguera (_fairness through unawareness_)**: excluir la variable sensible del modelo. Ingenua: otras variables correlacionadas (código postal) la filtran igual.
-  **Paridad demográfica**: que la tasa de resultados positivos sea similar entre grupos.
-  **Igualdad de oportunidades / _equalized odds_**: que los errores (falsos positivos y falsos negativos) se distribuyan por igual entre grupos.

#### Diferencia Crítica: Equidad vs. Precisión

Un modelo puede ser muy preciso en promedio y a la vez profundamente inequitativo: acertar el 95% del total mientras falla el 40% de los casos de un grupo minoritario. La precisión es un promedio que oculta la distribución de los errores; la equidad obliga a desagregar las métricas por grupo. Además, optimizar solo la precisión global suele **maximizar** el sesgo, porque el camino estadísticamente fácil es reproducir el patrón histórico.

### Propósito fundamental

La equidad convierte una pregunta técnica (¿qué tan bien predice el modelo?) en una pregunta social (¿a quién beneficia y a quién perjudica esa predicción?): medirla por grupos y auditarla es inseparable del análisis de datos moderno, porque un modelo sesgado automatiza y escala la injusticia que aprendió de sus datos.
