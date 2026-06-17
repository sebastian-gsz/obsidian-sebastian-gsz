---
def-type: atomic
aliases:
  - Teorema CAP
  - Consistency vs Availability
tags:
  - arquitectura/sistemas-distribuidos
  - escalabilidad
  - latencia
category: concepto
contexto: bases-de-datos
version: 1.0
date: 2026-06-14
status: estandar
---

Es el marco conceptual que dicta las reglas del juego en sistemas distribuidos. Básicamente, establece que ante una partición de red (que dos nodos no se puedan comunicar entre sí), un sistema solo puede garantizar una de las dos restantes:

- **Consistencia (C):** Cada lectura recibe la escritura más reciente o un error. El sistema se "congela" hasta asegurar que todos los nodos tengan el mismo dato.
- **Disponibilidad (A):** Cada solicitud recibe una respuesta, aunque no se garantice que sea la versión más reciente del dato.
- **Tolerancia a particiones (P):** El sistema sigue funcionando a pesar de que los nodos se desconecten entre sí.

En el mundo real, **P** es una realidad inevitable (las redes fallan). Por tanto, un arquitecto debe decidir si su sistema será **CP** (prioriza la integridad de datos sobre que el sistema siempre responda) o **AP** (prioriza que el sistema siempre responda, aceptando datos potencialmente desactualizados).
