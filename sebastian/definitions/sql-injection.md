---
def-type: atomic
version: 1.0
id: def-inyeccion-sql
status: estandar
category: amenazas
contexto: ataques-web
date: 2026-11-11
tags:
  - ciberseguridad
  - sql
  - ataques
  - bases-de-datos
aliases:
  - inyección sql
  - sql injection
  - sqli
---
La **inyección SQL** (_SQL Injection_ — SQLi) es un ataque que **ejecuta consultas manipuladas para comprometer una base de datos**: el atacante introduce código SQL malicioso en un campo de entrada de la aplicación, y si esa entrada se concatena directamente en una consulta sin filtrar, la base de datos lo ejecuta como si fuera parte legítima del programa.

#### Mecánica del Ataque

-  **La grieta**: una consulta construida por concatenación de cadenas — `SELECT * FROM usuarios WHERE user = '" + entrada + "'` — permite que la entrada cambie la estructura de la consulta en lugar de ser un dato.
-  **Ejemplo clásico**: introducir `' OR '1'='1' --` en un login convierte la consulta en "muéstrame el usuario donde algo = algo" → **evita la autenticación**. Con un `; DROP TABLE` se puede destruir; con `UNION SELECT`, exfiltrar tablas enteras.
-  **Variantes**: _in-band_ (la respuesta visible delata los datos), _blind_ (sin error visible, se deduce por comportamiento: tiempo de respuesta, booleanos) y _out-of-band_ (exfiltración por canal secundario).

#### Consecuencias

Robo de la base de datos completa (usuarios, credenciales, datos de clientes), evasión de autenticación, modificación o destrucción de datos, y en configuraciones permisivas, ejecución de comandos en el propio servidor de base de datos.

#### Diferencia Crítica: SQLi vs. XSS

-  La **SQLi ataca al servidor y sus datos**: el objetivo es la base de datos, y el vector es la entrada que llega a una consulta.
-  **XSS** ataca al usuario: inyecta código que se ejecuta en el navegador de las víctimas. Ambos nacen del mismo pecado — no separar datos de código — pero en capas distintas: la SQLi engaña a la base de datos; el XSS engaña al navegador.

#### Mitigación

-  **Consultas parametrizadas** (_prepared statements_): la única defensa estructural — la consulta se define primero y los datos entran después, imposibles de interpretar como SQL.
-  ORM y capas de acceso que parametrizan por defecto; validación de entrada por lista blanca; **mínimo privilegio** del usuario de base de datos (que la app no conecte como administrador); mensajes de error genéricos que no revelen la consulta.

### Propósito fundamental

La inyección SQL es la lección fundacional de la seguridad en aplicaciones: toda entrada del usuario es hostil hasta demostrar lo contrario, y la separación entre el código de una consulta y sus datos es la línea que separa una aplicación de una base de datos abierta al atacante — vulnerabilidad que encabeza los ranking OWASP desde hace dos décadas.
