
Esta plantilla crea un sitio web de WordPress y su base de datos MySQL en una instancia de contenedor de una red virtual. El contenido del sitio de WordPress y la base de datos MySQL se almacenan de forma persistente en un recurso compartido de archivos de Azure Storage. También crea una puerta de enlace de aplicaciones con una instancia de contenedor de WordPress como servidor backend. La puerta de enlace de aplicaciones expone el acceso público a la red del sitio de WordPress en la red virtual.

Los siguientes recursos se implementan como parte de la solución:

+ **``Instancia de contenedor de Azure``**: Instancia de contenedor de Azure para alojar el sitio de WordPress.
+ **``Instancia de contenedor de Azure``**: Instancia de contenedor de Azure para alojar la base de datos MySQL.
+ **``Instancia de contenedor de Azure``**: Una instancia de contenedor de Azure de una sola ejecución de directiva "**Never**".
+ **``Cuenta de almacenamiento``**: Cuenta de almacenamiento para los recursos compartidos de archivos que almacenan el contenido del sitio de WordPress y la base de datos MySQL.
+ **``Recurso compartido de archivos``**: Recursos compartidos de archivos de Azure para almacenar el contenido del sitio de WordPress y la base de datos MySQL.
+ **``Puerta de enlace de aplicaciones``**: Puerta de enlace de aplicaciones para el sitio de WordPress. Expone el acceso de red pública al sitio de WordPress en la red virtual.
+ **``Red virtual``**: Red virtual para el sitio de WordPress, la base de datos MySQL y la puerta de enlace de aplicaciones.

![[barra.gif]]

-  **Componentes ARM template**

	**`azuredeploy.json`**: Este es el archivo central, conocido como plantilla ARM (Azure Resource Manager). Es un archivo JSON que define de manera declarativa todos los recursos que quieres crear en Azure. En lugar de crear recursos manualmente uno por uno a través del portal de Azure, los describes en este archivo.
	
	-  **Componentes clave**:
	
		- ``$schema``: Especifica la versión del lenguaje de la plantilla. Ayuda a los editores de código a ofrecer autocompletado
		- ``parameters``: Define las entradas que se pueden proporcionar al desplegar la plantilla (ej: ``vnetName``, ``mysqlPassword``). Esto hace que la plantilla sea reutilizable y personalizable.
		- ``variables``: Contiene valores que se usan repetidamente dentro de la plantilla. Ayuda a mantener la consistencia y a simplificar la lectura (ej: ``storageAccountName``).
		- ``resources``: Esta es la sección principal. Es una lista de todos los recursos de Azure que se van a desplegar. Tu plantilla está creando una red virtual (``VNet``), cuentas de almacenamiento, instancias de contenedor para WordPress y ``MySQL``, y un ``Application Gateway`` para exponer el sitio al público.
		- ``outputs``: Define los valores que se devolverán una vez que el despliegue haya finalizado (ej: la URL pública de tu nuevo sitio de WordPress).
	
	**`azuredeploy.parameters.json`**: Este archivo proporciona los valores para los parámetros definidos en azuredeploy.json
	
	-  **``Ventaja``**: Separar los parámetros del diseño de la infraestructura te permite usar la misma plantilla (azuredeploy.json) en diferentes entornos (desarrollo, pruebas, producción) simplemente cambiando el archivo de parámetros. En tu caso, este archivo se usa para establecer la contraseña de la base de datos MySQL. El valor "``GEN-PASSWORD``" es una indicación de que se debe generar una contraseña segura en el momento del despliegue.
	
	**`metadata.json` (Información descriptiva)**: Este archivo contiene metadatos sobre la plantilla. No afecta a la infraestructura, pero es crucial para catalogar y entender la plantilla.
	
	-  **``Contenido``**: Describe para qué sirve la plantilla (``itemDisplayName``, ``description``), quién la creó (``githubUsername``), y cuándo se actualizó. El portal de plantillas de inicio rápido de Azure utiliza este archivo para mostrar tu plantilla en la galería pública.
