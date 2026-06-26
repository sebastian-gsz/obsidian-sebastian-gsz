---
def-type: atomic
version: 1.0
id: def-cloudwatch
status: estandar
category: observabilidad
contexto: monitoreo-cloud
date: 2026-06-26
tags:
  - aws
  - monitoreo
  - observabilidad
  - logs
  - metrics
aliases:
  - cloudwatch
---
Cloudwatch es el servicio de observabilidad y monitoreo integral de Amazon Web Services (AWS), diseñado para recopilar y rastrear métricas, recopilar y supervisar archivos de registro (logs), y establecer alarmas automatizadas sobre los recursos de AWS y las aplicaciones que se ejecutan en ellos.

#### Componentes clave del servicio

-  **Métricas (Metrics):** Datos numéricos de series temporales que representan el rendimiento de recursos (ej. uso de CPU, red, disco). Se pueden visualizar, analizar y configurar para actuar como disparadores de alarmas.
-  **Registros (Logs):** Almacenamiento centralizado y análisis de archivos de registro de aplicaciones, SO y servicios de AWS. Permite la búsqueda, filtrado y detección de patrones críticos mediante CloudWatch Logs Insights.
-  **Alarmas (Alarms):** Mecanismo para monitorizar métricas individuales o expresiones matemáticas. Si el valor cruza un umbral definido, el servicio puede ejecutar acciones automatizadas (ej. notificaciones SNS, políticas de escalado automático o funciones Lambda).
-  **Insights:** Herramientas de análisis avanzado como _Container Insights_ (monitoreo de contenedores) y _Contributor Insights_ (análisis de los principales contribuidores a un pico de tráfico o error).

#### Propósito arquitectónico

Cloudwatch actúa como el plano de control para la observabilidad operativa en AWS. Su valor reside en la capacidad de transformar datos brutos en telemetría accionable, lo cual es crítico para:

1. **Detección de anomalías:** Uso de algoritmos de Machine Learning para identificar comportamientos inusuales en las métricas de rendimiento.
2. **Visibilidad completa:** Correlación entre métricas de infraestructura y logs de aplicaciones para reducir el tiempo medio de resolución (MTTR) de incidentes.
3. **Automatización operativa:** Integración nativa para la respuesta a incidentes, permitiendo cerrar el ciclo entre la detección de un fallo y su remediación sin intervención humana.