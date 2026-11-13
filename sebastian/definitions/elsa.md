---
def-type: atomic
version: 1.0
id: def-elsa
status: estandar
category: ciberseguridad
contexto: monitoreo-y-observabilidad
date: 2026-11-11
tags:
  - syslog
  - logs
  - monitoreo
  - security-onion
aliases:
  - elsa
  - enterprise log search and archive
---
**ELSA** (_Enterprise Log Search and Archive_) es un **marco de Syslog centralizado que se basa en la búsqueda de texto completo de Syslog-NG, MySQL y Sphinx**: el buscador de logs masivos de la era Security Onion clásica — diseñado para que buscar cadenas arbitrarias en **miles de millones de registros** sea tan fácil como buscar en la web.

#### Qué Ofrece

-  **Búsqueda de texto completo asíncrona**: una **interfaz de consulta web totalmente asincrónica** — lanzas la búsqueda contra miles de millones de logs y la interfaz no se bloquea: los resultados llegan cuando el índice los encuentra.
-  **Normalización de registros**: los logs dispersos en formatos distintos se normalizan para ser consultables juntos.
-  **Permisos por registro**: herramientas para **asignar permisos de visualización** — quién puede ver qué logs (crítico en SOC multi-cliente).
-  **Alertas por correo y consultas programadas**: búsquedas que corren solas y avisan — el antecedente del alertado moderno.
-  **Gráficos**: visualización de tendencias sobre los logs.

#### Su Arquitectura (por Qué Convergen Tres Piezas)

-  **Syslog-NG**: recibe y canaliza los logs hacia el almacén.
-  **MySQL**: guarda los metadatos y el índice relacional.
-  **Sphinx**: el motor de búsqueda de texto completo — la pieza que hace viable la búsqueda instantánea sobre lo masivo.
-  El conjunto: ingesta + índice + búsqueda — la arquitectura del buscador de logs antes de que Elasticsearch tomara ese rol.

#### Diferencia Crítica: ELSA vs. Kibana (en Security Onion)

-  **ELSA** buscaba los **syslogs brutos** en el stack clásico — texto completo sobre Syslog-NG + Sphinx.
-  **Kibana** busca en **Elasticsearch** — el stack moderno, con el mismo objetivo: buscar en lo masivo.
-  La evolución técnica es directa: el papel de ELSA (buscar en miles de millones de registros desde la web) hoy lo cumple Kibana sobre Elastic — con mejor indexación, pero la misma idea nacida en ELSA.

### Propósito fundamental

ELSA es el buscador que hizo consultable lo masivo: syslog centralizado, normalizado y con búsqueda web instantánea sobre miles de millones de registros — el antecedente directo del análisis de logs moderno, que demostró que el valor de los logs no está en guardarlos sino en poder BUSCARLOS.
