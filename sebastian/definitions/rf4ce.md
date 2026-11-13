---
def-type: atomic
version: 1.0
id: def-rf4ce
status: estandar
category: protocolos-de-red
contexto: systemtechnik
date: 2026-11-11
tags:
  - protocolos
  - inalambrico
  - iot
aliases:
  - radio frequency for consumer electronics
  - rf4ce nwk
---
**RF4CE** (Radio Frequency for Consumer Electronics) es un protocolo de comunicación inalámbrica diseñado específicamente para dispositivos electrónicos de consumo —controles remotos avanzados, audífonos, cámaras— que requieren conectividad sencilla y eficiente; el término **NWK** se refiere a la capa de red (Network Layer) dentro de su stack de protocolos.

### Características

-  **Bajo consumo energético**: Ideal para dispositivos alimentados por baterías, como controles remotos.
-  **Bajo retardo**: Ofrece tiempos de respuesta rápidos, adecuados para aplicaciones en tiempo real.
-  **Simplicidad**: Es más simple que Zigbee, ya que no requiere la complejidad de redes mesh.
-  **Interoperabilidad**: Garantiza que dispositivos de diferentes fabricantes puedan comunicarse entre sí.
-  **Seguridad**: Incluye mecanismos de cifrado AES-128 para proteger las comunicaciones.

### Arquitectura

-  **Capa física (PHY)**: Define cómo los datos se transmiten por radiofrecuencia (generalmente en la banda de 2.4 GHz); es compatible con el estándar IEEE 802.15.4.
-  **Capa de enlace (MAC)**: Gestionada también por IEEE 802.15.4; se encarga del acceso a la red y la sincronización entre dispositivos.
-  **Capa de red (NWK)**: Responsable de establecer conexiones entre dispositivos, manejar direcciones y rutas de comunicación, y soportar topologías simples (punto a punto o estrella); a diferencia de Zigbee, no soporta redes mesh.
-  **Capa de aplicación**: Define los perfiles y servicios específicos para cada aplicación (control remoto, sensores, etc.).

### Propósito fundamental

RF4CE ofrece una alternativa ligera a Zigbee para el control de dispositivos de consumo: conectividad punto a punto fiable con AES-128 y consumo mínimo, sacrificando la escalabilidad mesh.
