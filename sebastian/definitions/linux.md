---
def-type: atomic
version: 1.0
id: def-linux
status: estandar
category: sistemas-operativos
contexto: linux
date: 2026-11-11
tags:
  - linux
  - sistemas-operativos
  - open-source
aliases:
  - linux
  - sistema operativo linux
  - gnu/linux
---
**Linux** es un **sistema operativo de código abierto**: nacido en 1991 como el kernel personal de Linus Torvalds y convertido, junto con las herramientas GNU, en el sistema que domina servidores, supercomputadoras, contenedores y dispositivos embebidos en todo el mundo.

#### Anatomía y Filosofía

-  **Kernel + todo lo demás**: "Linux" en rigor es el kernel (que gestiona procesos y memoria); las **distribuciones** — Debian, Ubuntu, Red Hat, CentOS, Arch — son el kernel empaquetado con utilidades, gestor de paquetes y entorno. Ese modelo hizo que cada comunidad construyera su versión para su propósito.
-  **Código abierto**: cualquier persona puede leer, modificar y redistribuir el código — la base de su seguridad auditable y de su evolución colectiva.
-  **Herencia Unix**: descendiente directo de la filosofía Unix — programas pequeños que hacen una cosa bien, todo es un archivo, texto como interfaz universal.

#### Por Qué Domina los Servidores

-  **Estabilidad y rendimiento** sin licencias por servidor — el costo del software no escala con la infraestructura.
-  **La jerarquía estándar (FHS)** hace legible cualquier distribución: configuraciones en `/etc`, logs en `/var/log` — previsibilidad para administrar y auditar.
-  **CLI primero**: todo se puede automatizar y administrar remotamente por SSH — el terreno natural de la nube, los contenedores (Docker/Linux) y el SOC (los logs que un analista examina salen casi siempre de un Linux).

#### Diferencia Crítica: Linux vs. Unix

-  **Unix** es la familia original (Bell Labs, años 70) — sistemas propietarios certificados (AIX, Solaris, los BSD como parientes libres).
-  **Linux** es una **reimplementación libre** de su diseño: no descendió de su código, sino de sus ideas y convenciones — compatible en espíritu, independiente en origen.
-  La consecuencia práctica: el conocimiento Unix es directamente transferible a Linux (misma filosofía y herramientas), pero legalmente son mundos distintos — uno se compra, el otro se descarga.

### Propósito fundamental

Linux es la prueba de que el software abierto puede dominar el mundo: un kernel hobby convertido en la infraestructura de Internet — y su dominio técnico (kernel, FHS, CLI, permisos) es la base sobre la que se construyen la administración de servidores, la nube y la ciberseguridad moderna.
