---
def-type: atomic
version: 1.0
id: def-wazuh
status: estandar
category: ciberseguridad
contexto: detección-de-intrusiones
date: 2026-11-12
tags:
  - wazuh
  - hids
  - soc
  - monitoreo
aliases:
  - wazuh
  - wazuh hids
  - wazuh agent
---
**Wazuh** es un **sistema de detección de intrusiones basado en host (HIDS) que reemplazó a OSSEC** y se utiliza para **monitorear y defender Security Onion**: su **agente de monitoreo liviano se instala en los dispositivos host** de la red y es compatible con **Windows, Linux, Mac OS X, HP-UX, AIX y Solaris** — la capa de detección en cada equipo.

#### Qué Hace el Agente en Cada Host

-  **Integridad de archivos**: vigila qué archivos del sistema cambian — la alteración que delata a un intruso.
-  **Detección de intrusiones**: reglas sobre logs y comportamiento del propio equipo — ataques al host vistos desde dentro.
-  **Inventario y vulnerabilidades**: qué software corre en el host y qué debilidades tiene — visibilidad del endpoint sin tocar la red.
-  **Respuesta activa**: acciones automáticas ante eventos definidos — bloquear IPs, matar procesos.
-  Todo fluye al **manager central** que correlaciona los reportes de todos los agentes — la vista agregada de todos los hosts.

#### Su Lugar en Security Onion

Wazuh es el **HIDS de referencia de Security Onion** (reemplazando al histórico OSSEC): mientras los NIDS (Suricata/Snort) ven el TRÁFICO de la red, Wazuh ve CADA HOST desde dentro — logs, integridad, procesos — la complementariedad red+host que completa la visibilidad del SOC.

#### Diferencia Crítica: Wazuh (HIDS) vs. Suricata/Snort (NIDS)

-  El **NIDS** ve el tráfico que cruza la red — lo que VIAJA entre equipos.
-  El **HIDS** ve lo que pasa DENTRO de cada equipo — archivos, logs, procesos que la red jamás mostraría.
-  Un atacante que no genera tráfico sospechoso pero toca archivos del sistema solo lo delata el HIDS — por eso el monitoreo serio cubre ambos ojos: la red y el host.

### Propósito fundamental

Wazuh es el centinela dentro de cada equipo: agente liviano multiplataforma que vigila integridad, logs y vulnerabilidades desde dentro del host — el HIDS que reemplazó a OSSEC y completa la visión del SOC, porque lo que no cruza la red solo puede verse desde el propio equipo.
