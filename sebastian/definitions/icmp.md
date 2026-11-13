---
def-type: atomic
version: 1.0
id: def-icmp
status: estandar
category: protocolos-de-red
contexto: diagnostico-de-red
date: 2026-11-11
tags:
  - icmp
  - ping
  - redes
  - diagnostico
aliases:
  - internet control message protocol
  - icmp
---
**ICMP** (_Internet Control Message Protocol_ — protocolo de mensajes de control de Internet) es un protocolo de la **capa de red** utilizado principalmente para **determinar si los datos llegan o no a su destino a su debido tiempo**: es el mensajero de control del propio IP — no transporta datos de aplicación, sino información sobre el estado del envío.

#### Mensajes Principales

-  **Echo Request / Echo Reply**: el par que sustenta **ping** — "¿estás ahí?" y "sí, y tardó X ms": la prueba básica de alcanzabilidad y latencia.
-  **Destination Unreachable**: un router avisa que el destino no se alcanzó (red inexistente, host caído, firewall bloqueando).
-  **Time Exceeded**: el TTL del paquete llegó a cero — la base de **traceroute**, que provoca estos mensajes deliberadamente para revelar cada salto del camino.
-  Otros: redirecciones, avisos de fragmentación necesaria, control de congestión básico.

#### Diferencia Crítica: ICMP vs. TCP/UDP

-  **TCP y UDP transportan los datos** de las aplicaciones: conexiones, puertos, fiabilidad o velocidad.
-  **ICMP no tiene puertos ni carga útil de aplicación**: es mensajería de control e informe de errores que IP usa para reportar problemas del propio envío.
-  Por eso los ping y traceroute no son "conexiones": son interrogatorios de control — y por eso un servicio puede estar caído y aun así responder ping (el host vive; la aplicación no).

#### ICMP y Seguridad

-  **Reconocimiento**: un ping sweep barre una red con echo requests para descubrir hosts vivos — por eso los firewalls suelen filtrar ICMP de entrada.
-  **Floods**: inundaciones de echo request (smurf, ping de la muerte históricos) usan ICMP para agotar objetivos.
-  El equilibrio correcto: filtrar el ICMP entrante no esencial pero permitir los mensajes de error salientes — sin ellos, la depuración de conectividad (PMTUD incluido) se vuelve ciega.

### Propósito fundamental

ICMP es el sistema de información y alerta de la capa de red: mientras TCP y UDP entregan la carga, ICMP reporta cómo va el viaje — y de esa mensajería nacen las herramientas de diagnóstico fundamentales (ping, traceroute) y buena parte de la visibilidad que un administrador tiene sobre su red.
