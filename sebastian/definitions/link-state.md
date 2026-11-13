---
def-type: atomic
version: 1.0
id: def-link-state
status: estandar
category: redes
contexto: routing-y-conmutacion
date: 2026-11-11
tags:
  - redes
  - routing
  - protocolos
aliases:
  - estado de enlace
  - link state
  - enrutamiento de estado de enlace
---
El **estado de enlace** (_link state_) es un tipo de algoritmo de enrutamiento dinámico en el que cada router descubre a sus vecinos, inunda la red con información sobre sus enlaces y, con esa información, **construye y mantiene una base de datos completa de la topología de la red**. Cada router calcula sus rutas de forma independiente sobre ese mapa común.

#### Cómo Funciona

-  **Descubrimiento de vecinos**: cada router saluda a sus vecinos directamente conectados (paquetes Hello).
-  **Inundación de LSA**: cada router genera un anuncio de estado de enlace (LSA — _Link State Advertisement_) describiendo sus enlaces y costes, y lo reenvía a todos los routers del área. Todos terminan con la **misma base de datos topológica** (LSDB).
-  **Cálculo con SPF**: sobre esa base de datos, cada router ejecuta el algoritmo de Dijkstra (_Shortest Path First_) para calcular el árbol de caminos más cortos desde sí mismo hacia toda la red, y llena con él su tabla de enrutamiento.
-  **Reacción ante cambios**: si un enlace cae, un LSA nuevo se inunda y todos recalculan — la convergencia es rápida y libre de bucles.

#### Diferencia Crítica: Estado de Enlace vs. Vector Distancia

-  **Vector distancia** (RIP, EIGRP clásico): cada router solo conoce lo que sus vecinos le cuentan ("a esta red llego a N saltos") — opinión de segunda mano, convergencia lenta, riesgo de bucles (algoritmo de Bellman-Ford).
-  **Estado de enlace** (OSPF, IS-IS): cada router conoce el **mapa completo** y calcula con datos de primera mano — converge rápido, escala mejor en redes grandes, y su costo es más memoria y CPU.
-  Regla práctica: redes pequeñas y simples toleran vector distancia; redes grandes y jerárquicas (áreas OSPF) piden estado de enlace.

### Propósito fundamental

El estado de enlace es la filosofía del "mapa completo antes de decidir": al replicar la topología entera en cada router y calcular rutas con Dijkstra, consigue convergencia rápida y sin bucles en redes de gran tamaño — es el motor de OSPF e IS-IS, y la razón por la que las redes empresariales sobreviven a los fallos de enlaces.
