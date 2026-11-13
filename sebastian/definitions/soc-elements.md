---
def-type: atomic
version: 1.1
id: def-elementos-soc
status: estandar
category: ciberseguridad
contexto: operaciones-de-seguridad
date: 2026-09-22
tags:
  - soc
  - ciberseguridad
  - monitorizacion
  - incidentes
  - seguridad
  - siem
  - soar
  - ids
  - ips
aliases:
  - elementos soc
  - componentes del soc
  - security operations center
  - analista n1
  - respuesta de incidentes n2
  - cazador de amenazas n3
  - administrador soc
---

Un **Centro de Operaciones de Seguridad (SOC)** es una unidad centralizada responsable de supervisar y mejorar la postura de seguridad de una organización, detectando, analizando y respondiendo a incidentes de ciberseguridad mediante la integración coordinada de personas, procesos y tecnología avanzada.

Se enfoca principalmente en la monitorización continua de la red y los sistemas en tiempo real, identificando amenazas de forma temprana, aunque las respuestas suelen requerir intervención humana para la investigación y la toma de decisiones críticas.

## Componentes fundamentales

### 1. Personas (Equipo Humano)

-  **Analista de N1:** Profesionales encargados de monitorizar las alertas entrantes, verificar si se trata de un incidente verdadero y derivar los tickets al N2 si es necesario.
-  **Respuesta de incidentes (N2):** Responsables de investigar incidentes en profundidad y aconsejar soluciones o acciones de mitigación concretas.
-  **Cazador de amenazas (N3):** Perfiles expertos en redes, puntos terminales (endpoints), inteligencia de amenazas e ingeniería inversa de malware. Su objetivo es buscar proactivamente amenazas cibernéticas que ya están presentes en la red pero que aún no han sido detectadas por las alertas tradicionales.
-  **Administrador SOC:** Administra todos los recursos del SOC y sirve como el punto de contacto principal con el resto de la organización o el cliente.

### 2. Procesos

Procedimientos operativos estandarizados, playbooks de respuesta y flujos de trabajo definidos que estandarizan los procesos de detección, contención y recuperación ante amenazas.

### 3. Tecnología (Stack Defensivo)

-  **Sistema SIEM (Security Information and Event Management):** Recopila y filtra datos, detecta y clasifica amenazas, y analiza e investiga incidentes. También puede administrar recursos para implementar medidas preventivas. Sus funciones clave incluyen:

    -  Recopilación, correlación y análisis de eventos.
    -  Monitoreo y control de la seguridad.
    -  Administración de registros (_logs_).
    -  Evaluación y seguimiento de vulnerabilidades.
    -  Integración de inteligencia de amenazas.
-  **SOAR (Security Orchestration, Automation, and Response):** Se empareja frecuentemente con el SIEM para optimizar y automatizar los procesos de respuesta a incidentes a través de:

    1. **Orquestación:** Integración y coordinación de múltiples herramientas y sistemas de seguridad.
    2. **Automatización:** Reducción de la carga manual en tareas repetitivas (recolección de datos, análisis de eventos, informes).
    3. **Respuesta:** Ejecución automática de respuestas predefinidas o provisión de guías para analistas.
    4. **Integración:** Conexión con sistemas IDS/IPS, firewalls y SIEMs.
    5. **Análisis y reporting:** Evaluación de la efectividad de las respuestas automatizadas.
    6. **Playbooks:** Guías predefinidas automatizadas para amenazas específicas.
-  **IDS (Intrusion Detection System):** Analiza el tráfico de red, registros y otros datos para detectar y alertar sobre actividades sospechosas o maliciosas. No toma medidas directas para detenerlas; proporciona visibilidad e información para la respuesta manual de los analistas.
-  **IPS (Intrusion Prevention System):** Evolución del IDS que cuenta con la capacidad adicional de tomar medidas activas y proactivas en tiempo real (bloquear tráfico malicioso, modificar configuraciones de firewall o aplicar correcciones automáticas) para detener ataques antes de que causen daños.

## Métricas de rendimiento del SOC (KPIs)

-  **Tiempo de permanencia:** El tiempo que los actores de amenazas tienen acceso a una red antes de ser detectados y expulsados.
-  **Tiempo medio de detección (MTTD):** El tiempo medio que tarda el personal del SOC en identificar incidentes de seguridad válidos.
-  **Tiempo medio de respuesta (MTTR):** El tiempo medio que se tarda en detener y corregir un incidente de seguridad.
-  **Tiempo medio para contener (MTTC):** El tiempo necesario para evitar que el incidente cause más daños a los sistemas o datos.
-  **Tiempo de control:** El tiempo necesario para detener con éxito la propagación de malware dentro de la red.

## Diferencias clave

-  **Propósito y función:** IDS/IPS detectan y previenen intrusiones; el SIEM centraliza y correlaciona eventos de seguridad; el SOAR automatiza y orquesta la respuesta a incidentes.
-  **Automatización:** IDS/IPS y SIEM generan alertas, pero dependen de la intervención humana para la respuesta; el SOAR automatiza dicha respuesta.
-  **Integración:** El SIEM se integra con múltiples fuentes de datos para un análisis centralizado, mientras que el SOAR se integra con las herramientas defensivas para ejecutar acciones automatizadas.
-  **Complementariedad:** El SIEM proporciona visibilidad y análisis, el SOAR optimiza la respuesta, y los sistemas IDS/IPS alimentan a ambos con datos de detección en tiempo real.