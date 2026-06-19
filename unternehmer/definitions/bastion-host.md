---
def-type: atomic
aliases:
  - bastión
  - jump server
  - nodo de salto
  - bastion host
tags:
  - redes
  - ciberseguridad
  - acceso-remoto
category: seguridad-de-red
contexto: administración-de-sistemas
version: 1
date: 2026-06-17
status: estandar
---
Servidor altamente securizado ubicado en una red pública o zona desmilitarizada (DMZ) que actúa como un único punto de entrada controlado para acceder a los recursos situados en una red privada o interna.

* **Faceta de seguridad**: Minimiza la superficie de ataque al exponer un solo punto de entrada que es reforzado (hardened), permitiendo que los servidores internos permanezcan aislados de Internet.
* **Faceta de administración**: Facilita la auditoría y el control de acceso, ya que todas las conexiones hacia la red privada deben pasar por este servidor, donde se puede implementar autenticación multifactor (MFA) y registro de sesiones (logs).
* **Propósito**: Implementar el principio de menor privilegio en el acceso administrativo, asegurando que los recursos internos no sean directamente alcanzables desde redes no confiables.