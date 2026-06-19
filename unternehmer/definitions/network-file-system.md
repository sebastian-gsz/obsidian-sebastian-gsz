---
def-type: atomic
aliases:
  - Network File System
  - NFS
tags:
  - protocolos/red
  - almacenamiento
  - linux
  - networking
category: protocolo
contexto: infraestructura
organismo: IETF
version: 1.0
date: 2026-06-13
status: finalizado
---

NFS (**Network File System**) es un protocolo de sistema de archivos distribuido que permite que un equipo cliente monte directorios compartidos desde un servidor remoto a través de una red. Esto facilita que los usuarios y aplicaciones accedan a los archivos como si estuvieran alojados localmente en su propio almacenamiento, garantizando transparencia en la gestión de datos.

-  **Funcionamiento básico**

	  El protocolo opera bajo una arquitectura cliente-servidor donde:
	  
	  - **Servidor:** Exporta directorios específicos del sistema de archivos local para que estén disponibles en la red.
	  - **Cliente:** Monta estos directorios exportados, integrándolos en su propia jerarquía de archivos local.
	  - **RPC (Remote Procedure Call):** Es el mecanismo base que permite la comunicación entre el cliente y el servidor para ejecutar operaciones sobre los archivos.
-  **Ventajas principales**
  
	  - **Centralización:** Permite consolidar datos en un servidor central, facilitando copias de seguridad y administración.
	  - **Acceso compartido:** Facilita la colaboración en entornos de desarrollo y entornos donde múltiples clientes necesitan acceder a los mismos datasets.
	  - **Independencia:** Es agnóstico respecto al hardware y al sistema operativo subyacente, lo cual es fundamental en infraestructuras heterogéneas.
-  **Comandos esenciales en Linux**

	  Si necesitas configurar o verificar montajes NFS, aquí tienes los comandos fundamentales en una sola línea:
	  
	  - Para montar un directorio compartido desde un servidor remoto en un punto de montaje local: `sudo mount -t nfs 192.168.1.10:/ruta/del/recurso /mnt/nfs_local`
	  - Para verificar los sistemas de archivos montados y ver si el montaje NFS está activo: `mount | grep nfs`
	  - Para exportar los directorios definidos en el archivo `/etc/exports` en el servidor: `sudo exportfs -rav`
	  - Para comprobar qué directorios está exportando un servidor remoto antes de intentar montarlos: `showmount -e 192.168.1.10`

![[barra.gif]]

-  **Topología de red y departamentos típicos**

En una empresa como AnyCompany, un servidor NFS actúa tradicionalmente como un nodo central (o un cluster de alta disponibilidad, si tienen presupuesto). La topología suele ser una red local (LAN) plana o segmentada por VLANs donde el servidor NFS está en el núcleo (core) y los clientes se conectan a través del switch principal.

Los departamentos que suelen depender de este almacenamiento centralizado son:

- **Ingeniería y desarrollo:** Donde almacenan repositorios de código, librerías compartidas o compilaciones pesadas que requieren alta disponibilidad.
- **Contabilidad y finanzas:** Con acceso a directorios compartidos para hojas de cálculo, nóminas o informes financieros históricos.
- **Media y diseño:** Si la empresa genera contenido, aquí residen los activos gráficos o multimedia.
- **TI y operaciones:** Para guardar logs de servidores, imágenes de sistemas operativos (ISO) y scripts de automatización.

La problemática radica en que si este servidor central (o el almacenamiento subyacente, tipo SAN o NAS) falla, todo el flujo de trabajo de estos departamentos se detiene.

-  **Por qué preocupa la protección contra desastres**

La preocupación de la CIO no es solo el miedo a un borrado accidental, sino la continuidad del negocio. El problema es técnico y financiero:

- **RPO (Recovery Point Objective):** En un sistema on-premise sin replicación avanzada, el último backup pudo ser hace 24 horas. Si el servidor falla, pierdes un día de trabajo.
- **RTO (Recovery Time Objective):** Si el servidor físico muere, ¿Cuánto tiempo tarda el equipo en aprovisionar un nuevo hardware, configurar el almacenamiento, restaurar los datos desde cintas o discos externos y volver a montar los recursos? Probablemente días.
- **Replicación costosa:** Para tener una replicación real (casi síncrona), necesitas duplicar el hardware en un sitio remoto o en un centro de datos secundario, lo cual es prohibitivo para una empresa con presupuesto reducido.

-  **La realidad del balance cloud frente a on-premise**

"Reducir infraestructura física, costo y complejidad" es extremadamente difícil si intentas hacerlo todo de forma local. La premisa del caso es que **trasladas la carga de almacenamiento a la nube** para que el proveedor gestione la durabilidad y la disponibilidad, mientras que el almacenamiento local se convierte solo en una "caché" temporal.

No es que la nube sea mágica, es que cambia el CAPEX (inversión de capital en hardware) por OPEX (pago por uso) y transfiere la responsabilidad de la durabilidad (copias de seguridad, replicación entre regiones) del proveedor.
