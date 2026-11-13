---
def-type: atomic
version: 1.0
id: def-netbios
status: estandar
category: redes
contexto: servicios-de-red
date: 2026-11-11
tags:
  - netbios
  - windows
  - redes
  - legacy
aliases:
  - netbios
  - netbt
  - netbios sobre tcp/ip
---
**NetBIOS** (_Network Basic Input/Output System_) es una **API y un protocolo de capa de sesión** que se utilizó históricamente para que las aplicaciones de diferentes computadoras se comunicaran a través de una **red local (LAN)**. No es un protocolo de red en sí mismo como TCP/IP — necesita un protocolo de transporte subyacente para funcionar.

#### Sus Tres Servicios

1.  **Servicio de Nombres** (_Name Service_ — puerto **137** UDP/TCP): las computadoras registran y resuelven **nombres NetBIOS** legibles (nombres de computadora) en direcciones IP — la forma en que las máquinas se encontraban por nombre antes de que DNS dominara las redes locales.
2.  **Servicio de Sesión** (_Session Service_ — puerto **139** TCP): conexión fiable y orientada a conexión entre dos nombres NetBIOS para la comunicación.
3.  **Servicio de Datagramas** (_Datagram Service_ — puerto **138** UDP): mensajes sin conexión y no fiables a un nombre o grupo de nombres.

#### NetBIOS sobre TCP/IP

Originalmente corría sobre **NetBEUI**; con la popularización de TCP/IP, la implementación común se convirtió en **NetBIOS sobre TCP/IP (NBT o NetBT)** — la razón por la que los puertos 137, 138 y 139 se asocian a NetBIOS corriendo sobre TCP/IP.

#### Relevancia Actual

-  Su papel de resolución de nombres fue **reemplazado por DNS** — mucho más escalable, tanto en redes locales como en Internet.
-  Sobrevive en **sistemas heredados** y configuraciones de compatibilidad, especialmente en Windows antiguos.
-  **Exponer NetBIOS a Internet es una mala práctica de seguridad**: puede explotarse para recopilar información de la red (enumeración de nombres y usuarios) o para atacarla — uno de los chequeos básicos de cualquier auditoría externa es que 137/138/139 no respondan desde fuera.

#### Diferencia Crítica: NetBIOS vs. DNS

-  **NetBIOS** resuelve nombres **de una LAN**: plano, sin jerarquía, sin escalabilidad — diseño de los años 80.
-  **DNS** resuelve nombres **globales y jerárquicos**: el sistema que gobierna nombres en Internet y redes modernas.
-  La regla operativa: en redes actuales, DNS para todo lo posible y NetBIOS solo donde un sistema legado lo exija — apagado y blindado, no heredado por defecto.

### Propósito fundamental

NetBIOS es el vestigio operativo de la era pre-DNS de las redes Windows: sus tres servicios (nombres, sesiones, datagramas) explican los puertos 137-139 que todo escáner aún mira — y su valor actual es doble: saber qué sistema heredado lo exige, y saber por qué nunca debe quedar expuesto al mundo.
