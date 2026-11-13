---
def-type: atomic
version: 1.0
id: def-squert
status: estandar
category: ciberseguridad
contexto: detección-de-intrusiones
date: 2026-11-11
tags:
  - security-onion
  - visualizacion
  - analisis
aliases:
  - squert
---
**Squert** es una **aplicación web que se utiliza para consultar y ver los datos de eventos almacenados en una base de datos Sguil** — normalmente datos de alerta IDS: la capa visual del stack clásico de Security Onion, que **intenta proporcionar contexto adicional a los eventos** mediante metadatos.

#### Qué Aporta

-  **Consulta web de los eventos**: los datos que Sguil almacena (alertas IDS, sesiones) accesibles desde el navegador — sin abrir la consola tcl/tk.
-  **Contexto por metadatos**: enriquece cada evento con información adicional — IP geolocalizadas, reputación, relaciones entre eventos.
-  **Representaciones de series de tiempo**: cómo se distribuyen las alertas en el tiempo — los picos y patrones que una tabla esconde.
-  **Resultados ponderados y agrupados lógicamente**: los eventos se agrupan por lógica de análisis — prioridad, protocolo, firma — en lugar de una lista plana de miles de líneas.

#### Su Lugar en el Stack

En la arquitectura clásica de Security Onion: **Snort/Suricata** detectan → **Sguil** almacena y presenta la investigación profunda → **Squert** consulta esa misma base desde la web con contexto visual → **CapME** sirve las capturas completas cuando se necesita el paquete crudo. Cada capa añade una vista sobre la misma evidencia.

#### Diferencia Crítica: Squert vs. Kibana (en Security Onion)

-  **Squert** consulta la base de datos de **Sguil** (el stack clásico) — construida alrededor del flujo sguil/sancp.
-  **Kibana** consulta **Elasticsearch** (el stack moderno de Security Onion) — dashboards sobre los logs indexados.
-  Son las dos generaciones de visualización del mismo propósito: dar contexto visual a los eventos — la evolución del proyecto de tcl/tk+MySQL hacia Elastic.

### Propósito fundamental

Squert es la vista con contexto del stack clásico de Security Onion: convierte los eventos IDS almacenados en series de tiempo, agrupaciones y metadatos legibles — la capa que responde a la pregunta del analista: ¿este evento es una aguja o parte de un patrón?
