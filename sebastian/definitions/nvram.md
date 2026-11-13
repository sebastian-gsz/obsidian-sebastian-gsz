---
def-type: atomic
version: 1.0
id: def-nvram
status: estandar
category: hardware
contexto: computacion
date: 2026-11-11
tags:
  - hardware
  - memoria
  - firmware
aliases:
  - nvram
  - memoria no volátil de acceso aleatorio
  - non-volatile ram
---
La **NVRAM** (_Non-Volatile RAM_ — memoria no volátil de acceso aleatorio) es un tipo de memoria que **retiene los datos almacenados incluso cuando se apaga la alimentación**: combina el acceso aleatorio y rápido de la RAM con la persistencia del almacenamiento — el mejor de los dos mundos para configuraciones que deben sobrevivir al apagón.

#### Qué la Distingue

-  **No volátil**: conserva su contenido sin corriente — a diferencia de la memoria volátil convencional (como la **DRAM**, memoria dinámica de acceso aleatorio), que pierde sus contenidos al interrumpirse el suministro eléctrico.
-  **Acceso aleatorio y rápido**: se lee y escribe por dirección, como la RAM — a diferencia del almacenamiento masivo, optimizado para capacidad y no para latencia.

#### Dónde Vive en la Práctica

-  **BIOS/UEFI**: la configuración del firmware (orden de arranque, opciones de hardware) se guarda en NVRAM — por eso tu PC "recuerda" sus ajustes tras meses apagado.
-  **Routers y switches**: la configuración del dispositivo persiste en NVRAM — reiniciar no borra la red.
-  Historias de usuario cotidianas: configuraciones de cámaras, ajustes de periféricos — pequeño, crítico y persistente.

#### Diferencia Crítica: NVRAM vs. RAM

-  La **RAM** (DRAM) es el banco de trabajo: rapidísima, grande en capacidad relativa y **volátil** — al apagar, todo desaparece.
-  La **NVRAM** es la libreta de ajustes: más pequeña y pensada para retener — sobrevive a apagones y reinicios.
-  La pregunta que decide el uso: ¿el dato debe sobrevivir al apagado? Configuraciones y firmware sí (NVRAM); el trabajo en curso, no (RAM) — y el almacenamiento masivo queda para el resto.

#### Diferencia Crítica: NVRAM vs. ROM

-  La **ROM** guarda firmware que normalmente no se reescribe; la **NVRAM** está pensada para ser actualizada por el sistema tantas veces como cambie la configuración.
-  Ambas persisten sin corriente — la diferencia es la escritura: ocasional (NVRAM, por diseño) frente a fija o rara (ROM).

### Propósito fundamental

La NVRAM es la memoria de los ajustes que no pueden perderse: pequeñas, críticas y persistentes — la razón por la que tu equipo recuerda cómo arrancar y tu router recuerda tu red tras el apagón — el punto exacto donde la velocidad de la RAM se encuentra con la fidelidad del disco, en el tamaño justo.
