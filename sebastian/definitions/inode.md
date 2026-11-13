---
def-type: atomic
version: 1.0
id: def-inode
status: estandar
category: sistemas-operativos
contexto: filesystem
date: 2026-11-11
tags:
  - linux
  - filesystem
  - metadatos
  - almacenamiento
aliases:
  - inodo
  - inodes
  - inode
---
Un **inode** (inodo) es una **estructura de datos del sistema de archivos que almacena la información sobre un archivo o directorio, pero no su contenido**: cada archivo tiene un inode asociado que contiene sus metadatos — es la "ficha administrativa" que el sistema necesita para encontrar y manejar el archivo.

#### Qué Almacena un Inode

-  El **propietario** del archivo y sus permisos de acceso (lectura/escritura/ejecución por dueño, grupo y otros).
-  Las **marcas de tiempo**: creación, modificación y último acceso.
-  El **tamaño** del archivo y la **ubicación de sus bloques de datos** en el disco.
-  NOTA CLAVE: no guarda el nombre del archivo — ese vive en la entrada de directorio, que apunta al inode.

#### Los Bloques: el Contenido al Otro Lado

Un **bloque** es la unidad de almacenamiento más pequeña que se puede leer o escribir en el sistema de archivos; su estado puede ser libre, en uso o reservado. Al guardar un archivo, ocupa **uno o más bloques** según su tamaño — y si el tamaño no encaja perfecto en bloques enteros, el último queda parcialmente utilizado. El inode sabe en qué bloques vive su contenido; el contenido está en ellos.

#### El Problema de "Quedarse sin Inodos"

El número de inodos de un disco es **limitado y se fija al crear el sistema de archivos**. Un disco con **muchos archivos pequeños** puede quedarse sin inodos aunque aún haya espacio físico libre — y entonces **no se pueden crear más archivos ni directorios** hasta liberar inodos (borrar archivos) o reformatear con más densidad de inodos. Es un fallo clásico en servidores con millones de ficheros pequeños (cachés, sesiones, mails).

#### Diferencia Crítica: Inode vs. Bloque

-  El **inode** es el registro administrativo: metadatos y el mapa de dónde está el contenido.
-  El **bloque** es la unidad de contenido: los datos en sí, troceados en unidades mínimas de lectura/escritura.
-  Analogía: el inode es la ficha de la biblioteca (autor, ubicación de estante); los bloques son las páginas del libro. Ambos son indispensables y se quedan sin espacio de formas distintas.

### Propósito fundamental

El inode es el corazón de los sistemas de archivos Linux/Unix: separa la identidad administrativa del archivo de su contenido físico, y su límite finito enseña una lección de capacidad que el espacio en disco no muestra — un disco puede tener gigabytes libres y aun así estar agotado para crear archivos, porque lo que se acabó son las fichas, no las páginas.
