---
def-type: atomic
version: 1.0
id: def-eigrp
status: estandar
category: redes
contexto: routing-y-conmutacion
date: 2026-11-11
tags:
  - redes
  - routing
  - cisco
  - protocolos
aliases:
  - enhanced interior gateway routing protocol
  - protocolo de gateway interior mejorado
  - protocolo de enrutamiento híbrido cisco
---
**EIGRP** (_Enhanced Interior Gateway Routing Protocol_) es un protocolo de enrutamiento dinámico de Cisco clasificado como **híbrido**: combina mecánicas de vector distancia con propiedades de estado de enlace, y puede funcionar en dos modos — **modo OSPF** (avanzado) y **modo clásico**. Es un protocolo de _gateway interior_ (IGP): enrutamiento dentro de un mismo sistema autónomo.

#### Modo OSPF (Avanzado)

-  Funciona como un protocolo de **estado de enlace**: usa el algoritmo **SPF** (Dijkstra) para calcular las rutas más cortas sobre una vista completa de la topología.
-  **Escalable**: capaz de operar en redes de gran tamaño con un alto número de routers.
-  **Interoperable**: puede intercambiar rutas con redes que ejecutan OSPF.

#### Modo Clásico

-  Funciona como **vector distancia avanzado**: usa el algoritmo de **Bellman-Ford** (con el refinamiento DUAL de Cisco) para calcular rutas basándose en lo que reportan los vecinos.
-  **Compatibilidad limitada**: solo intercambia rutas con otros routers que ejecuten EIGRP en modo clásico — es un protocolo propietario de Cisco (aunque parcialmente publicado como RFC).

#### Diferencia Crítica: EIGRP vs. OSPF puro

-  **OSPF** es estándar abierto (multivendor), puramente estado de enlace, y organiza la red en áreas jerárquicas.
-  **EIGRP** es Cisco-centrado, híbrido, y aporta ventajas operativas propias: métrica compuesta (ancho de banda y retardo por defecto), **convergencia ultrarrápida sin bucles** mediante DUAL (rutas de respaldo ya calculadas — _feasible successor_) y actualizaciones incrementales en vez de inundaciones periódicas.
-  La elección es casi siempre política y de parque: red multi-fabricante → OSPF; parque Cisco homogéneo → EIGRP es la opción con menos carga de cálculo.

### Propósito fundamental

EIGRP demuestra que los dos paradigmas de enrutamiento no son excluyentes: al combinar la vista topológica del estado de enlace con la ligereza del vector distancia y añadir DUAL, ofrece una de las convergencias más rápidas del mundo IGP — a cambio de atar la red al ecosistema Cisco.
