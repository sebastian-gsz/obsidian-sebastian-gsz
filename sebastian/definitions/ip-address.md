---
def-type: atomic
version: 1.0
id: def-ip-address
status: estandar
category: redes
contexto: direccionamiento-ip
date: 2026-11-11
tags:
  - ip
  - direccionamiento
  - redes
  - ipv4
aliases:
  - dirección ip
  - ip address
  - protocolo de internet
---
Una **dirección IP** es el identificador numérico que el **Internet Protocol (IP)** asigna a cada dispositivo conectado a una red para poder enviarle y recibir datos de él: sin ella, ningún paquete sabe a dónde ir — es el domicilio lógico de todo host en la red.

#### La Estructura IPv4: 4 Octetos

Una dirección IPv4 son **32 bits divididos en 4 octetos** (grupos de 8 bits), escritos en decimal separados por puntos. Cada octeto vale de 0 a 255. El ejemplo en binario:

`11111111.00000000.00110011.10011100` = **255.0.51.156**

-  **Porción de red**: los primeros bits identifican la red a la que pertenece el host — es lo que los routers consultan para enrutar (longest prefix match).
-  **Porción de host**: los bits restantes identifican al dispositivo dentro de esa red.
-  La **máscara de subred** (o el prefijo CIDR `/24`, `/16`...) delimita dónde termina la red y empieza el host.
-  El espacio IPv4 total: 2³² ≈ 4.300 millones de direcciones — **agotadas** desde hace años; **IPv6** (128 bits, notación hexadecimal) es su sucesor.

#### Diferencia Crítica: IP (el protocolo) vs. Dirección IP (el identificador)

-  El **Internet Protocol** es el protocolo: define cómo se fragmentan, dirigen y entregan los paquetes entre redes.
-  La **dirección IP** es el dato que hace posible ese envío: el identificador que va en la cabecera de cada paquete.
-  El legacy las funde bajo "IP", y de ahí la confusión común — el protocolo es el sistema postal; la dirección, el domicilio que escribe en el sobre. Ambas conviven con variantes: la dirección **anycast** permite que varios servidores compartan una sola IP.

### Propósito fundamental

La dirección IP es la unidad mínima del direccionamiento global: 32 bits que convierten una malla de redes ajenas entre sí en un espacio direccionable donde cualquier host puede alcanzar a cualquier otro — y su estructura red/host es la base sobre la que se construyen el enrutamiento, las subredes y toda la arquitectura de Internet.
