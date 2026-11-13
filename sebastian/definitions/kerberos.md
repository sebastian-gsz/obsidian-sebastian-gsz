---
def-type: atomic
version: 1.0
id: def-kerberos
status: estandar
category: identidad-y-acceso
contexto: autenticacion-de-red
date: 2026-07-02
tags:
  - kerberos
  - autenticacion
  - protocolos
  - sso
  - seguridad
aliases:
  - protocolo de autenticación kerberos
  - kerberos protocol
  - kerberos authentication
---
Kerberos es un protocolo de autenticación de red diseñado para proporcionar una autenticación sólida para aplicaciones cliente-servidor mediante criptografía de clave secreta. Permite que nodos en una red no segura prueben su identidad ante otros de manera segura, utilizando un tercero de confianza conocido como Key Distribution Center (KDC).

#### Funcionamiento técnico

El protocolo utiliza un sistema de tickets para evitar el envío de contraseñas a través de la red:

-  **Autenticación (AS):** El cliente solicita un ticket inicial al Authentication Service.
-  **Ticket granting (TGS):** El cliente utiliza el ticket inicial para solicitar tickets de servicio específicos a otros servidores.
-  **Cifrado:** Todas las comunicaciones están cifradas para prevenir ataques de interceptación o suplantación.

#### Propósito arquitectónico

Es el estándar de facto para la autenticación en entornos Windows (Active Directory) y en infraestructuras de Big Data (Hadoop/Spark), proporcionando un Single Sign-On (SSO) robusto dentro de un dominio o reino (_realm_).