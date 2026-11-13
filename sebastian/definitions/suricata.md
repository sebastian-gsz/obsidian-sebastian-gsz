---
def-type: atomic
version: 1.0
id: def-suricata
status: estandar
category: ciberseguridad
contexto: detección-de-intrusiones
date: 2026-11-11
tags:
  - suricata
  - ids
  - nids
  - deteccion
aliases:
  - suricata
  - suricata ids
---
**Suricata** es un **software de análisis de redes y detección de amenazas de código abierto**: **inspecciona el tráfico de red para identificar comportamientos sospechosos y generar registros de datos de red** — el motor NIDS/NIPS moderno que encuentra actividad en usuarios, equipos o direcciones IP para descubrir amenazas, riesgos o vulnerabilidades.

#### Qué Hace

-  **Detección basada en reglas**: matchea el tráfico contra firmas (compatibles con la sintaxis de Snort) — alertas de amenazas conocidas en tiempo real.
-  **Detección por protocolo y anomalías**: entendimiento nativo de HTTP, TLS, DNS, SMB, FTP — decodifica los protocolos y busca lo anómalo dentro de cada uno.
-  **Generación de registros ricos**: no solo alertas — eve.json, el registro estructurado de todo lo que ve: eventos, sesiones, archivos, DNS — materia prima directa para Elasticsearch y el SOC moderno.
-  **Extracción de archivos**: puede guardar los archivos que viajan por la red (HTTP, SMB...) — forense integrada en el sensor.
-  Modo **inline (NIPS)**: además de detectar, puede bloquear cuando se le despliega en línea.

#### Su Fortaleza Técnica

-  **Multihilo por diseño**: escala sobre el hardware moderno — procesa tráfico a 10G+ en servidores ordinarios donde los motores de una sola cola descartan paquetes.
-  Por eso es el motor **por defecto de Security Onion** y el elegido en los SOC de alto caudal.

#### Diferencia Crítica: Suricata vs. Snort

-  Ambos son motores de detección de red basados en reglas con **sintaxis de reglas compatible** — las reglas viajan entre ellos.
-  **Suricata** nació multihilo (OISF) y con registros estructurados nativos; **Snort** es el clásico fundacional (Cisco), ahora modernizado con Snort 3.
-  La elección práctica: alto caudal y salida para el pipeline Elastic → Suricata; ecosistema histórico y reglas heredadas → Snort — y en Security Onion conviven como motores seleccionables.

### Propósito fundamental

Suricata es el motor de detección de la era de los SOC modernos: inspección multihilo a velocidad de línea, reglas compatibles con el estándar histórico y registros estructurados que alimentan directamente el análisis — el sensor que convierte el tráfico crudo en datos detectables a escala.
