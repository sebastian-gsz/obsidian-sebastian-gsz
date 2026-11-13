---
def-type: atomic
version: 1.0
id: def-wireshark
status: estandar
category: ciberseguridad
contexto: analisis-de-trafico
date: 2026-11-12
tags:
  - wireshark
  - analisis-de-trafico
  - herramientas
aliases:
  - wireshark
  - wireshark analyzer
---
**Wireshark** es el **analizador de protocolos de red** (_network protocol analyzer_) por excelencia: captura e inspecciona el tráfico paquete a paquete — decodifica cada protocolo, permite filtrar con precisión quirúrgica y es la herramienta estándar universal del análisis de red, del aula a la forense.

#### Qué Hace

-  **Captura en vivo o abre PCAP**: escucha una interfaz o analiza archivos de captura (los mismos que producen netsniff-ng y Security Onion).
-  **Decodifica cientos de protocolos**: cada paquete se despliega capa a capa — Ethernet, IP, TCP, HTTP, DNS, TLS... con cada campo explicado.
-  **Filtrado quirúrgico**: el lenguaje de filtros (`http.request`, `tcp.port == 443 && ip.addr == 10.0.1.5`) reduce millones de paquetes a los que importan.
-  **Extracción de objetos**: `File → Export Objects` saca archivos de HTTP, SMB, TFTP y más directamente de la captura (la función que conecta con la extracción de archivos desde el cable).
-  **Seguimiento de streams**: reconstruye la conversación completa de TCP — el diálogo legible entre dos equipos.

#### Dónde Vive

-  **Diagnóstico de red**: por qué va lento, qué se retransmite, quién no responde.
-  **Forense y SOC**: examinar capturas de incidentes, entender el ataque paquete a paquete.
-  **Desarrollo y aprendizaje**: ver EXACTAMENTE qué envía tu aplicación — la herramienta con la que se aprenden los protocolos de verdad.

#### Diferencia Crítica: Wireshark vs. NetworkMiner

-  **Wireshark** es el analizador MANUAL: el bisturí — inspección profunda, filtros, comprensión de cada byte, decidida por el analista.
-  **NetworkMiner** es el extractor AUTOMÁTICO: abre el PCAP y entrega archivos, credenciales y hosts ordenados — el cucharón.
-  El flujo forense los combina: NetworkMiner barre los artefactos automáticamente; Wireshark examina a fondo lo que el barrido señala.

#### Diferencia Crítica: Wireshark vs. NetFlow

-  **NetFlow** guarda el RESUMEN de cada conversación — barato, sin contenido, retención larga.
-  **Wireshark** inspecciona los PAQUETES completos — todo el contenido, costoso, puntual.
-  El diseño maduro: NetFlow para el panorama permanente; Wireshark cuando se necesita el byte exacto.

### Propósito fundamental

Wireshark es el microscopio de la red: captura, decodifica y permite filtrar cada paquete hasta su byte — la herramienta universal con la que se diagnostica, se enseña y se investiga todo lo que viaja por el cable — el estándar indiscutible del análisis manual de protocolos.
