---
def-type: atomic
version: 1.0
id: def-nested-set-model
status: estandar
category: bases-de-datos
date: 2026-08-04
tags:
  - sql
  - jerarquias
aliases:
  - modelo de conjuntos anidados
  - nested set model
---

El modelo de conjuntos anidados (Nested Set Model) es una técnica de diseño de bases de datos relacionales diseñada para almacenar estructuras jerárquicas, tales como árboles o categorías con relaciones de padre e hijo, de forma altamente eficiente. En lugar de depender exclusivamente de una columna que apunte al ID del padre, este modelo asigna a cada nodo un par de números enteros denominados `lft` (izquierda) y `rgt` (derecha).
### Funcionamiento práctico

La estructura opera de manera similar a un sistema de intervalos numéricos o cajas chinas anidadas, donde los rangos de los nodos hijos están completamente contenidos dentro del intervalo numérico de su nodo superior:

-  **Nodo raíz**: Posee el rango global que abarca todo el universo de elementos de la jerarquía (por ejemplo, con un intervalo de `lft: 1` y `rgt: 12`).
-  **Nodos hijos**: Sus valores numéricos se sitúan estrictamente dentro de los límites del intervalo de su respectivo padre (por ejemplo, rangos como `lft: 2, rgt: 3` o `lft: 4, rgt: 5` contenidos dentro del intervalo superior).
### Regla matemática

Para identificar si un elemento es descendiente de otro, el modelo prescinde de consultas recursivas complejas y se basa en una comparación directa de rangos:

-  **Condición de descendencia**: Un registro se clasifica como hijo o descendiente directo si su valor `lft` es mayor que el `lft` del padre y su valor `rgt` es menor que el `rgt` del padre.
-  **Consultas optimizadas**: Permite consultar ramas completas de árboles genealógicos utilizando operadores relacionales simples en SQL (como `BETWEEN`, `>`, `<`), evitando bucles pesados o expresiones de tabla comunes recursivas (CTEs) que penalizan el rendimiento con volúmenes elevados de registros.
### Implementación en ERP

-  **Rendimiento en lectura**: Su adopción principal responde a la optimización drástica en la velocidad de lectura y consulta de estructuras jerárquicas complejas a escala.
-  **Contrapunto operativo**: Las operaciones de inserción, eliminación o reubicación de categorías en posiciones intermedias del árbol requieren recalcular y actualizar los valores `lft` y `rgt` de los registros afectados. El framework Frappe gestiona y automatiza esta complejidad matemática subyacente cada vez que se ejecutan acciones desde la interfaz visual.

![[barra.gif]]

**No existe una tabla diferente o separada** que sea la "madre" o "padre" de `tabItem Group`. En nested set model (y en las bases de datos relacionales en general), cuando se manejan estructuras de árbol o jerarquías, se utiliza una técnica llamada **Auto-relación (Self-Join)**.
### ¿Cómo funciona?

La tabla **`tabItem Group` es su propia tabla padre y su propia tabla hija**.

- El registro `"All Item Groups"` (que actúa como la raíz de todo) **vive dentro de la misma tabla `tabItem Group`**.
- Cuando el registro `"Products"` dice en su columna `parent_item_group` el valor `"All Item Groups"`, no está buscando en otra tabla externa; está haciendo referencia **a otra fila dentro de la misma tabla `tabItem Group`**.
### ¿Cómo se vería esto en una consulta SQL si quieres unir la tabla consigo misma?

Para un ingeniero de datos que quiere ver quién es el padre de cada elemento cruzando la misma tabla, se utiliza un **Self-Join**:

```SQL
SELECT 
    hijo.name AS Elemento_Hijo,
    padre.name AS Elemento_Padre
FROM `tabItem Group` hijo
LEFT JOIN `tabItem Group` padre 
    ON hijo.parent_item_group = padre.name;
```

Si ejecutas esto en tu PopSQL, verás que tanto los hijos como los padres provienen exactamente de la misma tabla: **`tabItem Group`**. Por eso los campos `lft` y `rgt` son tan importantes, porque le dicen a esa misma tabla dónde empieza y dónde termina cada rama sin tener que hacer consultas pesadas hacia otras tablas.