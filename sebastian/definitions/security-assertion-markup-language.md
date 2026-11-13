---
def-type: atomic
version: 1.0
id: def-saml
status: estandar
category: identidad-y-acceso
contexto: federacion-de-identidades
date: 2026-07-02
tags:
  - saml
  - xml
  - sso
  - federacion
  - autenticacion
aliases:
  - saml
  - security assertion markup language
---
SAML es un estándar abierto basado en XML para intercambiar datos de autenticación y autorización entre un Proveedor de Identidad (IdP) y un Proveedor de Servicios (SP). Su función principal es facilitar el inicio de sesión único (SSO) en aplicaciones web empresariales, permitiendo que un usuario se autentique una sola vez ante un IdP y acceda a múltiples aplicaciones sin necesidad de volver a introducir credenciales.

#### Funcionamiento técnico

-  **Assertions:** Declaraciones emitidas por el IdP que contienen información sobre la autenticación del usuario, atributos y autorizaciones.
-  **Protocolos:** Define cómo se solicita y se entrega la información (ej. Web Browser SSO Profile).
-  **Bindings:** Especifica cómo se transportan los mensajes SAML (generalmente mediante HTTP POST o HTTP Redirect).

#### Propósito arquitectónico

Es la tecnología fundamental para la federación de identidades en entornos corporativos. Permite centralizar la gestión de usuarios y políticas de acceso, reduciendo la superficie de ataque y simplificando la administración de cuentas al delegar la autenticación a sistemas expertos (Active Directory, Okta, Ping Identity).