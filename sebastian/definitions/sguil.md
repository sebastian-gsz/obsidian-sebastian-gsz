---
def-type: atomic
version: 1.0
id: def-sguil
status: estandar
category: ciberseguridad
contexto: detección-de-intrusiones
date: 2026-11-11
tags:
  - security-onion
  - analisis
  - soc
aliases:
  - sguil
  - sguil gui
---
**Sguil** (pronunciado "sgweel") está **creado por analistas de seguridad de redes para analistas de seguridad de redes**: su componente principal es una **GUI intuitiva que proporciona acceso a eventos en tiempo real, datos de sesión y capturas de paquetes sin procesar** — la consola de trabajo del analista dentro del ecosistema Security Onion.

#### Qué Ofrece al Analista

-  **Eventos en tiempo real**: las alertas de los sensores (Snort, Suricata) llegan a la consola con contexto, ordenadas para priorizar la investigación.
-  **Datos de sesión**: las conversaciones de red asociadas a cada evento — quién habló con quién, cuándo y cuánto (integración con los registros de flujo).
-  **Capturas de paquetes sin procesar**: el salto directo a los PCAP — el analista pasa de la alerta al paquete crudo sin cambiar de herramienta.
-  El resultado: **monitoreo de seguridad de red y análisis impulsado por eventos** — el flujo de trabajo del SOC de la era Security Onion clásica.

#### Su Lugar en el Stack de Security Onion

Sguil es la **consola de investigación** de la arquitectura clásica: los sensores detectan (Snort/Suricata), los eventos se almacenan, y Sguil los presenta para investigar — con **Squert** como su capa web de visualización y **CapME** como el acceso a las capturas completas. La cadena alerta → sesión → paquete en una sola interfaz.

#### Diferencia Crítica: Sguil vs. Squert

-  **Sguil** es la consola tcl/tk del analista: investigación profunda, eventos en vivo, consulta directa — el escritorio de trabajo.
-  **Squert** es la aplicación web que consulta los mismos datos de Sguil con visualizaciones — la vista de contexto y series de tiempo.
-  Se complementan: el analista serio vive en Sguil; Squert aporta la vista rápida desde el navegador.

### Propósito fundamental

Sguil es la consola de investigación construida por y para analistas: convierte las alertas de los sensores en un flujo de investigación real — evento, sesión y paquete crudo al alcance de un clic — la herramienta que materializa el análisis impulsado por eventos en el SOC.
