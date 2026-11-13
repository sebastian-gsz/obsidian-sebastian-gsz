---
def-type: atomic
version: 1.0
id: def-ldap
status: estandar
category: gestión-de-identidades
contexto: infraestructura-de-ti
date: 2026-06-20
tags:
  - identidades
  - protocolos
  - seguridad
  - directorios
aliases:
  - ldap
  - protocolo de acceso a directorio ligero
  - light-weight directory access protocol
---
Es fundamental distinguir entre el protocolo de comunicación y el servicio de directorio que aloja la información.

-  **LDAP (Lightweight Directory Access Protocol):** Es un protocolo estándar, un "idioma" que permite a las aplicaciones consultar, leer y modificar información en servicios de directorio. Funciona como la interfaz de comunicación entre una aplicación cliente y el repositorio de identidades.
-  **Active Directory (AD):** Es un servicio de directorio propietario de Microsoft. Actúa como la base de datos centralizada donde residen físicamente los objetos (usuarios, equipos, impresoras) y las políticas de grupo (GPO). AD utiliza LDAP como uno de sus protocolos principales para recibir consultas.

#### Analogía de referencia

Si Active Directory es la **biblioteca física** que contiene toda la información organizada, LDAP es el **lenguaje técnico** que utilizas para hacerle preguntas al bibliotecario y obtener datos específicos sobre los libros o usuarios.

#### Conceptos clave de IAM

-  **SSO (Single Sign-On):** Capacidad que permite a un usuario iniciar sesión una vez y acceder a múltiples aplicaciones. Esto se logra delegando la autenticación a protocolos modernos (SAML, OIDC) que, a menudo, consultan la información de identidad almacenada en directorios como AD.
-  **Jerarquía (DIT - Directory Information Tree):** La estructura interna de estos directorios es arbórea. Los objetos (hojas del árbol) se organizan en contenedores o Unidades Organizativas (OUs), lo que facilita la delegación administrativa y la aplicación de políticas granulares.
-  **Autenticación vs. Autorización:** LDAP y AD son robustos para la **Autenticación** (verificar quién es el usuario) y la recuperación de atributos (ej. email, departamento). La **Autorización** (gestión de permisos sobre recursos específicos) suele derivarse de la pertenencia a los grupos de seguridad definidos en el propio directorio.

#### Evolución arquitectónica

Aunque LDAP ha sido el estándar durante décadas, los arquitectos de soluciones Cloud están migrando progresivamente hacia servicios de identidad modernos como **Microsoft Entra ID** (anteriormente Azure AD). Estos servicios priorizan protocolos basados en la web como **OIDC (OpenID Connect)** y **SAML**, que ofrecen mayor seguridad en entornos dispersos y mejor integración con aplicaciones SaaS, reduciendo la dependencia de conectividad directa al controlador de dominio tradicional.