---
def-type: atomic
version: 1.0
id: def-evidence-preservation
status: estandar
category: ciberseguridad
contexto: forense
date: 2026-11-11
tags:
  - forense
  - evidencia
  - incidentes
aliases:
  - proteger y preservar evidencia
  - preservación de evidencia
  - evidence preservation
---
**Proteger y preservar evidencia** es el **proceso de trabajar adecuadamente con evidencia digital frágil y volátil**: tratar cada dato que puede probar lo ocurrido como lo que es — material que se degrada, se altera o pierde valor legal al primer error del que lo maneja.

#### Las Reglas del Manejo Correcto

-  **No tocar el original**: se trabaja sobre **copias forenses** (imágenes bit a bit verificadas por hash) — el original queda sellado.
-  **Bloqueadores de escritura** (_write blockers_): al examinar un disco, el hardware/software impide cualquier modificación — ni una escritura accidental.
-  **Cadena de custodia** (_chain of custody_): quién tomó qué, cuándo, con qué método y quién lo tuvo después — el registro que hace que la evidencia valga ante auditoría o tribunal.
-  **Orden de volatilidad**: capturar primero lo que muere primero (RAM antes que disco) — la preservación decide el orden según el reloj de cada tipo de dato.

#### Qué Hace Frágil a la Evidencia Digital

-  **La volatilidad**: RAM, conexiones activas y cachés desaparecen al apagar — la primera decisión del incidente es qué capturar antes de cambiar nada del estado.
-  **La alterabilidad**: abrir un archivo cambia su timestamp de acceso; navegar el disco con el sistema operativo vivo modifica cientos de metadatos — por eso se examina una copia, nunca el original en producción.
-  **La procedencia rota**: una evidencia sin registro de custodia puede ser genuina y aun así rechazada — sin trazabilidad, no es evidencia, es un dato curioso.

#### Diferencia Crítica: Preservación vs. Orden de Volatilidad

-  El **orden de volatilidad** responde EN QUÉ ORDEN capturar (RAM → disco → backups).
-  La **preservación** responde CÓMO capturar y manipular sin corromper: imágenes bit a bit, write blockers, hashes, cadena de custodia.
-  Juntas forman el protocolo forense: el orden dice el QUÉ CUÁNDO; la preservación, el CÓMO — fallar cualquiera invalida la evidencia.

### Propósito fundamental

Proteger y preservar evidencia es lo que separa la respuesta a incidentes de la forense válida: trabajar la evidencia digital frágil y volátil con copias verificadas, bloqueos de escritura y cadena de custodia — porque un hallazgo correcto pero mal preservado no prueba nada, y en forense, lo que no puede probarse no ocurrió.
