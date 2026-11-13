---
def-type: atomic
version: 1.0
id: def-proxychains
status: estandar
category: ciberseguridad
contexto: herramientas-seguridad
date: 2026-11-11
tags:
  - proxy
  - herramientas
  - anonimato
  - linux
aliases:
  - proxychains
  - proxy chains
---
**Proxychains** es una herramienta para sistemas operativos **Linux, BSD y macOS** que funciona como proxy y **permite redirigir el tráfico de cualquier aplicación a través de una cadena de proxies**: prefijas la aplicación al comando y todo su tráfico sale por la cadena configurada — sin modificar la aplicación.

#### Qué Aporta Encadenar Proxies

-  **Oculta tu dirección IP**: al pasar tu tráfico por varios proxies, es más difícil rastrear tu actividad en línea y identificarte — cada salto borra una capa del origen.
-  **Accede a sitios web bloqueados**: si un sitio está bloqueado en tu región, el tráfico puede salir por un proxy en otro país — la restricción geográfica desaparece.
-  **Protege tu privacidad**: terceros observadores ven conexiones hacia el primer proxy, no hacia el destino real de tus actividades.

#### Cómo se Usa

-  Configuras la cadena en `proxychains.conf` (SOCKS4/5, HTTP, DNS) y ejecutas: `proxychains nmap -sT objetivo` o `proxychains firefox` — cualquier aplicación, sin código nativo de proxy.
-  En pentesting es el complemento estándar del equipo atacante: hacer que sus herramientas salgan desde infraestructura propia (o alquilada) y no desde su IP — alineado con la ética del pentest autorizado.
-  La resolución de DNS también puede forzarse por la cadena (`proxy_dns`) — evitando la fuga DNS que delata el destino real.

#### Diferencia Crítica: Proxychains vs. VPN

-  La **VPN** cifra TODO el tráfico del sistema dentro de un túnel a un servidor — capa de sistema, cifrada, una salida.
-  **Proxychains** redirige por capas de proxies **SOLO las aplicaciones que prefijes** — sin cifrado propio (depende del proxy), y cada aplicación decide.
-  Para ocultar la IP de herramientas concretas en una operación → proxychains; para todo el dispositivo de forma cifrada → VPN. En un pentest suelen convivir: VPN para el operador, proxychains para las herramientas.

### Propósito fundamental

Proxychains convierte cualquier aplicación de Linux en un cliente anónimo: encadena proxies para ocultar la IP de origen, saltar restricciones geográficas y fragmentar el rastro — el estándar del equipo rojo para que sus herramientas ataquen desde donde conviene a la operación, y no desde su propia puerta.
