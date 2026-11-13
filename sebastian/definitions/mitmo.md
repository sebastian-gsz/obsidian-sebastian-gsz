---
def-type: atomic
version: 1.0
id: def-mitmo
status: estandar
category: amenazas
contexto: malware-movil
date: 2026-11-11
tags:
  - mitmo
  - malware
  - moviles
  - amenazas
aliases:
  - mitmo
  - man in the mobile
  - mitmo malware
---
**MitMo** (_Man-in-the-Mobile_ — hombre en el móvil) es **malware que se utiliza para tomar el control de un dispositivo móvil**: una vez dentro, el atacante no solo espía — opera el dispositivo desde dentro, leyendo y manipulando lo que la víctima ve y hace en su propio teléfono.

#### Cómo Actúa

-  **Intercepción de SMS**: el vector clásico — lee los códigos de verificación de dos factores que llegan por mensaje antes (o mientras) los ve la víctima.
-  **Superposiciones (_overlays_)**: dibuja ventanas falsas encima de la app legítima de banca — la víctima escribe su contraseña en la pantalla falsa creyendo usar la real.
-  **Acceso a servicios de accesibilidad (Android)**: los permisos de accesibilidad permiten leer la pantalla, pulsar botones y aprobar ventanas — control efectivo del dispositivo.

#### El Objetivo Típico: Fraude Bancario

Los MitMo son predominantemente **troyanos bancarios móviles**: capturan credenciales con la overlay y reciben el SMS del segundo factor en el mismo teléfono comprometido — el doble factor deja de proteger porque **ambos factores viven en el mismo dispositivo controlado por el atacante**.

#### Diferencia Crítica: MitMo vs. MitM

-  El **MitM** (_Man-in-the-Middle_) intercepta **comunicaciones**: se cuela entre dos partes en la red y lee o modifica el tráfico.
-  El **MitMo** compromete el **dispositivo entero**: no intercepta el camino, se sienta en el propio terminal — ni importa cuán cifrado viaje el tráfico, el atacante ya está en el extremo que lo descifra.
-  El cifrado no salva del MitMo: el punto débil ya no es el canal sino el aparato en la mano de la víctima.

#### Defensa

No instalar apps de fuentes no oficiales; desconfiar de permisos de accesibilidad solicitados por apps sospechosas; mantener el sistema actualizado; y ante la duda, mover la verificación de segundo factor a un medio distinto del teléfono comprometido (llave física, app en otro dispositivo).

### Propósito fundamental

MitMo demuestra que el eslabón más débil del segundo factor puede ser el propio dispositivo que lo aloja: cuando el malware controla el teléfono, leer el SMS y falsificar la pantalla le cuesta lo mismo al atacante — y por eso la seguridad móvil empieza por la higiene de instalación, no por la cifra del canal.
