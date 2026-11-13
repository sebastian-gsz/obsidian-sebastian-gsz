---
def-type: atomic
version: 1.0
id: def-oidc
status: estandar
category: identidad-y-acceso
contexto: autenticación
date: 2026-07-02
tags:
  - oidc
  - oauth2
  - identidad
  - autenticacion
  - sso
aliases:
  - oidc
  - openid connect
---
OIDC es una capa de identidad construida sobre el marco de autorización OAuth 2.0. Permite a los clientes verificar la identidad del usuario basándose en la autenticación realizada por un servidor de autorización (Identity Provider), obteniendo a su vez información básica del perfil del usuario mediante tokens de identidad (ID Tokens) en formato JWT.

#### Diferencia clave con OAuth 2.0

Mientras que OAuth 2.0 está diseñado exclusivamente para la delegación de autorización (acceder a recursos en nombre de un usuario), OIDC añade la capacidad de autenticación, permitiendo estandarizar el inicio de sesión único (SSO) en aplicaciones distribuidas y microservicios.