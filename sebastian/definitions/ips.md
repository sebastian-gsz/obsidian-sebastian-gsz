---
def-type: atomic
version: 1.0
id: def-ips
status: estandar
category: ciberseguridad
contexto: detección-de-intrusiones
date: 2026-11-11
tags:
  - ips
  - deteccion
  - prevencion
  - soc
aliases:
  - ips
  - intrusion prevention system
  - sistema de prevención de intrusiones
---
Un **sistema de prevención de intrusiones** (_IPS_ — _Intrusion Prevention System_) **supervisa las redes en busca de actividad maliciosa o violaciones de políticas y TOMA ACCIÓN para detenerla**: no se limita a alertar — **bloquea la intrusión y minimiza el daño en el momento**.

#### Qué Hace que Sea "Prevención"

-  Está **en línea** (_inline_): el tráfico REALMENTE pasa por él — puede descartar paquetes, bloquear remitentes, cerrar conexiones, en tiempo real.
-  Busca **firmas de ataques conocidos y anomalías** en los datos — y ante cada coincidencia actúa: informar al analista Y ejecutar la corrección (drop, block, reset).
-  Igual que el IDS, se clasifica por alcance: **NIPS** monitorea el tráfico de red completo; **HIPS** protege un solo dispositivo o host.

#### Ejemplos Representativos

-  **Cisco Firepower serie 4100**: dispositivo con funcionalidad NIDS/NIPS — inspección en línea de la red.
-  **Cisco Secure Endpoint**: ejemplo de HIDS/IPS — prevención instalada en el propio host.

#### El Coste de la Potencia

-  Un IPS que bloquea puede equivocarse: un falso positivo corta tráfico legítimo — caída de servicio por un filtro agresivo.
-  Por eso el IPS exige **afinamiento**: reglas ajustadas, modos de detección antes de prevención, y monitoreo de falsos positivos — la potencia de bloquear se gana con la disciplina de afinar.

#### Diferencia Crítica: IPS vs. IDS

-  El **IDS** ve y ALERTA — no detiene nada; la acción es del analista.
-  El **IPS** ve y ACTÚA — detiene la anomalía en el momento, antes de que cause daño.
-  Es "incluso más protección que un IDS" — con el costo de asumir la responsabilidad de bloquear: el IDS es el guardia que grita; el IPS es el que agarra del brazo.

#### Diferencia Crítica: IPS vs. Firewall

-  El **firewall** decide por reglas de red y aplicación (IP, puerto, identidad) — no mira el contenido del flujo permitido.
-  El **IPS** inspecciona el CONTENIDO del tráfico que el firewall ya permitió — detecta el exploit que entra por el puerto 80 legítimo.
-  La defensa en profundidad los apila: el firewall cierra lo prohibido; el IPS examina lo que pasa.

### Propósito fundamental

El IPS es el guardia que actúa: no se conforma con ver la intrusión — la detiene en línea, bloqueando al remitente y descartando los paquetes sospechosos — la evolución del IDS que convierte la detección en prevención, al precio de afinar constantemente para no cortar lo legítimo.
