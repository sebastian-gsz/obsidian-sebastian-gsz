---
def-type: atomic
version: 1.0
id: def-sdn
status: estandar
category: redes
contexto: arquitectura-de-redes
date: 2026-11-11
tags:
  - sdn
  - redes
  - arquitectura
  - virtualizacion
aliases:
  - sdn
  - software defined networking
  - red definida por software
---
**SDN** (_Software-Defined Networking_ — red definida por software) es un **concepto y arquitectura de red que permite la separación del plano de control y el plano de reenvío, haciendo que la red sea más programable y flexible**: la inteligencia de la red sale de cada caja y se centraliza en software.

#### Qué Separa — y Por Qué Importa

-  En la red tradicional, cada switch/router decide POR SU CUENTA: control (qué rutas, qué políticas) y reenvío (mover paquetes) viven juntos dentro de cada caja.
-  En **SDN** el **plano de control se centraliza**: un controlador de software tiene la vista global y DICE a los switches qué hacer — estos solo reenvían según instrucciones (_plano de datos programable_).
-  El resultado: la red se **programa** — cambia la política en el controlador y toda la red se reconfigura en segundos, vía interfaces estándar (OpenFlow es el protocolo fundacional de esta idea).

#### Qué Hace Posible

-  **Configuración programática**: crear, mover o segmentar redes por API — la red como código, no como configuración manual caja por caja.
-  **Visibilidad global**: el controlador ve toda la red — decisiones coherentes en lugar de optimizaciones locales que chocan entre sí.
-  **Virtualización de red**: redes lógicas sobre la misma física — la base de las redes cloud (VPC/VNet son SDN de facto) y de los entornos multi-tenant.
-  **Innovación rápida**: nuevas funciones de red llegan como software, no como compras de hardware.

#### Diferencia Crítica: SDN vs. Red Tradicional

-  La red **tradicional** es distribuida: cada caja inteligente, decisiones locales, configuración por dispositivo — estable pero lenta de cambiar.
-  **SDN** es centralizada y programable: una mente, muchas manos — ágil y consistente, con la dependencia obvia del controlador.
-  El trade-off: autonomía distribuida frente a programabilidad centralizada — y la red moderna (cloud, datacenter) ya es SDN aunque no lo diga su nombre.

#### Diferencia Crítica: SDN vs. Routing Tradicional

-  El **routing tradicional** (OSPF/BGP) aprende rutas distribuidamente — cada router calcula el suyo con protocolos.
-  La **SDN** reemplaza ese cálculo distribuido por decisiones centrales programadas — el controlador programa las tablas (incluidas las de forwarding).
-  No compiten en todas las escalas: el routing dinámico sigue viviendo en el WAN; la SDN domina datacenter, cloud y redes que necesitan cambiar a velocidad de software.

### Propósito fundamental

SDN separa la mente de la mano en la red: el control se centraliza en software y los dispositivos solo reenvían — la arquitectura que convirtió la red en algo programable, y el fundamento invisible de las redes cloud: cada VPC que creas por API es SDN trabajando.
