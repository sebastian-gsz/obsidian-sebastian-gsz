---
def-type: atomic
version: 1.0
id: def-elastic-beats
status: estandar
category: ciberseguridad
contexto: monitoreo-y-observabilidad
date: 2026-11-11
tags:
  - elastic-stack
  - observabilidad
  - logs
  - ciberseguridad
aliases:
  - Elastic Beats
  - beats
  - agentes de elastic
---
**Elastic Beats** es una familia de agentes de envío de datos livianos (lightweight shippers) que se instalan en los servidores o dispositivos finales para recolectar y enviar datos específicos a **Elasticsearch** o **Logstash**.

#### Propósito Técnico
A diferencia de Logstash, que es un motor de procesamiento pesado, los Beats están diseñados para tener un consumo mínimo de CPU y memoria, permitiendo que se ejecuten en cualquier host sin degradar el rendimiento del sistema.

#### Tipos Comunes de Beats
- **Filebeat:** Recolecta y envía logs de archivos de texto.
- **Metricbeat:** Recolecta métricas de rendimiento del sistema y aplicaciones.
- **Packetbeat:** Analiza tráfico de red en tiempo real.
- **Winlogbeat:** Recolecta eventos de los logs de Windows.

#### Flujo de Datos
`Host (Beats) → Logstash (Opcional para transformación) → Elasticsearch (Almacenamiento/Búsqueda) → Kibana (Visualización)`
