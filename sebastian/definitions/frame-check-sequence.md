---
def-type: atomic
version: 1.0
id: def-fcs
status: estandar
category: redes
contexto: enlace-de-datos
date: 2026-11-11
tags:
  - redes
  - tramas
  - integridad
  - ethernet
aliases:
  - secuencia de verificación de trama
  - fcs
  - frame check sequence
---
La **FCS** (_Frame Check Sequence_ — secuencia de verificación de trama) es el campo final de una trama de enlace de datos que sirve para **verificar que la información de la trama no resultó dañada durante la transmisión**: el emisor calcula un valor sobre el contenido y lo adjunta; el receptor recalcula sobre lo recibido y compara.

#### Cómo Funciona

-  **Cálculo en el emisor**: sobre los bytes de la trama se aplica un algoritmo de redundancia cíclica (típicamente **CRC-32** en Ethernet) y el resultado se añade como el último campo de la trama.
-  **Verificación en el receptor**: el receptor recalcula la FCS sobre lo que le llegó. Si **la FCS recibida no coincide con la FCS calculada**, la trama se corrompió en tránsito y **se descarta silenciosamente** — no se corregirá aquí, esa es tarea de capas superiores (retransmisión TCP, por ejemplo).
-  Es detección, no corrección: la FCS dice *que* algo llegó dañado, nunca *qué* ni cómo repararlo.

#### Diferencia Crítica: FCS vs. CRC

Se usan como sinónimos pero son capas distintas: el **CRC** es el algoritmo matemático (división polinómica que genera el residuo verificador); la **FCS** es el campo de la trama donde ese residuo se almacena y transporta. Se implementa CRC, se transmite FCS.

#### Contexto: dónde vive

En Ethernet, la FCS cierra la trama tras el _payload_ (32 bits). Cubre direccionamiento, tipos y datos — pero solo detecta corrupción accidental (ruido, colisiones): un atacante que altera una trama puede recalcular la FCS y pasar desapercibido, por eso la integridad criptográfica de capas superiores (TLS) es imprescindible.

### Propósito fundamental

La FCS es el control de integridad barato y ubicuo de la capa de enlace: en cada salto, millones de tramas por segundo se validan con una simple comparación de 32 bits, garantizando que lo que sube a las capas superiores es exactamente lo que se transmitió — o nada.
