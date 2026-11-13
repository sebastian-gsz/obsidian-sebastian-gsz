---
def-type: atomic
version: 1.0
id: def-iops
status: estandar
category: almacenamiento
contexto: rendimiento
date: 2026-11-11
tags:
  - almacenamiento
  - rendimiento
  - iops
  - aws
aliases:
  - iops
  - operaciones de e/s por segundo
  - input output operations per second
---
**IOPS** (_Input/Output Operations Per Second_ — operaciones de entrada/salida por segundo) es la **métrica estándar para medir el rendimiento de dispositivos de almacenamiento** — discos duros (HDD), unidades de estado sólido (SSD) y redes de área de almacenamiento (SAN): cuántas operaciones de lectura y escritura puede completar el sistema **por segundo**.

#### Qué Mide y Cómo se Usa

-  Mide la capacidad del almacenamiento para manejar operaciones de E/S por segundo — clave en cargas de trabajo de alta demanda de acceso a datos.
-  Un disco con **IOPS alto** maneja mayor volumen de operaciones por segundo — ideal para **bases de datos** y sistemas con muchas solicitudes rápidas de datos pequeñas.
-  Referencia práctica: un HDD mecánico rinde en el orden de 100-200 IOPS (limitado por sus cabezas mecánicas); un SSD clásico, miles; NVMe moderno, decenas o cientos de miles.

#### Relación con AWS

En AWS, los volúmenes EBS (_Elastic Block Store_) ofrecen **IOPS provisionados** — en los tipos **io1** e **io2** se especifica el número exacto de IOPS requeridos, pagando por rendimiento garantizado: el patrón de diseño cuando una base de datos necesita un mínimo de operaciones por segundo, no solo espacio.

#### Diferencia Crítica: IOPS vs. Throughput

-  **IOPS** cuenta **operaciones por segundo**: cuántas lecturas/escrituras se completan.
-  **Throughput** mide **datos por segundo** (MB/s): cuánto volumen se mueve.
-  La multiplicación conecta ambos (IOPS × tamaño de operación ≈ throughput), pero dominan escenarios distintos: una base de datos transaccional hace millones de operaciones **pequeñas** → compra IOPS; un backup o streaming mueve **pocos bloques enormes** → compra throughput. Optimizar la métrica equivocada es pagar por rendimiento que la aplicación no usa.

### Propósito fundamental

IOPS es el velocímetro de las operaciones de almacenamiento: traduce la demanda de una aplicación (cuántas lecturas y escrituras por segundo necesita) en la especificación de hardware correcta — la métrica que separa un disco que "tiene espacio" de uno que "aguanta la carga".
