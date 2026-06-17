---
def-type: atomic
aliases:
  - Microservicios
  - Microservice Architecture
tags:
  - arquitectura
  - cloud
  - escalabilidad
  - desarrollo
category: arquitectura
contexto: software
version: 1.0
date: 2026-06-15
status: estandar
---
Un microservicio es un enfoque arquitectónico para el desarrollo de software en el que una aplicación se construye como una suite de pequeños servicios independientes, cada uno ejecutándose en su propio proceso y comunicándose mediante mecanismos ligeros (usualmente APIs REST o mensajería).

**Características principales**

* **Desacoplamiento**: Cada servicio es autónomo y puede ser desarrollado, desplegado y escalado independientemente de los demás.
* **Contexto acotado (Bounded Context)**: Cada microservicio se especializa en una capacidad de negocio única y no depende directamente de la lógica interna de otros servicios.
* **Heterogeneidad tecnológica**: Permite utilizar diferentes lenguajes de programación, bases de datos o frameworks para cada servicio, eligiendo la herramienta ideal para el problema específico que resuelve.
* **Escalabilidad**: A diferencia de las aplicaciones monolíticas, puedes escalar solo el microservicio que tiene mayor carga de trabajo, optimizando el uso de recursos.

**Arquitectura de microservicios**

Una idea central de una arquitectura de microservicios es dividir las funcionalidades en verticales coherentes, no por capas tecnológicas, sino por medio de la implementación de un dominio específico. 

**Ejemplo**: La división de una base de datos monolítica y la optimización de las soluciones con las bases de datos personalizadas traen muchos beneficios.