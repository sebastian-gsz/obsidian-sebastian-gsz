---
def-type: atomic
version: 1.0
id: def-tcp
status: estandar
category: protocolos-de-red
contexto: transporte-de-datos
date: 2026-11-11
tags:
  - tcp
  - transporte
  - protocolos
  - redes
aliases:
  - tcp
  - transmission control protocol
  - protocolo de control de transmisión
---
**TCP** (_Transmission Control Protocol_ — protocolo de control de transmisión) es el **protocolo de comunicación de Internet que permite que dos dispositivos formen una conexión y transmitan datos de forma fiable**: la conversación ordenada, verificada y completa — el transporte que asume que cada byte importan.

#### Cómo Garantiza la Fiabilidad

-  **Conexión previa (handshake de 3 vías)**: SYN → SYN-ACK → ACK — antes del primer dato, ambos confirman que están listos y acordado el punto de partida.
-  **Numeración y confirmación**: cada byte se numera (secuencia) y el receptor confirma lo recibido (ACK) — lo que no se confirma se **retransmite**.
-  **Orden garantizado**: los segmentos que llegan desordenados se reordenan — la aplicación recibe los datos exactamente como se enviaron.
-  **Control de flujo y congestión**: la ventana deslizante ajusta el ritmo — el receptor no se ahoga, la red no se satura.

#### La Multiplexación por Puertos

TCP permite que miles de conversaciones compartan un enlace: cada segmento lleva **puerto de origen y destino** — la demultiplexación entrega cada flujo a su aplicación correcta (80 web, 443 HTTPS, 22 SSH...).

#### Diferencia Crítica: TCP vs. UDP

-  **TCP**: conexión, fiabilidad, orden, retransmisión — el precio es latencia y sobrecarga de control. Para lo que NO puede perderse: web, correo, archivos, bases de datos.
-  **UDP**: sin conexión, sin garantías, sin retransmisión — veloz y ligero. Para lo que tolera pérdida: streaming, voz, juegos, DNS — perder un frame de vídeo es mejor que esperar 200 ms a retransmitirlo.
-  La elección define el carácter de la aplicación: fiabilidad (TCP) o velocidad (UDP) — y QUIC (HTTP/3) es la prueba de que la frontera se puede reinventar: fiabilidad construida sobre UDP.

#### Diferencia Crítica: TCP vs. ICMP

-  **TCP** transporta datos de aplicación; **ICMP** es mensajería de control y diagnóstico (ping, errores) — no lleva puertos ni carga útil de apps.
-  Un servicio caído y un host vivo responden distinto: el ping (ICMP) puede contestar mientras la conexión TCP al puerto muere — diagnosticar exige distinguir las capas.

### Propósito fundamental

TCP es el contrato de fiabilidad de Internet: convierte un medio que pierde, duplica y desordena en un canal ordenado y completo — la base invisible sobre la que corre casi todo lo que valoras (web, correo, banca) — y su negociación constante con UDP define el trade-off fundacional del transporte: exactitud o velocidad.
