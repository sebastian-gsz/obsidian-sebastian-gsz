---
def-type: atomic
version: 1.0
id: def-no-repudio
status: estandar
category: ciberseguridad
contexto: fundamentos-seguridad
date: 2026-11-11
tags:
  - ciberseguridad
  - firmas
  - fundamentos
  - criptografia
aliases:
  - no repudio
  - non-repudiation
  - irreversibilidad de autoría
---
El **no repudio** es la **garantía de que una persona no puede negar la autoría de una comunicación**: quien firma o envía un mensaje queda vinculado a él de forma demostrable ante terceros — la propiedad que convierte un intercambio digital en evidencia.

#### Cómo se Logra

-  **Firma digital (criptografía asimétrica)**: el emisor firma con su clave **privada** — algo que solo él posee. Cualquiera verifica con la clave pública: si la firma valida, el mensaje solo pudo salir de quien tiene esa clave privada.
-  **Certificados (PKI)**: la autoridad de certificación vincula esa clave pública a una identidad real — sin ese vínculo, la firma prueba que alguien firmó, pero no quién es.
-  **Sellos de tiempo**: anclan CUÁNDO se firmó, cerrando el hueco de "fue después".

#### Su Lugar entre las Propiedades de Seguridad

El no repudio completa el clásico trío CID (confidencialidad, integridad, disponibilidad) con la dimensión de responsabilidad:

-  **Confidencialidad**: nadie más lo lee.
-  **Integridad**: nadie lo alteró.
-  **Disponibilidad**: está accesible cuando se necesita.
-  **No repudio**: y el autor no puede decir "no fui yo". Las firmas digitales aportan integridad Y no repudio a la vez: cualquier cambio rompe la firma.

#### Diferencia Crítica: No Repudio vs. Autenticación

-  La **autenticación** verifica identidad EN EL MOMENTO: el servidor te reconoce hoy.
-  El **no repudio** sobrevive al tiempo y a la negación: la evidencia firmada sigue demostrando la autoría mañana, ante un juez, contra el propio autor.
-  Un login con contraseña autentica pero no da no repudio (la contraseña se puede compartir, el sistema no puede probar quién la tecleó) — por eso los compromisos legales requieren firma digital, no login.

### Propósito fundamental

El no repudio es la propiedad que hace ejecutables los compromisos digitales: firma el contrato, la transferencia o la orden — y ni el remitente puede negar su autoría ni nadie puede forjarla — el puente entre la criptografía y la confianza legal, sin el cual el comercio y la contratación electrónica no existirían.
