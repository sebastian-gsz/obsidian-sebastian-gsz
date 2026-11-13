---
def-type: atomic
version: 1.0
id: def-isis
status: estandar
category: redes
contexto: routing-y-conmutacion
date: 2026-11-11
tags:
  - redes
  - routing
  - protocolos
  - ospf
aliases:
  - intermediate system to intermediate system
  - isis
  - protocolo de enrutamiento isis
---
**IS-IS** (_Intermediate System to Intermediate System_) es un **protocolo de enrutamiento dinámico de tipo estado de enlace** que **calcula las rutas más cortas entre dos puntos de una red IP**: es el otro gran protocolo de estado de enlace además de OSPF — y el favorito de los backbones de proveedores de Internet.

#### Funcionamiento

1.  **Intercambio de información**: los routers IS-IS comparten el estado de sus enlaces con sus vecinos.
2.  **Base de datos**: cada router construye y mantiene la **base de datos topológica completa** de la red.
3.  **Cálculo de rutas**: ejecutan el algoritmo **SPF** (_Shortest Path First_ — Dijkstra) para calcular la ruta más corta a cada destino.
4.  **Reenvío de paquetes**: entregan cada paquete al siguiente router en la ruta más corta calculada.

#### Similitudes con OSPF

-  Ambos son **protocolos de estado de enlace**.
-  Ambos utilizan el algoritmo **SPF** para calcular rutas más cortas.
-  Ambos ofrecen **convergencia rápida y escalabilidad** en redes grandes.

#### Diferencia Crítica: IS-IS vs. OSPF

-  **Origen y capa**: IS-IS nació sobre redes de **nivel 2** (Ethernet, Frame Relay) y corre directamente sobre enlaces; OSPF fue diseñado para redes de **nivel 3** (IP).
-  **Jerarquía**: IS-IS admite **múltiples niveles de áreas** (jerarquía anidada — ideal para redes enormes); OSPF usa un solo nivel de áreas alrededor del área 0.
-  **Métricas**: IS-IS puede usar **métricas múltiples y extensibles** (TLVs); OSPF clásico solo usa el **coste del enlace**.
-  En la práctica: OSPF domina las redes empresariales; IS-IS domina los backbones de operadores — ambos imitan el mismo paradigma que define `link-state`: mapa completo, cálculo SPF.

### Propósito fundamental

IS-IS demuestra la solidez del paradigma de estado de enlace en su versión más escalable: base de datos topológica completa, SPF y jerarquía multinivel — el motor silencioso que sostiene los sistemas autónomos de los grandes proveedores, donde la red es tan grande que OSPF ya no respira.
