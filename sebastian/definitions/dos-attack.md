---
def-type: atomic
version: 1.0
id: def-dos-ddos
status: estandar
category: amenazas
contexto: ataques-de-red
date: 2026-11-12
tags:
  - dos
  - ddos
  - amenazas
  - disponibilidad
aliases:
  - ataque de denegación de servicio
  - dos ddos
  - denegación de servicio
---
Los **ataques de denegación de servicio** (DoS — y su forma distribuida **DDoS**) son **vectores de ataque que saturan un servidor o red con tráfico para inutilizarlo**: no roban datos ni rompen software — agotan el RECURSO (ancho de banda, memoria, conexiones) hasta que el servicio legítimo no puede atender a nadie. Atacan directamente la **disponibilidad** de la tríada CIA.

#### DoS vs. DDoS

-  **DoS** (_Denial of Service_): un origen único satura al objetivo — simple pero limitado por el ancho de banda del atacante.
-  **DDoS** (_Distributed DoS_): **miles de máquinas comprometidas** (una botnet) atacan a la vez — la escala del ataque deja de depender de una máquina y supera cualquier enlace individual.

#### La Familia (los ejemplos del legacy)

-  **Inundación ICMP** (_ping flood_): pings masivos que consumen ancho de banda.
-  **Ataque de inundación SYN** (_SYN flood_): handshakes TCP iniciados y jamás completados — la tabla de conexiones del servidor se llena de sesiones a medio abrir.
-  **Smurf**: ping broadcast con IP suplantada de la víctima — todos los hosts de la red responden hacia ella (amplificación).
-  **Ping de la muerte**: el paquete oversized que crasheaba sistemas antiguos (histórico).
-  La lógica común: agotar un recurso — ancho de banda, memoria, sockets, CPU — con tráfico que parece legítimo.

#### La Mitigación Moderna

-  **Scrubbing/CDN**: servicios (Cloudflare, AWS Shield) que absorven el tráfico masivo delante del origen.
-  **Rate limiting y SYN cookies**: frenar volúmenes y neutralizar los handshakes falsos.
-  **Anycast**: distribuir el ataque entre cientos de nodos en vez de concentrarlo en uno — la arquitectura que difumina la avalancha.

#### Diferencia Crítica: DoS/DDoS vs. Malware

-  El **malware** compromete SISTEMAS: entra, roba, persiste — ataca confidencialidad e integridad.
-  El **DoS/DDoS** no entra: **satura** — su daño es la indisponibilidad, y su rastro suele desaparecer con el tráfico.
-  Por eso se defiende distinto: contra el malware, parcheo y EDR; contra el DDoS, absorción de tráfico y arquitectura distribuida — sin parches que instalen.

### Propósito fundamental

El DoS/DDoS es el ataque que no entra — apaga: saturar el recurso hasta que el servicio legítimo muera de hambre — el vector que ataca la disponibilidad por encima de todo, y cuya defensa no es un parche sino una arquitectura: absorción distribuida, límites de tasa y la capacidad de respirar mientras la avalancha pasa.
