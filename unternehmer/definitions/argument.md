---
def-type: atomic
version: 1.0
id: def-argument
status: estandar
category: conceptos-generales
contexto: sistemas-operativos
date: 2026-06-16
tags:
  - cli
  - comandos
  - desarrollo
  - bash
aliases:
  - argument
  - argumento
  - parameter
  - parámetro
---
Un argumento es el valor de entrada que se proporciona a un comando, script o función para personalizar su ejecución o definir el objeto sobre el cual se aplicará la lógica definida.

-  **Distinción técnica:**
    
    -  **Argumentos (Operandos):** Valores directos que el programa requiere para operar (ej. nombres de archivos, rutas, texto).
    -  **Opciones/Flags:** Modificadores que alteran el comportamiento predeterminado del comando. Suelen precederse por guiones  simples (`-`) para formas cortas o dobles (`--`) para formas descriptivas largas.
-  **Anatomía de una línea de comando:** `comando [opciones] [argumentos]`
-  **Ejemplo práctico:** `grep -n "error" log.txt`
    
    -  `-n`: Opción (modifica el comportamiento para mostrar números de línea).
    -  `"error"`: Argumento (define el patrón de búsqueda).
    -  `log.txt`: Argumento (define el archivo de entrada).
-  **Importancia:** Sin estos parámetros, la ejecución de la mayoría de las herramientas de consola sería indeterminada o inútil al carecer del contexto necesario para procesar los datos.

