---
def-type: def-lab
version: 1
status: succeeded
category: implementación
date: 2026-07-02
id: lab-aws-nfs-storagegateway-datasync
contexto: amazon-web-service
aliases:
  - aws datasync y storage gateway poc
  - reemplazo de servidor nfs local
tags:
  - datasync
  - storage-gateway
  - nfs
  - migración
  - cloud-storage
---
-  **[Información general ](migración-nfs-local-mediante-datasync-y-storage-gateway-local.md)**

	**AnyCompany** deposita una gran confianza en el uso de archivos compartidos del sistema de archivos de red (Network File System) para llevar a cabo su actividad comercial diaria. A la directora de información (Chief Information Officer) le preocupa que el servidor de archivos NFS en las instalaciones no tenga la protección correcta contra desastres. Además, cuenta con un presupuesto reducido. Prefiere utilizar el dinero en mejorar el negocio, en lugar de invertirlo en costosas soluciones de respaldo o replicación, que además requieren que el personal trabaje muchas horas para su implementación y mantenimiento. Se comunica con usted, que se dedica a la ingeniería en sistemas, para que proponga una solución que debe cumplir estos requisitos:
	
	-  No requerir cambios en las aplicaciones existentes.
	-  Reducir la infraestructura física, el costo y la complejidad.
	-  Ofrecer una transferencia de datos segura y optimizada.
	-  Otorgar acceso de baja latencia a los datos.
	  
	Para solucionar los desafíos de AnyCompany, la estrategia técnica consiste en una arquitectura híbrida que separa la migración inicial del acceso operativo diario mediante dos servicios clave:
	
	**DataSync (Capa de migración)**
	
	Se utiliza para realizar la mudanza de datos desde el servidor NFS local hacia AWS.
	
	-  **Eficiencia:** Protocolo NFS/SMB estándar, sin necesidad de hardware adicional ni licencias.
	-  **Modelo de costo:** Pago por uso (tasa plana por GB transferido).
	-  **Integridad:** Verificación automatizada de datos en tránsito y reposo para garantizar la coherencia absoluta
	
	**Storage Gateway (Capa de acceso)**
	
	Actúa como reemplazo funcional del servidor NFS físico, conectando las aplicaciones locales con Amazon S3.
	
	-  **Baja latencia:** Utiliza una **caché local** para almacenar los datos de uso frecuente, permitiendo que las aplicaciones operen sin notar el salto a la nube.
	-  **Operatividad:** El gateway se monta como un sistema de archivos estándar, permitiendo retirar el hardware local, centralizar la gestión en S3 y reducir drásticamente los costes de mantenimiento.
	
	-  **Objetivos**
	
		Cuando finalice este laboratorio, podrá realizar lo siguiente:
		
		-  Implementar y activar un agente de DataSync en una instancia de Elastic Compute Cloud.
		-  Crear una DataSync para copiar datos desde un servidor NFS basado en Linux a un bucket de S3.
		-  Activar un dispositivo de puerta de enlace Storage Gateway como una instancia de EC2.
		-  Crear un recurso compartido de archivos NFS en una puerta de enlace de archivos.
		-  Configurar un host de Linux para compartir archivos NFS en una puerta de enlace de archivos.
	-  **Explicaciones técnicas por capa**
	
		**El problema:** Quieren mover todos sus papeles a un almacén centralizado y seguro (Amazon S3), pero los empleados de la oficina necesitan seguir trabajando como si tuvieran el archivo en el pasillo, sin cambiar su forma de trabajar. **La solución:**
		
		-  **DataSync (El Camión de Mudanza):**
			
			-  Su único trabajo es coger todas las cajas que hay en el archivo viejo y llevarlas al almacén nuevo (S3).
			-  Es inteligente: mientras carga las cajas, comprueba que nada se rompa y que lo que llega sea idéntico a lo que salió. Una vez que termina la mudanza, su trabajo acaba.
		-  **Storage Gateway (La "Ventana Mágica"):**
			
			-  Una vez que los datos están en el almacén (S3), ¿Cómo hacen los empleados para trabajar?
			-  Instalamos este dispositivo en la oficina. Para los empleados, **parece un servidor de archivos local de toda la vida**
			-  Cuando un empleado pide un archivo, el dispositivo lo busca en el almacén (S3). Si lo usa mucho, se lo queda guardado en su "memoria interna" (caché) para que la próxima vez sea ultra rápido.

