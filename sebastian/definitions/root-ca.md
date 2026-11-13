---
def-type: atomic
version: 1.0
id: def-root-ca
status: estandar
category: ciberseguridad
contexto: infraestructura-de-clave-publica
date: 2026-10-03
tags:
  - pki
  - root-ca
  - criptografia
  - seguridad
aliases:
  - CA
  - root ca
  - autoridad de certificacion raiz
  - root certificate authority
---
Una autoridad de certificación raíz (Root CA) es la entidad de confianza principal y el ancla absoluta dentro de una infraestructura de clave pública (PKI). Es responsable de emitir el certificado raíz autofirmado que encabeza toda la cadena de confianza, otorgando validez a las autoridades de certificación intermedias y, en última instancia, a los certificados de entidad final.

### Características principales

- **Certificado autofirmado:** El certificado raíz está firmado por su propia clave privada, estableciendo la cúspide de la confianza sin depender de ninguna entidad superior.
- **Máxima seguridad:** Al ser el origen de toda la cadena de confianza, la clave privada de la Root CA se almacena bajo estrictos controles físicos y lógicos, frecuentemente en módulos de seguridad de hardware (HSM) y aislada de redes públicas.
- **Delegación operativa:** Raramente emite certificados de entidad final de forma directa; en su lugar, emite y respalda a las autoridades de certificación intermedias para distribuir la carga operativa y mitigar riesgos.

### Jerarquía de confianza

Garantiza que cualquier certificado digital válido pueda ser rastreado y verificado de manera retroactiva hasta la Root CA, permitiendo a los sistemas operativos y navegadores validar la autenticidad de las comunicaciones mediante el almacén de certificados raíces preinstalados.

### Propósito fundamental

Establecer la base criptográfica de confianza inquebrantable para todo un ecosistema digital, asegurando la integridad, autenticidad y seguridad de las operaciones en red a escala global.