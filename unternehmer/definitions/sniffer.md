---
def-type: atomic
version: 1.0
id: def-sniffer
status: estandar
category: herramientas
contexto: redes
date: 2026-06-26
tags:
  - red
  - diagnóstico
  - seguridad
aliases:
  - sniffer
  - packet analyzer
  - analizador de protocolos de red
---
Un analizador de protocolos (o _sniffer_) es una herramienta avanzada, disponible tanto en formato software como hardware, diseñada para interceptar y registrar el tráfico que atraviesa una interfaz de red. A diferencia de las herramientas de monitoreo pasivo de alto nivel, estas permiten realizar una inspección profunda de paquetes (_Deep Packet Inspection_ o DPI) en tiempo real.

#### Capacidades de inspección

Su valor operativo reside en la capacidad de decodificar las distintas capas del modelo OSI:

-  **Visualización de cabeceras:** Análisis detallado de direcciones MAC, IPs de origen/destino, puertos TCP/UDP y banderas de estado.
-  **Inspección de payloads:** Extracción y análisis de la carga útil (contenido de los paquetes), permitiendo identificar comandos maliciosos, fugas de datos o información no cifrada en tránsito.
-  **Reconstrucción de sesiones:** Capacidad de ensamblar paquetes fragmentados para reconstruir flujos de comunicación completos (ej. un archivo transferido vía FTP o una sesión HTTP completa).

#### Uso profesional

-  **Resolución de problemas:** Diagnóstico preciso de problemas de latencia, retransmisiones de paquetes o errores en el _handshake_ de protocolos de comunicación.
-  **Análisis forense digital:** Es el estándar para la recolección de evidencias en red, permitiendo identificar el origen de un ataque, vectores de intrusión o tráfico de exfiltración.
-  **Seguridad ofensiva y defensiva:** Identificación de protocolos no autorizados en la red, detección de escaneo de puertos y análisis de comportamiento de malware que intenta comunicarse con servidores de mando y control (C2).

#### Comandos de captura rápida (cli)

Para análisis rápidos directamente en la terminal, el uso de `tcpdump` es el estándar en entornos Linux:

-  Capturar tráfico en una interfaz específica y guardar en un archivo pcap: `tcpdump -i eth0 -w captura.pcap`
-  Analizar tráfico de un puerto específico ignorando la resolución DNS: `tcpdump -ni eth0 port 443`
-  Capturar solo los paquetes con flags TCP SYN (útil para detectar escaneos): `tcpdump -i eth0 "tcp[tcpflags] & (tcp-syn) != 0"`