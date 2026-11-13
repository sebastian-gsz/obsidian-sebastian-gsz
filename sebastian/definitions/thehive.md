---
def-type: atomic
version: 1.0
id: def-thehive
status: estandar
category: ciberseguridad
contexto: operaciones
date: 2026-11-12
tags:
  - soc
  - respuesta-a-incidentes
  - plataforma
aliases:
  - thehive
  - the hive
  - thehive project
---
**TheHive** es una **plataforma de respuesta a incidentes de seguridad y sistema de gestión de casos** (_Security Incident Response Platform_, SIRP) **integrado con MISP** (_Malware Information Sharing Platform_ — plataforma de compartición de información de malware): el centro donde el SOC gestiona cada incidente como un caso — con tareas, evidencia, colaboradores e historial.

#### Qué Ofrece

-  **Gestión de casos**: cada incidente es un CASE — con descripción, severidad, tareas asignadas, observables (IOCs) y línea de tiempo — el expediente completo del incidente.
-  **Integración con MISP**: comparte y consume inteligencia de malware — los IOCs de la comunidad entran en tus casos, y los tuyos salen al ecosistema.
-  **Colaboración multi-analista**: varios analistas trabajan el mismo caso con roles y trazabilidad — el incidente deja de vivir en el chat y el correo.
-  **Conexión con el pipeline**: las alertas del SIEM llegan a TheHive (vía crawlers/昇 integration), se convierten en casos, y las respuestas se ejecutan — frecuentemente orquestadas con Cortex (su compañero de análisis) y en flujo con SOAR.

#### Su Lugar en el Pipeline del SOC

La cadena de gestión: **SIEM** detecta → **TheHive** convierte la alerta en caso investigable y documentado → **SOAR** ejecuta las respuestas → el caso cierra con evidencia y lecciones. TheHive aporta la capa que el SIEM no tiene: la GESTIÓN del incidente como expediente colaborativo.

#### Diferencia Crítica: TheHive vs. SIEM

-  El **SIEM** detecta y correlaciona: dice "aquí pasa algo" — la máquina de señales.
-  **TheHive** gestiona la RESPUESTA: convierte la señal en caso, tareas, evidencia y cierre — la máquina de expedientes.
-  Uno alimenta al otro: sin SIEM no hay señales; sin TheHive (o su equivalente), las señales se investigan por chat y se pierden sin documentar.

### Propósito fundamental

TheHive es el expediente digital del incidente: convierte las alertas del SOC en casos gestionables — con tareas, evidencia, colaboración e inteligencia compartida vía MISP — porque la respuesta a incidentes sin gestión documentada no escala, no aprende y no se defiende ante nadie.
