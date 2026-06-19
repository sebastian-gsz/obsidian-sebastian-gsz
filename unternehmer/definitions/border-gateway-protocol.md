---
def-type: atomic
aliases:
  - BGP
  - Border Gateway Protocol
tags:
  - redes
  - bgp
  - enrutamiento
  - internet
category: protocolos-de-red
contexto: internet-routing
version: 1
date: 2026-06-17
status: estandar
---

Protocolo de enrutamiento estandarizado diseñado para intercambiar información de alcanzabilidad (rutas) entre diferentes sistemas autónomos (ASN) en Internet.

-  **Faceta de comunicación**: Funciona como el lenguaje universal que permite a los sistemas autónomos negociar y acordar los caminos por los cuales debe transitar el tráfico a través de la infraestructura global.
-  **Faceta operativa**:
  
	-  **Anuncio de rutas**: Proceso mediante el cual un ASN informa a sus vecinos qué prefijos IP controla.
	-  **Selección de ruta**: Algoritmos que determinan el camino óptimo basándose en políticas de negocio, latencia o costo.
	-  **Detección de fallos**: Mecanismo de convergencia que permite actualizar las tablas de enrutamiento automáticamente ante la caída de enlaces.
-  **Propósito**: Garantizar que el tráfico de datos encuentre un camino funcional y eficiente a través de una red descentralizada de redes independientes, permitiendo que Internet sea escalable y robusto.
