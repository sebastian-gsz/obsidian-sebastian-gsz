---
def-type: def-lab-local
version: 1.0
status: queued
category: implementación
date: 2026-07-02
id: lab-aws-poc-simple-storage-partition
---
Validar una arquitectura de Data Lake sobre Amazon S3 utilizando particionado Hive, catálogo de datos en AWS Glue y consultas mediante Athena. La **PoC** debe permitir evaluar cómo afectan distintos diseños de prefijos y particiones al rendimiento de la ingesta, la capacidad de escalado, el partition pruning y los costes de consulta.

**s3://tu-bucket-datalake/**
**└── datalake/**
    **├── region=es/**
    **│   ├── hash=00/**
    **│   │   └── year=2026/**
    **│   │       └── month=06/**
    **│   │           └── day=16/**
    **│   │               └── part-*.parquet**
    **│   └── hash=01/**
    **│       └── year=2026/**
    **│           └── month=06/**
    **│               └── day=16/**
    **│                   └── part-*.parquet**
    **└── region=fr/**
        **├── hash=00/**
        **└── ...**

###### Contexto

Se desea analizar buenas prácticas de diseño de prefijos en S3 para evitar hotspots y facilitar cargas masivas de datos.  
- Particionado únicamente por fecha.  
- Particionado por clave natural de negocio + fecha.  
- Particionado híbrido mediante clave natural + hash de distribución + fecha.  

El objetivo es validar la compatibilidad con motores analíticos como Athena y determinar cuál proporciona mejor equilibrio entre rendimiento operativo y eficiencia analítica.

###### Alcance

Incluido:  

-  Creación de bucket S3.  
-  Carga de datos en formato Parquet.  
-  Estructura de particionado Hive.  
-  Creación de Glue Database.  
-  Configuración y ejecución de Glue Crawler.  
-  Registro automático de particiones.  
-  Consultas mediante Athena.  
-  Validación de partition pruning.  
-  Comparativa de estructuras de prefijos.  

Excluido:  

-  Automatización CI/CD.  
-  Ingesta en streaming.  
-  Lake Formation.  
-  Optimización de costes avanzada.  
-   Gobierno y seguridad a nivel enterprise



