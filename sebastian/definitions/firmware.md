---
def-type: atomic
version: 1.0
id: def-firmware
status: estandar
category: hardware
contexto: sistemas-embebidos
date: 2026-11-11
tags:
  - hardware
  - firmware
  - arranque
  - bios
aliases:
  - software de bajo nivel
  - software embebido
  - firmware del dispositivo
---
El **firmware** es el software que **maneja físicamente al hardware**: código de bajo nivel grabado en memoria no volátil del propio dispositivo que lo controla, lo inicializa y le da su comportamiento básico. Es la capa donde la programación toca directamente la máquina.

#### Ejemplo Canónico: el BIOS

El programa **BIOS** de una computadora es firmware: su propósito es **activar la máquina desde el encendido** (POST — verificación del hardware) y **preparar el entorno para cargar el sistema operativo** en memoria RAM y disco duro. Sin ese firmware, el procesador ni siquiera sabe dónde buscar un sistema operativo al arrancar. Su sucesor moderno es **UEFI**.

#### Características Técnicas

-  **Vive dentro del dispositivo**: se almacena en memoria flash/ROM del propio hardware, no en el disco del sistema — disponible antes de que exista cualquier sistema operativo.
-  **Bajo nivel y específico**: hablado directamente al hardware concreto (controladoras, chips, periféricos); cada dispositivo — router, disco SSD, cámara, teclado, impresora — lleva el suyo.
-  **Actualizable pero delicado**: se puede actualizar (flashear) para corregir fallos o añadir funciones, pero una actualización interrumpida puede dejar el dispositivo inutilizable (_bricking_).

#### Diferencia Crítica: Firmware vs. Sistema Operativo

-  El **sistema operativo** es software general que gestiona recursos y ejecuta aplicaciones del usuario, arrancado *por* el firmware.
-  El **firmware** es el código específico de un dispositivo concreto que lo hace funcionar — y en el caso del BIOS/UEFI, es lo que existe *antes* y *fuera* de cualquier sistema operativo. El firmware arranca el SO; el SO nunca arranca el firmware.

### Propósito fundamental

El firmware es el puente entre la electrónica bruta y el software: convierte un conjunto de circuitos en un dispositivo con comportamiento — y por eso es también superficie de ataque y punto ciego: la mayoría de los usuarios nunca lo actualiza, y un firmware comprometido controla la máquina antes de que ningún antivirus exista.