---

![[migración-nfs-local-mediante-datasync-y-storage-gateway.svg]]

![[barra.gif]]

-  <strong style ="color:5d6d7e;">Conectarse al servidor NFS en las instalaciones</strong>

	**Propósito arquitectónico**: Establecer el entorno de prueba para la prueba de concepto (POC) mediante el uso de un servidor de archivos NFS de Linux y un cliente de Linux. **Pasos obligatorios**:
	
	-  Diríjase a **Elastic Compute Cloud**, acceda  y seleccione la instancia "**Client Linux**":
	
		- Haga clic en "**Conectar**" en la parte superior derecha.
		- Verifique que la pestaña "**EC2 Instance Connect**" esté seleccionada y elija "**Conectar**".
	-  Ejecute y reemplace **`NFS_SERVER_PRIVATE_IP`** con la Dirección IPv4 privada de instancia "**Server Linux**": **`sudo mount NFS_SERVER_PRIVATE_IP:/var/nfs /mnt/nfs`**
	-  Ejecuta y confirma que el recurso se montó correctamente: **`df -h`**
	-  La instancia cliente contiene directorios con datos de muestra (`/data/DataSync/` y `/data/FileGateway/`). 
	-  Para copiar los datos del primer directorio al recurso NFS, ejecute: **`sudo cp /data/DataSync/*.* /mnt/nfs`**
	-  Regrese a la Consola de administración de EC2 y abra una nueva sesión para la instancia "**Server Linux**".
	-  En la sesión del servidor NFS, ejecute el siguiente comando para verificar que los archivos se transfirieron correctamente desde el cliente: **`ls /var/nfs`**
	
	**_Advertencia_**: No se desconecte de las sesiones activas; las retomará más adelante.
	
	**Validaciones de configuración**:
	
	- [x] La instancia de cliente tiene acceso al recurso compartido `/mnt/nfs`.
	- [x] El comando `ls /var/nfs` en la instancia servidor debe mostrar los archivos `1.png` a `10.png`.
-  <strong style ="color:5d6d7e;">Implementar y activar una instancia de agente en DataSync</strong>

	El agente de datasync actúa como el intermediario para la transferencia de datos. Se debe desplegar en la misma subred que el servidor nfs. **Pasos completos**:
	
	-  En la consola de EC2, seleccione "**Lanzar instancia**".
	-  En la sección de nombres y etiquetas, ingrese el valor "**DataSync agent**".
	-  Seleccione "Agregar etiquetas adicionales", y en tipos de recursos elija "**Volúmenes**" e "**Interfaces de red**" (e "Instancias" si no está seleccionado).
	-  En la búsqueda de imágenes, escriba "**``aws-datasync``**", presione Enter, seleccione la pestaña "**``Community AMIs``**" y elija la versión más reciente.
	-  En tipo de instancia, seleccione **`t3.xlarge`** (obligatorio para este laboratorio).
	-  En el par de claves, elija "**Continuar sin un par de claves (no recomendado)**".
	-  **Configurar red**:
	
	    - En VPC, elija "**Lab VPC**".
	    - En Subred, elija "**Server Subnet**".
	    - En Asignar automáticamente IP pública, elija "**Habilitar**".
	    - En Firewall, seleccione un grupo de seguridad existente y elija "**DataSyncAccess**".
	-  Seleccione "**Lanzar instancia**" y luego "**Ver todas las instancias**".
	-  Espere a que la columna de comprobación de estado indique "3/3 comprobaciones aprobadas" (tiempo estimado de 5 minutos).
	- Seleccione la instancia **DataSync agent** (Agente de DataSync) y navegue a la pestaña **Details** (Detalles).
	-  En la pestaña de detalles de la instancia, copie la "**Dirección IPv4 pública**" y la "**Dirección IPv4 privada**" para usarlas posteriormente.
	-  Navegue a la consola de **AWS DataSync**, expanda el menú, seleccione "**Agentes**" y luego "**Create agent**".
	-  **Configurar agente**:
	
		- Origen "NFS" --> Destino "S3"
	    - Hipervisor: "**Amazon EC2**".
	    - Clave de activación: "**Automatically get the activation key from your agent**".
	    - Agent address: Ingrese la dirección IPv4 pública de la instancia copiada en la tarea anterior.
	    - Elija "**Get key**" para recuperar la clave.
	-  **Finalizar creación**: En la sección Agent name, ingrese "**NFS DataSync agent**" y seleccione "**Create agent**" en la parte inferior.
	
	**Configuraciones críticas**:
	
	-  **Tipo de instancia `t3.xlarge`**: Es la única configuración compatible con los requisitos del laboratorio.
	-  **Grupo de seguridad `DataSyncAccess`**:
	
		- Entrante: puerto 80 (HTTP) para la activación del agente
		- Saliente: puerto 443 para la comunicación con el servicio de AWS DataSync
		- Saliente: puerto 2049 para las comunicaciones del NFS v. 4.1 con la subred del servidor
