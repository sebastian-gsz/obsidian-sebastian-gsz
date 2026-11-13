---
def-type: atomic
version: 1.0
id: def-packet-sniffing
status: estandar
category: amenazas
contexto: ataques-de-red
date: 2026-11-11
tags:
  - sniffing
  - redes
  - amenazas
  - analisis-de-trafico
aliases:
  - rastreo de paquetes
  - packet sniffing
  - sniffing
---
El **rastreo de paquetes** (_packet sniffing_) es la **captura de paquetes de datos en tránsito** sobre una red — una técnica con dos caras: es la base legítima del análisis y monitoreo de tráfico (Wireshark, netsniff-ng), y su versión maliciosa es el espionaje de red que expone credenciales y datos que viajan **sin cifrar**.

#### Rastreo Pasivo

-  El atacante **solo escucha**: captura el tráfico que pasa por su segmento sin enviar nada — invisible para la red.
-  Funciona de forma natural en medios compartidos (WiFi abierta, hubs); en redes conmutadas modernas solo ve SU tráfico — salvo que el atacante fuerce el camino.
-  Consecuencia directa: lo que viaja sin cifrar (HTTP plano, Telnet, credenciales sin TLS) queda expuesto — el sniffer pasivo solo lee; no altera nada.

#### Rastreo Activo

-  El atacante **interactúa con la red para recibir lo que no le corresponde**: ARP poisoning para hacerse pasar por el gateway, DNS spoofing, instalación de puntos de acceso falsos (_evil twin_).
-  A diferencia del pasivo, deja huellas — las tablas ARP alteradas y las respuestas falsas son detectables con las defensas correctas (dynamic ARP inspection, monitoreo).
-  Es el paso previo típico al **MitM**: el rastreo activo posiciona al atacante en medio de la conversación.

#### Defensa

Cifrar todo lo que importa (TLS/SFTP/SSH — el sniffer que lee solo ve gibberish); segmentación y switches en vez de hubs; detección de ARP poisoning; y en redes WiFi: WPA2/WPA3 — la red abierta es un sniffer público.

#### Diferencia Crítica: Rastreo vs. Ataque de Reproducción

-  El **rastreo** CAPTURA: roba y observa el tráfico en tránsito.
-  El **ataque de reproducción** (_replay attack_) REUTILIZA: toma una comunicación capturada legítima — un ticket de autenticación, una transferencia firmada — y la **retransmite tal cual** para engañar al sistema.
-  La cadena del ataque: primero el rastreo consigue el material; la reproducción lo ejecuta. La defensa contra el replay es temporal o única (timestamps, nonces, números de secuencia): un mensaje que solo vale UNA vez no puede reproducirse.

### Propósito fundamental

El rastreo de paquetes es la vigilancia del cable — pasiva e invisible cuando escucha, activa y posicionada cuando interviene — y su lección estructural define el diseño seguro de toda red: el que viaja sin cifrar viaja expuesto, y el que captura hoy puede reproducir mañana si el protocolo no expira sus mensajes.
