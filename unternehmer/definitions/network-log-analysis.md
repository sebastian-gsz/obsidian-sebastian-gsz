---
def-type: atomic
version: 1.0
id: def-analisis-logs
status: estandar
category: procesos
contexto: ciberseguridad
date: 2026-06-26
tags:
  - red
  - seguridad
  - forense
  - observabilidad
aliases:
  - análisis de logs
  - network log analysis
  - análisis de registros de red
---
El análisis de registros (logs) es la disciplina técnica consistente en la recolección, normalización, indexación y examen crítico de los eventos generados por dispositivos de red, sistemas operativos y aplicaciones. En un ecosistema de infraestructura, estos registros actúan como el testigo silencioso de toda actividad, desde conexiones legítimas hasta intentos de intrusión.

#### Finalidad operativa

El objetivo principal es transformar datos crudos en inteligencia accionable. Esto implica:

-  **Detección de anomalías:** Identificar patrones que se desvíen de la línea base operativa (ej. un pico inusual de tráfico, accesos en horarios atípicos o fallos de autenticación masivos).
-  **Investigación forense:** Reconstruir la cronología de eventos tras un incidente de seguridad para determinar el alcance y el vector de ataque.
-  **Cumplimiento y auditoría:** Mantener un registro inalterable para demostrar el cumplimiento de normativas de seguridad (ej. PCI-DSS, ISO 27001).

#### Gestión centralizada y SIEM

En entornos modernos, el análisis de logs trasciende el análisis manual en servidor. Se implementan soluciones **SIEM (Security Information and Event Management)** que centralizan los logs de fuentes heterogéneas (firewalls, WAF, balanceadores, routers). Estas herramientas realizan la correlación de eventos en tiempo real, aplicando reglas de detección para alertar a los equipos de SOC (Security Operations Center) solo cuando un patrón específico representa una amenaza real.

#### Comandos de análisis en cli

Para análisis rápidos o resolución de problemas en entornos Linux, estos comandos son fundamentales:

- **Filtrar intentos fallidos de inicio de sesión:** `grep "failed password" /var/log/auth.log`
- **Consultar logs de un servicio específico en la última hora:** `journalctl -u nginx --since "1 hour ago"`
- **Monitorizar tráfico denegado en tiempo real:** `tail -f /var/log/syslog | grep "DENY"`
- **Analizar frecuencias de IPs que conectan al sistema:** `awk '{print $1}' /var/log/access.log | sort | uniq -c | sort -nr`