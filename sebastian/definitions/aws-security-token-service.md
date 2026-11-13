---
def-type: atomic
version: 1
id: def-aws-sts
status: estandar
category: seguridad
contexto: identidad-y-acceso
date: 2026-07-02
tags:
  - aws
  - iam
  - seguridad
  - credenciales
aliases:
  - aws sts
  - security token service
  - aws security token service
---
AWS Security Token Service (STS) es un servicio web que permite solicitar credenciales temporales y con privilegios limitados para usuarios de IAM o para usuarios autenticados mediante federación. Estas credenciales tienen un tiempo de vida definido y expiran automáticamente, lo que reduce significativamente el riesgo asociado a la exposición de credenciales de larga duración (como las claves de acceso estáticas).
#### Funcionamiento técnico

El servicio opera mediante la emisión de pares de claves de acceso, una clave secreta y un token de sesión. Su ciclo de vida es el siguiente:

-  **Solicitud:** El cliente (usuario, rol o federado) solicita credenciales temporales a STS.
-  **Validación:** STS verifica los permisos del solicitante (a menudo mediante políticas de IAM).
-  **Emisión:** Se generan credenciales temporales válidas por un tiempo específico (desde 15 minutos hasta 36 horas, dependiendo del caso de uso).
-  **Expiración:** Una vez cumplido el tiempo, las credenciales quedan inutilizables de forma inmediata.

#### Propósito arquitectónico

STS es fundamental para implementar arquitecturas de seguridad robustas, facilitando:

-  **Acceso entre cuentas:** Permite que un usuario en una cuenta de AWS asuma un rol en otra cuenta sin necesidad de replicar identidades.
-  **Federación de identidades:** Facilita la integración de identidades externas (Active Directory, SAML, OIDC) para que los usuarios accedan a recursos de AWS sin crear un usuario IAM explícito.
-  **Seguridad granular:** Permite definir permisos específicos para una sesión determinada mediante el paso de políticas de sesión, limitando aún más el alcance de las credenciales emitidas.