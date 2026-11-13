---
def-type: atomic
version: 1.0
id: def-ndp
status: estandar
category: redes
contexto: direccionamiento-ip
date: 2026-11-11
tags:
  - ipv6
  - redes
  - protocolos
aliases:
  - ndp
  - protocolo de detección de vecinos
  - neighbor discovery
---
El **protocolo NDP** (_Neighbor Discovery Protocol_ — protocolo de detección de vecinos) es una **parte integral de IPv6 basada en ICMPv6**: **reemplaza las funciones que ARP realiza en IPv4** y añade capacidades nuevas propias del protocolo — es el ARP evolucionado de la era IPv6, más el sistema de autoconfiguración.

#### Sus Cuatro Responsabilidades

-  **Resolución de direcciones**: como ARP en IPv4, resuelve direcciones MAC a partir de direcciones IPv6 — mediante mensajes **NS** (_Neighbor Solicitation_, solicitud de vecino) y **NA** (_Neighbor Advertisement_, anuncio de vecino).
-  **Detección de vecinos**: verifica la presencia de otros dispositivos en la red local — útil para detectar si una dirección IPv6 ya está en uso por otro equipo (duplicados).
-  **Detección de routers**: los routers envían **RA** (_Router Advertisement_, anuncios de router) periódicos informando su presencia y la configuración — prefijos de red, tiempo de vida de los prefijos; los hosts pueden pedirlo con **RS** (_Router Solicitation_). Es la base de la autoconfiguración de direcciones (SLAAC) en IPv6.
-  **Redirección**: los routers pueden avisar al host de una **ruta más eficiente** hacia un destino particular.

#### Diferencia Crítica: NDP vs. ARP

-  **ARP** resuelve IP→MAC en IPv4 **con broadcasts** que golpean a todos los hosts del segmento.
-  **NDP** hace el mismo trabajo sobre **ICMPv6 con multicast**: los mensajes solo alcanzan a los nodos interesados — más eficiente y menos ruido.
-  Además, NDP hace MUCHO más que ARP: descubre routers, autoconfigura direcciones, detecta duplicados y redirige — ARP solo resuelve. Y existe una variante segura (SEND) que ARP nunca tuvo.

### Propósito fundamental

NDP es el servicio de vecindad de IPv6: encuentra quién está al lado, quién es el router y cómo configurarse sin servidor — absorbe el trabajo de ARP y lo multiplica con autoconfiguración y detección, uno de los rediseños que hace de IPv6 una red que se administra a sí misma.
