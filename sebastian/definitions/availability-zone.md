---
def-type: atomic
version: 1.0
id: def-availability-zone
status: estandar
category: cloud-computing
contexto: computacion-en-la-nube
date: 2026-11-12
tags:
  - cloud
  - aws
  - disponibilidad
aliases:
  - zona de disponibilidad
  - availability zone
  - az
---
Una **zona de disponibilidad** (_Availability Zone_ — AZ) es una **ubicación distinta dentro de una región que está aislada de errores en otras zonas de disponibilidad y proporciona conectividad de red económica y de baja latencia hacia las demás zonas de la misma región**: el edificio a prueba de desastres dentro del campus de la nube.

#### La Jerarquía Geográfica del Cloud

-  **Región**: la ciudad — el área geográfica donde el proveedor tiene infraestructura (us-east-1, eu-west-3).
-  **Zonas de disponibilidad (AZs)**: los EDIFICIOS de esa ciudad — ubicaciones físicas **distintas y aisladas** dentro de la región, cada una con su energía, refrigeración y red independientes.
-  La relación entre zonas de la misma región: **conectividad económica y de baja latencia** — cerca unas de otras para comunicarse rápido, pero aisladas para no caer juntas.

#### Para Qué Sirven

-  **Alta disponibilidad**: desplegar la aplicación en varias AZs — si una zona falla (corte eléctrico, inundación, incidente), las demás siguen — el failover entre edificios.
-  **Latencia interna mínima**: los servicios distribuidos entre AZs de una región se hablan con milisegundos — la sincronización barata que no es posible entre regiones.
-  **Arquitecturas resilientes por diseño**: bases de datos replicadas multi-AZ, balanceadores que reparten entre zonas — la práctica estándar de cualquier despliegue serio.

#### Diferencia Crítica: Zona de Disponibilidad vs. Región

-  La **región** es el conjunto: el área geográfica completa con todas sus zonas — la decisión de dónde viven los datos (ley, latencia al usuario).
-  La **zona de disponibilidad** es la unidad de aislamiento DENTRO de la región: la decisión de redundancia — cuántos edificios independientes soportan el servicio.
-  La regla de diseño: región para latencia y cumplimiento; múltiples AZs para alta disponibilidad — y nunca todas las instancias críticas en una sola zona.

### Propósito fundamental

La zona de disponibilidad es la unidad de aislamiento del cloud: ubicaciones físicamente separadas dentro de una región, conectadas por red de baja latencia — el mecanismo que convierte "alta disponibilidad" de promesa en arquitectura: los edificios independientes que evitan que un desastre tumbe todo el campus.
