---
def-type: atomic
version: 1.0
id: def-router
status: estandar
category: redes
contexto: routing-y-conmutacion
date: 2026-11-11
tags:
  - redes
  - routing
  - infraestructura
aliases:
  - enrutador
  - encaminador
  - gateway de capa 3
---
Un **enrutador** (_router_) es un dispositivo de red que **reenvía paquetes de datos entre redes independientes**, dirigiéndolos hacia su destino correcto mientras mantiene esas redes separadas. Es el dispositivo que permite conectar una red local (LAN) a una red de área amplia (WAN) — como Internet — y es esencial para que cualquier dispositivo alcance redes más allá de la suya.

#### Cómo Decide el Camino

-  **Capa 3 (red)**: opera sobre direcciones IP, a diferencia del _switch_, que conmuta tramas por MAC en la capa 2. El router mira la IP de destino del paquete y consulta su **tabla de enrutamiento** para elegir el siguiente salto (_next hop_).
-  **Tabla de enrutamiento**: cada entrada dice "para llegar a la red X, entrega al router Y por la interfaz Z". Las entradas llegan por tres vías: redes directamente conectadas, rutas estáticas configuradas a mano, y protocolos de enrutamiento dinámico (OSPF, EIGRP, BGP) que las aprenden de otros routers.
-  **Separación de dominios**: además de reenviar, delimita — cada interfaz pertenece a una red distinta, y el router no propaga _broadcasts_. Esa separación es la que hace que Internet sea una red de redes y no una sola LAN global.

#### Diferencia Crítica: Router vs. Switch

-  El **switch** conecta dispositivos *dentro* de una misma red y entrega tramas por dirección MAC; no entiende de redes remotas.
-  El **router** conecta redes *distintas* entre sí y encamina paquetes por dirección IP. El switch crea la red; el router la une con el resto del mundo.
-  En el hogar, el "router" de fibra es en realidad router + switch + punto de acceso + firewall en una sola caja.

### Propósito fundamental

El enrutador es el nodo que convierte muchas redes aisladas en una interconexión útil: decide, paquete a paquete y sobre direcciones IP, cuál es el siguiente paso hacia cualquier destino del mundo — la función sobre la que se construye todo Internet.
