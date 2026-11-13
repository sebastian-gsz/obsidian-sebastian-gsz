---
def-type: atomic
version: 1.0
id: def-wan
status: estandar
category: redes
contexto: topologia-de-redes
date: 2026-11-12
tags:
  - redes
  - wan
  - infraestructura
aliases:
  - wan
  - red de área amplia
  - wide area network
---
Una **WAN** (_Wide Area Network_ — red de área amplia) es una **red informática que conecta múltiples LANs a través de distancias geográficas más amplias** — a nivel regional, nacional o **global**: la red que une las redes — y **la Internet es el ejemplo máximo de una WAN**.

#### Qué Define una WAN

-  **Alcance geográfico**: ciudades, países, continentes — frente a la LAN limitada al edificio, la WAN cruza kilómetros y océanos.
-  **Infraestructura ajena**: los enlaces (fibra de operadores, satélite, MPLS, internet) pertenecen a proveedores — a diferencia de la LAN, de propiedad privada.
-  **Latencias mayores y ancho de banda costoso**: la distancia y el alquiler del transporte se pagan en velocidad — por eso el diseño WAN optimiza cada byte.

#### Cómo Conecta las LANs

-  Cada sitio (oficina, datacenter) tiene su LAN; en el borde de cada una, un **router** la une con la WAN — el punto donde tu red privada habla con el transporte ajeno.
-  Las tecnologías del borde varían: líneas dedicadas (MPLS), VPN sobre internet, **SD-WAN** (la evolución inteligente), Cloud Interconnect para los entornos híbridos.
-  El conjunto: LANs como nodos, WAN como carreteras — Internet como la WAN de todas las WANs.

#### Diferencia Crítica: WAN vs. LAN

-  La **LAN** es local, rápida, privada y tuya — el terreno controlado.
-  La **WAN** es amplia, más lenta, alquilada y compartida — el camino hacia el mundo.
-  La relación es jerárquica y complementaria: la LAN crea la red; la WAN la conecta con las demás — y la frontera entre ambas (el router y el firewall) es donde vive toda la seguridad del perímetro.

### Propósito fundamental

La WAN es la carretera entre las redes: conecta LANs a través de distancias geográficas — hasta formar Internet, la WAN de todas las WANs — y su papel es el de la infraestructura ajena que convierte muchas redes locales en una sola red global, con el costo y la latencia que la distancia impone.