-  **Componentes Terraform**

	Esta configuración de Terraform despliega un sitio de WordPress con base de datos MySQL en Azure Container Instances (ACI) dentro de una red virtual, con un Application Gateway para el acceso público.
	
	-  **Arquitectura**
	
		La solución despliega los siguientes recursos:
	
		-  **Virtual Network** con dos subnets:
		
			- Subnet para Container Instances (delegada)
			- Subnet para Application Gateway
		-  **Storage Account** con Azure File Shares para:
		
			- Almacenamiento persistente de WordPress
			- Almacenamiento persistente de MySQL
		-  **Container instances**:
	
			- MySQL 5.6 (privado, en VNet)
			- WordPress 4.9 Apache (privado, en VNet)
		-  **Application Gateway** v2 con IP pública
		-  **Public IP** con DNS label
	-  **Diferencias con la plantilla ARM original**
	
		-  **SKU del Application Gateway**: Actualizado de `Standard_Medium` a `Standard_v2` para usar la versión más moderna
		-  **Public IP**: Cambiado de asignación dinámica a estática (requerido por Application Gateway v2)
		-  **Storage Account**: Simplificada la generación del nombre único
		-  **Eliminado el contenedor de inicialización**: En Terraform, los Azure File Shares se crean directamente sin necesidad de un contenedor temporal
		-  **Priority en routing rules**: Agregado el parámetro `priority` requerido en versiones recientes
	-  **Mantenido de la plantilla original**
	
		- Misma topología de red
		- Mismos rangos de direcciones IP
		- Mismas versiones de contenedores
		- Misma configuración de volúmenes y montajes
	-  **Requisitos previos**
	
		1. **Azure CLI** instalado y configurado
		2. **Terraform** >= 1.0 instalado
		3. **Resource Group** existente en Azure
		4. Credenciales de Azure configuradas (az login)
