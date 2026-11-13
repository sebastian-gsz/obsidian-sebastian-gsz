---
def-type: atomic
version: 1.0
id: def-fhs
status: estandar
category: sistemas-operativos
contexto: linux
date: 2026-11-11
tags:
  - linux
  - sistemas-operativos
  - filesystem
aliases:
  - estándar de jerarquía del sistema de archivos
  - fhs
  - jerarquía del sistema de archivos
  - filesystem hierarchy standard
---
El **Estándar de Jerarquía del Sistema de Archivos (FHS)** es la especificación que define cómo se organiza el sistema de archivos en Linux: qué directorios existen en la raíz (`/`) y qué tipo de datos debe contener cada uno. Es el componente que ordena los datos del sistema operativo, de modo que cualquier distribución siga la misma estructura predecible.

#### Directorios Clave según el FHS

-  **`/bin`, `/sbin`**: ejecutables esenciales del sistema y del superusuario (`ls`, `cp`, `shutdown`).
-  **`/etc`**: archivos de **configuración** de todo el sistema (texto plano — aquí viven `passwd`, `ssh/sshd_config`).
-  **`/home`**: directorios personales de los usuarios; **`/root`** es el hogar aparte del superusuario.
-  **`/var`**: datos **variables** que crecen con el tiempo — logs (`/var/log`), colas, cachés. El directorio que todo analista de seguridad conoce.
-  **`/usr`**: software y librerías instaladas para todos los usuarios; **`/tmp`**: archivos temporales que se borran al reiniciar.
-  **`/dev`**: los dispositivos como archivos (`/dev/sda` es el disco); **`/proc`**: información del kernel y los procesos en tiempo real.

#### Diferencia Crítica: FHS vs. El Bosque de Windows

-  Linux tiene **una sola raíz**: los discos y particiones se *montan* como directorios dentro de ese árbol único (`/mnt/usb`).
-  Windows organiza por **unidades letra** (C:, D:) y el "Program Files" es una convención de Microsoft, no un estándar multi-distribución. El FHS, en cambio, es un estándar público que Debian, Red Hat, SUSE y todas las distribuciones respetan.

### Propósito fundamental

El FHS es el mapa que hace legible cualquier Linux: si sabes qué guarda cada directorio, sabes dónde buscar una configuración (`/etc`), un log sospechoso (`/var/log`) o un binario instalado (`/usr/bin`) sin importar la distribución — y esa previsibilidad es la que sostiene los scripts, la administración y la forense en sistemas Linux.
