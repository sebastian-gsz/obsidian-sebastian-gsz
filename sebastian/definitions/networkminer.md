---
def-type: atomic
version: 1.0
id: def-networkminer
status: estandar
category: ciberseguridad
contexto: analisis-de-trafico
date: 2026-11-11
tags:
  - ciberseguridad
  - forense
  - pcap
  - analisis-de-trafico
aliases:
  - networkminer
  - network miner
---
**NetworkMiner** es una herramienta que **realiza análisis de tráfico de red para analizar archivos PCAP y extraer artefactos**: una herramienta de análisis forense de red (NSFA — _Network Forensic Analysis Tool_) que toma una captura y, sin configurar nada, extrae de ella los archivos transferidos, las credenciales, los hosts, las sesiones y las imágenes que cruzaron la red.

#### Qué Extrae de un PCAP

-  **Archivos reconstruidos**: documentos, imágenes, ejecutables que viajaron por HTTP, SMB, FTP, TFTP — reensamblados desde los paquetes.
-  **Credenciales en claro**: usuarios y contraseñas que pasaron por protocolos sin cifrar — la lección forense más dura sobre HTTP plano y autenticaciones antiguas.
-  **Hosts y sesiones**: qué equipos hablaron, con quién, cuándo y cuánto — el mapa de la conversación reconstruido automáticamente.
-  **Parámetros y formularios**: datos enviados en formularios web sin cifrar.

#### El Enfoque Pasivo

NetworkMiner analiza **sin tocar la red**: trabaja sobre capturas ya hechas (PCAP) o tráfico observado pasivamente — cero interferencia, cero paquetes propios. Eso lo hace ideal para forense posterior al incidente y para laboratorios: darle la captura y pedirle la evidencia organizada.

#### Diferencia Crítica: NetworkMiner vs. Wireshark

-  **Wireshark** es el analizador manual: inspección paquete a paquete, filtros precisos, comprensión profunda de protocolos — el bisturí del analista.
-  **NetworkMiner** es el extractor automático: abre el PCAP y te entrega los artefactos ordenados por tipo y host — el cucharón que vacía la caja.
-  El flujo forense real los combina: NetworkMiner para el barrido automático de artefactos; Wireshark para examinar a fondo lo que el barrido señala.

#### Diferencia Crítica: NetworkMiner vs. netsniff-ng

-  **netsniff-ng** captura (produce los PCAP); **NetworkMiner** analiza (los consume y extrae) — capturar y analizar son dos fases, cada una con su herramienta.

### Propósito fundamental

NetworkMiner convierte una captura bruta de paquetes en evidencia organizada: archivos, credenciales, hosts y sesiones extraídos automáticamente — el acelerador del análisis forense de red, que muestra en minutos lo que a mano tomaría horas y prueba con sus hallazgos por qué el tráfico sin cifrar es evidencia contra ti.
