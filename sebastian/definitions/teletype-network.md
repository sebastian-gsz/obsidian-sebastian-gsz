---
def-type: atomic
version: 1.0
id: def-telnet
status: obsoleto
category: protocolos-de-red
contexto: administración-remota
date: 2026-07-02
tags:
  - telnet
  - inseguro
  - legado
  - protocolos
aliases:
  - telnet
  - teletype network
---
Telnet es un protocolo de red antiguo que permite la comunicación bidireccional basada en texto sobre una conexión virtual. Fue el estándar para el acceso remoto antes de la llegada de protocolos cifrados.

#### Riesgos de seguridad

Telnet transmite todos los datos, incluidas las credenciales de inicio de sesión y los comandos, en texto plano a través de la red. Esto permite que cualquier atacante con acceso a la red pueda interceptar, leer y manipular la sesión mediante técnicas de _sniffing_, por lo que su uso está totalmente desaconsejado en entornos modernos.