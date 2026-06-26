
-  **Información general**

	> **AnyCompany** deposita una gran confianza en el uso de archivos compartidos del sistema de archivos de red (Network File System) para llevar a cabo su actividad comercial diaria. A la directora de información (Chief Information Officer) le preocupa que el servidor de archivos NFS en las instalaciones no tenga la protección correcta contra desastres. Además, cuenta con un presupuesto reducido. Prefiere utilizar el dinero en mejorar el negocio, en lugar de invertirlo en costosas soluciones de respaldo o replicación, que además requieren que el personal trabaje muchas horas para su implementación y mantenimiento. Se comunica con usted, que se dedica a la ingeniería en sistemas, para que proponga una solución que debe cumplir estos requisitos:
	
	- No requerir cambios en las aplicaciones existentes.
	- Reducir la infraestructura física, el costo y la complejidad.
	- Ofrecer una transferencia de datos segura y optimizada.
	- Otorgar acceso de baja latencia a los datos.
	
	Luego de una exhaustiva investigación, se decide por crear una prueba de concepto mediante AWS DataSync y una puerta de enlace de archivos de AWS Storage Gateway.
	
	DataSync cumple con muchos de los requisitos mencionados. El servicio posee estas características:
	
	- Se conecta a los sistemas de almacenamiento existentes a través de los protocolos NFS y SMB estándares del sector.
	- Solo se paga por los datos que copia el servicio a una tasa por gigabyte plana. No requiere licencias de software, contratos, tarifas de mantenimiento, ciclos de desarrollo ni hardware.
	- Garantiza la integridad de los datos. Para cada transferencia, el servicio realiza verificaciones de integridad en tránsito y en reposo. Mediante estas verificaciones se garantiza que los datos escritos en el destino coincidan con los datos leídos desde la fuente, lo que permite validar la coherencia.
	
	Una puerta de enlace de archivos de Storage Gateway proporciona una transferencia de datos continua hacia Amazon S3 y desde este. El servicio posee estas características:
	
	- Brinda una protección integral de los datos del cliente desde Storage Gateway en la red empresarial hasta los datos alojados en AWS.
	- Conserva una caché de los datos escritos o leídos recientemente para que las aplicaciones puedan tener acceso de baja latencia a los datos que se almacenan de forma duradera en AWS.
	
	La puerta de enlace de archivos actúa como un sistema de archivos montado en un bucket de S3. El recurso compartido de archivos NFS de la puerta de enlace de archivos reemplaza el servidor de archivos NFS en las instalaciones existentes, lo que permite retirar ese servidor. Este procedimiento libera los recursos locales y reduce el tiempo de mantenimiento.
	
	**Objetivos**
	
	Cuando finalice este laboratorio, podrá realizar lo siguiente:
	
	- Implementar y activar un agente de DataSync en una instancia de Amazon Elastic Compute Cloud (Amazon EC2).
	- Crear una tarea de DataSync para copiar datos desde un servidor NFS basado en Linux a un bucket de S3.
	- Implementar y activar un dispositivo de puerta de enlace de archivos de Storage Gateway como una instancia de EC2.
	- Crear un recurso compartido de archivos NFS en una puerta de enlace de archivos.
	- Configurar un host de Linux para conectarse a un recurso compartido de archivos NFS en una puerta de enlace de archivos.
	  
	**Explicaciones técnicas por capa**
	
	- **Capa de transferencia (DataSync)**: Gestiona la migración inicial de datos desde el entorno local hacia s3, garantizando la integridad mediante verificaciones en tránsito y reposo.
	- **Capa de acceso (Storage Gateway)**: Proporciona una interfaz nfs estándar para las aplicaciones, mientras almacena los datos de forma duradera en s3. La caché local reduce la latencia de acceso.
	- **Capa de almacenamiento (Amazon S3)**: Actúa como el repositorio centralizado y duradero, interoperable tanto con datasync como con storage gateway mediante metadatos de usuario para preservar permisos posix.
