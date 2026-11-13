---
def-type: atomic
version: 1.0
id: def-orm
status: estandar
category: ingenieria-de-software
date: 2026-08-09
tags:
  - bases-de-datos
  - sql
  - desarrollo
  - programacion
aliases:
  - object-relational mapping
  - mapeo objeto-relacional
---
El mapeo objeto-relacional (ORM, por sus siglas en inglés, _Object-Relational Mapping_) es una técnica de programación que permite traducir e interconectar los datos almacenados en una base de datos relacional con los objetos utilizados en un lenguaje de programación orientado a objetos.

### Características principales

-  **Abstracción de datos**: Permite interactuar con la base de datos utilizando la lógica del lenguaje de programación (clases, métodos y propiedades) en lugar de escribir consultas SQL de manera manual.
-  **Independencia del motor**: Facilita la migración o el cambio de sistema gestor de bases de datos (por ejemplo, de PostgreSQL a MySQL o SQL Server) con modificaciones mínimas en el código fuente.
-  **Estructura de mapeo**: Las tablas de la base de datos se corresponden con clases, las filas con instancias u objetos, y las columnas con los atributos de dichos objetos.

### Ventajas y desventajas

-  **Ventajas**: Acelera el desarrollo de software, reduce la duplicación de código repetitivo y aporta mecanismos integrados de seguridad contra vulnerabilidades como la inyección SQL.
-  **Desventajas**: Puede generar consultas SQL menos optimizadas que las escritas a mano y presenta una sobrecarga de rendimiento en operaciones masivas o extremadamente complejas.