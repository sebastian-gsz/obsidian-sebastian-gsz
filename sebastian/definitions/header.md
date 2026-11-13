---
def-type: atomic
version: 1.0
id: def-encabezado
status: estandar
category: ciencia-de-datos
contexto: analisis-de-datos
date: 2026-11-11
tags:
  - datos
  - hojas-de-calculo
  - ciencia-de-datos
aliases:
  - encabezado
  - encabezado de columna
  - header row
  - fila de encabezados
---
Un **encabezado** es la primera fila de una hoja de cálculo o tabla de datos, y su función es declarar **de qué tipo de dato se trata en cada columna**: el nombre de la variable que esa columna contiene. Es el contrato de lectura del dataset — sin encabezado, una tabla es solo una malla de números sin significado.

#### Funciones del Encabezado

-  **Semántica**: da nombre a cada variable (`fecha`, `ingresos`, `país`), convirtiendo columnas anónimas en campos referenciables por fórmulas, consultas y código.
-  **Detección de esquema**: los importadores (Excel, pandas, bases de datos) usan la primera fila para inferir los nombres de campo; un encabezado ambiguo o duplicado contamina todo el análisis aguas abajo.
-  **Filtrado y ordenación**: los filtros automáticos, las tablas dinámicas y las cláusulas `ORDER BY` operan sobre los nombres del encabezado.

#### Diferencia Crítica: Encabezado en Datos vs. Encabezado en Redes

-  En **análisis de datos**, el encabezado describe el contenido de las columnas de una tabla (este es el sentido del término en el glosario de datos).
-  En **redes**, "encabezado" (_header_) designa otra cosa: los bytes de metadatos que anteceden al _payload_ en un paquete o trama — dirección MAC origen/destino, IPs, puertos, flags. Coinciden en idioma pero no en concepto: uno nombra columnas, el otro dirige paquetes.

#### Buenas Prácticas

-  Nombres cortos, únicos y sin espacios (`fecha_alta` mejor que "Fecha de Alta del Cliente").
-  Una fila de encabezado única al principio; nada de títulos decorativos ocupando filas encima de los datos reales — rompen los importadores.

### Propósito fundamental

El encabezado es la primera línea de comunicación entre los datos y quien los consume: define qué es cada columna y habilita todo lo demás — fórmulas, filtros, modelos — por lo que un encabezado bien diseñado es la inversión más barata en calidad de un dataset.
