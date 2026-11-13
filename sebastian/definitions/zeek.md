---
def-type: atomic
version: 1.0
id: def-zeek
status: estandar
category: ciberseguridad
contexto: analisis-de-trafico
date: 2026-11-12
tags:
  - zeek
  - nsm
  - analisis-de-trafico
  - deteccion
aliases:
  - zeek
  - bro
  - zeek bro
---
**Zeek** (antes conocido como **Bro**) es un **motor de análisis de protocolos y grabador de paquetes que se usa comúnmente para analizar el tráfico de red y detectar anomalías de comportamiento**: no busca firmas — ENTIENDE los protocolos y registra lo que pasa en ellos — el padre del _Network Security Monitoring_ moderno.

#### Cómo se Diferencia de un IDS Clásico

-  **Snort/Suricata** buscan FIRMAS: matchea patrones maliciosos conocidos.
-  **Zeek** analiza PROTOCOLOS: decodifica HTTP, DNS, SSH, TLS... y produce **registros estructurados y ricos** de cada sesión — quién, qué, cuánto, con qué comportamiento — sin necesariamente alarmarse.
-  Su valor: la DETECCIÓN DE ANOMALÍAS DE COMPORTAMIENTO — conexiones raras, patrones inusuales de DNS, exfiltración lenta — lo que no tiene firma pero sí tiene forma.
-  Y es **programable**: su lenguaje de scripting permite escribir políticas propias — "si un host hace N conexiones DNS en un minuto, registra/alerta" — detección a medida.

#### Sus Salidas

-  **Logs estructurados por protocolo**: conn.log, http.log, dns.log, ssl.log, files.log — cada conversación de la red descrita en campos analíticos.
-  Integración directa con Elasticsearch/Kibana y los pipelines del SOC moderno — Zeek alimenta la detección de comportamiento y el threat hunting.
-  Además: puede extraer archivos del tráfico y grabar paquetes selectivamente.

#### Su Lugar en Security Onion

Zeek es uno de los sensores estrella del stack: junto a **Suricata** (firmas) y **Wazuh** (hosts), aporta la tercera vista — el análisis de protocolos y comportamientos. Las tres miradas sobre el mismo tráfico: firmas, protocolos y hosts.

#### Diferencia Crítica: Zeek vs. Suricata

-  **Suricata** responde "¿hay una amenaza CONOCIDA en este paquete?" — firmas y reglas.
-  **Zeek** responde "¿QUÉ está pasando en esta red, protocolo por protocolo?" — análisis y comportamiento.
-  Se complementan de forma ejemplar: las firmas cazan lo conocido; Zeek describe TODO lo que pasa para que lo desconocido sea detectable por su comportamiento — el dúo completo del monitoreo de red.

### Propósito fundamental

Zeek es el narrador de la red: entiende cada protocolo y registra lo que ocurre en ellos con riqueza estructural — el motor que convierte el tráfico en datos analizables para detectar anomalías de comportamiento — y la pieza que elevó el monitoreo de red de "buscar firmas" a "entender lo que pasa".
