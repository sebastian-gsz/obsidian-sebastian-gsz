---
def-type: atomic
version: 1.0
id: def-freeserver
status: estandar
category: ciberseguridad
contexto: deteccion-de-amenazas
date: 2026-11-11
tags:
  - ciberseguridad
  - dga
  - monitoreo
  - deteccion
aliases:
  - free server
  - detector de dga
---
**FreeServer** es una herramienta de monitoreo de red orientada a **detectar DGA** (dominios generados algorítmicamente por malware) y a extraer del tráfico los **artefactos aleatorios** que delatan actividad maliciosa: nombres de archivos aleatorios, nombres de scripts, nombres de procesos, nombres de servicios, nombres de estaciones de trabajo, y certificados TLS con sus sujetos emisores, entre otros.

#### Qué Detecta y por Qué Importa

-  **El problema DGA**: el malware moderno (botnets, troyanos) genera sus dominios de comando y control (C2) algorítmicamente — cientos de nombres absurdos como `xkqzwmf.ru` — de modo que bloquear una lista fija es inútil: el dominio de mañana no existe hoy.
-  **La señal**: nombres generados por azar tienen entropía y patrones distintos de los nombres humanos (`servidor-finanzas.local`). FreeServer caza exactamente esa anomalía en el tráfico observado.
-  **Los artefactos**: además de dominios, la aleatoriedad delata infraestructura de ataque en otros planos — archivos descargados con nombres sin sentido, procesos y servicios creados por el malware, estaciones de trabajo comprometidas, y certificados TLS con emisores o sujetos sospechosos.

#### Diferencia Crítica: Detección pasiva vs. antivirus activo

A diferencia de un antivirus que inspecciona archivos en disco en cada endpoint, este tipo de herramienta trabaja **desde la red, de forma pasiva**: observa el tráfico (DNS, TLS, transferencias) y deduce la infección por los artefactos que el malware emite — sin tocar los equipos. Esa posición le permite ver amenazas que el malware diseñó para esconderse del disco.

### Propósito fundamental

FreeServer representa la disciplina del monitoreo pasivo orientado a indicadores: los malware se esconden de los endpoints pero no pueden esconderse de la red — su propio tráfico (dominios DGA, nombres aleatorios, certificados raros) los delata a quien sepa mirar, y ese es exactamente el trabajo de esta herramienta.
