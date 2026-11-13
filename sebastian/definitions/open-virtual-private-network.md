---
def-type: atomic
version: 1.0
id: def-openvpn
status: estandar
category: protocolos-de-red
contexto: vpn-y-túneles-seguros
date: 2026-07-02
tags:
  - openvpn
  - vpn
  - seguridad
  - red
  - ssl
aliases:
  - openvpn
---
OpenVPN es una aplicación de software de código abierto que implementa técnicas de red privada virtual (VPN) para crear conexiones seguras de punto a punto o de sitio a sitio. Utiliza una implementación personalizada basada en los protocolos SSL/TLS para el intercambio de claves y el cifrado de datos, lo que le otorga una gran flexibilidad para atravesar firewalls y traductores de direcciones de red (NAT).

#### Características técnicas

-  **Flexibilidad:** Puede operar tanto sobre TCP como sobre UDP, lo que facilita su configuración en diversos entornos de red.
-  **Seguridad:** Utiliza la librería OpenSSL para cifrar el tráfico, permitiendo una amplia gama de algoritmos criptográficos.
-  **Autenticación:** Soporta múltiples métodos, incluyendo certificados digitales, usuario/contraseña, y tokens de hardware.

#### Propósito arquitectónico

Es una de las soluciones VPN más maduras y probadas en el mercado. A diferencia de WireGuard, que es más moderno y eficiente en términos de rendimiento y simplicidad, OpenVPN es preferido en entornos donde la compatibilidad con sistemas heredados, la autenticación granular y la configuración compleja de red son requisitos obligatorios.