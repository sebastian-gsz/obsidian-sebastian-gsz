---
def-type: atomic
version: 1
id: def-aws-service-catalog-lab
status: completed
category: infraestructura-en-la-nube
date: 2026-08-30
tags:
  - aws
  - service-catalog
  - cloudformation
aliases:
---
-  **Requisitos previos**

	Para poder avanzar en cualquier tipo de comprobación, primero debes tener usuarios y políticas asignadas a dichos usuarios para que puedan interactuar con Service Catalog.
	
	**Templates**
	
	- [[relation_database.template]]
	- [[simple_storage.template]]
	- [[virtual_machine.template]]
	- [[virtual_private.template]]
![[barra.gif]]
-  **Tarea 1: <strong style ="color:5d6d7e;">Crear cartera y configuración inicial</strong>**


	*  **Inicio de sesión administrativo**: Cierre sesión como usuario normal e inicie sesión con las credenciales de `user-admin` empleando la `LoginURL` provista en el entorno.
	*  **Creación del portafolio**: Vaya al servicio **AWS Service Catalog**, seleccione **Administration > Portfolios** en el panel izquierdo y haga clic en **Crear portafolio**. Ingrese `My Portfolio` como nombre y `Lab` como propietario.
	*  **Asignación de acceso**: Abra los detalles de su cartera, seleccione la pestaña **Access** y elija **Conceder acceso**. Marque a los usuarios `user-developer` y `user-admin`, y confirme la acción.
	*  **Etiquetado de cartera**: En la pestaña **Tags**, agregue la clave `Portfolio` con el valor `My Portfolio` y la clave `Provider` con el valor `Infrastructure Team`.
	*  **Configuración de TagOptions**: En el menú lateral, diríjase a **TagOptions library**. Cree dos opciones con clave `CostCenter` y valores `Operations` y `Development` respectivamente. Vuelva a su cartera, seleccione la pestaña **TagOptions**, marque ambas opciones y elija **Associate TagOption** desde el menú **Actions**.
-  **Tarea 2: <strong style ="color:5d6d7e;">Crear productos de CloudFormation</strong>**

	*  **Descarga de plantillas**: Obtenga y guarde en su computadora los archivos de plantilla necesarios: `VPC.template`, `LINUX.template`, `RDS.template` y `S3.template`.
	*  **Producto VPC**: En su cartera, vaya a la pestaña **Products** y elija **Crear producto**. Seleccione CloudFormation, asigne el nombre `VPC`, la descripción `Development VPC Product`, el propietario `Lab`, y cargue el archivo `VPC.template` con la versión `1`. Indique un correo de soporte (por ejemplo, `support@example.com`) y finalice la creación.
	*  **Producto Linux EC2**: Cree un nuevo producto seleccionando CloudFormation, nombre `EC2`, descripción `Linux Instance Product`, propietario `Lab`, cargando el archivo `LINUX.template` con versión `1`.
	*  **Producto RDS Node**: Cree un producto de tipo CloudFormation, nombre `RDS Node`, descripción `RDS Node Product`, propietario `Lab`, cargando el archivo `RDS.template` con versión `1`.
	*  **Producto S3**: Cree un producto de tipo CloudFormation, nombre `S3`, descripción `Product that creates a S3 Bucket`, propietario `Lab`, cargando el archivo `S3.template` con versión `1`.
-  **Tarea 3: <strong style ="color:5d6d7e;">Crear restricciones de lanzamiento</strong> (Launch Constraints)**

	*  **Restricción de VPC**: En su cartera, seleccione la pestaña **Constraints** y elija **Crear restricción**. Elija el producto `VPC`, tipo de restricción `Iniciar`, método `Seleccionar rol de IAM` y asigne el rol `SC-VPC-ROLE`.
	*  **Restricción de EC2**: Cree otra restricción seleccionando el producto `EC2`, tipo `Iniciar`, método `Seleccionar rol de IAM` y asigne el rol `SC-EC2-ROLE`.
	*  **Restricción de RDS**: Cree una restricción para el producto `RDS Node`, tipo `Iniciar`, método `Seleccionar rol de IAM` y asigne el rol `SC-RDS-ROLE`.
	*  **Restricción de S3**: Cree una restricción para el producto `S3`, tipo `Iniciar`, método `Seleccionar rol de IAM` y asigne el rol `SC-S3-ROLE`.
