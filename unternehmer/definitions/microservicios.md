---
def-type: atomic
version: 1.0
id: def-microservicios
status: estandar
category: arquitectura
contexto: software
date: 2026-06-15
tags:
  - arquitectura
  - cloud
  - escalabilidad
  - desarrollo
aliases:
  - microservicios
  - microservice architecture
---
Los microservicios son un enfoque arquitectónico donde una aplicación se construye como un conjunto de servicios autónomos, cada uno ejecutándose en su propio proceso y comunicándose mediante mecanismos ligeros (APIs REST, mensajería).

#### Características fundamentales

-  **Desacoplamiento:** Cada servicio es independiente, permitiendo su despliegue, desarrollo y escalado sin afectar a otros componentes del sistema.
-  **Contexto acotado (Bounded Context):** Cada microservicio se especializa en una capacidad de negocio única, lo que facilita la comprensión y el mantenimiento del código.
-  **Heterogeneidad tecnológica:** Permite seleccionar el stack tecnológico (lenguaje, framework, base de datos) más adecuado para la naturaleza específica de cada servicio.
-  **Escalabilidad quirúrgica:** Permite escalar individualmente los servicios bajo mayor carga, optimizando el uso de recursos en comparación con el escalado horizontal de un monolito completo.

#### Desafío: ¿Es viable convertir un ERP a microservicios?

La conversión de sistemas altamente acoplados, como un **ERP (Enterprise Resource Planning)**, presenta retos significativos:

1. **Integridad de datos:** Los ERP requieren una consistencia estricta en sus datos (contabilidad, inventario, nómina). Fragmentar un ERP en microservicios con bases de datos distribuidas introduce complejidad técnica, requiriendo patrones avanzados como **Saga Pattern** para gestionar transacciones distribuidas y asegurar la consistencia.
2. **Modelo híbrido como solución:** La práctica recomendada no es una reescritura total, sino una evolución híbrida:

    -  **Núcleo (Monolito):** Mantener el ERP tradicional para la lógica financiera donde la integridad relacional es innegociable.
    -  **Satélites (Microservicios):** Desarrollar nuevas funcionalidades (ej. apps móviles, chatbots, portales de autoservicio) como microservicios externos que consumen datos del ERP mediante APIs, evitando romper el núcleo financiero mientras se moderniza la experiencia.