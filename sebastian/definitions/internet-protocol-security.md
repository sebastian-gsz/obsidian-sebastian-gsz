---
def-type: atomic
version: 1.0
id: def-ipsec-ikev2
status: estandar
category: redes
contexto: seguridad-vpn
date: 2026-07-02
tags:
  - ipsec
  - ikev2
  - vpn
  - seguridad
  - tunel
aliases:
  - ipsec
  - ikev2
  - internet key exchange v2
---
IPsec (Internet Protocol Security) es una suite de protocolos diseñada para asegurar la comunicación IP mediante la autenticación y el cifrado de paquetes de datos. IKEv2 (Internet Key Exchange version 2) es el protocolo de gestión de claves y asociación de seguridad (SA) que automatiza la negociación de parámetros criptográficos entre dos puntos, estableciendo el túnel seguro donde se transportará el tráfico de IPsec.

#### Características técnicas

-  **Autenticación y cifrado:** Utiliza protocolos como ESP (Encapsulating Security Payload) para cifrar los datos y AH (Authentication Header) para garantizar la integridad.
-  **Ventajas de IKEv2:** Introduce mejoras significativas sobre IKEv1, incluyendo una menor latencia en el _handshake_, soporte nativo para el paso a través de NAT (NAT-Traversal), mecanismos de detección de pares muertos (_dead peer detection_) y soporte para métodos de autenticación EAP.
-  **Resiliencia:** IKEv2 gestiona de forma eficiente la reconexión, permitiendo que los túneles se restablezcan rápidamente ante cambios de red (por ejemplo, al cambiar de Wi-Fi a redes móviles).

#### Propósito arquitectónico

Es el estándar de oro para configuraciones VPN de sitio a sitio (_site-to-site_) y VPN de acceso remoto de alta seguridad. Su capacidad para manejar dinámicamente las claves de cifrado sin intervención manual lo hace indispensable para conectar datacenters, sucursales o usuarios remotos a entornos Cloud de manera persistente y cifrada.

