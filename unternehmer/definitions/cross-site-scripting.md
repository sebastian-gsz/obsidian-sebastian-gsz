---
def-type: atomic
aliases:
  - inyección de código
  - XSS
  - Cross-Site Scripting
  - Ataque de inyección
tags:
  - vulnerabilidades
  - web
  - inyección
category: ataques
contexto: ciberseguridad
version: 1
date: 2026-06-16
status: estandar
---
Familia de ataques que explotan vulnerabilidades en aplicaciones web donde los datos suministrados por el usuario no son validados correctamente antes de ser procesados por el backend o renderizados en el frontend.

* **Tipos**:
  
    * **Inyección (SQL/Command)**: Introduce código ejecutable que altera la consulta de base de datos o comandos del sistema operativo.
    * **XSS (Cross-Site Scripting)**: Almacenado (persistente en el servidor), Reflejado (ejecutado por un clic de la víctima) o basado en DOM (manipulación del entorno cliente).
* **Impacto**: Permite el robo de sesiones, redirección maliciosa, robo de datos confidenciales o desfiguración (defacement) de sitios web.