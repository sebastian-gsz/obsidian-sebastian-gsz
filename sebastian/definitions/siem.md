---
def-type: atomic
version: 1.0
id: def-siem
status: estandar
category: ciberseguridad
contexto: monitoreo-y-observabilidad
date: 2026-11-11
tags:
  - siem
  - logs
  - ciberseguridad
  - correlacion
aliases:
  - gestión de eventos e información de seguridad
  - security information and event management
  - siem
---
Un **SIEM** (_Security Information and Event Management_ — gestión de eventos e información de seguridad) es una aplicación que **recopila, correlaciona y analiza los registros (logs) de toda la organización para detectar amenazas y monitorear actividades críticas**: es el centro nervioso donde convergen los logs de firewalls, sistemas, aplicaciones y endpoints para convertirse en detección.

#### Cómo Funciona

-  **Recopilación**: ingiere logs de todas las fuentes — dispositivos de red, servidores, aplicaciones, antivirus, usuarios.
-  **Normalización**: convierte formatos dispares (syslog, JSON, eventos de Windows) en un esquema común analizable.
-  **Correlación**: la función que lo define — cruza eventos entre fuentes para construir ataques que un log aislado no revela: un login fallido aquí, uno exitoso allá, y una escalada de privilegios después = posible compromiso.
-  **Detección y respuesta**: reglas y alertas sobre patrones (fuerza bruta, anomalías, firmas) más dashboards y retención para investigación forense.

#### El Stack de Elastic como SIEM

Un SIEM moderno se puede construir sobre el _Elastic Stack_: los agentes ligeros recolectan y envían los logs, el motor de búsqueda los indexa y los hace consultables, y las herramientas de alertado aplican reglas sobre los datos almacenados para disparar avisos — cada pieza del pipeline cumple una etapa del SIEM (recopilar → almacenar → correlacionar → alertar).

#### Diferencia Crítica: SIEM vs. Gestión de Logs

-  La **gestión de logs** almacena y permite buscar registros — responde "¿qué pasó hace dos semanas?".
-  El **SIEM** además **correlaciona y alerta en vivo** — responde "¿está pasando algo malo ahora mismo?".
-  Guardar logs es memoria; el SIEM es esa memoria vigilando en tiempo real. Sin correlación, mil logs separados nunca cuentan la historia del ataque que los conecta.

### Propósito fundamental

El SIEM resuelve el problema de la fragmentación: los indicios de un ataque están repartidos entre decenas de sistemas que no se hablan entre sí — al centralizarlos y correlacionarlos, convierte eventos aislados y mudos en la narrativa completa de un incidente, y en la alerta que llega a tiempo.
