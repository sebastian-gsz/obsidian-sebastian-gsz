---
def-type: atomic
version: 1.0
id: def-caas
status: estandar
category: computacion-en-la-nube
contexto: modelos-de-servicio
date: 2026-07-03
tags:
  - caas
  - contenedores
  - cloud
  - orquestacion
  - microservicios
aliases:
  - caas
  - container as a service
---
Container as a service es un modelo de servicio en la nube que permite a los usuarios gestionar y desplegar contenedores sin preocuparse por la administración de la infraestructura subyacente, como servidores, sistemas operativos o parches de los nodos. El proveedor de nube gestiona la plataforma de orquestación, proporcionando un entorno donde los desarrolladores pueden empaquetar, ejecutar y escalar aplicaciones de manera eficiente.

#### Características técnicas

-  **Abstracción:** Elimina la necesidad de gestionar el kernel o el aprovisionamiento detallado de nodos, permitiendo que el equipo se centre exclusivamente en la imagen del contenedor y su configuración.
-  **Orquestación:** Incluye herramientas de gestión de ciclo de vida (como Kubernetes o servicios nativos del proveedor) que manejan el balanceo de carga, la auto-recuperación y el escalado automático.
-  **Portabilidad:** Al estandarizar el despliegue mediante formatos de contenedor (como OCI), facilita la migración entre diferentes proveedores de nube o entornos on-premise.

#### Propósito arquitectónico

Actúa como el nivel de ejecución intermedio entre IaaS (donde gestionas el sistema operativo) y PaaS (donde gestionas el framework de la aplicación). Es la base sobre la que se construyen las arquitecturas de microservicios modernas, permitiendo despliegues ágiles y consistentes en entornos de nube.