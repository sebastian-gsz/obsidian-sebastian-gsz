---
def-type: atomic
version: 1.0
id: def-soar
status: estandar
category: ciberseguridad
contexto: operaciones
date: 2026-11-11
tags:
  - soar
  - soc
  - automatizacion
  - respuesta
aliases:
  - soar
  - security orchestration automation and response
  - orquestación automatización y respuesta de seguridad
---
**SOAR** (_Security Orchestration, Automation and Response_ — orquestación, automatización y respuesta de seguridad) es una **plataforma de software que ayuda a las organizaciones a automatizar las tareas de seguridad y responder a los incidentes de forma más eficaz**: el brazo ejecutor del SOC — convierte las playbooks en flujos automáticos que actúan sin esperar al analista.

#### Sus Tres Capacidades

-  **Orquestación**: integra y coordina múltiples herramientas — el SIEM, el EDR, el firewall, el sandbox, el ticketing — hablando entre sí a través del SOAR en vez de a mano en cada consola.
-  **Automatización**: las tareas repetitivas se ejecutan solas — enriquecer una alerta (¿es esta IP maliciosa? ¿qué hash es?), contener un endpoint, recopilar evidencia — reduciendo la carga manual en recolección de datos, análisis y reportes.
-  **Respuesta**: ejecuta acciones predefinidas o guías al analista — **playbooks** automatizados para amenazas específicas (bloquear la IP, aislar el host, forzar cambio de contraseña).

#### El Efecto en el SOC

-  El analista deja de ser operador manual de rutinas: el SOAR ejecuta el 80% repetitivo y el humano decide el 20% que exige criterio.
-  El tiempo de respuesta se mide en segundos, no en horas — la contención automática de una IP maliciosa ocurre mientras la alerta aún está caliente.
-  La alerta fatiga se combate: triage automático que cierra los falsos positivos obvios y escala solo lo que merece cerebro humano.

#### Su Lugar en el Pipeline

La cadena del SOC moderno: **SIEM** detecta y alerta → **SOAR** enriquece, decide y ejecuta la respuesta (con aprobación humana donde el playbook la exige) → **ITSM** documenta el incidente → el analista supervisa y mejora los playbooks.

#### Diferencia Crítica: SOAR vs. SIEM

-  El **SIEM** DETECTA: correlaciona y alerta — dice "algo pasa".
-  El **SOAR** RESPONDE: orquesta las herramientas y ejecuta — hace "algo pasa → algo está contenido".
-  Se emparejan frecuentemente (el SIEM alimenta, el SOAR actúa) — pero son capas distintas: detección frente a ejecución.

#### Diferencia Crítica: SOAR vs. ITSM

-  El **ITSM** organiza el PROCESO: tickets, prioridades, SLAs, aprobaciones.
-  El **SOAR** ejecuta la ACCIÓN técnica: los playbooks que tocan las herramientas.
-  En la arquitectura madura el SOAR actualiza el ticket del ITSM al ejecutar cada paso — la automatización viviendo dentro del proceso.

### Propósito fundamental

El SOAR es el automatizador del SOC: orquesta las herramientas, ejecuta los playbooks y responde en segundos lo que un analista tardaría horas — la capa que hace escalable la respuesta a incidentes, porque el volumen de alertas moderno no se gana a mano: se orquesta, se automatiza y se deja al humano lo que solo el humano sabe decidir.