-  <strong style ="color:5d6d7e;">Crear y ejecutar una tarea de DataSync</strong>

	Esta tarea establece el vínculo lógico entre el servidor NFS de origen y el bucket de S3 de destino, utilizando el agente de DataSync desplegado previamente como mediador para la migración de datos.
	
	-  **Preparación del servidor NFS**:
	
	    -  En la instancia **Server Linux**, modifique el archivo de exportaciones para permitir el tráfico desde el agente. **`sudo nano /etc/exports`**
	    -  Añada al final del archivo: **`/var/nfs DATA_SYNC_AGENT_IP(rw,fsid=2,sync,no_subtree_check)`** (reemplace `DATA_SYNC_AGENT_IP` por la IP privada del agente) 
	    -  Active la nueva configuración ejecutando: **`sudo exportfs -a`**
	-  **Configuración de la tarea en DataSync**:
	
	    -  En la consola de DataSync, en el agente **NFS DataSync** navegue a **Tasks** y seleccione **Create task**.
	    -  Seleccione **Create a new location**, tipo **Network File System (NFS)**. Seleccione el agente _NFS DataSync agent_, ingrese la IP del servidor NFS y la ruta de montaje **`/var/nfs`**.
		
			-  En la sección **Source location options** (Opciones de ubicación de la fuente), elija **Create a new location** (Crear una ubicación nueva).
			-  En la sección **Configuration** (Configuración), seleccione el menú desplegable **Location type** (Tipo de ubicación) y elija **Network File System (NFS)** (Sistema de archivos de red NFS).
	    -  Seleccione **Create a new location**, tipo **Amazon S3**. Elija el bucket correspondiente (`S3BucketName`) y el rol de IAM `S3BucketAccessRole`.
		
			-  En la sección **Destination location options** (Opciones de ubicación del destino), seleccione **Create a new location** (Crear una ubicación nueva).
			-  En la sección **Configuration** (Configuración), seleccione **Location type** (Tipo de ubicación) y elija **Amazon S3**.
			-  Continúe y seleccione lo siguiente:
			
				-  Elija la **S3 URI** correspondiente al bucket.
				-  Para el **rol de IAM**, elija `S3BucketAccessRole`.
	    -  En la sección de registro, seleccione **No generar registros**.
	    -  Revise la configuración y seleccione **Create task**.
	-  **Ejecución y monitoreo**:
	
	    -  Espere a que el estado de la tarea cambie a **Available**.
	    -  Seleccione el menú **Start** y elija **Start with defaults**.
	    -  En los detalles de la ejecución, espere a que el estado pase de _Launching_ a _Success_ (aproximadamente 3-4 minutos).
	-  **Verificación en Amazon S3**:
	
	    -  En la consola de S3, acceda al bucket correspondiente.
	    -  Verifique la presencia de los 10 archivos `.png` y el archivo de metadatos `aws-datasync-metadata`.
	
	**Configuraciones críticas**
	
	-  **Archivo `/etc/exports`**: La configuración debe incluir `(rw,fsid=2,sync,no_subtree_check)` para asegurar la compatibilidad con DataSync.
	-  **Metadatos**: DataSync conserva los permisos POSIX y marcas temporales en los metadatos de usuario de S3, lo cual es esencial para que la _File Gateway_ pueda operar correctamente después.
	
	**Validación final**
	
	-  **Estado de la Tarea**: Debe confirmar el estado _Success_ en la consola de DataSync.
	-  **Integridad**: Los archivos visualizados en el bucket de S3 deben coincidir con los archivos originales en el servidor NFS.
