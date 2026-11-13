---
def-type: atomic
version: 1.0
id: def-arp
status: estandar
category: redes
contexto: direccionamiento-ip
date: 2026-11-11
tags:
  - redes
  - arp
  - ethernet
  - protocolos
aliases:
  - arp
  - address resolution protocol
  - protocolo de resolución de direcciones
---
El **protocolo de resolución de direcciones** (_ARP_ — _Address Resolution Protocol_) es un **protocolo de red utilizado para determinar la dirección MAC del siguiente dispositivo en la ruta**: traduce la dirección IP (que el paquete lleva) a la dirección MAC (que la trama necesita) — el diccionario entre la capa 3 y la capa 2.

#### Cómo Resuelve

1.  El equipo quiere enviar un paquete a una IP de su red local, pero la trama necesita la MAC de destino.
2.  **Solicitud ARP (broadcast)**: pregunta a TODA la red local — "¿quién tiene la IP X? Dímelo a mi MAC".
3.  **Respuesta ARP**: el dueño de esa IP responde con su MAC — solo él contesta.
4.  La respuesta se guarda en la **caché ARP** para no repetir la pregunta — expira en minutos (el vecino pudo cambiar).
5.  Si el destino está en OTRA red, ARP no pregunta por el destino final sino por el **router (gateway)** — el siguiente salto (conecta con el forwarding).

#### Diferencia Crítica: ARP vs. DNS

-  **DNS** resuelve nombres → IP: "¿qué IP es google.com?" — global, jerárquico, humano.
-  **ARP** resuelve IP → MAC: "¿qué MAC tiene la IP 192.168.1.5?" — local, plano, mecánico.
-  Actúan en serie: DNS te da la IP del destino; el enrutamiento elige el camino; ARP completa la última milla local — sin ARP, el paquete IP no puede convertirse en trama entregable.

#### El Lado Oscuro: ARP Poisoning

-  ARP es **confiado**: cualquier respuesta se acepta y cachea — un atacante puede responder fingiendo ser el gateway (**ARP spoofing/poisoning**).
-  Resultado: el tráfico de la víctima pasa por el atacante — **MitM en la red local**, even con el tráfico que luego cifra a internet (ve metadatos y puede intentar degradar).
-  Defensas: _dynamic ARP inspection_ en switches, IPs estáticas en enlaces críticos, segmentación — la confianza de ARP es la grieta.

#### En IPv6

ARP no existe: su papel lo toma **NDP** (Neighbor Discovery) sobre ICMPv6 — multicast en lugar de broadcast, con detección de vecinos y duplicados incluidos.

### Propósito fundamental

ARP es el traductor de la última milla local: convierte la IP que el paquete lleva en la MAC que la trama necesita — y su confianza ciega, que lo hace simple y rápido, es también la grieta clásica del MitM local: el protocolo que asume que tus vecinos dicen la verdad.
