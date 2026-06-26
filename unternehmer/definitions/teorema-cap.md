---
def-type: atomic
version: 1.0
id: def-teorema-cap
status: estandar
category: concepto
contexto: bases-de-datos
date: 2026-06-26
tags:
  - arquitectura
  - sistemas-distribuidos
  - escalabilidad
aliases:
  - teorema cap
  - consistency vs availability
  - teorema de brewer
---
El Teorema CAP es el marco fundamental que define las limitaciones teóricas en el diseño de sistemas distribuidos. Establece que en presencia de una partición de red (la incapacidad de comunicación entre nodos), un sistema de datos distribuido solo puede garantizar simultáneamente dos de los tres pilares fundamentales: **Consistencia (C)**, **Disponibilidad (A)** y **Tolerancia a particiones (P)**.

#### Los tres pilares

-  **Consistencia (C):** Cada lectura recibe la escritura más reciente. Si el sistema no puede garantizar la misma respuesta en todos los nodos, debe devolver un error en lugar de un dato obsoleto.
-  **Disponibilidad (A):** Cada solicitud recibe una respuesta (éxito o fallo), garantizando que el sistema siempre está activo, aunque los datos devueltos puedan estar desactualizados.
-  **Tolerancia a particiones (P):** El sistema continúa operando a pesar de que los nodos pierdan la capacidad de comunicarse entre sí debido a fallos de red.
    

#### La realidad del diseño: El Trilema

En un sistema distribuido real, **la partición de red (P) es inevitable**. Las redes fallan. Por tanto, el arquitecto de sistemas no elige si tendrá P o no, sino cómo se comportará el sistema cuando ocurra una partición. Esto reduce la elección a dos arquitecturas fundamentales:

1. **CP (Consistencia + Tolerancia a Particiones):**
    
    - El sistema prioriza la integridad. Si los nodos no pueden comunicarse para asegurar que todos tengan el dato actualizado, el sistema bloquea las operaciones de escritura o lectura para evitar inconsistencias.
    - _Uso ideal:_ Sistemas financieros, inventarios críticos, donde un dato erróneo es más grave que un tiempo de inactividad temporal.
2. **AP (Disponibilidad + Tolerancia a Particiones):**

    - El sistema prioriza la operatividad. Si ocurre una partición, los nodos siguen respondiendo peticiones, aunque existe el riesgo de entregar datos obsoletos.
    - _Uso ideal:_ Redes sociales, sistemas de recomendación, feeds de noticias, donde la experiencia del usuario requiere velocidad y continuidad por encima de una consistencia absoluta inmediata.

#### Consideración estratégica

El Teorema CAP no debe entenderse como una elección binaria eterna. Los sistemas modernos suelen gestionar estas propiedades mediante **consistencia eventual**, donde el sistema se comporta como AP durante operaciones normales, pero utiliza protocolos de sincronización para alcanzar la consistencia eventualmente, ofreciendo un balance adaptativo según la carga de trabajo y el estado de la red.
