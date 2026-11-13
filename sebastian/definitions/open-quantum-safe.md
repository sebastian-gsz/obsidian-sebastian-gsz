---
def-type: atomic
version: 1.0
id: def-open-quantum-safe
status: estandar
category: criptografía
contexto: criptografía-post-cuántica
date: 2026-11-11
tags:
  - pqc
  - criptografia
  - liboqs
  - openssl
aliases:
  - open quantum safe
  - oqs
  - liboqs
---
Open quantum safe (OQS) es un proyecto de código abierto dedicado a desarrollar y prototipar algoritmos de criptografía resistente a ataques cuánticos. Proporciona las herramientas necesarias para integrar y probar criptografía post-cuántica (PQC) en aplicaciones y protocolos de seguridad existentes.

#### Componentes principales

- **liboqs:** Biblioteca central escrita en C que implementa una amplia gama de algoritmos criptográficos cuántico-resistentes (firmas y mecanismos de encapsulación de claves).
- **oqs-provider:** Un proveedor para OpenSSL que permite utilizar los algoritmos de liboqs en aplicaciones estándar (como servidores web o VPNs) sin modificar el código fuente de la aplicación, facilitando la transición hacia PQC.

#### Propósito arquitectónico

Es el ecosistema de referencia para la investigación y la implementación temprana de algoritmos PQC. Permite a los arquitectos de seguridad evaluar la compatibilidad, el rendimiento y la interoperabilidad de los nuevos estándares (como los definidos por el NIST) antes de que sean soportados de forma nativa por las implementaciones comerciales de las bibliotecas criptográficas principales.