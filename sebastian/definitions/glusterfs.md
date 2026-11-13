---
def-type: atomic
version: 1.0
id: def-glusterfs
status: estandar
category: almacenamiento
contexto: almacenamiento-distribuido
date: 2026-11-11
tags:
  - almacenamiento
  - filesystem
  - cluster
  - alta-disponibilidad
aliases:
  - gluster
  - glusterfs file system
  - sistema de archivos glusterfs
---
**GlusterFS** es un **sistema de archivos distribuido que agrega el almacenamiento de múltiples servidores en un único sistema lógico**: los discos de varios nodos se combinan en un volumen común que los clientes montan como si fuera un disco más — la capacidad total es la suma de las partes.

#### Cómo Funciona

-  Los datos se **distribuyen o replican entre los nodos** del clúster: la distribución reparte el contenido para ampliar capacidad y rendimiento; la replicación copia cada dato en varios nodos para garantizar **redundancia** y sobrevivir a la caída de un servidor.
-  No hay una centralita: cada nodo participa por igual en el volumen, y los clientes hablan directamente con ellos.

#### Uso Común

-  Entornos que necesitan **almacenamiento distribuido en múltiples nodos con alta disponibilidad**.
-  **Clústeres grandes** donde los datos deben estar disponibles desde muchos servidores a la vez — virtualización, contenedores, media, backups centralizados.

#### Limitaciones

-  **Mayor complejidad de configuración** comparado con NFS — diseñar el clúster (tipos de volumen, réplicas, tolerancia a fallos) exige más conocimiento que exportar un directorio.
-  **Requiere nodos adicionales** para garantizar redundancia: la alta disponibilidad no es gratis en hardware.

#### Diferencia Crítica: GlusterFS vs. NFS

-  **NFS** comparte los discos de **un servidor central** que los exporta; si ese servidor cae, todo el almacenamiento se cae con él.
-  **GlusterFS** no tiene servidor único: el almacenamiento es un **pool distribuido y replicado** entre muchos nodos — escala agregando servidores y tolera fallos por diseño.
-  La elección: simplicidad y carga ligera → NFS; escala, alta disponibilidad y crecimiento horizontal → GlusterFS.

### Propósito fundamental

GlusterFS convierte un grupo de servidores con discos en un único almacén lógico sin punto único de fallo: el almacenamiento deja de ser una caja que hay que agrandar y se vuelve un clúster que crece nodo a nodo — al precio de una configuración más exigente que el clásico servidor NFS.
