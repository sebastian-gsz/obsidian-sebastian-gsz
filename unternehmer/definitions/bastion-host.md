---
def-type: atomic
version: 1.0
id: def-bastion-host
status: estandar
category: seguridad-de-red
contexto: administración-de-sistemas
date: 2026-06-17
tags:
  - redes
  - ciberseguridad
  - acceso-remoto
aliases:
  - bastión
  - jump server
  - nodo de salto
  - bastion host
---
Un servidor altamente securizado, situado estratégicamente en una red pública o zona desmilitarizada (DMZ), diseñado para actuar como el único punto de entrada autorizado hacia recursos alojados en una red privada o interna. Al centralizar el acceso, funciona como un gateway de seguridad que aísla los activos críticos de la exposición directa a Internet.

**Puntos clave**

- **Reducción de superficie de ataque**: Al ser el único nodo expuesto, el host bastión se somete a un proceso riguroso de endurecimiento (_hardening_), minimizando vectores de intrusión mientras mantiene el resto de la infraestructura interna oculta tras el perímetro.
- **Control de acceso centralizado**: Permite la implementación unificada de mecanismos de autenticación robustos, como la autenticación multifactor (MFA), antes de permitir cualquier salto hacia la red privada.
- **Auditoría y trazabilidad**: Facilita la centralización del registro (_logging_) de todas las sesiones administrativas y conexiones, esencial para auditorías de cumplimiento y análisis forense.
- **Principio de menor privilegio**: Asegura que el acceso administrativo no sea directo, forzando un flujo de tráfico controlado que restringe los movimientos laterales dentro de la red interna.