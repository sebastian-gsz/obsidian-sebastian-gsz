---
def-type: atomic
aliases:
  - carga de lectura
  - Alta concurrencia de lectura
  - Carga de trabajo intensiva en lectura
  - Intensiva en lectura
  - read-intensive
tags:
  - arquitectura
  - rendimiento
  - bases-de-datos
  - optimización
category: tipos-de-carga
contexto: arquitectura-de-datos
version: 1
date: 2026-06-16
status: estandar
---
Arquitectura de sistema donde la frecuencia de consultas de acceso a datos es significativamente mayor que la frecuencia de operaciones de escritura o actualización.

*  **Faceta de rendimiento**: El desafío principal es servir los datos con una latencia mínima para miles de usuarios concurrentes. Se prioriza el tiempo de respuesta sobre la consistencia inmediata.
*  **Faceta de optimización**: Es altamente susceptible a técnicas de aceleración como el almacenamiento en caché (caching), el uso de réplicas de lectura (read replicas) y redes de distribución de contenido (CDN) para descargar la carga de la base de datos primaria.
*  **Casos de uso típicos**:
  
    * **CMS y blogs**: Consulta masiva de contenido estático.
    * **E-commerce**: Navegación por catálogos de productos.
    * **Dashboards**: Visualización de reportes analíticos.
*  **Propósito**: Evaluar la necesidad de redundancia de lectura y almacenamiento en caché para garantizar una experiencia de usuario rápida y fluida sin saturar el almacenamiento primario.