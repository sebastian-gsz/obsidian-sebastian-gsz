---
def-type: atomic
version: 1.0
id: def-input-sanitization
status: estandar
category: desarrollo-software
contexto: seguridad-de-aplicaciones
date: 2026-11-11
tags:
  - seguridad
  - validacion
  - desarrollo
  - web
aliases:
  - saneamiento de entradas
  - input sanitization
  - validación de entradas
---
El **saneamiento de entradas** (_input sanitization_) es la técnica de programación que **valida y limpia las entradas del usuario antes de procesarlas** — para prevenir ataques de inyección: ningún dato que llega del exterior (formularios, URLs, APIs, archivos) se confía sin verificar que es lo que dice ser.

#### Las Dos Mitades de la Defensa

-  **Validación**: ¿la entrada es lo que debe ser? — formato (un email parece email), tipo (un ID es numérico), rango (una edad está entre 0 y 130), lista blanca de valores permitidos.
-  **Saneamiento (limpieza)**: quitar o neutralizar lo peligroso — escapar caracteres especiales (`'` → `\'`, `<` → `&lt;`), eliminar código, truncar longitudes.
-  **El orden importa**: validar primero (rechazar lo inválido), sanitizar después (neutralizar lo aceptado) — y siempre ANTES de que el dato toque la base de datos, el shell o el HTML.

#### Por Qué es la Primera Línea Anti-Inyección

-  SQL injection, XSS, command injection — todas nacen del mismo pecado: **dato tratado como código**. El saneamiento rompe esa confusión en la entrada.
-  Es defensa en profundidad junto a las **sentencias preparadas**: la preparada protege la consulta SQL; el saneamiento protege las demás salidas — HTML, logs, comandos, nombres de archivo.
-  La regla de oro del desarrollo seguro: **confiar solo en la lista blanca** — lo que no está expresamente permitido, se rechaza; la lista negra siempre se queda corta.

#### Diferencia Crítica: Saneamiento vs. Sentencias Preparadas

-  Las **sentencias preparadas** protegen UNA salida específica: la base de datos SQL — separan estructura de consulta de los datos por diseño.
-  El **saneamiento** es la técnica general para TODAS las salidas: SQL, HTML, comandos, rutas de archivo.
-  No compiten — se apilan: la sentencia preparada hace el dato inofensivo para SQL; el saneamiento lo hace inofensivo para el resto — y la validación rechaza antes lo que ni siquiera debería existir.

### Propósito fundamental

El saneamiento de entradas es la disciplina que separa dato de código en la frontera de la aplicación: validar y limpiar todo lo que entra — porque la regla fundacional de la seguridad de aplicaciones es que toda entrada es hostil hasta demostrar lo contrario, y la entrada sanitizada es la que jamás se convierte en comando ajeno.