-  **Guía de implementación: manual de WordPress en azure container instances**

    -  **Creación del grupo de recursos**
	
        - Busca "Grupos de recursos" y haz clic en "Crear".
        - **``Suscripción``**: Selecciona tu suscripción.
        - **``Grupo de recursos``**: `rg-wordpresscontainers`
        - **``Región``**: `Spain Central`
        - Haz clic en "Revisar + crear" y luego en "Crear".
    -  **Creación de la red virtual y subredes**
	
        - Ve al grupo de recursos `rg-wordpresscontainers`.
        - Busca "Redes virtuales" y haz clic en "Crear".
        - **``Suscripción``**: Selecciona tu suscripción.
        - **``Grupo de recursos``**: `rg-wordpresscontainers`
        - **``Nombre``**: `aci-vnet`
        - **``Región``**: `Spain Central`
        - **``Espacio de direcciones IP``**: `10.0.0.0/16`
        - **``Subredes``**:
	     
            - **``Nombre``**: `aci-subnet`
            - **``Rango de direcciones``**: `10.0.0.0/24`
            - **``Delegación de subred``**: Agrega una delegación para `Microsoft.ContainerInstance/containerGroups`
            - **``Puntos de conexión de servicio``**: Agrega `Microsoft.Storage`.
            - **``Nombre``**: `ag-subnet`
            - **``Rango de direcciones``**: `10.0.1.0/24`
        - Haz clic en "Revisar + crear" y luego en "Crear".
    -  **Creación de la cuenta de almacenamiento y compartidos de archivos**
	
        - Ve al Grupo de Recursos `rg-wordpresscontainers`.
        - Busca "Cuentas de almacenamiento" y haz clic en "Crear".
        - **``Suscripción``**: Selecciona tu suscripción.
        - **``Grupo de recursos``**: `rg-wordpresscontainers`
        - **``Nombre de la cuenta de almacenamiento``**: `rgwordpresscontainerssub` (debe ser globalmente único)
        - **``Región``**: `Spain Central`
        - **``Rendimiento``**: Estándar
        - **``Tipo de cuenta``**: StorageV2 (uso general v2)
        - **``Redundancia``**: LRS (Almacenamiento con redundancia local)
        - Haz clic en "Revisar + crear" y luego en "Crear".
        - Una vez creada la cuenta de almacenamiento, ve a ella.
        - En "Almacenamiento de datos", haz clic en "Recursos compartidos de archivos".
        - Haz clic en "+ Recurso compartido de archivos" y crea dos recursos compartidos:
	     
            - **``Nombre``**: `mysql-share`
            - **``Cuota``**: 5 GiB
            - **``Nombre``**: `wordpress-share`
            - **``Cuota``**: 5 GiB
    -  **Despliegue de azure container instances (ACI) para MySQL**
	
        - Ve al Grupo de Recursos `rg-wordpresscontainers`.
        - Busca "Instancias de contenedor" y haz clic en "Crear".
        - **``Pestaña Conceptos básicos``**:
	     
            - **``Grupo de recursos``**: `rg-wordpresscontainers`
            - **``Nombre del grupo de contenedores``**: `mysql-containerinstance`
            - **``Región``**: `Spain Central`
            - **``Tipo de imagen``**: `Público`
            - **``Imagen``**: `mysql:5.6`
            - **``Tamaño``**: 1 CPU, 1.5 GB de memoria
            - **``Directiva de reinicio``**: `Siempre`
        - **``Pestaña Redes``**:
	     
            - **``Tipo de dirección IP``**: `Privada`
            - **``Red virtual``**: `aci-vnet`
            - **``Subred``**: `aci-subnet`
        - **``Pestaña Avanzado``**:
            - **``Variables de entorno``**:
                - **``Nombre``**: `MYSQL_ROOT_PASSWORD`
                - **``Valor``**: `TuContraseñaSeguraParaMySQL` (¡Cámbiala por una contraseña fuerte!)
        - **``Pestaña Almacenamiento``**:
	     
            - Haz clic en "+ Agregar".
            - **``Nombre``**: `mysqlfile`
            - **``Tipo de volumen``**: `Recurso compartido de archivos de Azure`
            - **``Cuenta de almacenamiento``**: `rgwordpresscontainerssub`
            - **``Nombre del recurso compartido``**: `mysql-share`
            - **``Ruta de montaje``**: `/var/lib/mysql`
        - Haz clic en "Revisar + crear" y luego en "Crear".
	-  **``5. Despliegue de azure container instances (ACI) para WordPress``**
	
        - Ve al Grupo de Recursos `rg-wordpresscontainers`.
        - Busca "Instancias de contenedor" y haz clic en "Crear".
        - **``Pestaña Conceptos básicos``**:
	     
            - **``Grupo de recursos``**: `rg-wordpresscontainers`
            - **``Nombre del grupo de contenedores``**: `wordpress-containerinstance`
            - **``Región``**: `Spain Central`
            - **``Tipo de imagen``**: `Público`
            - **``Imagen``**: `wordpress:4.9-apache`
            - **``Tamaño``**: 1 CPU, 1.5 GB de memoria
            - **``Directiva de reinicio``**: `Siempre`
        - **``Pestaña Redes``**:
	     
            - **``Tipo de dirección IP``**: `Privada`
            - **``Red virtual``**: `aci-vnet`
            - **``Subred``**: `aci-subnet`
            - **``Puertos``**: Abre el puerto 80 (TCP).
        - **``Pestaña Avanzado``**:
	     
            - **``Variables de entorno``**:
	          
                - **``Nombre``**: `WORDPRESS_DB_HOST`
                - **``Valor``**: La IP privada de tu instancia de MySQL (la obtendrás una vez que el contenedor de MySQL esté en ejecución).
                - **``Nombre``**: `WORDPRESS_DB_PASSWORD`
                - **``Valor``**: `TuContraseñaSeguraParaMySQL` (la misma que usaste para MySQL).
                - **``Nombre``**: `WORDPRESS_DB_USER`
                - **``Valor``**: `root`
                - **``Nombre``**: `WORDPRESS_DB_NAME`
                - **``Valor``**: `wordpress`
        - **``Pestaña Almacenamiento``**:
	     
            - Haz clic en "+ Agregar".
            - **``Nombre``**: `wordpressfile`
            - **``Tipo de volumen``**: `Recurso compartido de archivos de Azure`
            - **``Cuenta de almacenamiento``**: `rgwordpresscontainerssub`
            - **``Nombre del recurso compartido``**: `wordpress-share`
            - **``Ruta de montaje``**: `/var/www/html`
        - Haz clic en "Revisar + crear" y luego en "Crear".
        - **``Importante``**: Una vez que el contenedor de MySQL esté en ejecución, ve a su página de "Información general" para obtener su "Dirección IP privada". Edita el grupo de contenedores de WordPress para actualizar la variable de entorno `WORDPRESS_DB_HOST` con esta IP.
	-  **``6. Configuración de azure application gateway``**
	
        - Ve al Grupo de Recursos `rg-wordpresscontainers`.
        - Busca "Application Gateways" y haz clic en "Crear".
        - **``Pestaña Conceptos básicos``**:
	     
            - **``Grupo de recursos``**: `rg-wordpresscontainers`
            - **``Nombre de la puerta de enlace de aplicación``**: `applicationGateway1`
            - **``Región``**: `Spain Central`
            - **``Nivel``**: `Estándar v2`
            - **``Recuento de instancias``**: 2
        - **``Pestaña Frontends``**:
	     
            - **``Tipo de dirección IP de frontend``**: `Pública`
            - **``Dirección IP pública``**: Haz clic en "Agregar nuevo" y crea una nueva IP pública:
                - **``Nombre``**: `publicIp1`
                - **``Etiqueta de nombre de dominio DNS``**: `acisite6369d9ccb6a8a` (o un nombre único de tu elección)
        - **``Pestaña Backends``**:
	     
            - Haz clic en "Agregar un grupo de back-end".
            - **``Nombre del grupo de back-end``**: `appGatewayBackendPool`
            - **``Tipo de destino``**: `Dirección IP`
            - **``Destino``**: La IP privada de tu instancia de contenedor de WordPress (la obtendrás una vez que el contenedor de WordPress esté en ejecución).
        - **``Pestaña Configuración``**:
	     
            - **``Reglas de enrutamiento``**:
	          
                - Haz clic en "Agregar una regla de enrutamiento".
                - **``Nombre de la regla``**: `rule1`
                - **``Prioridad``**: 100
                - **``Oído``**:
	               
                    - **``Nombre del oído``**: `appGatewayHttpListener`
                    - **``Tipo de frontend``**: `Público`
                    - **``Puerto de frontend``**: `80`
                    - **``Protocolo``**: `HTTP`
                - **``Destino de back-end``**:
	               
                    - **``Tipo de destino``**: `Grupo de back-end`
                    - **``Grupo de back-end``**: `appGatewayBackendPool`
                    - **``Configuración de HTTP``**: Haz clic en "Agregar nuevo".
                        - **``Nombre de la configuración de HTTP``**: `appGatewayBackendHttpSettings`
                        - **``Puerto de back-end``**: `80`
                        - **``Protocolo de back-end``**: `HTTP`
                        - **``Tiempo de espera de la solicitud``**: `60`
            - **``Pestaña Etiquetas``**: (Opcional) Agrega etiquetas si lo deseas.
            - Haz clic en "Revisar + crear" y luego en "Crear".
	-  **``7. Configuración de DNS y acceso``**
	
		- Una vez que el Application Gateway esté desplegado, ve a su página de "Información general".
		- Copia la "Dirección IP pública" o el "FQDN" (nombre de dominio completo) de tu Application Gateway.
		- Pega esta dirección en tu navegador web para acceder a tu instalación de WordPress.
		- Completa la configuración inicial de WordPress.
	
	**``Consideraciones adicionales``**
	
     -  **``Seguridad``**: Para un entorno de producción, considera usar HTTPS en el Application Gateway con un certificado SSL/TLS.
     -  **``Escalabilidad``**: Azure Container Instances y Application Gateway ofrecen opciones de escalabilidad que puedes configurar según tus necesidades.
     -  **``Monitoreo``**: Configura el monitoreo y las alertas para tus recursos de Azure.

