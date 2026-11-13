---
def-type: atomic
version: 1.0
id: def-llc
status: estandar
category: redes
contexto: enlace-de-datos
date: 2026-11-11
tags:
  - redes
  - osi
  - ethernet
  - protocolos
aliases:
  - llc
  - control de enlace lógico
  - logical link control
---
**LLC** (_Logical Link Control_ — control de enlace lógico) es una **subcapa de la capa de enlace de datos del modelo OSI** que se encarga de la **comunicación entre el software de red de las capas superiores y el hardware del dispositivo en las capas inferiores**: es el traductor entre "qué protocolo corre arriba" y "qué física conecta abajo".

#### Su Lugar en la Capa 2

La capa de enlace de datos (OSI) se divide en dos mitades:

-  **LLC (subcapa superior)**: habla con el software de red — identifica a qué protocolo de capa 3 pertenece cada trama (IPv4, IPv6, ARP...) mediante el campo de Service Access Point, y ofrece control de flujo y de errores a las capas superiores.
-  **MAC (subcapa inferior)**: habla con el hardware — direccionamiento físico (direcciones MAC origen/destino), acceso al medio (CSMA/CD en el Ethernet clásico) y la estructura física de la trama.

#### Por Qué Existe esta División

La separación LLC/MAC permite que **una misma tecnología de hardware sirva a múltiples protocolos de red**: la tarjeta Ethernet y su MAC no necesitan saber si arriba viaja IPv4 o IPv6 — LLC identifica al pasajero y MAC maneja el vehículo. Esa abstracción hizo posible evolucionar los protocolos de red sin reemplazar el hardware.

#### Diferencia Crítica: LLC vs. MAC

-  La **MAC** es la mitad mecánica: quién envía, quién recibe, cómo se accede al cable — identificada por las direcciones físicas de la trama.
-  La **LLC** es la mitad diplomática: a qué protocolo se entrega el contenido de la trama una vez llegada — el puente software-hardware.
-  En el Ethernet moderno el rol de LLC es mínimo (IP domina y el campo EtherType de la MAC hace ese trabajo), pero el modelo OSI lo conserva como concepto: dos mitades, dos mundos, un medio.

### Propósito fundamental

LLC representa la frontera elegante de la capa de enlace: al separar la conversación con el software (arriba) de la conversación con el hardware (abajo), permite que protocolos y tecnologías de red evolucionen por separado — la razón por la que un mismo cable Ethernet puede transportar cualquier protocolo que invente el futuro.
