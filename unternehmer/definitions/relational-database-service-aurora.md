---
def-type: atomic
version: 1.0
id: def-aurora
status: estandar
category: bases-de-datos
contexto: arquitectura-cloud
date: 2026-06-25
tags:
  - aws
  - aurora
  - bases-de-datos
  - cloud
  - sql
aliases:
  - amazon aurora
  - aws aurora
  - relational database service aurora
---
Amazon Aurora es una base de datos relacional de alto rendimiento diseñada específicamente para la nube. Su arquitectura reinventa el almacenamiento de bases de datos relacionales al desacoplar el motor de base de datos de la capa de almacenamiento, permitiendo una escalabilidad y resiliencia superiores a las de los motores tradicionales (MySQL/PostgreSQL) ejecutándose en volumen de bloques convencionales.

#### Arquitectura y ventajas operativas

-  **Almacenamiento auto-gestionado:** El almacenamiento es distribuido y log-structured. Se escala automáticamente hasta 128 TiB sin necesidad de intervención ni aprovisionamiento manual, eliminando la gestión de volúmenes de disco tradicionales.
-  **Resiliencia distribuida (6-way replication):** Los datos se replican seis veces en tres zonas de disponibilidad (AZs) distintas. Esta arquitectura permite tolerar la pérdida de dos copias de datos sin impacto en la escritura y de tres copias sin impacto en la lectura, garantizando una disponibilidad extremadamente alta.
-  **Rendimiento optimizado:** Al utilizar un motor de almacenamiento distribuido diseñado para trabajar directamente con logs (reduciendo la escritura de páginas completas), Aurora elimina gran parte del _overhead_ de E/S de las bases de datos tradicionales, logrando hasta 5x el rendimiento de MySQL y 3x el de PostgreSQL estándar.
-  **Réplicas de lectura de baja latencia:** El uso de un endpoint compartido para réplicas facilita el escalado horizontal. La replicación ocurre a nivel de almacenamiento en milisegundos, asegurando una coherencia de lectura rápida a través del clúster.    

#### Opciones de cómputo

-  **Instancias aprovisionadas:** Optimización fija para cargas de trabajo predecibles.
-  **Aurora Serverless:** Escala la capacidad de cómputo (ACUs - Aurora Capacity Units) automáticamente hacia arriba o hacia abajo en función de la demanda real de la aplicación. Es la opción ideal para cargas de trabajo impredecibles o intermitentes, optimizando costos al cobrar solo por la capacidad consumida.

#### Compatibilidad

Aurora no es un motor nuevo en cuanto a lenguaje; es totalmente compatible con **MySQL** y **PostgreSQL**. Esto permite migrar aplicaciones existentes con cambios mínimos en el código, al tiempo que se obtienen beneficios de rendimiento, automatización de _backups_ y disponibilidad de nivel empresarial sin los costos de las licencias propietarias tradicionales.