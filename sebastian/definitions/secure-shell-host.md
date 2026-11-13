---
def-type: atomic
version: 1.0
id: def-ssh
status: estandar
category: protocolos-de-red
contexto: seguridad-y-administración-remota
date: 2026-06-27
tags:
  - protocolos
  - seguridad
  - red
  - shell
aliases:
  - ssh
  - secure shell
---
SSH es un protocolo de red criptográfico que permite a los usuarios acceder y administrar dispositivos de forma remota a través de una red no segura. Es el estándar de la industria para la administración de sistemas tipo Unix, reemplazando protocolos antiguos e inseguros como Telnet o rlogin mediante la implementación de cifrado robusto.

#### Fundamentos técnicos

El protocolo opera bajo un modelo cliente-servidor y garantiza tres pilares de seguridad:

-  **Cifrado (confidencialidad):** Todo el tráfico intercambiado entre el cliente y el servidor (comandos, contraseñas, datos) se cifra, evitando la interceptación y lectura no autorizada (_sniffing_).
-  **Integridad:** Utiliza códigos de autenticación de mensajes (MAC) para asegurar que la información transmitida no haya sido alterada durante el tránsito.
-  **Autenticación:** Permite verificar la identidad de ambas partes mediante contraseñas o, más preferiblemente, mediante pares de claves criptográficas (pública/privada), eliminando la transmisión de credenciales en texto plano.

#### Uso operativo

SSH no se limita únicamente a una terminal remota; es la base de múltiples herramientas de administración y transferencia de datos:

-  **Acceso remoto:** Ejecución de comandos en servidores distantes.
-  **Túneles SSH:** Redirección de puertos para asegurar tráfico de otras aplicaciones (VPN casera o acceso a bases de datos internas).
-  **Transferencia de archivos:** Protocolos como SCP y SFTP funcionan sobre la capa de seguridad proporcionada por SSH.
-  **Gestión de infraestructura:** Es la base para la automatización (ej. Ansible, Terraform, Puppet) para configurar servidores a gran escala de forma segura.