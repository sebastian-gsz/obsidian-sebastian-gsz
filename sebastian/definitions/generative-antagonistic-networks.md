---
def-type: atomic
version: 1.0
id: def-gan
status: estandar
category: arquitectura-de-redes
contexto: inteligencia-artificial
date: 2026-06-20
tags:
  - ia
  - redes-generativas
aliases:
  - generative adversarial networks
  - gan
  - redes generativas antagónicas
  - generative antagonistic networks
---
Las Generative Adversarial Networks (GAN) son una arquitectura de aprendizaje profundo compuesta por dos modelos neuronales que compiten entre sí en un marco de teoría de juegos. Esta estructura permite que el sistema genere datos sintéticos que imitan las propiedades estadísticas de un conjunto de datos real.

-  **Generador:** Es la red responsable de crear datos nuevos a partir de una entrada de ruido aleatorio, buscando replicar la distribución de probabilidad de los datos reales.
-  **Discriminador:** Actúa como el "juez" de la red; su función es clasificar los datos de entrada para determinar si son auténticos (provenientes del dataset original) o sintéticos (generados por el modelo rival).
-  **Dinámica de entrenamiento:** Se establece un juego de suma cero donde, a medida que el Discriminador mejora su capacidad para detectar falsificaciones, el Generador se ve forzado a optimizar su arquitectura para crear resultados cada vez más realistas con el fin de engañarlo.
-  **Equilibrio de Nash:** El entrenamiento concluye idealmente cuando el Generador produce muestras de alta calidad que el Discriminador ya no puede distinguir eficazmente de los datos reales.