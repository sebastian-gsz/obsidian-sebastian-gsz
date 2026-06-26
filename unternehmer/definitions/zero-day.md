---
def-type: atomic
version: 1.0
id: def-zero-day
status: estandar
category: gestión-de-vulnerabilidades
contexto: ciberseguridad
date: 2026-06-26
tags:
  - vulnerabilidades
  - ciberseguridad
  - amenazas-críticas
aliases:
  - zero day
  - vulnerabilidad día cero
  - día cero
---
Una vulnerabilidad _zero day_ es un fallo de seguridad en software o hardware que es descubierto por atacantes antes de que el proveedor o desarrollador sea consciente de su existencia. El nombre hace referencia a que el desarrollador tiene "cero días" para crear un parche o solución desde que la vulnerabilidad comienza a ser explotada en la naturaleza.

#### Impacto crítico

Esta categoría de vulnerabilidad representa el riesgo máximo en ciberseguridad. Al no existir una firma, parche o comportamiento de ataque definido en los sistemas de detección, las herramientas de seguridad convencionales (como antivirus o sistemas de detección de intrusos basados en firmas) son ineficaces para detener el ataque. El atacante posee una ventaja absoluta sobre la superficie de ataque.

#### Ciclo de vida y explotación

La explotación ocurre durante la llamada "ventana de exposición":

1.  **Descubrimiento:** El atacante encuentra el fallo.
2.  **Explotación:** El atacante desarrolla y utiliza un _exploit_ contra sistemas vulnerables.
3.  **Detección:** O el proveedor descubre el fallo, o los defensores detectan la actividad maliciosa.
4.  **Parcheo:** El desarrollador lanza una actualización (el contador de días de exposición se cierra).

La gravedad radica en que, durante este ciclo, la organización afectada no tiene forma de cerrar la brecha mediante una actualización convencional.

#### Estrategias de defensa

Dado que no existe una solución directa (parche) hasta que se descubre el fallo, la protección contra _zero days_ debe basarse en la arquitectura de defensa en profundidad:

-  **Segmentación de red:** Limita el movimiento lateral en caso de que un sistema sea comprometido, impidiendo que el atacante escale privilegios o extraiga datos críticos.
-  **Seguridad conductual (EDR/XDR):** Dado que no existen firmas para el exploit, la detección debe basarse en anomalías de comportamiento (ej. un proceso de sistema ejecutando comandos inusuales o conexiones de red inesperadas).
-  **Navegación aislada:** El uso de contenedores o entornos aislados para aplicaciones web reduce el impacto de exploits que atacan el navegador o los complementos de software.
-  **Principio de menor privilegio:** Reduce la superficie de ataque; si el atacante logra ejecutar código, su capacidad de acción está limitada por los permisos del usuario o proceso comprometido.

La gestión de _zero days_ no es un problema de parcheo, sino de resiliencia: la capacidad de detectar, contener y responder ante comportamientos maliciosos desconocidos sin depender de la existencia de un parche previo.