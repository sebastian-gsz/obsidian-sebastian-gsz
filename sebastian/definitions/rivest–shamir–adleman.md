---
def-type: atomic
version: 1
id: def-rsa-ecc
status: estandar
category: criptografía
contexto: criptografía-clásica
date: 2026-07-02
tags:
  - rsa
  - ecc
  - cifrado-asimetrico
  - seguridad
  - certificados
aliases:
  - rsa
  - rivest shamir adleman
---
RSA es un algoritmo de cifrado asimétrico pionero basado en la dificultad computacional de factorizar números enteros grandes producto de dos números primos. Es ampliamente utilizado para el intercambio de claves y firmas digitales en protocolos como TLS y SSH.

#### Características técnicas

- **Seguridad:** Requiere longitudes de clave grandes (mínimo 2048 bits, recomendado 4096) para mantener un nivel de seguridad adecuado frente a ataques modernos.
- **Rendimiento:** Es computacionalmente intensivo, especialmente en operaciones de cifrado y firma, lo que lo hace más lento en comparación con algoritmos modernos.