-  <strong style ="color:5d6d7e;">Implementar y activar una puerta de enlace de archivos (Storage Gateway)</strong>

	Esta tarea implementa el dispositivo de _Storage Gateway_ como una instancia EC2, actuando como un puente que proporciona acceso de baja latencia a los datos en Amazon S3 mediante el protocolo NFS, permitiendo la sustitución de servidores locales.
	
	-  **Creación de la puerta de enlace**:
	
	    -  En la consola de _Storage Gateway_, seleccione **Crear puerta de enlace**.
	    -  Nombre de la puerta de enlace: `File Gateway`.
	    -  Zona horaria: `GMT -8:00 Hora del Pacífico (EE. UU. y Canadá)`.
	    -  Tipo de puerta de enlace: `Puerta de enlace de archivo Amazon S3`.
	    -  Plataforma de host: `Amazon EC2`.
	    -  Seleccione **Personalizar la configuración** y luego **Iniciar instancia**.
	-  **Configuración de la instancia EC2**:
	
	    -  En el asistente de lanzamiento de EC2:
	     
	        -  Nombre: `File Gateway appliance`.
	        -  Etiquetas: Seleccione `Volúmenes`, `Interfaces de red` e `Instancias`.
	        -  Tipo de instancia: `t3.xlarge` (Obligatorio para el laboratorio).
	        -  Par de claves: `Continuar sin un par de claves`.
	        -  Configuración de red: VPC `Lab VPC`, Subred `Server Subnet`, IP pública `Habilitar`.
	        -  Firewall (Grupos de seguridad): Seleccione `FileGatewayAccess`.
	    -  En la sección **Configurar almacenamiento**:
	        -  Seleccione **Avanzado** -> **Agregar volumen nuevo**.
	        -  Nombre del dispositivo: `/dev/sdb`.
	        -  Tamaño: `150 GiB`.
	        -  Tipo de volumen: `General purpose SSD (gp2)`.
	        -  Eliminar al terminar: `Sí`.
	    -  Seleccione **Lanzar instancia**.
	-  **Activación del dispositivo**:
	    
	    -  Espere a que la instancia tenga las comprobaciones de estado aprobadas (3/3).
	    -  Copie la **Dirección IPv4 pública** de la instancia desde la consola de EC2.
	    -  En la pestaña de _Storage Gateway_, confirme que ha completado los pasos y seleccione **Siguiente**.
	    -  En **Conectar a AWS**:
	        
	        -  Opciones de conexión: `Dirección de IP`.
	        -  Dirección IP: Pegue la IP pública copiada.
	        -  Punto de enlace de servicio: `De acceso público`.
	    -  Seleccione **Activar puerta de enlace**.
	-  **Configuración final**:
	
	    -  La sección **Configurar almacenamiento en caché**, seleccione `Caché` en el menú desplegable "Asignado a".
	    -  En **Grupo de registros de CloudWatch**, seleccione `Desactivar registro`.
	    -  En **CloudWatch alarms**, seleccione `No alarm`.
	    -  Seleccione **Configurar**.

![[migración-nfs-local-mediante-datasync-y-storage-gateway.webp]]

![[barra.gif]]

**Preguntas de profundización**

