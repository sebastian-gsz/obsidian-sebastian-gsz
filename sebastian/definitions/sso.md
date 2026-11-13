---
def-type: atomic
version: 1.0
id: def-sso
status: estandar
category: identidad-y-acceso
contexto: control-de-acceso
date: 2026-11-11
tags:
  - sso
  - identidad
  - autenticacion
aliases:
  - sso
  - single sign-on
  - inicio de sesión único
---
El **inicio de sesión único** (_SSO_ — _Single Sign-On_) es el patrón que **permite a los usuarios autorizados acceder a varios servicios con una sola cuenta**: te autenticas UNA vez ante un sistema central de identidad y a partir de ahí entras en todas las aplicaciones conectadas — sin repetir contraseñas.

#### Cómo Funciona

-  Un **proveedor de identidad** (_Identity Provider_ — IdP) autentica al usuario una única vez y emite un comprobante (token o aserción).
-  Cada **aplicación** (_Service Provider_ — SP) confía en ese IdP: al recibir el comprobante, concede acceso sin volver a pedir credenciales.
-  Los protocolos que lo implementan: **SAML** (el clásico empresarial con XML), **OpenID Connect** (moderno, construido sobre OAuth 2.0) y **Kerberos** (el SSO original de las redes de dominio Windows).

#### Por Qué Vale la Pérdida del Riesgo Concentrado

-  **Experiencia**: una credencial, todos los servicios — el usuario deja de apuntar 15 contraseñas en un post-it.
-  **Seguridad operativa**: una política central — MFA exigido en la puerta única, bajas revocadas en el IdP cortan el acceso a TODO en un instante.
-  **El precio es la concentración**: el IdP se convierte en la llavero maestro — comprometerlo compromete todo; por eso el acceso al IdP exige la protección máxima (MFA reforzado, monitoreo — el rol de Identity Protection).

#### Diferencia Crítica: SSO vs. OAuth

-  **SSO** es el PATRÓN de autenticación: una identidad, muchos servicios — el QUÉ.
-  **OAuth 2.0** es un protocolo de **autorización delegada**: permite que una app actúe con los permisos del usuario sin ver su contraseña — el mecanismo de PERMISOS, no de login.
-  La pieza que los une: **OpenID Connect** añade autenticación ENCIMA de OAuth 2.0 — convirtiendo el flujo de autorización en SSO. Y OAuth solo, sin OIDC, no es SSO: autoriza a una app, no te loguea en todas.
-  El SSO clásico de dominio (Kerberos) ni siquiera usa OAuth: demuestra que SSO es el patrón, no un protocolo concreto.

### Propósito fundamental

El SSO convierte la identidad en una sola puerta con un solo guardia: un login para toda la organización — mejor experiencia, política central y revocación instantánea, al precio de proteger ese guardia como lo más valioso de la red, porque quien controla el IdP controla todas las puertas.
