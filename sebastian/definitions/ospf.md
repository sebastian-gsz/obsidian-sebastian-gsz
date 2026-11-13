---
def-type: atomic
version: 1.0
id: def-ospf
status: estandar
category: redes
contexto: routing-y-conmutacion
date: 2026-11-11
tags:
  - redes
  - routing
  - ospf
  - protocolos
aliases:
  - ospf
  - open shortest path first
  - protocolo ospf
---
**OSPF** (_Open Shortest Path First_) es un **protocolo de enrutamiento dinámico de tipo estado de enlace que calcula las rutas más cortas entre dos puntos de una red IP**: el IGP estándar abierto — multi-fabricante — de las redes empresariales, el "OSPF puro" frente al híbrido EIGRP.

#### Funcionamiento

1.  **Intercambio de información**: los routers OSPF comparten el estado de sus enlaces con sus vecinos.
2.  **Base de datos**: cada router construye y mantiene la base de datos con la topología completa de la red (la LSDB, alimentada por LSAs).
3.  **Cálculo de rutas**: el algoritmo **SPF** (_Shortest Path First_ — Dijkstra) calcula la ruta más corta a cada destino sobre esa base de datos.
4.  **Reenvío de paquetes**: cada paquete sigue el siguiente salto en la ruta más corta calculada.

#### Ventajas

-  **Convergencia rápida** ante cambios de topología — el impacto en el tráfico se minimiza.
-  **Escalabilidad**: funciona en redes grandes con un alto número de routers (gracias a la división en áreas).
-  **Rutas óptimas**: más precisas y eficientes que las de los algoritmos de vector distancia.
-  **Seguridad**: puede configurarse con autenticación y cifrado para proteger la información de enrutamiento.

#### Desventajas

-  **Consumo de recursos**: más CPU y memoria que los protocolos de vector distancia (el mapa completo no es gratis).
-  **Complejidad**: configuración y mantenimiento más exigentes que en protocolos más simples.

#### Áreas y Roles de Router

-  **Área única**: todos los routers en la misma área — simple, para redes medianas.
-  **Múltiples áreas**: la red se divide para reducir el tamaño de la base de datos y mejorar el rendimiento — jerarquía alrededor del área backbone (área 0).
-  Roles: **router interno** (dentro de un área), **router de área fronteriza** (ABR — conecta dos o más áreas), **router backbone** (conecta las áreas entre sí).

#### Diferencia Crítica: OSPF vs. EIGRP

-  **OSPF** es estándar abierto y de estado de enlace puro — la elección natural en redes **multi-fabricante**.
-  **EIGRP** es el híbrido de Cisco — convergencia ultrarrápida con DUAL, pero ata la red al ecosistema Cisco.
-  La decisión clásica de IGP: interoperabilidad y estándar → OSPF; parque Cisco homogéneo → EIGRP. Con IS-IS (su par de estado de enlace), OSPF domina el mundo empresarial mientras IS-IS domina los backbones de operadores.

### Propósito fundamental

OSPF es el enrutador de estado de enlace por excelencia del mundo empresarial: mapa completo de la red, cálculo SPF y jerarquía de áreas para escalar — el estándar abierto que convierte el paradigma de "conocer todo el mapa antes de decidir" en la infraestructura de enrutamiento de la mayoría de las empresas.
