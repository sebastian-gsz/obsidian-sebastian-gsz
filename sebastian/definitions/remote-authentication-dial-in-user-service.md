---
def-type: atomic
version: 1.0
id: def-radius
status: estandar
category: identidad-y-acceso
contexto: autenticacion-y-autorizacion
date: 2026-07-02
tags:
  - radius
  - aaa
  - red
  - autenticacion
  - seguridad
aliases:
  - radius
  - remote authentication dial-in user service
---
RADIUS es un protocolo de red diseñado para gestionar la autenticación, autorización y contabilización (AAA) de usuarios que acceden a servicios de red. Actúa como un servidor centralizado que valida las credenciales de los usuarios y gestiona los permisos de acceso para dispositivos de red como switches, routers, puntos de acceso Wi-Fi y servidores VPN.

#### Características técnicas

-  **AAA:** Proporciona un marco unificado para verificar la identidad (Autenticación), definir qué recursos puede usar el usuario (Autorización) y registrar el uso de dichos recursos (Contabilización).
-  **Arquitectura cliente-servidor:** El dispositivo de acceso a la red (NAS) actúa como cliente RADIUS, enviando las credenciales del usuario al servidor RADIUS para su validación.
-  **Protocolo UDP:** Opera típicamente sobre los puertos UDP 1812 (autenticación) y 1813 (contabilización), favoreciendo la velocidad sobre la fiabilidad estricta de transporte.

#### Propósito arquitectónico

Es fundamental en infraestructuras corporativas para centralizar la seguridad. Permite que múltiples dispositivos de red consulten un repositorio único (como Active Directory, LDAP o bases de datos SQL) para validar el acceso, eliminando la necesidad de gestionar credenciales locales en cada equipo.