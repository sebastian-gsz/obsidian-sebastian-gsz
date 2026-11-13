---
def-type: atomic
version: 1.0
id: def-syslog
status: estandar
category: redes
contexto: monitoreo-y-observabilidad
date: 2026-11-11
tags:
  - syslog
  - logs
  - protocolos
  - monitoreo
aliases:
  - syslog
  - protocolo syslog
  - protocolo de registro
---
**Syslog** es un **protocolo de red estándar para la transmisión de mensajes de registro (logs)**: un protocolo de **texto plano que utiliza el puerto UDP 514** — el estándar con el que dispositivos de red, servidores y aplicaciones envían sus mensajes de registro a un servidor central de registros.

#### Qué Transmite

Los mensajes de registro contienen la vida del dispositivo — **estado del dispositivo, eventos que ocurren, errores que se producen**. El formato clásico del mensaje:

`<prioridad> <fecha y hora> <identificador de origen> <mensaje>`

-  **Prioridad**: la importancia del mensaje — codifica instalación (_facility_: qué subsistema lo genera) y severidad (de emergencia a debug, en 8 niveles).
-  **Fecha y hora**: cuándo se generó el mensaje — el orden de los hechos.
-  **Identificador de origen**: el dispositivo o aplicación que lo generó.
-  **Mensaje**: el registro en sí — lo que pasó.

#### Por Qué Centraliza Todo

-  Cada equipo escribe sus logs LOCALMENTE — y se pierden si el equipo muere, se borran si el atacante las limpia, se dispersan si hay 200 equipos.
-  Con syslog, **todo fluye al servidor de registros central**: el SIEM lo recoge, correlaciona y alerta — la ingesta de logs es la primera etapa de todo pipeline de observabilidad y detección.
-  La debilidad clásica: **UDP no garantiza entrega** — un log perdido se pierde; versiones sobre TCP/TLS (syslog-sec) añaden fiabilidad y cifrado, y los atacantes saben que el servidor de logs es objetivo prioritario.

#### Diferencia Crítica: Syslog vs. NetFlow

-  **Syslog** transporta **eventos**: lo que el dispositivo QUIERE contar — "fallo de login", "interfaz caída", "configuración cambiada".
-  **NetFlow** transporta **flujos**: el resumen automático del TRÁFICO que cruzó el dispositivo — quién habló con quién y cuánto.
-  Se complementan: el syslog cuenta la historia que el equipo narra; el flujo muestra la que nadie narró — el SIEM serio come de ambos.

### Propósito fundamental

Syslog es el idioma común de los logs de red: un protocolo mínimo de texto plano por el que todo dispositivo cuenta su vida a un servidor central — la materia prima del monitoreo y del SIEM, porque sin logs centralizados, cada incidente queda contado en 200 archivos dispersos que nadie juntará a tiempo.
