---
def-type: atomic
version: 1
id: def-strong-consistency
status: estandar
category: conceptos-teóricos
contexto: teoría-de-sistemas
date: 2026-06-16
tags:
  - sistemas-distribuidos
  - bases-de-datos
  - arquitectura
  - transacciones
aliases:
  - atomic-consistency
  - alta consistencia
  - high consistency
---
La consistencia fuerte (o alta consistencia) es un modelo en sistemas distribuidos que garantiza que, tras una operación de escritura exitosa, todas las operaciones de lectura posteriores devolverán invariablemente el valor más reciente. Es considerado el estándar de oro en sistemas donde cualquier discrepancia en la lectura resulta inaceptable.