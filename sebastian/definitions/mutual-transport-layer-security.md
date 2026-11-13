---
def-type: atomic
version: 1.0
id: def-mtls
status: estandar
category: seguridad
contexto: identidad-de-red
date: 2026-07-02
tags:
  - tls
  - autenticacion
  - mtls
  - seguridad
aliases:
  - mtls
  - mutual tls
  - autenticacion mutua
---
El mTLS es una extensión del protocolo TLS que requiere la autenticación bidireccional entre el cliente y el servidor. En un flujo TLS convencional, solo el servidor presenta un certificado para demostrar su identidad; en mTLS, el cliente también debe presentar un certificado digital válido que el servidor verifica antes de completar el apretón de manos (_handshake_).

#### Relevancia en arquitectura

Es un componente crítico para arquitecturas _Zero Trust_. Asegura que la comunicación no solo sea cifrada, sino que ambas partes en la comunicación sean entidades de confianza, evitando ataques de suplantación (_spoofing_) y garantizando que solo servicios autorizados participen en la malla de microservicios.