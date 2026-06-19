---
def-type: atomic
aliases:
  - argument
  - argumento
tags:
  - cli
  - comandos
  - desarrollo
  - bash
category: conceptos-generales
contexto: sistemas-operativos
version: 1
date: 2026-06-16
status: estandar
---
Un argumento es el valor de entrada que se proporciona a un comando, script o función para personalizar su ejecución o definir el objeto sobre el cual se aplicará la lógica definida.

* **Tipología**: Generalmente se distinguen entre argumentos (valores que el programa necesita para funcionar, como el nombre de un archivo) y opciones/flags (modificadores que alteran el comportamiento del comando, precedidos usualmente por guiones como `-` o `--`).
* **Ejemplo técnico**: En el comando `grep -n "error" log.txt`, `-n` es una opción para mostrar el número de línea, `"error"` es un argumento de patrón de búsqueda y `log.txt` es un argumento de entrada de archivo. Sin estos argumentos, el comando carecería del contexto necesario para procesar la información de forma útil.