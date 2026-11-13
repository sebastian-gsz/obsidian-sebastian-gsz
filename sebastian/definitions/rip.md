---
def-type: atomic
version: 1.0
id: def-rip
status: estandar
category: redes
contexto: routing-y-conmutacion
date: 2026-11-11
tags:
  - redes
  - routing
  - protocolos
  - vector-distancia
aliases:
  - rip
  - routing information protocol
  - protocolo de información de enrutamiento
---
**RIP** (_Routing Information Protocol_) es un **protocolo de enrutamiento dinámico de tipo vector distancia** que calcula las rutas más cortas entre dos puntos de una red IP: **uno de los protocolos de enrutamiento más antiguos y simples** — usado principalmente en redes pequeñas o como respaldo en redes mayores.

#### Funcionamiento

1.  **Intercambio de información**: los routers RIP envían mensajes de actualización a sus vecinos **cada 30 segundos**.
2.  **Información de las rutas**: cada actualización contiene las rutas que el router conoce, con la distancia a cada destino (en saltos).
3.  **Cálculo de rutas**: el algoritmo de **Bellman-Ford** calcula la ruta más corta con la información de las actualizaciones — la opinión de los vecinos.
4.  **Reenvío**: los paquetes siguen el siguiente salto en la ruta calculada.

#### Ventajas

-  **Simple**: fácil de entender y configurar — el protocolo con el que se aprende enrutamiento.
-  **Eficiente en recursos**: consume pocos CPU y memoria.
-  **Ampliamente compatible**: soportado por una amplia gama de routers, de cualquier época y fabricante.

#### Desventajas

-  **Convergencia lenta**: tarda en adaptarse a cambios de topología — los cambios se propagan vecino a vecino, minuto a minuto.
-  **Escalabilidad limitada**: no escala para redes grandes — el límite clásico de **15 saltos** (16 = infinito) acota su mundo.
-  **Bucles de enrutamiento**: susceptible a bucles si no se configura correctamente — el precio del conocimiento de segunda mano.

#### Versiones

-  **RIPv1**: la original — classful, sin máscaras variables, broadcast.
-  **RIPv2**: mejorada — soporte para **VLSM** (máscaras de subred variables) y **autenticación** de las actualizaciones.

#### Diferencia Crítica: RIP vs. OSPF

-  **RIP** es vector distancia: cada router sabe solo lo que le dicen sus vecinos — convergencia lenta, límite de 15 saltos, bucles posibles.
-  **OSPF** es estado de enlace: cada router construye el MAPA completo y calcula con SPF — convergencia rápida, sin límite práctico de saltos, sin bucles.
-  El legado de RIP: define el punto de comparación — todo protocolo de enrutamiento moderno se explica por lo que RIP hacía mal a escala.

### Propósito fundamental

RIP es el abuelo honesto del enrutamiento dinámico: simple, ligero y universal — perfecto para aprender, tolerable en redes pequeñas y como respaldo — y su límite de 15 saltos y su convergencia lenta son exactamente la lección de por qué el mundo escaló hacia OSPF e IS-IS.
