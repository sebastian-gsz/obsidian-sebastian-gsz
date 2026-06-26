---
def-type: atomic
version: 1.0
id: def-nfs
status: finalizado
category: protocolo
contexto: infraestructura
organismo: IETF
date: 2026-06-13
tags:
  - protocolos/red
  - almacenamiento
  - linux
  - networking
aliases:
  - network file system
  - nfs
---
NFS es un protocolo de sistema de archivos distribuido que permite que un cliente monte directorios compartidos desde un servidor remoto a través de una red. Esto permite a los usuarios y aplicaciones acceder a archivos remotos como si residieran localmente en su propio almacenamiento, garantizando transparencia operativa.

#### Funcionamiento y Arquitectura

-  **Modelo Cliente-Servidor:** El servidor "exporta" directorios del sistema de archivos local para ponerlos a disposición en la red. El cliente "monta" estos directorios dentro de su propia jerarquía de archivos.
-  **Mecanismo base:** Utiliza **RPC (Remote Procedure Call)** para gestionar las comunicaciones y ejecutar operaciones de sistema de archivos (lectura, escritura, bloqueo) de forma remota.
-  **Independencia:** Es agnóstico respecto al hardware y al sistema operativo, lo que facilita su despliegue en entornos heterogéneos.    

#### Comandos fundamentales (Linux)

-  **Montaje de recurso:** `sudo mount -t nfs 192.168.1.10:/ruta/del/recurso /mnt/nfs_local`
-  **Verificación de montajes activos:** `mount | grep nfs`
-  **Exportar directorios (Servidor):** `sudo exportfs -rav`
-  **Listar recursos exportados (Servidor remoto):** `showmount -e 192.168.1.10`

#### Consideraciones de arquitectura y continuidad

La implementación de NFS centraliza los datos, lo cual es excelente para la colaboración, pero crea una dependencia crítica: si el servidor central falla, se detiene el flujo de trabajo de todos los clientes dependientes.

- **Desafíos de Protección:**

    -  **RPO (Recovery Point Objective):** En entornos locales tradicionales, la falta de replicación en tiempo real suele implicar ventanas de pérdida de datos significativas (ej. el último backup hace 24h).
    -  **RTO (Recovery Time Objective):** La recuperación ante desastres requiere aprovisionar hardware, restaurar datos y reconfigurar servicios, lo que puede tardar días si no hay una estrategia de replicación (ej. SAN, NAS o migración a almacenamiento Cloud).
- **Estrategia Cloud:** Trasladar la carga a la nube permite que el proveedor gestione la durabilidad y disponibilidad (mediante replicación regional), convirtiendo el almacenamiento local en una caché temporal y transformando gastos de capital (CAPEX) en gastos operativos (OPEX).
