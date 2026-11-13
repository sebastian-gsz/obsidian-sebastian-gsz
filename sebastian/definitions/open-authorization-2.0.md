---
def-type: atomic
version: 1.0
id: def-oauth2
status: estandar
category: identidad-y-acceso
contexto: autorizacion-api
date: 2026-07-02
tags:
  - oauth2
  - autorizacion
  - seguridad
  - api
  - tokens
aliases:
  - oauth2
  - oauth 2.0
---
OAuth 2.0 es el marco de trabajo estándar de la industria para la autorización. Permite que una aplicación (cliente) obtenga acceso limitado a los recursos de un usuario en un servicio HTTP (servidor de recursos) sin necesidad de exponer las credenciales (usuario y contraseña) del usuario, mediante la emisión de _access tokens_.

#### Roles principales

-  **Resource Owner:** El usuario que autoriza a una aplicación a acceder a su cuenta.
-  **Client:** La aplicación que solicita acceso al recurso.
-  **Authorization Server:** El servidor que autentica al usuario y emite los _tokens_ de acceso.
-  **Resource Server:** El servidor que alberga los datos protegidos y acepta los _tokens_ para conceder acceso.

#### Propósito arquitectónico

OAuth 2.0 desvincula la autenticación de la autorización. Su uso es vital en arquitecturas de microservicios y APIs modernas, ya que permite delegar el acceso de forma granular (mediante _scopes_) y segura, facilitando la revocación del acceso sin cambiar las credenciales del usuario.