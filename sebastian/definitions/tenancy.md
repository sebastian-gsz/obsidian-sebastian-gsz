---
def-type: atomic
version: 1.0
id: def-tenancy
status: estandar
category: cloud-computing
contexto: computacion-en-la-nube
date: 2026-11-12
tags:
  - aws
  - cloud
  - ec2
  - aislamiento
aliases:
  - tenancy
  - tenencia
  - ec2 tenancy
---
La **Tenancy** en AWS se refiere a la política de **"propiedad" o modelo de asignación de hardware** para las instancias de Amazon EC2 dentro de una **VPC** (Virtual Private Cloud): quién comparte — o no — el servidor físico que corre tu instancia. Tres modos, tres niveles de aislamiento y costo.

#### Tenancy "Default" (Predeterminado)

-  Las instancias **comparten el mismo hardware físico** con instancias de otros clientes de AWS — el modelo **más económico** y el que AWS usa por defecto.
-  Aunque se comparte el hardware, **AWS aísla a nivel de máquina virtual** (hipervisor) — las instancias operan de forma independiente unas de otras.
-  Adecuado para la **mayoría de los casos**: rentable y suficientemente seguro para la mayoría de las aplicaciones.

#### Tenancy "Dedicated" (Dedicado)

-  Las instancias corren en **hardware físico dedicado exclusivamente a un cliente** — ningún otro cliente comparte ese servidor, aunque tú mismo ejecutes varias instancias en él.
-  Mayor garantía de **aislamiento a nivel físico** — ideal para organizaciones con **requisitos estrictos de cumplimiento normativo o seguridad**.
-  **Más costoso** que el default, por el uso exclusivo del hardware.

#### Tenancy "Host" (Host dedicado)

-  AWS proporciona acceso directo a un **host físico completo** — los _Dedicated Hosts_ permiten lanzar instancias en un host físico **reservado** con visibilidad completa de la infraestructura (CPU, memoria, sockets).
-  Ideal para **licencias de software que requieren hardware dedicado** (licenciamiento por núcleo/socket) y regulaciones que especifican control sobre el hardware.
-  **Control total sobre la ubicación y el aprovisionamiento** de las instancias en el host físico — el modo que satisface a los auditores más estrictos.

#### Diferencia Crítica: Dedicated vs. Host

-  **Dedicated**: tu hardware exclusivo, PERO AWS decide el detalle interno — no ves ni controlas qué instancias van en qué socket.
-  **Host**: el host ES TUYO en su totalidad — control de colocación y visibilidad de CPU/memoria, lo que exigen las **licencias por hardware** (Oracle, Windows Server por core).
-  La escalera de decisión: costo mínimo y aislamiento de VM suficiente → Default; cumplimiento físico sin licencias por socket → Dedicated; licencias y regulación por hardware → Host.

### Propósito fundamental

La tenancy define cuánto del hierro es tuyo en la nube: compartido y barato (default), exclusivo y caro (dedicated), o host completo con control total para licencias y auditores — la decisión que equilibra costo, cumplimiento y control sobre el hardware que corre tus instancias.
