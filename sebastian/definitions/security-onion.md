---
def-type: atomic
version: 1.0
id: def-security-onion
status: estandar
category: ciberseguridad
contexto: detección-de-intrusiones
date: 2026-11-11
tags:
  - security-onion
  - soc
  - distribucion
  - monitoreo
aliases:
  - security onion
  - security onion linux
---
**Security Onion** es una **distribución basada en Ubuntu Linux destinada a ayudar a los analistas de SOC con el monitoreo de la seguridad de la red** — detección de intrusiones, monitoreo y gestión de registros — **conteniendo varias herramientas de seguridad preintegradas** para proporcionar cuatro funciones principales.

#### Sus Cuatro Funciones Principales

-  **Captura de paquetes completos**: guarda el tráfico crudo (con Stenographer/PCAP) — la evidencia completa disponible para retroceder a cualquier momento.
-  **Sensores de detección de intrusiones** basados en red y en host: **Suricata y Snort** como motores NIDS, Zeek para el análisis de protocolos, y detección en endpoints.
-  **Herramientas de análisis de seguridad**: la suite clásica de investigación — **Sguil** (consola del analista), **Squert** (contexto web), **Kibana** (dashboards Elastic), **CapME** (recuperación de capturas completas).
-  **Gestión de registros**: centralización de los logs de la red — la capa de gestión que alimenta la detección y la forense.

#### Por Qué es Tan Usado en Laboratorios y SOCs Pequeños

-  **Todo preintegrado**: instalar Security Onion es levantar sensor + detección + análisis + gestión de logs en una sola instalación — la pila que montar pieza a pieza llevaría semanas.
-  **Gratis y de código abierto** — el SOC de laboratorio, de academia o de pequeña empresa con presupuesto cero tiene su plataforma completa.
-  La base **Ubuntu Linux** — familiar, mantenida y compatible con el hardware ordinario.

#### Diferencia Crítica: Security Onion vs. un SIEM Comercial

-  Security Onion es la **plataforma de detección de red integrada y gratuita** — fuerte en captura completa, NIDS y análisis forense de tráfico.
-  Un **SIEM comercial** (Splunk, Microsoft Sentinel) es el motor de correlación y gestión a escala empresarial — con licencias y SLAs.
-  En la práctica conviven: Security Onion como el sensor y la forense de red; el SIEM comercial como el centro de correlación y respuesta — o Security Onion solo en los entornos donde el presupuesto no alcanza.

### Propósito fundamental

Security Onion es la caja de herramientas del analista de red empaquetada en una distribución: captura completa, detección de intrusiones, análisis y gestión de logs preintegrados sobre Ubuntu — la plataforma que convierte un servidor ordinario en un SOC de red funcional, y el laboratorio donde toda una generación de analistas aprendió a investigar.
