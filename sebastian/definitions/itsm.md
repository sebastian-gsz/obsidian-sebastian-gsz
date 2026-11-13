---
def-type: atomic
version: 1.0
id: def-itsm
status: estandar
category: ciberseguridad
contexto: operaciones
date: 2026-11-11
tags:
  - itsm
  - soc
  - workflows
  - gestion
aliases:
  - itsm
  - sistema de gestión de servicios de ti
  - it service management
---
Un **sistema de gestión de servicios de TI (ITSM)** es un **conjunto de herramientas de flujo de trabajo que recopila y gestiona los datos de incidentes** de las herramientas y dispositivos de seguridad **en un flujo de trabajo automatizado y estructurado que ayuda al SOC a priorizar las amenazas**. Un ejemplo popular de ITSM es **ServiceNow**.

#### Qué Aporta al SOC

-  **La vía formal del incidente**: la alerta del SIEM se convierte en TICKET — con dueño, prioridad, estado, SLA y trazabilidad completa de cada acción.
-  **Priorización estructurada**: los incidentes entran en colas con criterios de negocio (impacto × urgencia) — no se investiga lo que más ruido hace, sino lo que más importa.
-  **Automatización del flujo**: asignación, escalado, notificaciones y cierres siguen el proceso definido — sin que el analista recuerde los pasos administrativos.
-  **La memoria operativa**: cada incidente deja registro — lecciones, patrones, tiempos — la materia prima de las métricas (MTTD/MTTR) y de la mejora continua.

#### Sus Vecinos en el Pipeline del SOC

El flujo completo de un incidente moderno: **SIEM** detecta y alerta → **ITSM** convierte la alerta en incidente gestionado con prioridad y trazabilidad → el analista investiga → **SOAR** automatiza las respuestas repetitivas → el ticket cierra con evidencia. El ITSM es la capa de gestión que ordena el trabajo entre las herramientas de detección y las de respuesta.

#### Diferencia Crítica: ITSM vs. SIEM

-  El **SIEM** detecta: correlaciona logs y dispara alertas — la máquina de señales.
-  El **ITSM** gestiona: convierte cada señal en un incidente con proceso, prioridad y responsable — la máquina del flujo de trabajo.
-  Uno sin el otro: alertas sin gestión se pierden en el ruido; tickets sin señales son burocracia vacía — el SOC maduro une detección y gestión en un solo flujo.

#### Diferencia Crítica: ITSM vs. SOAR

-  El **SOAR** automatiza la RESPUESTA técnica: playbooks que contienen, enriquecen y remedían.
-  El **ITSM** organiza el PROCESO administrativo: tickets, aprobaciones, escalados, SLAs y comunicación.
-  En las arquitecturas modernas convergen — el SOAR ejecuta los pasos técnicos y actualiza el ticket del ITSM: la automatización dentro del proceso.

### Propósito fundamental

El ITSM es la disciplina que convierte las alertas de seguridad en trabajo gestionado: incidentes con dueño, prioridad, SLA y trazabilidad — la diferencia entre un SOC que alerta y un SOC que opera — porque detectar sin gestionar produce caos documentado, y gestionar sin detectar produce papeles sin amenazas.
