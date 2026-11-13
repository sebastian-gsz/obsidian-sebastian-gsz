---
def-type: atomic
version: 1.0
id: def-tempdb
status: estandar
category: bases-de-datos
contexto: bases-de-datos
date: 2026-11-12
tags:
  - sql-server
  - bases-de-datos
  - rendimiento
aliases:
  - tempdb
  - base de datos temporal
---
**tempdb** es una **base de datos del sistema en Microsoft SQL Server que se utiliza como almacenamiento temporal** para diversas operaciones internas y del usuario: el taller de trabajo del motor — donde vive lo que existe solo mientras dura la consulta o la sesión.

#### Su Propósito

-  **Almacenar tablas y datos temporales**: si un usuario crea una tabla temporal, va a tempdb — `CREATE TABLE #Temporal (Id INT, Nombre VARCHAR(50));` existe solo durante la sesión actual y se elimina automáticamente después.
-  **Soporte para operaciones complejas**: los cálculos intermedios — ordenar datos en un `ORDER BY`, manejos de resultados grandes, _spools_ de consultas — pasan por tempdb.
-  **Almacén para índices temporales y versiones de datos**: transacciones con **bloqueo de registros** o con múltiples versiones de datos (row versioning) se gestionan aquí.

#### Sus Características

-  **Volátil**: TODO lo que hay en tempdb se elimina cuando se reinicia el servidor — por definición, nunca guarda nada permanente.
-  **Rendimiento crítico**: tempdb gestiona MUCHAS operaciones internas del motor — su rendimiento afecta directamente la velocidad general de SQL Server; el cuello de botella silencioso de muchas bases lentas.

#### Configuración en Entornos Críticos

En entornos como los de **Azure o AWS** se recomienda asignar un **disco SSD exclusivo para tempdb** — mejora la velocidad de las operaciones intensivas de I/O (lectura/escritura) que el motor le descarga constantemente. Múltiples archivos de datos de tempdb bien dimensionados son otra práctica estándar para evitar contención.

#### Diferencia Crítica: tempdb vs. Las Bases de Usuario

-  Las bases de usuario **persisten**: sus datos sobreviven al reinicio — son el negocio.
-  **tempdb** es efímera y compartida: se recrea limpia en cada arranque y sirve a TODAS las bases a la vez — su saturación afecta a todo el servidor.
-  La lección operativa: monitorear tempdb (tamaño, contención) no es opcional — es el órgano interno que, cuando falla, hace lentas a todas las bases sin que ninguna lo parezca.

### Propósito fundamental

tempdb es el almacén de lo temporal en SQL Server: tablas temporales, cálculos intermedios y versiones de transacciones viven aquí y mueren al reiniciar — y por ser el taller interno de TODAS las operaciones, su rendimiento es el rendimiento del servidor — el componente que nadie ve y que todo lo nota.
