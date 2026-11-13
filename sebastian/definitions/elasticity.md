---
def-type: atomic
version: 1.0
id: def-elasticity
status: estandar
category: cloud-computing
contexto: computacion-en-la-nube
date: 2026-11-11
tags:
  - cloud
  - aws
  - escalado
  - arquitectura
aliases:
  - elasticidad
  - elasticidad en la nube
  - auto scaling
---
**Elasticidad** (_elasticity_) es la capacidad de un sistema en la nube de **adquirir recursos automáticamente cuando se necesitan y liberarlos cuando dejan de ser necesarios**, con el objetivo de ajustar la infraestructura a la demanda real, optimizar su uso y reducir costos. En la nube este proceso ocurre normalmente de forma automática y sin intervención humana.

#### Formas de Escalado

-  **Escalado horizontal** (_Scale Out / Scale In_): agregar o quitar **instancias** completas — más servidores o contenedores para repartir la carga, menos cuando la demanda cae. Es el modo común en servicios como _Amazon EC2 Auto Scaling_ o _Amazon ECS_.
-  **Escalado vertical** (_Scale Up / Scale Down_): aumentar o reducir los recursos **dentro de una misma instancia** — más RAM, más CPU en la máquina existente. Típico de servicios como _Amazon RDS_, donde cambiar el tamaño de la instancia es más simple que repartir la base de datos.

#### Diferencia Crítica: Elasticidad vs. Escalabilidad

-  **Escalabilidad** es la capacidad **estructural** de crecer (la arquitectura admite añadir capacidad); elasticidad es esa capacidad puesta en **automático y en ambos sentidos**, siguiendo la demanda en tiempo real.
-  Un sistema puede ser escalable pero no elástico (hay que pedir recursos a mano); el elástico es siempre escalable por definición.
-  El beneficio económico es el sello distintivo: la elasticidad convierte el costo fijo de capacidad sobredimensionada en un costo variable alineado con el uso real — pagar por lo que se consume, no por lo que se podría necesitar.

#### Mecanismo Típico

Un grupo de autoescalado (_Auto Scaling Group_) monitorea métricas — CPU promedio, número de peticiones, longitud de cola — contra umbrales definidos; al superarlos lanza instancias nuevas desde una plantilla y las registra en el balanceador; al bajar de ellos, termina las sobrantes.

### Propósito fundamental

La elasticidad es la promesa económica y técnica central de la nube: la infraestructura respira con la carga, manteniendo el rendimiento durante los picos sin pagar capacidad ociosa en los valles — algo imposible con hardware físico aprovisionado para el peor caso.
