---
def-type: atomic
version: 1.0
id: def-kernel
status: estandar
category: sistemas-operativos
contexto: linux
date: 2026-11-11
tags:
  - linux
  - kernel
  - sistemas-operativos
  - procesos
aliases:
  - kernel
  - núcleo del sistema operativo
  - linux kernel
---
El **kernel** es el componente del sistema operativo Linux que **gestiona los procesos y la memoria**: es el núcleo permanente del sistema — el único software con privilegios totales sobre el hardware, al que todo lo demás (aplicaciones, shell, servicios) pide servicios sin tocar la máquina directamente.

#### Qué Gestiona el Kernel

-  **Procesos**: decide qué proceso corre cuándo (planificación de CPU), crea y termina procesos, y aísla unos de otros para que uno fallido no tumba al sistema.
-  **Memoria**: asigna RAM a cada proceso, protege sus espacios de memoria entre sí y maneja la memoria virtual (swap) cuando la RAM se agota.
-  **Hardware**: los drivers del kernel hablan con discos, red y periféricos — las aplicaciones ven abstracciones limpias (archivos, sockets), no registros de hardware.
-  **Llamadas al sistema (_syscalls_)**: la única puerta de entrada — una aplicación que quiere abrir un archivo o enviar un paquete *pide* al kernel que lo haga por ella.

#### Diferencia Crítica: Kernel vs. Sistema Operativo vs. Shell

-  El **kernel** es el núcleo: gestión de procesos, memoria y hardware — el que realmente ejecuta y protege.
-  El **sistema operativo** es el kernel **más** todo el entorno: utilidades, librerías, sistemas de archivos, arranque (por eso "Linux" en rigor es el kernel, y Debian/Ubuntu son el kernel + el resto).
-  El **shell** es la interfaz que traduce tus comandos en llamadas al kernel — nunca toca el hardware directamente.
-  La jerarquía de privilegios es la clave: el kernel corre en modo privilegiado; todo lo demás, en modo usuario restringido.

#### Por Qué Importa (también en seguridad)

El kernel es la frontera de confianza del sistema: un exploit de kernel (_privilege escalation_) rompe el aislamiento de procesos y entrega control total de la máquina — por eso parchear el kernel es actualización crítica, no opcional.

### Propósito fundamental

El kernel es el árbitro invisible de la computadora: reparte CPU y memoria entre procesos rivales, traduce las peticiones de software en operaciones de hardware y protege a cada componente de los demás — sin él, un sistema operativo sería solo una colección de programas compitiendo a ciegas por la máquina.
