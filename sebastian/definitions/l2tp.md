---
def-type: atomic
version: 1.0
id: def-l2tp
status: estandar
category: redes
contexto: seguridad-vpn
date: 2026-11-11
tags:
  - vpn
  - protocolos
  - tunneling
  - redes
aliases:
  - l2tp
  - layer 2 tunneling protocol
  - protocolo de tunelización de capa 2
---
**L2TP** (_Layer 2 Tunneling Protocol_ — protocolo de tunelización de capa 2) es un protocolo de tunelización que **transporta datos encapsulados pero no ofrece cifrado por sí mismo**: construye el túnel — el "tubo" por el que viaja el tráfico — pero no pone las puertas blindadas. Por eso nunca viaja solo: se combina con IPsec, formando el clásico **L2TP/IPsec**.

#### Qué Hace y Qué No

-  **Hace el túnel**: encapsula tramas PPP (la capa 2 de la vieja conexión telefónica) dentro de paquetes IP, permitiendo que un cliente remoto se comunique como si estuviera en la red local.
-  **No cifra**: el contenido viaja legible si alguien intercepta el túnel — el protocolo no incluye ni negociación de claves ni cifrado.
-  **La pareja obligada**: IPsec añade exactamente lo que falta — cifrado y autenticación — y por eso L2TP/IPsec fue durante años el estándar de VPN corporativa compatible con todo.

#### Diferencia Crítica: L2TP vs. VPNs modernas

-  **L2TP/IPsec** requiere dos capas de encapsulado (túnel L2TP + cifrado IPsec), puertos UDP 500/4500 abiertos, y su negociación es difícil de pasar por NAT y firewalls estrictos.
-  **OpenVPN/TLS** y **WireGuard** cifran y tunelizan en un solo protocolo moderno, con mejor rendimiento y menos superficie de ataque — WireGuard lo expresa mejor: ~4.000 líneas que hacen todo, frente a una arquitectura de dos protocolos ensamblados.
-  L2TP/IPsec sobrevive por compatibilidad legada (soporte nativo en todos los sistemas operativos), no por ser la mejor opción hoy.

### Propósito fundamental

L2TP enseña la anatomía de una VPN por descomposición: el túnel (transporte encapsulado) y la seguridad (cifrado y autenticación) son funciones distintas que este protocolo separa — y la historia de L2TP/IPsec demuestra que juntarlas bien es lo que hace una VPN de verdad segura.