- [x]  **¿Qué es cada máquina en la "vida real"?**

	-  **La máquina "Client" (Realidad):** Es la **Workstation del empleado** o una **App Server** de la empresa. Es el equipo que necesita usar los archivos, editar documentos o leer logs. No tiene los datos en su propio disco duro, sino que se "conecta" al servidor central para pedirlos.
	-  **La máquina "Server" (Realidad):** Es el **Servidor NFS físico** que está guardado en el rack del cuarto de servidores de la empresa. Ese equipo tiene el disco duro (el almacenamiento) donde residen los datos físicamente.
	
	Cuando ejecutas `sudo mount NFS_SERVER_PRIVATE_IP:/var/nfs /mnt/nfs`, **no estás enviando datos todavía**. Estás creando un **"tubo" de red**.
	
	-  **Lado del Servidor (Server):** El servidor tiene una carpeta llamada `/var/nfs`. Él "publica" o "exporta" esa carpeta diciendo: _"Cualquiera que tenga permiso, puede conectarse a mi carpeta /var/nfs"_.
	-  **Lado del Cliente (Client):** Tú le dices a tu cliente: _"Todo lo que yo guarde en mi carpeta local `/mnt/nfs`, envíalo a través de la red hacia el servidor"_.
	
	**Respuesta a tu duda:** El `mount` **no es bidireccional en el sentido de sincronización**; es una **conexión de red**. Una vez montado, el sistema operativo del cliente hace que la carpeta remota del servidor parezca una carpeta local más.
	
	-  **¿Por qué se transfieren los datos con un simple `cp`?**
	
		Aquí está la magia (y la confusión) que mencionas. Cuando haces `sudo cp /data/DataSync/*.* /mnt/nfs`:
		
		1. El comando `cp` (copy) lee el archivo desde el disco local del cliente (`/data/DataSync/`).
		2. Al escribirlo en `/mnt/nfs`, el sistema operativo detecta que esa carpeta no es un disco físico, sino un **montaje de red (NFS)**.
		3. El sistema operativo **"empaqueta"** ese archivo y lo envía por la red hacia la IP del servidor.
		4. El servidor recibe esos paquetes y los guarda en su disco duro real (`/var/nfs`).
		
		**Por eso**, cuando te conectas después al servidor y haces `ls /var/nfs`, **los archivos están ahí**. No necesitas hacer SSH ni conexiones especiales; el protocolo NFS se encarga de que todo lo que escribas en `/mnt/nfs` (el túnel) aparezca mágicamente en `/var/nfs` (el disco del servidor).
	-  **Agentes DataSync**
	
		-  **Etiquetas y costos (Cost Allocation Tags)**
		
			En AWS, las etiquetas son metadatos clave-valor que permiten:
			
			1.  **Organización:** Identificar rápidamente qué recursos pertenecen a este laboratorio (ej. `Project: Lab-NFS-Migration`).
			2.  **Gestión de costos:** Si el laboratorio fuera una factura real, podrías filtrar exactamente cuánto costó este ejercicio.
			3.  **Control de acceso:** Puedes crear políticas de IAM para que solo los usuarios autorizados puedan modificar o eliminar recursos que tengan una etiqueta específica.
			
			-  Para que esto funcione, debes ir a la consola de **AWS Billing and Cost Management** y activar las etiquetas que has creado como **"Cost Allocation Tags"**.
			-  Una vez activadas, podrás usar el **AWS Cost Explorer** para filtrar, agrupar y visualizar exactamente cuánto consumió cada laboratorio.
			-  Es la forma estándar de convertir la infraestructura técnica en una unidad de negocio con valor monetario.
		-  **¿Por qué se elige el hipervisor?**
		
			DataSync necesita un "agente" que esté físicamente cerca de tus datos para poder leerlos y enviarlos a la nube.
			
			-  **Rol del agente:** La instancia que lanzaste **no es el servicio DataSync**, es un **Agente de DataSync** (un traductor).
			-  **Hipervisor:** Se elige EC2 porque tu servidor NFS está corriendo en una instancia EC2 dentro de la misma VPC. El agente vive en esa misma red, actúa como un "puente" que lee los archivos del servidor local (NFS), los comprime, los cifra y los envía a S3.
			
				**¿Qué ocurre si el origen es "On-Premise"?**
				
				Si tus datos no estuvieran en una EC2, sino en un servidor físico en tu propia oficina (on-premise), la arquitectura cambia ligeramente, pero mantiene su esencia:
				
				-  **Agente como máquina virtual:** En un entorno on-premise, no lanzas una instancia EC2. En su lugar, descargas la imagen del **Agente de DataSync** (disponible en formato VMware ESXi, Microsoft Hyper-V, o KVM) y lo ejecutas como una máquina virtual dentro de tu propio hardware.
				-  **Conectividad:** El agente, viviendo en tu centro de datos local, se conecta a tu almacenamiento NFS/SMB local y establece una conexión segura (vía internet o AWS Direct Connect) con el endpoint de DataSync en la nube.
				-  **Transparencia:** Para el servicio de AWS, el funcionamiento es idéntico. DataSync no sabe (ni le importa) si el agente está corriendo en una EC2 o en un servidor físico bajo tu escritorio; solo le importa que el agente esté "activo" y pueda ver los datos.
		-  **¿Por qué esa instancia "nueva" es necesaria?**
		
			El servicio DataSync de AWS es un servicio administrado, pero para que pueda "ver" tu servidor NFS privado, necesita un intermediario.
			
			-  Sin esta instancia de agente, DataSync no tendría forma de entrar en tu VPC privada para leer el disco del servidor NFS.
			-  La instancia actúa como un **Gateway de transporte**: Tú le das la IP privada del servidor NFS al agente, y el agente se encarga de "extraer" la información y subirla a S3.
			
			**El grupo de seguridad `DataSyncAccess`**
			
			Es correcto que todas las máquinas estén en este grupo para que puedan hablar entre sí. Aquí está el porqué de cada puerto:
			
			-  **Puerto 80 (HTTP):** Se utiliza únicamente para la **activación inicial** del agente. Tu consola de AWS se conecta al agente para que este pueda registrarse en tu cuenta de AWS.
			-  **Puerto 443 (HTTPS):** Es el puerto de **control y datos**. El agente necesita hablar con los endpoints de AWS para enviar los archivos a S3 y reportar el estado de la tarea.
			-  **Puerto 2049 (NFS):** Este es el puerto vital. Es el protocolo que el agente usa para conectarse al servidor NFS y poder leer tus archivos (`/var/nfs`). Sin este puerto abierto, el agente no tendría permiso de red para acceder al disco del servidor.
		-  **¿Es "todo" lo que está en el servidor lo que se sube?**
		
			No necesariamente. Al configurar la tarea, tú defines la "ruta de origen".
			
			- Si configuras la ruta como `/var/nfs`, el agente copiará todo lo que esté ahí.
			- DataSync es inteligente: si vuelves a ejecutar la tarea, solo copiará los archivos que hayan cambiado, ahorrando ancho de banda y tiempo.
		-  **Configuración de la tarea en DataSync**
		
			Al crear la tarea (Task), estás definiendo el puente lógico entre el origen y el destino. Ten en cuenta estos tres puntos críticos para que la ejecución no falle:
			
			1. **Conectividad de red:** Recuerda que tu DataSync Agent es quien "habla" con el servidor NFS. Verifica que el Security Group del servidor NFS permita tráfico entrante en el puerto 2049 desde la IP privada del DataSync Agent.
			2. **Ubicaciones (Locations):**
			
			    - **Ubicación de origen:** Aquí seleccionas el tipo "NFS". El campo "NFS Server" debe ser la IP privada de tu instancia Server. La "Mount path" es `/var/nfs`.
			    - **Ubicación de destino:** Aquí seleccionas "S3 bucket". AWS te pedirá un rol de IAM que DataSync asumirá para escribir en ese bucket. Asegúrate de que dicho rol tenga permisos de `s3:PutObject` y `s3:ListBucket`.
			3. **Configuración de la tarea:**
			
			    - Al configurar la tarea, verás una opción llamada "Verify data". Te recomiendo dejarla marcada; DataSync calculará el checksum de cada archivo transferido para garantizar que lo que está en S3 es bit a bit idéntico a lo que está en tu NFS.
			
			**Consejo de arquitecto:** Cuando lances la tarea, monitorea los primeros minutos en la pestaña "History" dentro de la consola de DataSync. Si el estado cambia rápidamente a "Launching" y luego a "Transferring", la comunicación entre el Agente y el Servidor NFS es correcta. Si se queda en "Launching" por mucho tiempo, suele ser un problema de permisos del Security Group bloqueando el puerto 2049.
		-  **¿Virtualizar el Software o "Dejarlo a la nube"?**
		
			**Si tus datos viven on-premises, el software (agente o gateway) DEBE vivir on-premises.**
			
			No puedes "dejarlo en la nube" por una razón fundamental de **latencia y protocolo**:
			
			-  **Storage Gateway / DataSync:** Su trabajo es realizar la conversión de protocolos (de NFS/SMB a API de S3 o EBS) y gestionar el caché localmente. Si el software estuviera en la nube y el almacenamiento estuviera en tu oficina, tendrías que enviar cada petición de lectura/escritura a través de la red (WAN) para que el gateway la procese, lo cual es ineficiente y lento.
			-  **El componente local:** Tanto para DataSync como para Storage Gateway, el "agente" o "dispositivo" es un **Virtual Appliance** que debes ejecutar en tu infraestructura (VMware, Hyper-V o KVM). Su función es estar lo más cerca posible de los datos (en la misma red local) para que la transferencia hacia AWS sea optimizada, comprimida y cifrada.
		-  **Arquitectura de red con Direct Connect (DX)**
		
			**Conectividad**
			
			-  **Direct Connect (DX):** No lo conectas a un ISP convencional, sino que contratas un **AWS Direct Connect Location** (a menudo a través de un Partner de AWS). La conexión física va de tu centro de datos a una ubicación de AWS; ahí es donde se establece la fibra.
			-  **DX Gateway (DXGW):** Es el componente más importante para escalabilidad. Te permite conectar tu red on-premises a múltiples VPCs en diferentes regiones de AWS.
			    
			**Routing y disponibilidad**
			
			-  **BGP (Border Gateway Protocol):** Es el estándar. AWS y tu router on-premises hablarán BGP para intercambiar rutas. Tú anuncias tus redes locales a AWS, y AWS te anuncia las rutas de tus VPCs (o la red global).
			-  **Propagación de rutas:** En la tabla de enrutamiento de tu VPC, habilitas la **propagación de rutas**. Esto hace que AWS actualice automáticamente la tabla cuando detecta nuevas redes a través de la conexión DX.
		-  **Seguridad y auditoría (El "Cómo audito")**
		
			-  **Seguridad (Defensa en profundidad):**
			
			    -  **NACLs (Network ACLs):** Capa de seguridad a nivel de subred (stateless). Úsalas para bloquear rangos IP o protocolos completos desde la oficina.
			    -  **Security Groups:** Capa de seguridad a nivel de instancia (stateful). Aquí es donde defines "quién habla con qué".
			-  **Auditoría (El "qué pasó"):**
			
			    -  **VPC Flow Logs:** Esto es obligatorio para auditar. Capturan el tráfico IP que entra y sale de las interfaces de red en tu VPC. Podrás ver si el tráfico de la oficina está intentando acceder a puertos no permitidos.
			    -  **CloudTrail:** Audita quién hizo qué. Si alguien cambió la ruta del Direct Connect o modificó una regla de seguridad, quedará registrado aquí.
			-  **Políticas y roles (IAM):**
			
			    -  Los roles son para los _servicios_. Por ejemplo, el agente de DataSync necesita un rol de IAM para poder escribir en tu bucket de S3.
			    -  Las políticas (IAM Policies) aseguran el principio de **privilegio mínimo**.
	-  **POSIX**
	  
		-  **POSIX (Authorization):** Es el **"qué"**. Define quién puede leer, escribir o ejecutar un archivo específico basándose en el propietario y el grupo (UID/GID). Es inherente al sistema de archivos (está escrito en el inodo del disco).
		-  **Entra ID / AD (Authentication):** Es el **"quién"**. Es el sistema que verifica tu identidad cuando haces login.
		
		Cuando accedes a un archivo NFS, primero te **autenticas** (probablemente contra un AD o LDAP) y luego el sistema operativo comprueba los bits **POSIX** del archivo para **autorizar** la acción.
		
		**¿Cómo lo hace DataSync? (La magia de los metadatos)**
		
		S3, por naturaleza, **no es un sistema de archivos POSIX**. Es un almacén de objetos planos. Si subes un archivo a S3 tal cual, pierdes los permisos (el dueño, el grupo y los bits rwx).
		
		Aquí es donde entra la configuración de **DataSync (Metadata Preservation)**:
		
		-  Cuando DataSync copia el archivo a S3, no solo copia los datos (el contenido), sino que toma los atributos POSIX (UID, GID, permisos) y los guarda como **Metadatos del Objeto en S3** (específicamente como `x-amz-meta-*`).
		-  Básicamente, "empaqueta" los permisos dentro del objeto en S3. El archivo en S3 ahora tiene una "etiqueta oculta" que dice: _"Yo originalmente pertenecía al usuario con ID 1001 y grupo 1001, y tenía permisos 644"_.
		
		**El papel del Storage Gateway (La traducción)**
		
		Aquí es donde se cierra el círculo. Cuando el **Storage Gateway (File Gateway)** lee ese objeto desde S3:
		
		1. Ve que el objeto tiene esos metadatos especiales.
		2. El Gateway, que está emulando un sistema de archivos NFS/SMB, **"traduce"** esos metadatos de S3 de vuelta a atributos del sistema de archivos.
		3. Cuando tu usuario (el cliente) hace un `ls -l` o intenta abrir el archivo, el Gateway le presenta esos permisos como si fueran archivos reales en un disco local.
		    
		**¿Qué pasa con los usuarios?** Para que esto funcione en la vida real, necesitas un componente adicional: **el mapeo de identidades**. El Storage Gateway debe estar integrado con tu directorio (Active Directory o LDAP) para que pueda decir: _"El archivo dice que pertenece al UID 1001; en mi directorio, el UID 1001 es 'Juan Sebastian'"_.
	
	---
	
	1. [ ] ¿Por qué es necesario modificar el archivo /etc/exports antes de ejecutar la tarea de datasync?
	
		El protocolo NFS (Network File System) requiere explícitamente que el servidor autorice el acceso a directorios específicos a través de una lista de control de acceso basada en IPs (o subredes) en el archivo `/etc/exports`. Al añadir la IP privada del agente de DataSync con permisos de lectura/escritura (`rw`), estás autorizando al agente a montar el sistema de archivos del servidor NFS para leer los datos que debe transferir. Sin este paso, el agente carece de permisos de nivel de red y sistema de archivos para acceder al origen.
	2. [ ] ¿Qué ocurre con los permisos posix de los archivos al ser almacenados en s3 a través de estas herramientas?
	
		Aunque Amazon S3 es un almacenamiento de objetos y no tiene una estructura de archivos nativa que soporte POSIX, DataSync resuelve esto mediante **metadatos de usuario**. Los atributos POSIX (UID, GID, permisos de archivo, marcas temporales) se extraen del servidor NFS y se escriben en los metadatos del objeto S3. Esta información es persistente y, crucialmente, **interoperable** con Storage Gateway. Cuando el Gateway lee el objeto desde S3, reconstruye estos metadatos para presentarlos al cliente NFS, manteniendo la integridad del sistema de archivos original.
	3. [ ] ¿Cómo influye el tamaño de la caché asignada al gateway en el rendimiento de las aplicaciones cliente?
	
		La File Gateway opera bajo un modelo _cache-first_. El tamaño de la caché determina cuántos datos de uso frecuente ("working set") pueden mantenerse localmente en el almacenamiento SSD (local) de la instancia.
		
		-  **Si la caché es pequeña:** Se producen frecuentes "cache misses", obligando al gateway a realizar llamadas a S3 para cada lectura, lo que incrementa la latencia (dependiendo del ancho de banda hacia AWS).
		-  **Si la caché es adecuada:** Las aplicaciones leen y escriben a velocidades cercanas a las locales, ya que los archivos frecuentes residen en el volumen SSD del gateway, mientras que S3 actúa como el repositorio de durabilidad (capa asíncrona de persistencia).