![[barra.gif]]

-  **Infraestructura como código**

	-  **IaC ARM**
	
		- [[azuredeploy.json]]
		- [[azuredeploy.parameters.json]]
		- [[sebastian/assets/laboratorium/az-wordpress-in-aci-for-vpc/arm/metadata.json]]
	-  **IaC Bicep**
	
		- [[main.bicep]]
		- [[main.bicepparam]]
		- [[sebastian/assets/laboratorium/az-wordpress-in-aci-for-vpc/bicep/metadata.json]]
		- [[application-gateway.bicep]]
		- [[container-instances.bicep]]
		- [[network.bicep]]
		- [[storage.bicep]]
	-  **IaC Terraform**
	  
		- [[application-gateway.tf]]
		- [[container-instances.tf]]
		- [[sebastian/assets/laboratorium/az-wordpress-in-aci-for-vpc/terraform/main.tf]]
		- [[network.tf]]
		- [[sebastian/assets/laboratorium/az-wordpress-in-aci-for-vpc/terraform/outputs.tf]]
		- [[storage.tf]]
		- [[sebastian/assets/laboratorium/az-wordpress-in-aci-for-vpc/terraform/terraform.tfvars]]
		- [[sebastian/assets/laboratorium/az-wordpress-in-aci-for-vpc/terraform/variables.tf]]




































































































































