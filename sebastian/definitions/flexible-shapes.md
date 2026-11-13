---
def-type: atomic
version: 1.0
id: def-flexible-shapes
status: estandar
category: computacion-en-la-nube
contexto: arquitectura-de-infraestructura
date: 2026-07-04
tags:
  - flexible-shapes
  - computacion
  - nube
  - optimizacion
  - escalabilidad
aliases:
  - unidades flexibles
  - flexible shapes
  - custom machine types
---
Las unidades flexibles (flexible shapes) representan la capacidad de aprovisionar recursos de cómputo definiendo el número de VCPU/OCPU y la cantidad de memoria RAM de forma independiente. Este modelo rompe la restricción de ratios fijos impuesta por la mayoría de las familias de instancias tradicionales, permitiendo un dimensionamiento preciso para cargas de trabajo específicas.

#### Análisis del mercado en los cinco grandes

La flexibilidad granular no es un estándar universal; se divide en dos enfoques arquitectónicos principales:

| **Proveedor** | **Capacidad de flexibilidad** | **Enfoque técnico**                                         |
| ------------- | ----------------------------- | ----------------------------------------------------------- |
| **OCI**       | Alta                          | Flexible shapes (definición independiente de ocpus/ram).    |
| **GCP**       | Alta                          | Custom machine types (definición independiente de cpu/ram). |
| **AWS**       | Baja                          | Instance families (ratios fijos por familia).               |
| **Azure**     | Baja                          | Instance sizes (ratios fijos por tamaño).                   |
| **IBM**       | Baja                          | Instance profiles / flavors (ratios fijos por perfil).      |

#### Características técnicas

-  **Desacoplamiento:** Permite escalar la capacidad de procesamiento y la memoria sin depender de la otra, evitando el desperdicio de recursos (over-provisioning).
-  **Eficiencia de costes:** Optimiza el gasto al ajustar los recursos al consumo real de la aplicación, en lugar de pagar por un perfil de hardware predefinido que puede exceder las necesidades.
-  **Limitaciones:** Los proveedores con enfoque de familias fijas (AWS, Azure, IBM) garantizan un rendimiento predecible al probar y certificar ratios específicos de cpu/memoria, lo cual simplifica la estandarización en entornos enterprise.

#### Propósito arquitectónico

Es la herramienta clave para la optimización de costes y rendimiento en arquitecturas modernas. En entornos de oci o gcp, las unidades flexibles permiten ajustar el tamaño de los nodos de kubernetes (OKE/GKE) al consumo exacto de los pods, mientras que en AWS, Azure, IBM, la estrategia debe orientarse a seleccionar el perfil (flavor) que más se acerque a la demanda esperada para minimizar el gasto innecesario.