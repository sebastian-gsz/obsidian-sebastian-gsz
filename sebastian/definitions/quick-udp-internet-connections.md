---
def-type: atomic
version: 1.0
id: def-quic
status: estandar
category: protocolos-de-red
contexto: transporte-y-latencia
date: 2026-07-02
tags:
  - quic
  - udp
  - red
  - http3
  - latencia
aliases:
  - quic
  - quick udp internet connections
---
QUIC es un protocolo de transporte de red desarrollado por Google, diseñado para reducir la latencia de las conexiones web en comparación con TCP y TLS combinados. A diferencia de TCP, que funciona sobre una base de entrega ordenada y fiable, QUIC opera sobre UDP, lo que le permite implementar su propio control de flujo, gestión de congestión y recuperación de errores sin las limitaciones de la pila de red del sistema operativo.

#### Características técnicas

-  **Cifrado integrado:** A diferencia de TLS sobre TCP, donde el cifrado es una capa independiente, QUIC integra TLS 1.3 de forma nativa en el protocolo, garantizando que el establecimiento de la conexión sea seguro y rápido.
-  **Multiplexación:** Resuelve el problema del "bloqueo de cabeza de línea" (_head-of-line blocking_) de HTTP/2, ya que permite que múltiples flujos de datos independientes operen sobre una única conexión QUIC sin interferir entre sí.
-  **Migración de conexión:** Permite que una sesión persista aunque el cliente cambie de red (ej. de Wi-Fi a 4G/5G) mediante el uso de identificadores de conexión en lugar de tuplas IP/puerto.

#### Propósito arquitectónico

Es la base técnica de HTTP/3, convirtiéndose en el estándar para servicios que demandan baja latencia y alta resistencia a la pérdida de paquetes, como streaming de video, juegos en línea y aplicaciones web modernas.