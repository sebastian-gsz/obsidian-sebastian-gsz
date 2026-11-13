---
def-type: atomic
version: 1.0
id: def-prepared-statements
status: estandar
category: desarrollo-software
contexto: seguridad-de-aplicaciones
date: 2026-11-11
tags:
  - seguridad
  - sql
  - bases-de-datos
  - desarrollo
aliases:
  - sentencias preparadas
  - prepared statements
  - consultas parametrizadas
---
Las **sentencias preparadas** (_prepared statements_ — consultas parametrizadas) son la técnica que **separa la estructura de la consulta SQL de sus datos**: la consulta se define PRIMERO con marcadores de posición (`?`, `:param`) y los valores llegan DESPUÉS como datos puros — el motor los trae como texto, jamás como código ejecutable.

#### Por Qué Neutraliza la Inyección SQL

-  En la concatenación clásica, el dato del usuario SE PEGA al SQL — y un `' OR '1'='1' --` cambia la estructura de la consulta.
-  En la sentencia preparada, la estructura está COMPILADA de antemano: el parámetro entra como valor vinculado — aunque contenga SQL completo, el motor lo trata como literal, no como código.
-  Es la defensa estructural (no cosmética) contra la inyección SQL: el dato no puede ser código porque el motor nunca lo interpreta como tal — sin listas negras, sin escapar a mano, sin errores humanos.

#### Cómo se Ve

```sql
-- VULNERABLE: concatenación
"SELECT * FROM usuarios WHERE user = '" + entrada + "'"

-- SEGURA: sentencia preparada
SELECT * FROM usuarios WHERE user = ?   -- y 'entrada' viaja como parámetro
```

-  Todo ORM serio (Hibernate, SQLAlchemy, Prisma) y toda API de acceso a datos parametrizan por defecto — la vulnerabilidad nace cuando alguien "optimiza" concatenando.
-  Bonus: las preparadas se **precompilan** — en consultas repetidas, el plan de ejecución se reutiliza: seguridad Y rendimiento a la vez.

#### Diferencia Crítica: Sentencias Preparadas vs. Saneamiento de Entradas

-  La **sentencia preparada** protege la base de datos SQL específicamente — el diseño que hace imposible confundir dato con consulta.
-  El **saneamiento** es la técnica general para todas las salidas del dato: HTML (XSS), comandos, rutas, logs.
-  Se apilan en defensa en profundidad: la preparada para SQL (la más estructural), el saneamiento para lo demás, y la validación al frente rechazando lo inválido — ninguna es suficiente sola contra todas las superficies.

### Propósito fundamental

Las sentencias preparadas son la defensa estructural contra la inyección SQL: la consulta se define una vez y el dato viaja como dato — por diseño, no por filtro — y su adopción universal (por ORM y por hábito) es la razón por la que la inyección SQL, la vulnerabilidad número uno de dos décadas, es hoy un fallo de decisión, no un misterio técnico.