-  **Diferencias clave entre DataSync y Storage Gateway**

	Es fundamental entender que, aunque ambos mueven datos, cumplen roles operativos distintos en esta migración.
	
	**AWS DataSync**
	
	Se utiliza para la migración de datos o la sincronización masiva y periódica. Piensa en él como un camión de mudanza inteligente. No está diseñado para que los usuarios monten un directorio y trabajen sobre él diariamente.
	
	- **Caso de uso:** Mover los 10 TB de datos históricos desde el servidor NFS viejo hacia S3 para archivarlos o realizar una migración inicial.
	- **Comando CLI:** Para iniciar una tarea de transferencia de datos: `aws datasync start-task-execution --task-arn arn:aws:datasync:region:account:task/task-id`
    
	**AWS Storage Gateway (File Gateway)**
	
	Se utiliza para el acceso operativo diario. Se comporta como un servidor NFS, pero en lugar de escribir en un disco local, los datos viajan a S3. Mantiene una caché local (en disco SSD o HDD de la instancia EC2) con los archivos más usados.
	
	- **Caso de uso:** Reemplazar el servidor NFS. Los usuarios montan este gateway como si fuera su servidor de archivos habitual, pero el almacenamiento de fondo es S3.
	- **Comando CLI:** Para crear un recurso compartido de archivos en la gateway: `aws storagegateway create-nfs-file-share --gateway-arn arn:aws:storagegateway:region:account:gateway/sgw-12345 --client-list 10.0.0.0/24 --location-arn arn:aws:s3:::nombre-del-bucket`

![[migración-nfs-local-mediante-datasync-y-storage-gateway.svg]]

![[barra.gif]]

-  <strong style ="color:5d6d7e;">Conectarse al servidor NFS en las instalaciones</strong>

	**Propósito arquitectónico**: Establecer el entorno de prueba para la prueba de concepto (POC) mediante el uso de un servidor de archivos NFS de Linux y un cliente de Linux.
	
	**Pasos obligatorios**:
	
	-  Diríjase a **Elastic Compute Cloud**, acceda  y seleccione la instancia "**Client Linux**":
	
		- Haga clic en "**Conectar**" en la parte superior derecha.
		- Verifique que la pestaña "**EC2 Instance Connect**" esté seleccionada y elija "**Conectar**".
	-  Ejecute y reemplace `NFS_SERVER_PRIVATE_IP` con la Dirección IPv4 privada de instancia "**Server Linux**": **`sudo mount NFS_SERVER_PRIVATE_IP:/var/nfs /mnt/nfs`**
	-  Ejecute el siguiente comando para confirmar que el recurso se montó correctamente: **`df -h`**
	-  La instancia cliente contiene directorios con datos de muestra (`/data/DataSync/` y `/data/FileGateway/`). 
	-  Para copiar los datos del primer directorio al recurso NFS, ejecute: **`sudo cp /data/DataSync/*.* /mnt/nfs`**
	-  Regrese a la Consola de administración de AWS y abra una nueva sesión de EC2 Instance Connect para la instancia "Server Linux".
	-  En la sesión del servidor NFS, ejecute el siguiente comando para verificar que los archivos se transfirieron correctamente desde el cliente: **`ls /var/nfs`**
	
	**_Advertencia_**: No se desconecte de las sesiones activas; las retomará más adelante.
	
	**Validaciones de configuración**:
	
	- [x] La instancia de cliente tiene acceso al recurso compartido `/mnt/nfs`.
	- [x] El comando `ls /var/nfs` en la instancia servidor debe mostrar los archivos `1.png` a `10.png`.
-  <strong style ="color:5d6d7e;">Implementar y activar una instancia de agente en DataSync</strong>

	El agente de datasync actúa como el intermediario para la transferencia de datos. Se debe desplegar en la misma subred que el servidor nfs.
	
	**Pasos completos**:
	
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
	    - Agent address: Ingrese la dirección IPv4 pública de la instancia copiada en el paso 10.
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
	
	    - En la instancia **Server Linux**, modifique el archivo de exportaciones para permitir el tráfico desde el agente. **`sudo nano /etc/exports`**
	    - Añada al final del archivo: **`/var/nfs DATA_SYNC_AGENT_IP(rw,fsid=2,sync,no_subtree_check)`** (reemplace `DATA_SYNC_AGENT_IP` por la IP privada del agente) 
	    - Active la nueva configuración ejecutando: **`sudo exportfs -a`**
	-  **Configuración de la tarea en DataSync**:
	
	    - En la consola de DataSync, en el agente **NFS DataSync** navegue a **Tasks** y seleccione **Create task**.
	    - Seleccione **Create a new location**, tipo **Network File System (NFS)**. Seleccione el agente _NFS DataSync agent_, ingrese la IP del servidor NFS y la ruta de montaje **`/var/nfs`**.
		
			- En la sección **Source location options** (Opciones de ubicación de la fuente), elija **Create a new location** (Crear una ubicación nueva).
			- En la sección **Configuration** (Configuración), seleccione el menú desplegable **Location type** (Tipo de ubicación) y elija **Network File System (NFS)** (Sistema de archivos de red [NFS]).
	    - Seleccione **Create a new location**, tipo **Amazon S3**. Elija el bucket correspondiente (`S3BucketName`) y el rol de IAM `S3BucketAccessRole`.
		
			- En la sección **Destination location options** (Opciones de ubicación del destino), seleccione **Create a new location** (Crear una ubicación nueva).
			- En la sección **Configuration** (Configuración), seleccione **Location type** (Tipo de ubicación) y elija **Amazon S3**.
			- Continúe y seleccione lo siguiente:
			
				- Elija la **S3 URI** correspondiente al bucket.
				- Para el **rol de IAM**, elija `S3BucketAccessRole`.
	    - En la sección de registro, seleccione **No generar registros**.
	    - Revise la configuración y seleccione **Create task**.
	-  **Ejecución y Monitoreo**:
	
	    - Espere a que el estado de la tarea cambie a **Available**.
	    - Seleccione el menú **Start** y elija **Start with defaults**.
	    - En los detalles de la ejecución, espere a que el estado pase de _Launching_ a _Success_ (aproximadamente 3-4 minutos).
	-  **Verificación en Amazon S3**:
	
	    - En la consola de S3, acceda al bucket correspondiente.
	    - Verifique la presencia de los 10 archivos `.png` y el archivo de metadatos `aws-datasync-metadata`.
	
	**Configuraciones críticas**
	
	- **Archivo `/etc/exports`**: La configuración debe incluir `(rw,fsid=2,sync,no_subtree_check)` para asegurar la compatibilidad con DataSync.
	- **Metadatos**: DataSync conserva los permisos POSIX y marcas temporales en los metadatos de usuario de S3, lo cual es esencial para que la _File Gateway_ pueda operar correctamente después.
	
	**Validación final**
	
	- **Estado de la Tarea**: Debe confirmar el estado _Success_ en la consola de DataSync.
	- **Integridad**: Los archivos visualizados en el bucket de S3 deben coincidir con los archivos originales en el servidor NFS.
