---
def-type: atomic
version: 1.0
id: def-availability
status: estandar
category: fundamentos-de-ingeniería
contexto: confiabilidad-del-sistema
date: 2026-06-20
tags:
  - ingeniería
  - confiabilidad
  - sistemas-distribuidos
  - gobernanza
aliases:
  - availability
  - uptime
  - disponibilidad
  - high availability
  - alta disponibilidad
---
Propiedad de un sistema, servicio o componente de ser accesible y utilizable por los usuarios autorizados cuando estos lo requieran, garantizando la continuidad de las operaciones.

-  **Definición técnica:** Se expresa como el porcentaje del tiempo total que un sistema está operativo durante un periodo determinado. El estándar de alta disponibilidad se conoce como "cinco nueves" ($99.999\%$).
-  **Pilares de implementación:**

    -  **Hardware:** Redundancia física (fuentes de poder, discos en RAID).
    -  **Redes:** Multi-homing, enlaces redundantes y balanceo de carga.
    -  **Software:** Microservicios, _failover_ automático y resiliencia.
    -  **Procesos:** Planes de continuidad de negocio (BCP) y recuperación ante desastres (DRP).
-  **Métricas fundamentales:**

    -  **MTBF (Mean Time Between Failures):** Mide la fiabilidad; tiempo promedio entre fallos consecutivos.
    -  **MTTR (Mean Time To Repair):** Mide la capacidad de respuesta; tiempo promedio para restaurar el servicio tras un fallo.
    -  **SLA (Service Level Agreement):** Compromiso contractual que define los umbrales aceptables de disponibilidad.
-  **Consideraciones de diseño:** Todo sistema debe equilibrar la **Disponibilidad** frente a la **Consistencia** y la **Latencia** (Teorema CAP).
-  **Enfoque de ingeniería:** Un sistema disponible no busca la infalibilidad, sino la resiliencia: la capacidad de fallar de forma controlada y recuperarse sin degradar la experiencia del usuario.