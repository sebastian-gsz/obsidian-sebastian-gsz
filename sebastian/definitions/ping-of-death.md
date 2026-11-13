---
def-type: atomic
version: 1.0
id: def-ping-of-death
status: estandar
category: amenazas
contexto: ataques-de-red
date: 2026-11-11
tags:
  - dos
  - icmp
  - amenazas
  - ataques
aliases:
  - ping de la muerte
  - ping of death
---
El **ping de la muerte** (_ping of death_) es un **tipo de ataque DoS causado cuando un atacante hace ping a un sistema enviándole un paquete ICMP de un tamaño mayor de 64 KB** — excediendo el límite máximo que un paquete IP puede tener (65.535 bytes), un tamaño que los sistemas de la época no estaban preparados para procesar sin fallar.

#### Cómo Funcionaba

-  **La regla violada**: un paquete IP no puede superar 65.535 bytes (el campo de longitud es de 16 bits) — un ping normal nunca llega ahí.
-  **La trampa**: fragmentando el ping en múltiples fragmentos IP que, al **reensamblarse en el destino**, formaban un paquete ICMP superior al límite.
-  **El efecto**: los sistemas antiguos (Windows 95, equipos de los años 90) no validaban el tamaño al reensamblar — el buffer se desbordaba y el sistema se **congelaba o reiniciaba**. Un solo ping malicioso bastaba: DoS sin volumen.

#### Hoy

Los sistemas modernos **validan el tamaño al reensamblar** y descartan el paquete ilegal — el ataque original está muerto. Pero su patrón (abuso de la fragmentación/reensamblado con datos malformados) sobrevive en variantes: _teardrop_, ICMP con payload malformado, y la familia general de ataques por paquetes malformados que siguen apareciendo en sistemas mal parcheados y dispositivos IoT baratos.

#### Diferencia Crítica: Ping de la Muerte vs. ICMP Flood

-  **Ping de la muerte**: el ataque es el **TAMAÑO** — un paquete malformado basta; es un ataque por contenido inválido.
-  **ICMP flood** (ping flood, smurf): el ataque es el **VOLUMEN** — pings legítimos a chorro hasta saturar; es un ataque de cantidad.
-  Ambos usan el mismo ping, pero rompen cosas distintas: el primero rompió el software; el segundo rompe el ancho de banda.

#### Defensa

Parcheo (el vector original ya está muerto en sistemas actuales); validación de fragmentos en firewalls y routers (descartar reensamblajes fuera de límites); y ante la familia de ataques por volumen — limitación de ICMP desde el perímetro.

### Propósito fundamental

El ping de la muerte es la lección histórica sobre los límites de los protocolos: un paquete que superaba 64 KB — imposible según la especificación — tiraba sistemas enteros porque nadie validaba el reensamblado — el recordatorio permanente de que en seguridad, el dato malformado es tan peligroso como el dato masivo, y que toda entrada, incluso un ping, debe validarse contra sus límites.
