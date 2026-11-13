---
def-type: atomic
version: 1.0
id: def-unix
status: estandar
category: sistemas-operativos
contexto: fundamentos-de-computacion
date: 2026-07-02
tags:
  - unix
  - sistemas-operativos
  - kernel
  - posix
aliases:
  - sistema operativo unix
  - unix operating system
  - unix os
---
Unix es una familia de sistemas operativos multitarea y multiusuario que se originó en los laboratorios Bell a finales de los años 60. Su diseño modular y su filosofía de "hacer una sola cosa y hacerla bien" han definido la estructura de la computación moderna, sirviendo como base para sistemas como Linux, BSD y macOS.

#### Características técnicas

-  **Diseño modular**: Basado en pequeñas utilidades de línea de comandos que pueden combinarse mediante tuberías (pipes) para realizar tareas complejas.
-  **Filesystem jerárquico**: Estructura de archivos unificada donde "todo es un archivo", incluyendo dispositivos y procesos.
-  **Gestión de procesos**: Arquitectura robusta de multitarea con separación clara entre espacio de usuario y espacio de kernel.

#### Propósito arquitectónico

Actúa como el cimiento de la infraestructura global. Su influencia es total en el cloud computing, donde los contenedores y las máquinas virtuales ejecutan principalmente kernels compatibles con Unix o Linux, permitiendo la automatización y la estandarización que requieren los entornos de alta disponibilidad.