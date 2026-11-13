---
def-type: atomic
version: 1.1
id: def-pqc
status: estandar
category: criptografía
contexto: criptografía-post-cuántica
date: 2026-11-11
tags:
  - pqc
  - criptografia
  - cuantica
  - nist
  - fips
  - ml-kem
  - ml-dsa
  - seguridad
aliases:
  - criptografía post-cuántica
  - post-quantum cryptography
  - pqc
  - fips 203
  - fips 204
  - ml-kem
---
La criptografía post-cuántica (PQC) engloba los algoritmos criptográficos, fundamentalmente de clave pública, diseñados para ser seguros frente a la capacidad de cómputo de un ordenador cuántico. A medida que la computación cuántica avanza, los algoritmos de cifrado asimétrico tradicionales como RSA o ECC, basados en la dificultad de factorizar números enteros o calcular logaritmos discretos, se vuelven vulnerables ante algoritmos cuánticos como el de Shor.

#### Características técnicas

-  **Resistencia cuántica:** Se basa en problemas matemáticos que, hasta donde se conoce, no pueden ser resueltos eficientemente por ordenadores cuánticos, tales como los basados en retículos (_lattices_), códigos de corrección de errores o polinomios multivariables.
-  **Estandarización:** El NIST ha liderado el proceso global para estandarizar estos algoritmos (ej. las normas FIPS 203, 204 y 205) para asegurar una transición segura y coordinada de la infraestructura digital.
-  **Agilidad criptográfica:** Es un principio fundamental en PQC, permitiendo a los sistemas actuales adoptar nuevos algoritmos sin necesidad de reconstruir toda la infraestructura desde cero.

#### Estándares del NIST (FIPS 203 y 204)

Las normas FIPS 203 y 204 representan la culminación del proceso de estandarización del NIST para algoritmos de criptografía post-cuántica, diseñados para reemplazar a los algoritmos clásicos vulnerables ante ordenadores cuánticos.

-  **FIPS 203 (ML-KEM):** El _Module-Lattice-Based Key-Encapsulation Mechanism_ (ML-KEM), anteriormente conocido como CRYSTALS-Kyber, es el estándar para el intercambio de claves. Su propósito es establecer secretos compartidos de manera segura sobre canales públicos, siendo el reemplazo directo de los métodos basados en Diffie-Hellman (ECDH/RSA). Se basa en la dureza del problema _Module Learning With Errors_ (MLWE).
-  **FIPS 204 (ML-DSA):** El _Module-Lattice-Based Digital Signature Algorithm_ (ML-DSA), anteriormente conocido como CRYSTALS-Dilithium, es el estándar para firmas digitales. Su objetivo es garantizar la autenticidad e integridad de documentos y transacciones, reemplazando a los esquemas RSA y ECDSA. Ofrece un equilibrio entre seguridad, tamaño de clave y rendimiento computacional.

#### Propósito arquitectónico

Su implementación es crítica para mitigar la amenaza de los ataques de tipo "cosechar ahora, descifrar después" (_harvest now, decrypt later_), donde atacantes interceptan tráfico cifrado hoy para descifrarlo en el futuro cuando dispongan de hardware cuántico capaz. La adopción de estos estándares es obligatoria para la seguridad a largo plazo en infraestructuras críticas y servicios Cloud, y constituye el estándar para garantizar la seguridad de la información a largo plazo.
