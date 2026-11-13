---
def-type: atomic
version: 1.0
id: def-iaas
status: estandar
category: computacion-en-la-nube
contexto: modelos-de-servicio
date: 2026-07-03
tags:
  - iaas
  - infraestructura
  - cloud
  - computacion
  - virtualizacion
aliases:
  - iaas
  - infrastructure as a service
---
IaaS es un modelo de computación en la nube que proporciona recursos fundamentales de infraestructura (servidores, redes, almacenamiento) bajo demanda a través de Internet. El proveedor de nube gestiona la virtualización del hardware físico, mientras que el usuario mantiene el control total sobre el sistema operativo, el middleware, las aplicaciones y la configuración de red virtual.

#### Características técnicas

-  **Control granular:** Ofrece el mayor nivel de control sobre la pila tecnológica, permitiendo instalar y configurar cualquier software según sea necesario.
-  **Elasticidad:** Permite aprovisionar o desaprovisionar recursos de cómputo y almacenamiento rápidamente según la demanda.
-  **Modelo de responsabilidad:** El proveedor es responsable de la disponibilidad del hardware y la virtualización, mientras que el cliente es responsable de la gestión, parches y seguridad del sistema operativo y las aplicaciones.

#### Propósito arquitectónico

Es la base sobre la que se migran cargas de trabajo tradicionales (_lift and shift_) o se construyen arquitecturas complejas desde cero. Actúa como el estrato fundamental para implementar soluciones de red, balanceo de carga, alta disponibilidad y recuperación ante desastres sin necesidad de gestionar centros de datos físicos.