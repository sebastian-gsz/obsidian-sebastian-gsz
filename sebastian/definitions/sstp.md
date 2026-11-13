---
def-type: atomic
version: 1.0
id: def-sstp
status: estandar
category: redes
contexto: seguridad-vpn
date: 2026-11-11
tags:
  - vpn
  - sstp
  - tls
  - microsoft
aliases:
  - sstp
  - secure socket tunneling protocol
  - protocolo de túnel seguro ssl
---
**SSTP** (_Secure Socket Tunneling Protocol_) es un **protocolo VPN desarrollado por Microsoft que transporta el tráfico VPN a través de una conexión segura basada en SSL/TLS**: viaja por el **puerto estándar 443** — el mismo de HTTPS — lo que lo hace ideal para **atravesar firewalls que bloquean otros protocolos** VPN.

#### Sus Claves Técnicas

-  **Uso de SSL/TLS**: aprovecha el cifrado y la autenticación inherentes a TLS — privacidad y seguridad heredadas del estándar web; usa **certificados X.509** para autenticar al servidor.
-  **Evita bloqueos**: opera en el puerto **443** (el de HTTPS) — funciona donde otros protocolos VPN mueren tras firewalls restrictivos y proxies.
-  **Integración con Windows**: nativo desde **Windows Vista SP1** en adelante — implementación sencilla sin instalar clientes extra.
-  **Cifrado fuerte**: admite algoritmos como **AES-256**.

#### Cómo Funciona

1.  **Establecimiento del túnel TLS**: el cliente inicia una conexión HTTPS con el servidor VPN — con **autenticación mutua por certificados**.
2.  **Tunelización de datos**: establecida la conexión segura, el tráfico VPN se **encapsula dentro del túnel TLS**.
3.  **Transmisión**: todo viaja cifrado por el puerto 443 — protegido ante interceptaciones e indistinguible (a nivel de puerto) del tráfico HTTPS corriente.

#### Ventajas

-  **Ideal para redes restringidas**: funciona donde otros protocolos fallan — firewalls estrictos, proxies corporativos, países que filtran VPN por puertos.
-  **Seguridad robusta**: los estándares TLS, ampliamente confiables y auditados.
-  **Nativo en Windows**: sin clientes de terceros en el entorno Microsoft.
-  **NAT traversal limpio**: funciona bien tras NAT, evitando los problemas clásicos de otros protocolos.

#### Diferencia Crítica: SSTP vs. L2TP/IPsec

-  Ambos atraviesan firewalls, por caminos distintos: **L2TP/IPsec** usa UDP 500/4500 (a veces filtrado) y monta DOS protocolos (túnel + cifrado); **SSTP** usa el 443 TCP con TLS integrado — se disfraza de HTTPS.
-  SSTP es **Microsoft-centrado** (su fuerza y su límite: ecosistema Windows); L2TP tiene soporte universal pero arquitectura más frágil.
-  Contra **WireGuard/OpenVPN** modernos: SSTP gana en natividad Windows y en pasar firewalls (443); pierde en multiplataforma y en rendimiento frente a WireGuard.

### Propósito fundamental

SSTP es la VPN que se disfraza de HTTPS: tuneliza el tráfico dentro de TLS por el puerto 443 — la solución Microsoft para conectarse donde los firewalls bloquean todo lo demás — y su lección de diseño es la estrategia del camaleón: cuando el entorno te bloquea, usa el puerto que nunca está cerrado.
