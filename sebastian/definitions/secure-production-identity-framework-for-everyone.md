---
def-type: atomic
version: 1.0
id: def-spiffe-spire
status: estandar
category: seguridad
contexto: identidad-de-carga-de-trabajo
date: 2026-07-02
tags:
  - spiffe
  - spire
  - identidad
  - cloud-native
  - zero-trust
aliases:
  - spiffe
  - spire
  - secure production identity framework for everyone
---
SPIFFE (Secure Production Identity Framework for Everyone) es un estándar abierto para la emisión y validación de identidades seguras para servicios de software en entornos heterogéneos. SPIRE (the SPIFFE Runtime Environment) es la implementación de referencia que automatiza la emisión, rotación y validación de estas identidades mediante documentos SVID (SPIFFE Verifiable Identity Documents).

#### Funcionamiento técnico

-  **Identidad basada en carga de trabajo:** Asigna una identidad única (_SPIFFE ID_) a cada servicio, independientemente de dónde se ejecute (VM, Kubernetes, servidor _bare-metal_).
-  **Documentos de identidad (SVID):** Emite certificados X.509 o tokens JWT de corta duración que actúan como credenciales de autenticación para servicios.
-  **Atestación:** SPIRE realiza una atestación de nodo (verifica el host) y de carga de trabajo (verifica el proceso) antes de emitir cualquier identidad, asegurando que el servicio es legítimo.

#### Propósito arquitectónico

SPIFFE/SPIRE elimina la necesidad de gestionar secretos estáticos (como contraseñas o claves API) dentro de los servicios. Es fundamental en arquitecturas _Zero Trust_ para habilitar la autenticación mutua (mTLS) de manera dinámica y automatizada entre microservicios, independientemente de la infraestructura subyacente.