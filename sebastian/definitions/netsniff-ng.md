---
def-type: atomic
version: 1.0
id: def-netsniff-ng
status: estandar
category: ciberseguridad
contexto: analisis-de-trafico
date: 2026-11-11
tags:
  - ciberseguridad
  - captura
  - linux
  - pcap
aliases:
  - netsniff-ng
  - netsniff
---
**netsniff-ng** es un **kit de herramientas de red Linux de alto rendimiento que captura el tráfico de red a través de un puerto SPAN (mirror), un TAP o un intermediario de paquetes, guardándolo en forma de archivos PCAP**: captura pasiva de máxima velocidad — diseñado para no perder ni un paquete incluso a caudales enormes.

#### Cómo Trabaja

-  **Origen del tráfico**: el espejo del switch (_SPAN_ — el puerto al que el switch copia el tráfico de otros puertos), un **TAP** físico (derivación directa del cable) o un intermediario — netsniff-ng no interviene la red: solo escucha.
-  **Captura cero-copia**: su técnica estrella — los paquetes pasan del kernel al disco con copias mínimas, lo que le permite sostener capturas a velocidad de línea (10G+) donde otras herramientas descartan paquetes.
-  **Salida PCAP**: guarda en el formato estándar de capturas — que Wireshark, NetworkMiner o cualquier analizador puede abrir después.

#### El Kit Completo

netsniff-ng no es una sola herramienta sino un ** conjunto**: incluye trafgen (generación de paquetes), flowtop (visualización de flujos en vivo), ifpps (métricas de red por CPU) y más — un cuchillo suizo de tráfico en línea de comandos.

#### Diferencia Crítica: netsniff-ng vs. NetworkMiner

-  **netsniff-ng** captura: produce los PCAP — el que RECIBE y guarda el tráfico.
-  **NetworkMiner** analiza: toma esos PCAP y extrae los artefactos — el que INTERROGA lo capturado.
-  Son las dos mitades del flujo forense de red: primero capturar sin perder nada (netsniff-ng), luego extraer archivos, credenciales y sesiones (NetworkMiner) — el legacy los empareja precisamente por eso.

#### Diferencia Crítica: netsniff-ng vs. NetFlow/IPFIX

-  **NetFlow** resume conversaciones: quién con quién, cuánto — barato, sin contenido.
-  **netsniff-ng** guarda los paquetes enteros: todo el contenido — costoso, evidencia completa.
-  La arquitectura sensata: NetFlow permanente como panorama; netsniff-ng puntual donde se necesita el contenido.

### Propósito fundamental

netsniff-ng es la captura forense en su forma más pura: escuchar el cable sin tocar nada y guardar cada paquete al máximo caudal que el hardware aguante — la herramienta que produce la materia prima (PCAP) sobre la que descansa todo el análisis forense de red posterior.
