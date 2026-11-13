---
def-type: atomic
version: 1.0
id: def-ip-anycast
status: estandar
category: redes
contexto: direccionamiento-ip
date: 2026-11-11
tags:
  - anycast
  - routing
  - cdn
  - disponibilidad
aliases:
  - ip anycast
  - anycast
  - direccionamiento anycast
---
**IP Anycast** es una técnica de **direccionamiento y enrutamiento en la que varios servidores o nodos, ubicados en distintos puntos geográficos, comparten la misma dirección IP**: el cliente siempre escribe a la misma dirección, pero la red entrega su paquete al nodo más cercano según las métricas de enrutamiento.

#### Cómo Funciona

-  Cada servidor anuncia la **misma dirección IP** hacia Internet mediante BGP, desde su ubicación geográfica.
-  Los routers de la Internet global, sin saberlo, eligen por tabla de enrutamiento la ruta "más corta" a esa IP — que en cada punto del mundo termina siendo un **servidor distinto**: el más cercano a quien pregunta.
-  Si un nodo cae, sus rutas se retiran y el tráfico se **redirige automáticamente** a los demás — alta disponibilidad sin balanceador central.

#### Para Qué se Usa

-  **Servidores raíz de DNS**: la infraestructura crítica de Internet reparte el mundo entero con apenas unas decenas de direcciones anycast.
-  **CDNs**: el contenido se sirve desde el _edge_ más cercano al usuario sin que la URL cambie.
-  **Resiliencia ante DDoS**: el ataque se dispersa entre cientos de nodos globales en lugar de concentrarse en uno.

#### Diferencia Crítica: Anycast vs. Unicast/Multicast/Broadcast

-  **Unicast**: una IP = un servidor, siempre el mismo (1 → 1 fijo).
-  **Anycast**: una IP = muchos servidores, la red elige el más cercano (1 → 1 elegido por ruta).
-  **Multicast**: una IP entregada a todo el grupo suscrito (1 → grupo).
-  **Broadcast**: 1 → todos, sin excepción. Anycast es la variante donde "el destino" lo decide la topología de red, no el cliente.

### Propósito fundamental

IP Anycast invierte el sentido del direccionamiento: en vez de que el cliente busque a un servidor concreto, la red misma lo lleva al más cercano — un solo nombre que responde desde todo el mundo, la técnica que hace que DNS y CDNs sean rápidos a escala planetaria y que los ataques se difuminen en lugar de concentrarse.
