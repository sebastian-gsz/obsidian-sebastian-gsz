---
def-type: atomic
version: 1.0
id: def-snort
status: estandar
category: ciberseguridad
contexto: detección-de-intrusiones
date: 2026-11-11
tags:
  - snort
  - ids
  - ips
  - deteccion
aliases:
  - snort
---
**Snort** es un **sistema de detección de intrusiones en la red (NIDS) y de prevención (NIPS) de código abierto y basado en reglas**, desarrollado por Cisco (tras adquirir Sourcefire): **realiza detección de amenazas en tiempo real y genera alertas** cuando las reglas detectan algo — el IDS de referencia histórica de la industria.

#### Cómo Funciona el Motor de Reglas

-  **Reglas firmadas**: cada regla describe una amenaza — cabecera (protocolo, IPs, puertos) + opciones (el contenido exacto a buscar en el paquete). Si el tráfico matchea, dispara la alerta.
-  **Tres modos**: _sniffer_ (solo muestra paquetes), _packet logger_ (los registra) y **NIDS/NIPS** (el modo de detección — aplica las reglas contra el tráfico en vivo).
-  **Modo NIPS (prevención, en línea)**: además de alertar, puede descartar el paquete o la conexión — bloqueando la amenaza en el camino. **Nota del legado de Security Onion: el modo en línea NIPS no es compatible con Security Onion** — allí Snort opera como detector puro (la prevención en línea la cubren otros componentes).

#### Su Papel en el SOC

-  Snort alimenta el flujo de detección: sus alertas llegan al SIEM y a las herramientas de análisis (Sguil/Squert en Security Onion) — el sensor que convierte el tráfico crudo en señales investigables.
-  Las reglas son **actualizables y compartidas**: conjuntos comunitarios (Talos, Emerging Threats) traen detección de amenazas conocidas al día.

#### Diferencia Crítica: Snort vs. Suricata

-  Ambos son motores de detección de red basados en reglas con sintaxis compatible — **Suricata** es el motor moderno multihilo que procesa más tráfico por servidor; **Snort** es el clásico de mayor longevidad y ecosistema (ahora Snort 3, también multihilo).
-  Security Onion permite elegir motor — la sintaxis de reglas viaja entre ambos: se aprende una vez, se aplica en los dos.

### Propósito fundamental

Snort es el estándar fundacional de la detección de intrusiones basada en reglas: lee el tráfico en tiempo real, matchea contra un catálogo vivo de firmas y alerta — el sensor que convirtió la inspección de paquetes en una disciplina operable, y cuyo lenguaje de reglas sigue siendo la gramática común de los NIDS modernos.
