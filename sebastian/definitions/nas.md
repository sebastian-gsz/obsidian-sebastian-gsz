---
def-type: atomic
version: 1.0
id: def-nas
status: estandar
category: almacenamiento
contexto: almacenamiento-en-red
date: 2026-11-11
tags:
  - almacenamiento
  - nas
  - redes
  - archivos
aliases:
  - nas
  - network attached storage
  - almacenamiento conectado en red
---
Un **NAS** (_Network Attached Storage_ — almacenamiento conectado en red) es una solución que **permite guardar y compartir archivos a través de una red, como si se tratara de un disco duro accesible para múltiples usuarios y dispositivos al mismo tiempo**: una caja especializada en servir ficheros — no bloques — por la red.

#### Cómo Funciona

-  Utiliza **protocolos de sistema de archivos compartidos**:
  - **NFS** (_Network File System_): común en sistemas Linux/Unix.
  - **SMB** (_Server Message Block_): usado principalmente en sistemas Windows.
-  Los archivos se organizan en **estructuras jerárquicas** (carpetas y subcarpetas), accesibles desde múltiples servidores, aplicaciones o usuarios — el cliente monta el recurso y trabaja con él como si fuera un disco local.
-  El dispositivo NAS gestiona por sí mismo discos, redundancia (RAID), copias y permisos — es un equipo dedicado a ser el almacén de archivos de la red.

#### Para Qué se Usa

-  **Hogar**: centralizar fotos, películas y backups de todos los dispositivos — tu nube privada.
-  **Pequeñas y medianas empresas**: almacenamiento compartido de equipo, repositorios de documentos, destino de backups centralizado.
-  **Laboratorios y SOC**: repositorio de capturas, evidencia e imágenes — archivos que varios analistas deben alcanzar a la vez.

#### Diferencia Crítica: NAS vs. SAN vs. GlusterFS

-  **NAS** entrega **archivos** (nivel de archivo): carpetas compartidas por NFS/SMB — listo para usar, jerárquico, para compartir documentos.
-  Una **SAN** entrega **bloques** (nivel de bloque): discos "crudos" en red que el servidor formatea como propios — para bases de datos y virtualización de alto rendimiento.
-  **GlusterFS** agrega **nodos distribuidos** en un volumen lógico escalable sin punto único de fallo — el NAS clásico es un equipo (que puede caer solo); GlusterFS es un clúster que crece nodo a nodo.
-  La elección: compartir archivos con simplicidad → NAS; bloques de alto rendimiento → SAN; capacidad escalable y alta disponibilidad distribuida → GlusterFS.

### Propósito fundamental

El NAS es el archivador en red de una organización: convierte el almacenamiento en un servicio de archivos compartido, jerárquico y multiplataforma — la solución más simple y directa cuando lo que se necesita es que muchos usuarios alcancen los mismos ficheros, sin montar la infraestructura de un centro de datos.
