---
def-type: atomic
version: 1
id: def-alta-disponibilidad
status: estandar
category: gobernanza-y-arquitectura
contexto: computación-en-la-nube
date: 2026-06-20
tags:
  - fiabilidad
  - resiliencia
aliases:
  - alta disponibilidad
  - high availability
---
La alta disponibilidad (HA) es la capacidad de un sistema para proporcionar servicios de manera continua, minimizando el tiempo de inactividad y garantizando el acceso operativo conforme a los Acuerdos de Nivel de Servicio (SLA) establecidos.

### Pilares de diseño

-  **Redundancia y tolerancia a fallos:** Eliminación de puntos únicos de fallo (SPOF) mediante la replicación de recursos en múltiples Zonas de Disponibilidad (AZs).
-  **Resiliencia (Failover):** Capacidad de los sistemas para conmutar automáticamente a recursos secundarios ante cualquier fallo de hardware o de red.
-  **Escalabilidad automática:** Ajuste dinámico de los recursos disponibles mediante _Auto Scaling_ para gestionar cargas de trabajo variables sin sufrir degradación en el rendimiento.
-  **Disaster Recovery (DR):** Estrategias definidas a través de métricas de RTO (tiempo de recuperación) y RPO (punto de recuperación) para restaurar el servicio ante desastres a gran escala, como fallos regionales.

### Gestión y objetivos

-  **Herramientas de gestión:** Implementación de monitoreo proactivo con servicios como CloudWatch, automatización mediante Infraestructura como Código (IaC) con herramientas como CloudFormation o Terraform, y el uso de backups gestionados (ej. S3, Glacier).
-  **Objetivo fundamental:** Garantizar que el sistema posea la capacidad de "auto-sanarse" o de resistir fallos técnicos sin que el usuario final perciba una interrupción en la continuidad del servicio.