---
def-type: atomic
version: 1.0
id: def-lan
status: estandar
category: redes
contexto: topologia-de-redes
date: 2026-11-11
tags:
  - redes
  - lan
  - infraestructura
aliases:
  - lan
  - red de área local
  - local area network
---
Una **LAN** (_Local Area Network_ — red de área local) es una red informática que **interconecta computadoras y dispositivos en un área geográfica limitada** — una casa, una oficina o un campus — permitiendo la comunicación directa entre los dispositivos locales sin salir al mundo exterior.

#### Características Definitorias

-  **Alcance limitado**: un edificio o campus — la delimitación geográfica es lo que la define frente a las redes de área amplia.
-  **Alta velocidad y baja latencia**: Ethernet (1/10 Gbps) y WiFi dentro del alcance — órdenes de magnitud más rápidas que cualquier enlace WAN.
-  **Propiedad privada**: la infraestructura (switches, cables, puntos de acceso) pertenece a la organización o al hogar — no a un operador.
-  **Comunicación directa**: los dispositivos se hablan entre sí por direcciones MAC y IP locales, sin intermediarios externos.

#### Los Componentes de una LAN

-  **Switch**: conecta los dispositivos por cable y conmuta tramas por MAC dentro de la LAN.
-  **Punto de acceso WiFi**: la porción inalámbrica de la red local.
-  **Router**: el punto de salida — conecta la LAN con la WAN (Internet) y delimita ambas redes.
-  **Servidores locales**: archivos, impresión, impresoras compartidas — servicios que viven y se consumen dentro.

#### Diferencia Crítica: LAN vs. WAN

-  La **LAN** es el terreno propio: controlada por la organización, rápida, limitada al edificio.
-  La **WAN** (_Wide Area Network_) conecta LANs distantes entre sí a través de infraestructura ajena (Internet, enlaces de operador) — más lenta, más cara, fuera de tu control.
-  La relación es jerárquica: las LAN son los nodos y las WAN las carreteras entre ellas — Internet es, en esencia, la WAN de todas las WANs.

### Propósito fundamental

La LAN es la unidad básica de la conectividad: el terreno controlado donde tus dispositivos se comunican rápido y en privado — y la frontera que un router y un firewall gestionan frente al resto del mundo, donde termina tu velocidad y empieza la de los demás.