-  <strong style ="color:5d6d7e;">Implementar y activar una puerta de enlace de archivos (Storage Gateway)</strong>

	Esta tarea implementa el dispositivo de _Storage Gateway_ como una instancia EC2, actuando como un puente que proporciona acceso de baja latencia a los datos en Amazon S3 mediante el protocolo NFS, permitiendo la sustitución de servidores locales.
	
	-  **Creación de la puerta de enlace**:
	
	    - En la consola de _Storage Gateway_, seleccione **Crear puerta de enlace**.
	    - Nombre de la puerta de enlace: `File Gateway`.
	    - Zona horaria: `GMT -8:00 Hora del Pacífico (EE. UU. y Canadá)`.
	    - Tipo de puerta de enlace: `Puerta de enlace de archivo Amazon S3`.
	    - Plataforma de host: `Amazon EC2`.
	    - Seleccione **Personalizar la configuración** y luego **Iniciar instancia**.
	-  **Configuración de la instancia EC2**:
	
	    - En el asistente de lanzamiento de EC2:
	     
	        - Nombre: `File Gateway appliance`.
	        - Etiquetas: Seleccione `Volúmenes`, `Interfaces de red` e `Instancias`.
	        - Tipo de instancia: `t3.xlarge` (Obligatorio para el laboratorio).
	        - Par de claves: `Continuar sin un par de claves`.
	        - Configuración de red: VPC `Lab VPC`, Subred `Server Subnet`, IP pública `Habilitar`.
	        - Firewall (Grupos de seguridad): Seleccione `FileGatewayAccess`.
	    - En la sección **Configurar almacenamiento**:
	        - Seleccione **Avanzado** -> **Agregar volumen nuevo**.
	        - Nombre del dispositivo: `/dev/sdb`.
	        - Tamaño: `150 GiB`.
	        - Tipo de volumen: `General purpose SSD (gp2)`.
	        - Eliminar al terminar: `Sí`.
	    - Seleccione **Lanzar instancia**.
	-  **Activación del dispositivo**:
	    
	    - Espere a que la instancia tenga las comprobaciones de estado aprobadas (3/3).
	    - Copie la **Dirección IPv4 pública** de la instancia desde la consola de EC2.
	    - En la pestaña de _Storage Gateway_, confirme que ha completado los pasos y seleccione **Siguiente**.
	    - En **Conectar a AWS**:
	        
	        - Opciones de conexión: `Dirección de IP`.
	        - Dirección IP: Pegue la IP pública copiada.
	        - Punto de enlace de servicio: `De acceso público`.
	    - Seleccione **Activar puerta de enlace**.
	-  **Configuración final**:
	    
	    - En la sección **Configurar almacenamiento en caché**, seleccione `Caché` en el menú desplegable "Asignado a".
	    - En **Grupo de registros de CloudWatch**, seleccione `Desactivar registro`.
	    - En **CloudWatch alarms**, seleccione `No alarm`.
	    - Seleccione **Configurar**.
