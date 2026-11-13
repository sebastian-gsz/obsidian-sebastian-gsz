---
def-type: atomic
version: 1.0
id: def-ml-dsa
status: estandar
category: criptografía
contexto: criptografía-post-cuántica
date: 2026-07-02
tags:
  - ml-dsa
  - dilithium
  - pqc
  - firma-digital
  - nist
aliases:
  - ml-dsa
  - module-lattice-based digital signature algorithm
  - dilithium
---
ML-DSA, estandarizado por el NIST bajo FIPS 204 y basado en el algoritmo Dilithium, es un esquema de firma digital de retículos diseñado para ser resistente a ataques tanto de ordenadores clásicos como cuánticos. Es uno de los algoritmos seleccionados para proteger la integridad y la autenticidad de los datos en la era post-cuántica.

#### Características técnicas

- **Fundamento:** Se basa en la dureza de problemas sobre módulos de retículos (_module learning with errors_), lo que proporciona una seguridad robusta frente a la computación cuántica.
- **Variantes:** Define diferentes niveles de seguridad (ML-DSA-44, ML-DSA-65 y ML-DSA-87) que permiten ajustar el tamaño de la firma y la clave pública según las necesidades de rendimiento y seguridad.
- **Eficiencia:** Ofrece un rendimiento computacional competitivo en comparación con esquemas tradicionales como RSA o ECDSA, lo cual facilita su adopción en protocolos de red.

#### Propósito arquitectónico

Representa el estándar de reemplazo para los algoritmos de firma digital convencionales. Su implementación es crítica para asegurar identidades (PKI), firmas de código y certificados TLS, garantizando la no repudio y la integridad a largo plazo ante la amenaza de la computación cuántica.