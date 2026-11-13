---
def-type: atomic
version: 1.0
id: def-dtls
status: estandar
category: protocolos-de-red
contexto: seguridad-en-tiempo-real
date: 2026-07-02
tags:
  - dtls
  - udp
  - seguridad
  - redes
  - vpn
aliases:
  - dtls
  - datagram transport layer security
---
El DTLS es un protocolo criptográfico basado en TLS que proporciona seguridad para aplicaciones que utilizan protocolos de datagramas, principalmente UDP. Mientras que el TLS convencional está diseñado para funcionar sobre conexiones orientadas a flujo (como TCP), el DTLS añade mecanismos para gestionar la pérdida de paquetes, el reordenamiento y la fragmentación, factores intrínsecos de la comunicación mediante datagramas.

#### Características técnicas

-  **Fiabilidad:** A diferencia del TLS, el DTLS implementa un mecanismo de retransmisión durante el _handshake_ para asegurar que los mensajes de control lleguen a su destino correctamente, incluso si se pierden paquetes.
-  **Manejo de datagramas:** Permite cifrar el tráfico sin establecer una conexión persistente antes de enviar los datos, lo que minimiza la latencia en aplicaciones de tiempo real.
-  **Prevención de ataques:** Incluye protección contra ataques de denegación de servicio (DoS) mediante cookies de verificación durante el establecimiento de la conexión.

#### Propósito arquitectónico

Es el estándar utilizado en escenarios donde la latencia es crítica y el orden estricto de entrega no es obligatorio. Es fundamental en tecnologías de comunicación en tiempo real (VoIP), túneles VPN (como OpenVPN) y aplicaciones de streaming donde el protocolo subyacente es UDP.