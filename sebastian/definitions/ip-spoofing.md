---
def-type: atomic
version: 1.0
id: def-ip-spoofing
status: estandar
category: amenazas
contexto: ataques-de-red
date: 2026-11-11
tags:
  - spoofing
  - redes
  - amenazas
aliases:
  - suplantación de ip
  - ip spoofing
  - falsificación de ip
---
La **suplantación de IP** (_IP spoofing_) es la **manipulación de la dirección IP de origen de un paquete para engañar a los sistemas sobre quién lo envía**: el atacante forja la cabecera — el paquete dice venir de una IP de confianza cuando viene de otra — la falsificación de identidad a nivel de red.

#### Cómo se Hace y Para Qué

-  **La forja**: construir paquetes con la IP de origen cambiada — trivial con herramientas de construcción de paquetes, porque IP no autentica su origen (esa es su grieta de diseño).
-  **Desbordar controles de volumen**: el _smurf attack_ y los ataques de amplificación DNS/NTP — el spoofed victim responde a un reflector que bombardea a la víctima.
-  **Sesgo de confianza históricos**: servicios que confían por IP (rsh, reglas "permitir solo la IP del servidor X") — el spoofing pretendía hacerse pasar por esa IP de confianza.
-  **Bypass de límites por IP**: saltarse bloqueos por dirección — el firewall ve la IP falsa, no la real.

#### El Límite Estructural del Spoofing

-  **TCP exige el handshake**: el atacante suplantado nunca recibe el SYN-ACK (va a la víctima real) — no puede completar la conexión... salvo con predicción de números de secuencia (histórico, Mitnick).
-  **UDP no tiene ese freno**: protocolos sin conexión son el terreno fértil del spoofing — por eso la amplificación refleja usa UDP.
-  **La defensa estructural**: _ingress/egress filtering_ en los routers (BCP 38) — no dejar pasar paquetes cuya IP de origen no pertenece a la red que los envía. Si todos filtraran, el spoofing muere: es un problema colectivo de higiene.

#### Diferencia Crítica: IP Spoofing vs. Ataque en Ruta

-  El **spoofing** falsifica ORIGEN: quien envía minte sobre su identidad — el atacante está fuera del camino.
-  El **ataque en ruta** (_on-path_, antes MitM) intercepta el CAMINO: el atacante está ENTRE las dos partes y ve/modifica el tráfico real.
-  Se combinan en la práctica: el atacante en ruta spoofea su identidad en cada salto — pero son técnicas distintas: falsificar de dónde viene vs. colocarse donde pasa.

#### Diferencia Crítica: IP Spoofing vs. ARP Spoofing

-  El **IP spoofing** falsifica la cabecera de capa 3 (IP) — funciona a distancia, sin acceso a la red local de la víctima.
-  El **ARP spoofing** falsifica la capa 2 (MAC) — requiere estar EN la red local de la víctima.
-  Ambos minten sobre identidad, en capas distintas y con alcances distintos: global vs. local.

### Propósito fundamental

La suplantación de IP explota la confianza ciega de un protocolo que nunca verificó su origen: falsificar el remitente de un paquete — y su defensa es estructural y colectiva — filtrar en el borde lo que uno no generó — porque mientras un solo rincón de Internet deje pasar paquetes mentirosos, el spoofing seguirá alimentando las amplificaciones que saturan la red.
