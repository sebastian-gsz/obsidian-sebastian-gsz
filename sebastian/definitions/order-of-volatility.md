---
def-type: atomic
version: 1.0
id: def-order-of-volatility
status: estandar
category: ciberseguridad
contexto: forense
date: 2026-11-11
tags:
  - forense
  - evidencia
  - incidentes
aliases:
  - orden de volatilidad
  - order of volatility
  - orden de volatilidad de datos
---
El **orden de volatilidad** (_order of volatility_) es la **secuencia que describe el orden en que los datos deben conservarse, del más volátil al menos volátil** durante una respuesta a incidentes: capturar PRIMERO lo que muere primero — porque la evidencia digital no espera al analista.

#### La Secuencia Canónica (RFC 3227)

1.  **Registros y cachés de la CPU** — mueren al instante.
2.  **Memoria RAM**: la tabla de procesos, conexiones y credenciales vivas — se pierde al apagar.
3.  **Datos de red**: conexiones activas, estado de sesiones.
4.  **Archivos temporales y swap**.
5.  **Disco duro / almacenamiento**: los datos en reposo — sobreviven al apagado, pero pueden alterarse con el uso.
6.  **Logs remotos y de monitoreo**: sobreviven mejor si la máquina comprometida no los borró.
7.  **Backups y medios físicos**: los más persistentes — la última fase.

#### Por Qué el Orden Manda

-  **La evidencia decae a velocidades distintas**: apagar el equipo para "preservar el disco" destruye la RAM — y con ella los procesos que corren el malware, las conexiones al C2 y las claves en memoria.
-  La regla operativa: **lo más volátil primero, con imagen forense** — y documentar cada paso (cadena de custodia) para que la evidencia valga.

#### Diferencia Crítica: Orden de Volatilidad vs. Orden de Importancia

-  El **orden de volatilidad** lo dicta el RELOJ: qué se pierde primero.
-  El **orden de importancia** lo dictaría el valor del dato: la prioridad del analista.
-  En forense, el reloj manda sobre la importancia: aunque el disco contenga "lo más importante", primero se captura la RAM — porque el disco seguirá ahí mañana y la memoria no.

### Propósito fundamental

El orden de volatilidad es la disciplina que evita destruir la evidencia al querer preservarla: delinea la secuencia de captura — RAM antes que disco, volátil antes que estable — y convierte la respuesta a incidentes en un procedimiento que conserva lo capturable mientras aún existe.
