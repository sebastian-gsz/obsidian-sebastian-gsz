---
def-type: atomic
version: 1.0
id: def-6-rs
status: estandar
category: estrategia-cloud
contexto: migración-de-sistemas
date: 2026-06-26
tags:
  - cloud
  - migracion
  - estrategia
  - infraestructura
aliases:
  - 6 rs
  - estrategias de migración
  - r6
  - seis erres
---
Las 6 Rs constituyen el marco estratégico estándar de la industria para evaluar y ejecutar la migración de aplicaciones y cargas de trabajo hacia entornos de nube pública. Este modelo guía al arquitecto de soluciones en la toma de decisiones sobre el destino y la forma en que cada activo será trasladado, equilibrando coste, esfuerzo y valor técnico.

#### Las estrategias de migración

-  **Rehost (Lift and shift):** Migración directa de aplicaciones tal como están, sin modificaciones. Es la estrategia más rápida, pero suele ser la que menos beneficios aporta de la nube, ya que no se optimiza para aprovechar características nativas.
-  **Replatform (Lift, tinker and shift):** Optimización mínima ("ajuste"). Se migra la aplicación pero se sustituyen componentes subyacentes por servicios gestionados (ej. pasar de una base de datos auto-gestionada en una VM a un servicio RDS/Cloud SQL).
-  **Refactor / Rearchitect:** Reescribir o modificar la arquitectura de la aplicación para aprovechar las capacidades nativas de la nube (arquitecturas sin servidor, microservicios, contenedores). Ofrece el máximo rendimiento y escalabilidad a largo plazo.
-  **Repurchase (Drop and shop):** Abandonar la aplicación actual y comprar una solución SaaS (Software as a Service) equivalente. El enfoque es dejar de gestionar software propio para consumir funcionalidad.
-  **Retain:** Decisión de mantener la aplicación en su entorno actual. Se aplica cuando la migración no es viable técnica o financieramente, o cuando la aplicación está cerca de su ciclo de fin de vida.
-  **Retire:** Identificar aplicaciones obsoletas o redundantes y darlas de baja. A menudo se descubre que entre el 10% y el 20% de la cartera de aplicaciones puede ser retirado sin impacto negativo, reduciendo costes y superficie de ataque.

#### Implementación técnica

La elección de la estrategia depende del balance entre la urgencia de la migración y los recursos disponibles. Mientras que el _refactoring_ ofrece el mejor retorno de inversión (ROI), el _rehosting_ es la opción predilecta para proyectos de migración masiva bajo presión de fechas límite (_deadline_).