---
def-type: atomic
version: 1
id: def-sre
status: estandar
category: ingenieria-de-software
date: 2026-07-24
tags:
  - devops
  - operaciones
  - fiabilidad
  - infraestructura
aliases:
  - site reliability engineering
  - ingeniería de fiabilidad de sitios
  - SRE
---
El site reliability engineering (SRE), o ingeniería de fiabilidad de sitios, es una disciplina de la ingeniería de software que aplica enfoques de la informática y el desarrollo a los problemas de infraestructura y operaciones. Su objetivo principal es ayudar a una organización a crear y gestionar sistemas de software ultra escalables, resilientes y altamente fiables.

### Pilares fundamentales

-  **Automatización**: Reducción sistemática del trabajo manual operativo y repetitivo (conocido como toil) mediante el desarrollo de software de gestión.
-  **Gestión de riesgos**: Control del presupuesto de errores (error budget) para equilibrar la velocidad en el lanzamiento de nuevas características con la estabilidad del servicio.
-  **Monitorización y observabilidad**: Recopilación y análisis de métricas, registros y trazas para conocer el comportamiento y la salud interna de los sistemas en tiempo real.
-  **Respuesta a incidentes**: Mitigación rápida de fallos en producción complementada con análisis post mortem orientados al aprendizaje sin buscar culpables (blameless post-mortems).

### Conceptos clave

-  **SLI (service level indicator)**: Métrica cuantitativa que evalúa el nivel de rendimiento o servicio proporcionado.
-  **SLO (service level objective)**: Objetivo interno de fiabilidad definido para un SLI específico durante un periodo de tiempo.
-  **SLA (service level agreement)**: Acuerdo formal o contrato de nivel de servicio que establece compromisos comerciales y penalizaciones con los clientes si se incumplen los objetivos.