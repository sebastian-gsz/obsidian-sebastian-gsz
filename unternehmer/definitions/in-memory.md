---
def-type: atomic
aliases:
  - IMDB
  - Base de datos en memoria
  - En memoria
  - In memory
  - in-memory
  - in-memory db
tags:
  - ram
  - latencia
  - performance
category: modelo_datos
contexto: bases_de_datos
version: 1
date: 2026-06-15
status: estandar
---

Las bases de datos en memoria (In-Memory Databases) almacenan los datos principalmente en la memoria RAM del sistema en lugar de en discos duros tradicionales, eliminando el cuello de botella de E/S.

**Características principales**

* **Velocidad extrema**: Ofrece tiempos de respuesta de milisegundos o microsegundos.
* **Acceso directo**: Evita la latencia asociada a la búsqueda en disco y al movimiento de datos.
* **Persistencia**: Aunque los datos residen en RAM, suelen contar con mecanismos (logs) para persistir el estado en disco ante fallos eléctricos.

**Caso de uso típico**

Sistemas de alta concurrencia, analítica en tiempo real, gestión de sesiones de usuario y sistemas de caché donde el rendimiento y la disponibilidad son factores dominantes.