-  **Tarea 4: <strong style ="color:5d6d7e;">Lanzar el producto de VPC</strong>**

	*  **Cambio de usuario**: Cierre sesión como administrador e inicie sesión como `user-developer` utilizando la `LoginURL`.
	*  **Aprovisionamiento**: En Service Catalog, seleccione **Products** en el submenú Provisioning. Elija el producto `VPC` y haga clic en **Lanzar producto**.
	*  **Parámetros**: Ingrese `myVPC` como nombre del producto aprovisionado. Configure los parámetros de región (`RegionAZ1Name` y `RegionAZ2Name`) para que coincidan con la `LabRegion` seguida de `a` y `b` respectivamente. En la sección de etiquetas, asegúrese de asignar la clave `CostCenter` con el valor `Development` y elija **Lanzar producto**.
	*  **Recuperación de salidas**: Espere a que el estado cambie a `Available`. Desplácese a la pestaña **Events**, seleccione el ARN de la pila de CloudFormation en el valor de salida y, en la nueva pestaña de CloudFormation, copie y guarde los valores de salida: `DevLinuxSecurityGroup`, `Subnet1Public` y `DevRDSSecurityGroup`.
-  **Tarea 5: <strong style ="color:5d6d7e;">Iniciar el producto S3</strong>**

	*  **Lanzamiento**: Vaya a Service Catalog, seleccione el producto `S3` y elija **Lanzar producto**.
	*  **Configuración**: Indique un nombre de producto aprovisionado como `mys3NUMBER` (reemplazando NUMBER por un número aleatorio largo). En los parámetros, pegue el valor de `DeveloperUserARN` en `S3UserARN` e introduzca `10.3.0.0/16` en `S3AccessCIDR`. Asigne la etiqueta `CostCenter` como `Development` y lance el producto.
-  **Tarea 6: <strong style ="color:5d6d7e;">Iniciar el producto EC2</strong>**

	*  **Lanzamiento**: Seleccione el producto `EC2` en Service Catalog y elija **Lanzar producto**.
	*  **Configuración**: Escriba `myEC2` como nombre del producto aprovisionado. Verifique el AMI por defecto, mantenga el tipo `t2.small`, y seleccione los valores de `DevLinuxSecurityGroup` y `Subnet1Public` que guardó previamente. Agregue la etiqueta `CostCenter` como `Development` y lance el producto.
-  **Tarea 7: <strong style ="color:5d6d7e;">Iniciar el producto RDS</strong>**

	*  **Lanzamiento**: Seleccione el producto `RDS Node` en Service Catalog y elija **Lanzar producto**.
	*  **Configuración**: Escriba `myRDS` como nombre del producto aprovisionado. Seleccione `DevRDSSecurityGroup` en `DBSecurityGroup`, elija `devdbsubnet` en `DBSubnetGroupName`, y pegue la contraseña del administrador en `MySQLPassword`. Asigne la etiqueta `CostCenter` como `Development` y lance el producto.
-  **Tarea 8: <strong style ="color:5d6d7e;">Agregar restricciones de plantilla</strong> (Template Constraints)**
  
	*  **Regreso a Administrador**: Cierre sesión como desarrollador e inicie sesión nuevamente como `user-admin`.
	*  **Restricción de plantilla para EC2**: Vaya a su cartera, seleccione la pestaña **Constraints** y elija **Create constraint**. Elija el producto `EC2`, tipo de restricción `Template` y método `Interactive editor`. Configure la regla de grupo de seguridad con el nombre `Linux-Security-Group-Constraint`, seleccione el parámetro `Security Group` y marque la casilla del ID de `DevLinuxSecurityGroup`. Agregue otra regla (`Linux-Subnet-Constraint`) para el parámetro `Subnet` seleccionando `Subnet1Public`, y haga clic en **Create**.
	*  **Restricción de plantilla para RDS**: Cree otra restricción de tipo `Template` para el producto `RDS Node`. Agregue la regla `RDS-Subnet-Group-Constraint` seleccionando el parámetro `DBSubnetGroupName` y el valor `devdbsubnet`. Agregue una regla adicional (`RDS-Security-Group-Constraint`) para el parámetro `DBSecurityGroup` seleccionando `DevRDSSecurityGroup`, y haga clic en **Create**.
-  Tarea 9: <strong style ="color:5d6d7e;">Probar la nueva restricción</strong>

	*  **Inicio de sesión como desarrollador**: Cierre sesión como administrador e inicie sesión como `user-developer`.
	*  **Verificación de EC2**: Seleccione el producto `EC2` en Service Catalog y elija **Launch product**. Escriba `MyEC2-2` como nombre del producto aprovisionado. Utilice la opción **Prefill using last values** y compruebe que los campos de grupo de seguridad y subred aparecen bloqueados y preseleccionados de manera automática conforme a la restricción de plantilla.
	*  **Verificación de RDS**: Seleccione el producto `RDS Node` y elija **Launch product**. Escriba `myRDS2` como nombre del producto aprovisionado, elija **Prefill using last values** y verifique que el grupo de subred y el grupo de seguridad de base de datos están preseleccionados obligatoriamente por la regla de plantilla.

![[amazon-web-service-service-catalog.mp4#invert]]