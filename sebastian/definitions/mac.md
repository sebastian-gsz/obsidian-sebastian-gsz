---
def-type: atomic
version: 1.0
id: def-mac
status: estandar
category: redes
contexto: enlace-de-datos
date: 2026-11-11
tags:
  - redes
  - osi
  - ethernet
  - hardware
aliases:
  - mac
  - media access control
  - control de acceso a medios
---
**MAC** (_Media Access Control_ — control de acceso a medios) es la **subcapa inferior de la capa de enlace de datos del modelo OSI**: se encarga de **quién usa el medio físico y cómo** — gestiona el acceso al cable o aire, y enmarca los datos con las direcciones físicas (direcciones MAC origen y destino) que identifican a cada tarjeta de red.

#### Sus Dos Trabajos

-  **Dirección física**: cada NIC lleva de fábrica una dirección MAC única de 48 bits (los primeros bytes identifican al fabricante) — el domicilio físico que las tramas usan para llegar al equipo correcto dentro de la red local.
-  **Acceso al medio**: decide cómo transmitir cuando varios comparten el cable o el aire — arbitrar quién habla para evitar colisiones (el CSMA/CD del Ethernet clásico, el CSMA/CA del WiFi).

#### Diferencia Crítica: MAC vs. LLC

-  Son las dos mitades de la capa de enlace: la **MAC** habla con el hardware — direcciones físicas y acceso al medio; la **LLC** habla con el software de las capas superiores — identifica a qué protocolo de red se entrega cada trama.
-  La MAC no sabe si el paquete lleva IPv4 o IPv6; la LLC no sabe cómo evitar colisiones en el cable — cada una su mundo, y juntas hacen funcionar la capa 2.

#### Diferencia Crítica: MAC (la subcapa) vs. Dirección MAC

-  La **subcapa MAC** es el conjunto de reglas y funciones: cómo se accede al medio.
-  La **dirección MAC** es el dato: el identificador de 48 bits que esa subcapa escribe en las tramas.
-  El mismo acrónimo para dos cosas relacionadas pero distintas — la subcapa usa la dirección; la dirección es el sello que la subcapa imprime.

#### Contexto Práctico

Los **switches** conmutan tramas leyendo direcciones MAC (por eso son equipos de capa 2); las **direcciones IP** las necesitan los routers (capa 3) — y ARP es el puente que traduce una IP a su MAC en cada salto local.

### Propósito fundamental

La subcapa MAC es la policía del medio físico: asigna a cada equipo su identidad física y ordena el acceso compartido al cable o al aire — sin ella, todos hablarían a la vez y ninguna trama sabría a quién pertenece; es la base sobre la que el Ethernet y el WiFi construyen toda comunicación local.
