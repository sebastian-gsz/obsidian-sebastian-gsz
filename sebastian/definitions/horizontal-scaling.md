---
def-type: atomic
version: 1.0
id: def-escalado-horizontal
status: estandar
category: cloud-computing
contexto: computacion-en-la-nube
date: 2026-11-11
tags:
  - cloud
  - escalado
  - arquitectura
  - distribucion
aliases:
  - escalado horizontal
  - escala horizontal
  - scale out
---
Un sistema **escalable horizontalmente** es aquel que **aumenta su capacidad agregando más computadoras al sistema**, en contraste con el escalado vertical — que se limita a ejecutar sus procesos en una sola computadora más potente. Es la decisión arquitectónica que separa los sistemas que crecen comprando máquinas de los que crecen añadiendo máquinas.

#### Las Dos Direcciones de Escalado

-  **Horizontal (scale out)**: agregar más nodos — el trabajo se **distribuye y ejecuta en paralelo** entre muchas máquinas distintas. La capacidad crece sumando unidades ordinarias.
-  **Vertical (scale up)**: dar más recursos a una sola computadora — CPU, memoria o almacenamiento más rápidos (o más). Simple de operar, pero tiene techo: existe el procesador más grande del mercado, y es finito y caro.

#### Por Qué la Horizontal Suele Ganar

Los sistemas escalables horizontalmente **pueden superar a los verticales** porque permiten la **ejecución paralela de cargas de trabajo distribuyéndolas entre muchos equipos**: la capacidad total crece casi linealmente con el número de nodos, el fallo de una máquina no tumba el sistema (los demás siguen), y el costo se mantiene en hardware commodity en vez de hierro premium.

#### El Precio de la Horizontal

-  El software debe **soportar la distribución**: servicios sin estado (o con estado gestionado aparte), un balanceador de carga que reparta el trabajo, y tolerancia a que cualquier nodo desaparezca.
-  La complejidad se traslada del hardware al diseño: consistencia de datos, comunicación entre nodos, depuración distribuida.

#### Diferencia Crítica: Horizontal vs. Elasticidad

-  El **escalado horizontal** es la *dirección* del crecimiento: más máquinas, no máquinas más grandes.
-  La **elasticidad** es la *automatización* de ese crecimiento: adquirir y liberar recursos en automático siguiendo la demanda — y casi siempre lo hace en horizontal (añadir/quitando instancias).
-  Se puede escalar a mano en horizontal; la elasticidad es escalar en horizontal *sin manos*.

### Propósito fundamental

El escalado horizontal es la filosofía que sostiene la nube moderna: crecimiento sumando unidades baratas en paralelo en lugar de perseguir la máquina infinita — a cambio de diseñar cada servicio para vivir distribuido, que es el verdadero trabajo arquitectónico de esta decisión.
