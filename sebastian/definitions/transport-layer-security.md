---
def-type: atomic
version: 1.0
id: def-tls-versions
status: estandar
category: seguridad
contexto: criptografía-de-red
date: 2026-07-02
tags:
  - tls
  - ssl
  - cifrado
  - seguridad
  - protocolos
aliases:
  - tls
  - transport layer security
  - versiones tls
---
El TLS (Transport Layer Security) es el sucesor del protocolo SSL (Secure Sockets Layer). Es el estándar criptográfico que asegura las comunicaciones sobre redes TCP/IP, garantizando la privacidad, autenticidad e integridad de los datos en tránsito. La evolución del protocolo ha sido dictada por la necesidad de eliminar vulnerabilidades de diseño y mejorar la eficiencia del proceso de establecimiento de conexión (_handshake_).

#### Evolución histórica

- **SSL 2.0 y 3.0:** Versiones originales. Actualmente están totalmente obsoletas y son consideradas inseguras debido a vulnerabilidades críticas como POODLE.
- **TLS 1.0 y 1.1:** Versiones antiguas que han sido deprecadas por la industria (PCI DSS, IETF) debido a la debilidad de sus algoritmos de cifrado y dependencia de funciones hash antiguas.
- **TLS 1.2:** Versión ampliamente desplegada que introdujo soporte para AEAD (Authenticated Encryption with Associated Data). Sigue siendo un estándar aceptable, aunque requiere configuraciones restrictivas de cifrados (_cipher suites_).
- **TLS 1.3:** La iteración más reciente y segura. Diseñada para ser más rápida (reduce el _handshake_ de dos viajes de ida y vuelta a uno) y más segura al eliminar algoritmos obsoletos y configuraciones de cifrado débiles por defecto. Es el estándar recomendado para cualquier nueva implementación.

#### Propósito técnico

La adopción de la versión más reciente (TLS 1.3) no solo mejora la seguridad al eliminar la superficie de ataque de algoritmos heredados, sino que reduce la latencia en el establecimiento de conexiones seguras, optimizando el rendimiento de la aplicación.