---
def-type: atomic
version: 1.0
id: def-bgp
status: estandar
category: protocolos-de-red
contexto: internet-routing
date: 2026-06-17
tags:
  - redes
  - bgp
  - enrutamiento
  - internet
aliases:
  - bgp
  - border gateway protocol
  - protocolo de pasarela de frontera
---

El Border Gateway Protocol (BGP) es el protocolo de enrutamiento estandarizado fundamental para el intercambio de información de alcanzabilidad entre sistemas autónomos (ASN) en Internet. Actúa como el sistema de gestión de rutas global que permite la interconectividad descentralizada de las redes que componen Internet.

**Puntos clave**

-  **Intercambio de información (Faceta de comunicación)**: Funciona como el lenguaje universal que permite a los sistemas autónomos negociar y acordar las rutas mediante las cuales debe transitar el tráfico a través de la infraestructura global.
-  **Anuncio de rutas (Faceta operativa)**: Proceso mediante el cual un sistema autónomo (ASN) informa activamente a sus vecinos acerca de los prefijos IP que controla y sobre los cuales tiene autoridad de enrutamiento.
-  **Selección de ruta**: Implementa algoritmos complejos que determinan el camino óptimo para los paquetes, basándose en una combinación de políticas de negocio, latencia, costo y políticas de interconexión.
-  **Detección de fallos y convergencia**: Incorpora mecanismos para detectar la caída de enlaces y actualizar dinámicamente las tablas de enrutamiento en toda la red, garantizando la resiliencia ante cambios en la topología.
-  **Propósito**: Garantizar que el tráfico de datos encuentre un camino funcional y eficiente a través de una red descentralizada de redes independientes, lo cual es crítico para la escalabilidad y robustez de Internet.
