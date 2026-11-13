---
def-type: atomic
version: 1.0
id: def-azure-sre-agent
status: estandar
category: inteligencia-artificial
date: 2026-09-06
tags:
  - azure
  - sre
  - inteligencia-artificial
  - automatizacion
  - observabilidad
aliases:
  - azure sre agent
  - agente sre de azure
  - ai-powered reliability assistant
---
**Azure SRE Agent** es un asistente de fiabilidad impulsado por inteligencia artificial (IA) desarrollado por Microsoft. Funciona como una plataforma de operaciones autónomas diseñada para ayudar a los equipos de operaciones y de ingeniería de fiabilidad del sitio (SRE) a **diagnosticar, investigar y resolver problemas de producción**, reducir la carga de trabajo manual (_toil_) y disminuir el tiempo medio de resolución (MTTR).

### Funcionalidades clave

-   **Investigación y análisis de causa raíz (RCA):** Recopila y correlaciona automáticamente señales de múltiples herramientas (como métricas de Azure, Application Insights, registros y repositorios de código en GitHub) para identificar anomalías rápidamente. Por ejemplo, puede asociar una caída de memoria con un despliegue realizado horas antes.
-   **Mitigación automatizada o guiada:** Puede proponer soluciones o, si se configura con los permisos adecuados, ejecutar mitigaciones de forma autónoma (como reiniciar un pod afectado o ajustar los límites de escalado automático). También cuenta con un _Review mode_ donde un humano debe aprobar la acción antes de aplicarla.
-   **Consultas en lenguaje natural:** Permite a los ingenieros interactuar mediante preguntas conversacionales sobre el estado del entorno (por ejemplo: _"¿Qué ha cambiado en el sistema en la última hora?"_ o _"¿Por qué se ha degradado este servicio?"_), obteniendo respuestas con citas y contexto técnico.
-   **Automatización de tickets y notificaciones:** Rellena previamente informes de incidentes en plataformas como ServiceNow, PagerDuty o canales de Microsoft Teams con todo el resumen de la investigación.
-   **Tareas proactivas y programadas:** Ejecuta revisiones de estado rutinarias, auditorías de cumplimiento y comprobaciones preventivas de forma automatizada.

### Arquitectura y ecosistema extensible

El agente se integra en el flujo de trabajo existente de la organización a través de diversos mecanismos de extensión:

-  **Conectores MCP (Model Context Protocol):** Permite conectar herramientas de observabilidad de terceros como Datadog, Splunk, New Relic, Dynatrace o Elasticsearch.
-  **Habilidades y Herramientas Python:** Extiende su capacidad operativa mediante scripts personalizados de la CLI de Azure, runbooks y lógica propia.
-  **Gobernanza (_Agent Hooks_):** Establece puntos de control orientados a eventos para asegurar que cualquier acción automatizada cumpla estricta y rigurosamente con las políticas de seguridad y gobernanza de la empresa.
-  **Memoria Persistente y Contexto Profundo:** Almacena el aprendizaje de incidentes pasados y mantiene acceso continuo al código fuente para volverse más preciso con el tiempo.

### Beneficios Principales

-  **Menor MTTR (Mean Time to Resolution):** Acelera drásticamente la velocidad de respuesta al centralizar la información dispersa en un único hilo de investigación.
-  **Reducción de la fatiga por alertas:** Ayuda a filtrar el ruido operativo al automatizar el diagnóstico inicial.
-  **Enfoque en la innovación:** Permite a los ingenieros desprenderse de las tareas repetitivas de guardia (_toil_) para centrarse en el desarrollo de productos y la mejora de la arquitectura.
