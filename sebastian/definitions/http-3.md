---
def-type: atomic
version: 1.0
id: def-http3
status: estandar
category: protocolos-de-red
contexto: web
date: 2026-11-11
tags:
  - http3
  - quic
  - udp
  - rendimiento
aliases:
  - http/3
  - http3
---
**HTTP/3** es la **última versión del protocolo web**, y su gran cambio es el transporte: a diferencia de las versiones anteriores — que corrían sobre **TCP** — HTTP/3 utiliza **QUIC** (_Quick UDP Internet Connections_), un protocolo construido sobre UDP. El objetivo: máxima velocidad, especialmente en redes con alta pérdida de paquetes o alta latencia, como las redes móviles.

#### Qué Resuelve

-  **Establecimiento de conexión más rápido**: TCP exige su handshake y TLS el suyo (múltiples viajes de ida y vuelta antes del primer dato); QUIC integra el cifrado en el propio protocolo y combina ambos en menos vueltas — con reutilización de sesión, casi sin espera (0-RTT).
-  **El problema del "bloqueo de cabeza de línea" (_head-of-line blocking_)**: en HTTP/2 sobre TCP, múltiples peticiones comparten una conexión; si **un solo paquete** se pierde, TCP obliga a esperar su retransmisión y **todas** las peticiones se quedan esperando detrás — aunque las demás llegaran intactas. QUIC gestiona los flujos de forma independiente: la pérdida de un paquete solo retrasa al flujo afectado, no a los demás.

#### Cómo Funciona

-  QUIC corre sobre **UDP** e implementa a su nivel lo que TCP daba por hecho: fiabilidad, orden y control de congestión — más cifrado TLS integrado de serie.
-  El resultado: conexiones que se establecen antes, sobreviven a cambios de red (migración entre WiFi y móvil sin renegociar) y degradan mejor con pérdida de paquetes.

#### Diferencia Crítica: HTTP/3 vs. HTTP/2

-  **HTTP/2**: multiplexa peticiones sobre **TCP** — gana a HTTP/1.1 pero hereda su bloqueo de cabeza de línea a nivel de transporte.
-  **HTTP/3**: multiplexa sobre **QUIC/UDP** — la pérdida de un paquete no congela el resto de los flujos.
-  La ganancia es mayor cuanto peor es la red: en fibra estable la mejora es discreta; en móvil o redes saturadas es notable — por eso los grandes proveedores de contenido la adoptan primero.

### Propósito fundamental

HTTP/3 es la respuesta a medio siglo de limitaciones de TCP en la capa web: al mover el transporte a QUIC sobre UDP, consigue conexiones más rápidas de establecer y resistentes a redes imperfectas — manteniendo intactos el modelo de petición-respuesta y los métodos que han definido la web desde su origen.
