---
def-type: atomic
version: 1.0
id: def-aws-rds
status: estandar
category: bases-de-datos
contexto: arquitectura-cloud
date: 2026-06-26
tags:
  - aws
  - rds
  - bases-de-datos
  - cloud
  - sql
aliases:
  - aws rds
  - relational database service
  - rds
---
Amazon Web Service Relational Database Service es un servicio gestionado diseñado para facilitar la configuración, el funcionamiento y el escalado de bases de datos relacionales en la nube. Su propuesta de valor principal es la abstracción de la carga administrativa (parches, backups, aprovisionamiento), permitiendo que los equipos técnicos centren sus esfuerzos en la optimización del modelo de datos y el rendimiento de las consultas.

#### Pilares operacionales

-  **Gestión simplificada:** AWS automatiza el aprovisionamiento de hardware, la aplicación de parches del sistema operativo y del motor de base de datos, además de gestionar las copias de seguridad de forma transparente.
-  **Alta disponibilidad (Multi-AZ):** Al habilitar despliegues Multi-AZ, RDS aprovisiona automáticamente una réplica síncrona en una zona de disponibilidad (AZ) distinta. Ante un fallo de la instancia principal, el sistema realiza una conmutación por error (_failover_) automática, asegurando la continuidad del servicio.
-  **Escalabilidad de lectura:** Permite escalar horizontalmente mediante _Read Replicas_. Las operaciones de lectura se descargan de la instancia principal hacia réplicas secundarias, optimizando la capacidad de respuesta ante tráfico intenso.
-  **Recuperación ante desastres (PITR):** Ofrece _Point-in-Time Recovery_, permitiendo restaurar la base de datos a cualquier segundo específico dentro del periodo de retención configurado (hasta 35 días). Esto es vital para mitigar el impacto de errores humanos o corrupción accidental de datos.

#### Motores soportados

RDS es agnóstico respecto al motor SQL, lo que permite flexibilidad para elegir la tecnología adecuada según el caso de uso:

-  **Motores comunitarios:** Soporte nativo para **MySQL, MariaDB y PostgreSQL**, permitiendo la migración directa de cargas de trabajo existentes _on-premises_.
-  **Motores empresariales:** Soporte para **Oracle Database** y **Microsoft SQL Server**, incluyendo licencias integradas o modelos _Bring Your Own License_ (BYOL).
-  **Amazon Aurora:** Motor propietario de AWS, altamente optimizado, que combina la compatibilidad con MySQL/PostgreSQL con el rendimiento y la disponibilidad de una base de datos comercial de alto nivel.