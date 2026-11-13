---
def-type: atomic
version: 1.0
id: def-mitre-attack
status: estandar
category: ciberseguridad
contexto: inteligencia-de-amenazas
date: 2026-11-11
tags:
  - mitre
  - att&ck
  - ttp
  - threat-hunting
aliases:
  - mitre att&ck
  - matriz mitre att&ck
  - att&ck framework
---
La **matriz MITRE ATT&CK** es una **herramienta que ayuda a los profesionales de ciberseguridad a identificar y comprender las tácticas, técnicas y procedimientos (TTP) que utilizan los atacantes**: un catálogo organizado del comportamiento real de los adversarios — no teorías, sino lo que se ha observado en ataques reales. El cazador de amenazas la usa para identificar cualquier TTP empleado en una infracción actual o pasada.

#### Cómo se Estructura

-  **Tácticas (las columnas)**: el PORQUÉ de cada paso — reconocimiento, acceso inicial, ejecución, persistencia, escalada de privilegios, evasión defensiva, credenciales, descubrimiento, movimiento lateral, recolección, exfiltración, impacto...
-  **Técnicas (las celdas)**: el CÓMO de cada táctica — con identificadores (T1110: fuerza bruta; T1055: inyección de procesos) y descripciones observadas en la práctica.
-  **Procedimientos**: cómo grupos específicos de atacantes implementan cada técnica en el mundo real.

#### Cómo se Usa

-  **Threat hunting**: buscar proactivamente en la red los TTP de la matriz — el cazador pregunta "¿qué técnicas de ATT&CK podría estar ejecutando alguien ahora?" y diseña búsquedas para cada una.
-  **Mapeo de detecciones**: cada regla del SIEM/EDR se etiqueta con las técnicas que cubre — los huecos de la matriz propia son las zonas ciegas.
-  **Informes de incidentes**: describir una infracción por sus técnicas (entró con T1566 phishing, persistió con T1053 tareas programadas...) — un idioma común universal.

#### Diferencia Crítica: ATT&CK vs. Kill Chain

-  La **Kill Chain** describe etapas macro de un ataque (de la reconocimiento al impacto) — el mapa de fases.
-  **ATT&CK** detalla el comportamiento DENTRO y DESPUÉS del compromiso — qué hace exactamente el atacante en cada fase, con técnicas verificables.
-  ATT&CK cubre además el post-compromiso con muchísima más profundidad — por eso reemplazó a la Kill Chain como estándar operativo del SOC.

#### Diferencia Crítica: ATT&CK vs. CVE

-  **CVE** cataloga vulnerabilidades del software — las puertas mal hechas.
-  **ATT&CK** cataloga comportamientos del atacante — lo que hace al entrar y moverse.
-  Un incidente se defiende a ambos niveles: parchear las CVE y detectar las técnicas ATT&CK.

### Propósito fundamental

MITRE ATT&CK es el mapa del comportamiento enemigo: convierte la intuición del "hackeador malo" en tácticas y técnicas identificables con nombres y códigos — y le da al SOC un plano para construir detecciones, cazar amenazas y cubrir huecos de manera sistemática, en vez de esperar alertas y rezar.
