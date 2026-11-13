---
def-type: atomic
version: 1.0
id: def-buffer
status: estandar
category: desarrollo-software
contexto: gestion-de-memoria
date: 2026-09-24
tags:
  - buffer
  - memoria
  - rendimiento
  - concurrencia
  - E/S
aliases:
  - memoria intermedia
  - búfer
---
Un buffer, o memoria intermedia, es un espacio de almacenamiento temporal en la memoria RAM reservado para retener datos mientras se transfieren de un lugar a otro, permitiendo compensar las diferencias de velocidad de procesamiento o tasa de transferencia entre distintos dispositivos o procesos.

### Propósito fundamental

-  **Compensación de velocidad:** Permite que un componente rápido no tenga que esperar a uno lento, almacenando los datos de manera temporal hasta que el receptor esté listo para procesarlos.
-  **Flujo continuo:** Evita interrupciones en la transmisión de datos, asegurando una ejecución estable en operaciones de entrada y salida (E/S) y flujos de red.

### Tipos comunes

-  **Buffer circular:** Estructura de datos que utiliza un espacio de tamaño fijo como si estuviera conectado extremo con extremo, ideal para la gestión eficiente de colas de mensajes y streaming.
-  **Doble búfer (double buffering):** Técnica que emplea dos áreas de memoria para alternar entre lectura y escritura de forma sincronizada, muy utilizada en renderizado gráfico para evitar parpadeos visuales.

### Riesgos asociados

-  **Desbordamiento de buffer:** Vulnerabilidad de seguridad que ocurre cuando un programa intenta escribir más datos de los que el búfer puede contener, sobrescribiendo zonas de memoria adyacentes y comprometiendo la estabilidad o seguridad del sistema.