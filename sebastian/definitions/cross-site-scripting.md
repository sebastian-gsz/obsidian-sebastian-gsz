---
def-type: atomic
version: 1.0
id: def-inyeccion-xss
status: estandar
category: ataques
contexto: ciberseguridad
date: 2026-06-16
tags:
  - vulnerabilidades
  - web
  - inyeccion
aliases:
  - inyección de código
  - xss
  - cross-site scripting
  - ataque de inyección
---
Las vulnerabilidades de inyección comprenden una familia de ataques que explotan fallos en aplicaciones web, ocurriendo principalmente cuando los datos suministrados por el usuario no son validados, sanitizados o parametrizados correctamente antes de ser procesados por el _backend_ o renderizados en el _frontend_. Estos ataques permiten que actores malintencionados alteren la lógica de ejecución del software.

-  **Inyección (SQL/Command):** Esta técnica implica la introducción de código ejecutable que altera intencionalmente las consultas de bases de datos o los comandos del sistema operativo del servidor.
-  **XSS (Cross-Site Scripting):** Se clasifica según su método de ejecución:
    
    -  **Almacenado (persistente):** El código malicioso reside permanentemente en el servidor.
    -  **Reflejado:** El código es ejecutado mediante la interacción de la víctima, típicamente a través de un enlace malicioso.
    -  **Basado en DOM:** El ataque ocurre mediante la manipulación del entorno del cliente (DOM) durante la ejecución local del script.
-  **Impacto:** Las consecuencias de estos ataques incluyen el robo de sesiones, la redirección maliciosa, la exfiltración de datos confidenciales y la desfiguración (_defacement_) de sitios web.