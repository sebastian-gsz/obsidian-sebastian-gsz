---
def-type: atomic
version: 1.0
id: def-posix
status: estandar
category: sistemas-operativos
contexto: compatibilidad-unix
date: 2026-07-02
tags:
  - posix
  - estandar
  - unix
  - api
  - portabilidad
aliases:
  - posix
  - portable operating system interface
---
Posix es una familia de estándares definidos por el IEEE que mantienen la compatibilidad entre variantes de sistemas operativos tipo Unix. Estos estándares aseguran que el código fuente desarrollado para un sistema pueda compilarse y ejecutarse en otros sistemas compatibles, facilitando la portabilidad de las aplicaciones.

#### Características técnicas

-  **Interfaz de programación**: Define una interfaz estándar de programación de aplicaciones (API) para servicios de sistemas operativos.
-  **Utilidades y comandos**: Estandariza el comportamiento de los comandos de shell y herramientas de administración de red.
-  **Entorno de ejecución**: Define cómo interactúan las aplicaciones con el sistema operativo para la gestión de procesos, archivos y comunicación entre procesos.

#### Propósito arquitectónico

Es el fundamento de la interoperabilidad en entornos de servidor y computación de alto rendimiento. Al adherirse a Posix, los arquitectos garantizan que las aplicaciones no queden bloqueadas por un proveedor específico, permitiendo la migración fluida entre diferentes distribuciones de sistemas operativos tipo Unix.