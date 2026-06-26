---
def-type: atomic
version: 1.0
id: def-controles-seguridad
status: estandar
category: mecanismos-de-seguridad
contexto: seguridad-de-la-información
date: 2026-06-26
tags:
  - ciberseguridad
  - mitigación-de-riesgos
  - defensa
aliases:
  - salvaguardias
  - seguridad-operativa
  - security-controls
  - controles de seguridad
---
Los controles de seguridad, también conocidos como salvaguardias o contramedidas, son los mecanismos técnicos y administrativos implementados para reducir el riesgo sobre los activos de información. Su propósito fundamental es operacionalizar la estrategia de seguridad para garantizar la protección de la tríada CIA: **Confidencialidad, Integridad y Disponibilidad**.

#### Clasificación funcional

La eficacia de una arquitectura de seguridad depende del equilibrio entre estos tres tipos de controles:

-  **Controles Preventivos (Antes del incidente):** Actúan como barreras para detener la amenaza antes de que se materialice. Su objetivo es reducir la probabilidad de éxito de un ataque.

    _Ejemplos:_ Cifrado de datos en reposo, firewalls, políticas de contraseñas, segmentación de red, entrenamiento de concienciación.
-  **Controles Detectivos (Durante el incidente):** Identifican cuándo una medida preventiva ha sido superada. Son esenciales para reducir el tiempo de permanencia de un atacante.

    - _Ejemplos:_ Sistemas IDS (Intrusion Detection Systems), auditoría de logs, soluciones SIEM, monitoreo de integridad de archivos.
-  **Controles Correctivos (Después del incidente):** Diseñados para limitar el daño y restaurar el estado operativo tras un evento de seguridad.

    _Ejemplos:_ Backups (copias de seguridad), planes de recuperación ante desastres (DRP), parches de vulnerabilidades, procesos de respuesta ante incidentes.

#### Estrategia de implementación

La implementación de controles no ocurre de forma aislada, sino mediante un enfoque de **defensa en profundidad**. Una arquitectura madura asegura que si un control preventivo falla, exista un control detectivo que alerte sobre la anomalía y un control correctivo que permita mitigar el impacto.

|**Tipo de Control**|**Objetivo Principal**|**Frecuencia de Acción**|
|---|---|---|
|**Preventivo**|Evitar brechas|Constante (proactivo)|
|**Detectivo**|Identificar compromisos|Activo (real-time/periódico)|
|**Correctivo**|Recuperar la normalidad|Reactivo (tras el incidente)|

#### Relación con la gobernanza

Los controles técnicos (firewalls, cifrado) requieren controles administrativos (políticas, procedimientos, auditorías) para ser efectivos. Un control técnico sin una política que lo sustente suele derivar en configuraciones inconsistentes o gestión inadecuada, mientras que una política sin controles técnicos es difícil de hacer cumplir. La verdadera seguridad reside en la alineación entre ambos mundos.