-  <strong style ="color:5d6d7e;">Crear un recurso compartido NFS en la puerta de enlace de archivos</strong>

	-  **Creación de la puerta de enlace**:
	
	    -  En la consola de _Storage Gateway_, seleccione **Crear puerta de enlace**.
	    -  Nombre de la puerta de enlace: `File Gateway`.
	    -  Zona horaria: `GMT -8:00 Hora del Pacífico (EE. UU. y Canadá)`.
	    -  Tipo de puerta de enlace: `Puerta de enlace de archivo Amazon S3`.
	    -  Plataforma de host: `Amazon EC2`.
	    -  Seleccione **Personalizar la configuración** y luego **Iniciar instancia**.
	-  **Configuración de la instancia EC2**:
	
	    -  En el asistente de lanzamiento de EC2:
		
	        - Nombre: `File Gateway appliance`.
	        - Etiquetas: Seleccione `Volúmenes`, `Interfaces de red` e `Instancias`.
	        - Tipo de instancia: `t3.xlarge` (Obligatorio para el laboratorio).
	        - Par de claves: `Continuar sin un par de claves`.
	        - Configuración de red: VPC `Lab VPC`, Subred `Server Subnet`, IP pública `Habilitar`.
	        - Firewall (Grupos de seguridad): Seleccione `FileGatewayAccess`.
	    -  En la sección **Configurar almacenamiento**:
		
	        - Seleccione **Avanzado** -> **Agregar volumen nuevo**.
	        - Nombre del dispositivo: `/dev/sdb`.
	        - Tamaño: `150 GiB`.
	        - Tipo de volumen: `General purpose SSD (gp2)`.
	        - Eliminar al terminar: `Sí`.
	    -  Seleccione **Lanzar instancia**.
	-  **Activación del dispositivo**:
	
	    -  Espere a que la instancia tenga las comprobaciones de estado aprobadas (3/3).
	    -  Copie la **Dirección IPv4 pública** de la instancia desde la consola de EC2.
	    -  En la pestaña de _Storage Gateway_, confirme que ha completado los pasos y seleccione **Siguiente**.
	    -  En **Conectar a AWS**:
		
	        - Opciones de conexión: `Dirección de IP`.
	        - Dirección IP: Pegue la IP pública copiada.
	        - Punto de enlace de servicio: `De acceso público`.
	    -  Seleccione **Activar puerta de enlace**.
	-  **Configuración final**:
	
	    -  En la sección **Configurar almacenamiento en caché**, seleccione `Caché` en el menú desplegable "Asignado a".
	    -  En **Grupo de registros de CloudWatch**, seleccione `Desactivar registro`.
	    -  En **CloudWatch alarms**, seleccione `No alarm`.
	    -  Seleccione **Configurar**.

![[migración-nfs-local-mediante-datasync-y-storage-gateway.webp]]

![[barra.gif]]

**Preguntas de profundización**

1. [ ] ¿Por qué es necesario modificar el archivo /etc/exports antes de ejecutar la tarea de datasync?
2. [ ] ¿Qué ocurre con los permisos posix de los archivos al ser almacenados en amazon s3 a través de estas herramientas?
3. [ ] ¿Cómo influye el tamaño de la caché asignada al gateway en el rendimiento de las aplicaciones cliente?
4. [ ] ¿Qué es POSIX?

	Cuando se copian archivos o carpetas a Amazon S3, hay una relación uno a uno entre el archivo o la carpeta y un objeto. Las marcas temporales de los metadatos del archivo y la carpeta, y los permisos POSIX, incluido el ID del usuario, el ID de grupo y los permisos, se almacenan en los metadatos del usuario de Amazon S3. Los metadatos del archivo almacenados en los metadatos del usuario de Amazon S3 son interoperables con una puerta de enlace de archivos, lo que proporciona acceso basado en el archivo en las instalaciones a los datos que DataSync almacena en Amazon S3.
	
	Cuando DataSync copia desde un servidor NFS, los permisos POSIX de los archivos y carpetas en la fuente se almacenan en los metadatos del usuario de Amazon S3. Cuando se copia desde un recurso compartido de archivos SMB, los permisos POSIX predeterminados se almacenan en los metadatos del usuario de Amazon S3.
	
	Cuando DataSync vuelve a copiar objetos que contienen estos metadatos del usuario a un servidor NFS, los metadatos del archivo se restauran. Cuando se vuelve a copiar a un recurso compartido de archivos SMB, la propiedad se configura en función del usuario configurado en DataSync para acceder a ese recurso compartido de archivos y se asignan permisos predeterminados.
5. [ ] Extraer infra subyacente