---
def-type: atomic
version: 1.0
id: def-wireguard
status: estandar
category: protocolos-de-red
contexto: vpn-y-túneles-seguros
date: 2026-07-02
tags:
  - wireguard
  - vpn
  - red
  - seguridad
  - tunel
aliases:
  - vpn wireguard
  - wireguard vpn
  - protocolo wireguard
---
WireGuard es un protocolo de red y software de código abierto diseñado para implementar túneles VPN rápidos, modernos y seguros. A diferencia de soluciones tradicionales como IPsec o OpenVPN, WireGuard utiliza el _Noise Protocol Framework_ y algoritmos criptográficos de última generación (como Curve25519, ChaCha20 y Poly1305), logrando un rendimiento superior y una base de código significativamente más pequeña (aproximadamente 4.000 líneas de código), lo que facilita su auditoría y reduce la superficie de ataque.

#### Características técnicas

-  **Alto rendimiento:** Opera dentro del espacio del kernel en Linux, eliminando la sobrecarga de contexto entre el espacio de usuario y el kernel, lo que resulta en una latencia mínima y alto ancho de banda.
-  **Crypto-routing:** Utiliza el concepto de enrutamiento basado en criptografía; los pares (_peers_) se autentican mediante claves públicas, y la asociación de IP con la clave pública determina el enrutamiento.
-  **Roaming nativo:** Los túneles son persistentes y permiten que el cliente cambie de red (ej. de Wi-Fi a LTE) sin necesidad de renegociar la conexión, ideal para dispositivos móviles.

#### Propósito arquitectónico

Se posiciona como el sucesor de facto para VPNs en infraestructuras _cloud-native_ y acceso remoto. Su simplicidad de configuración y su capacidad para integrarse fácilmente en la pila de red del sistema lo hacen ideal para interconectar microservicios, nodos de clúster o para establecer VPNs de acceso remoto seguras y veloces.