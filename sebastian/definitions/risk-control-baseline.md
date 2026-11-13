---
def-type: atomic
version: 1.0
id: def-lcr
status: estandar
category: ciberseguridad
contexto: gestion-de-riesgos
date: 2026-11-11
tags:
  - riesgos
  - controles
  - gobernanza
  - ciberseguridad
aliases:
  - línea de base de control de riesgo
  - lcr
  - risk control baseline
---
La **línea de base de control de riesgo (LCR)** es un **documento que identifica los controles de seguridad que una organización debe implementar para mitigar sus riesgos de seguridad**: el mínimo conjunto de protecciones exigido, derivado del análisis de riesgos y no de la intuición.

#### Cómo se Construye

La LCR se basa en un **análisis de riesgos** que recorre la cadena completa:

1.  **Identificar los activos** de la organización (datos, sistemas, servicios — aquello que hay que proteger).
2.  **Identificar las amenazas** que podrían afectarlos (atacantes, fallos, desastres) y las **vulnerabilidades** que las harían posibles.
3.  **Seleccionar los controles** que mitigarán esos riesgos concretos — y documentarlos como línea de base: lo que se implementa SIEMPRE, como piso mínimo.

#### Qué Aporta una Línea de Base

-  **Consistencia**: todas las máquinas, servicios y sistemas nuevos nacen con los controles base aplicados — no depende del criterio de quien lo despliega.
-  **Auditoría**: hay un documento contra el que verificar el cumplimiento ("¿tiene el control X la LCR exige?").
-  **Punto de partida**: las configuraciones por defecto, hardening de sistemas, gestión de parches, antivirus, copias — la base sobre la que luego se añaden controles específicos por riesgo.

#### Diferencia Crítica: LCR vs. Análisis de Riesgos

-  El **análisis de riesgos** es el proceso: descubrir activos, amenazas, vulnerabilidades y valorar el riesgo.
-  La **LCR** es el resultado documentado: la lista de controles exigidos que ese análisis produce.
-  El análisis responde "¿qué podría pasar y cómo de grave es?"; la LCR responde "¿qué implementamos sí o sí contra ello?". Uno alimenta al otro — sin análisis, la línea de base es una lista de buenas prácticas sin fundamento.

### Propósito fundamental

La LCR convierte el análisis de riesgos en una exigencia implementable: fija el piso mínimo de controles que toda la organización cumple sin excepción — la diferencia entre "sabemos cuáles son nuestros riesgos" y "tenemos garantizado el mínimo que los contiene".
