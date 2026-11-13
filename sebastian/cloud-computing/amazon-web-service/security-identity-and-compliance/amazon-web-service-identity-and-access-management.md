

![[barra.gif]]
Para respaldar objetivos críticos como la prevención de pérdidas financieras o el cumplimiento de obligaciones normativas, es necesario contar con un proceso bien definido de respuesta a incidentes. En la nube, esto se rige por **siete principios clave de diseño de seguridad**.

-  **Identidades de IAM**

	Los recursos de gestión de acceso agrupan objetos conocidos como identidades de IAM, los cuales se utilizan para identificar y agrupar entidades a las que se les pueden adjuntar políticas de permisos. Estas identidades se dividen principalmente en tres tipos: usuarios, grupos y roles.
	
	![[jerarquia-organizacional.png]]
	
	-  **Usuario de IAM**
	
		-  **Definición y propósito:** Un usuario representa a una persona que interactúa con la plataforma. Su función principal es permitir que las personas inicien sesión en las consolas de administración para realizar tareas interactivas, así como emitir solicitudes programáticas a través de interfaces de programación (API) o herramientas de línea de comandos.
		*  **Estructura de credenciales:** Consta de un nombre identificativo, una contraseña para el acceso interactivo a la consola y hasta dos claves de acceso para solicitudes programáticas.
		*  **Asignación de permisos:** Los permisos se pueden otorgar de tres formas:
		
			1. Mediante la incorporación del usuario a un grupo que posea las políticas de permisos adecuadas (**método recomendado**).
			2. De forma directa asignando permisos específicos al usuario.
			3. Clonando los permisos de un usuario existente, lo que convierte automáticamente al nuevo usuario en miembro de los mismos grupos y le adjunta las mismas políticas.
	-  **Grupo de IAM**
	
		*  **Definición y propósito:** Un grupo es un conjunto de usuarios de IAM diseñado para especificar y administrar permisos de manera centralizada para una colección de personas (por ejemplo, un grupo de administradores).
		*  **Características clave:**
		  
			*  Un grupo puede incluir a muchos usuarios, y un usuario puede pertenecer a varios grupos de forma simultánea.
			*  Los grupos **no pueden anidar**; únicamente pueden contener usuarios y no otros grupos.
			*  No existe un grupo predeterminado que incluya automáticamente a todos los usuarios de una cuenta; si se requiere, debe crearse manualmente y asignar cada usuario de manera individual.
			*  Existen límites operativos en la cantidad de grupos permitidos y en la cantidad de grupos a los que puede pertenecer un usuario.
	-  **Rol de IAM**
	
		*  **Definición y propósito:** A diferencia de un usuario, un rol de IAM **no tiene credenciales permanentes** (como contraseñas o claves de acceso) asociadas de forma fija. Está diseñado para ser asignado temporalmente a cualquier entidad que lo necesite con el fin de **delegar el acceso** a usuarios, aplicaciones o servicios que normalmente no disponen de privilegios sobre los recursos.
		*  **Casos de uso principales:** Permitir que usuarios accedan a recursos de los que no disponen habitualmente o cruzar accesos entre distintas cuentas.
		
			*  Permitir que aplicaciones (como aplicaciones móviles) utilicen recursos en la nube sin necesidad de incrustar claves estáticas en el código, reduciendo riesgos de extracción y facilitando la rotación.
			*  Conceder acceso a identidades definidas externamente, como directorios corporativos o auditores externos.
		*  **Credenciales temporales:** Los roles operan mediante credenciales temporales que **vencen automáticamente** después de un período de tiempo determinado, cuya duración es controlada y configurada por el administrador.
		*  **Entidades autorizadas para usar roles:**
		
			*  Usuarios de la misma cuenta.
			*  Usuarios de cuentas diferentes.
			*  Servicios web provistos por la plataforma en la nube (por ejemplo, servidores virtuales).
			*  Usuarios externos autenticados mediante proveedores de identidad externos (IdP) compatibles con estándares como SAML 2.0 u OpenID Connect, o agentes de identidad personalizados.
-  **Tipos de políticas de control de acceso**

	Para gestionar la seguridad y el control de accesos de manera granular, los entornos modernos de nube suelen implementar un sistema compuesto por diversos tipos de políticas:
	
	-  **Políticas basadas en identidad:** Documentos de permisos adjuntos directamente a identidades (usuarios, grupos o roles) que especifican qué acciones tienen permitidas o denegadas.
	-  **Políticas basadas en recursos:** Reglas que se adjuntan directamente a un recurso específico (como un repositorio de almacenamiento o un servicio de ejecución) para definir qué entidades pueden acceder a él y bajo qué condiciones.
	-  **Límites de permisos:** Barandillas de seguridad que establecen un tope máximo de privilegios que una política basada en identidad puede conceder, actuando como una red de protección contra asignaciones excesivas.
	-  **Políticas de control organizacional:** Reglas aplicadas a nivel global o corporativo que determinan los permisos máximos disponibles para todas las cuentas, carpetas o proyectos dentro de una jerarquía de organización.
	-  **Listas de control de acceso (ACL):** Mecanismos de control tradicionales que permiten gestionar qué principales o cuentas externas poseen permisos específicos sobre recursos determinados.
	-  **Políticas de sesión:** Políticas avanzadas y dinámicas que se aplican de forma temporal al momento de asumir una identidad o federar una sesión, restringiendo los permisos estrictamente al ciclo de vida de dicha conexión.
	
	**Clasificación según su gestión y diseño**
	
	-  **Políticas administradas por la plataforma:** Son plantillas de permisos predefinidas, creadas y actualizadas directamente por el proveedor del servicio. Se recomiendan como punto de partida estándar al iniciar la configuración de permisos.
	-  **Políticas administradas por el cliente:** Son políticas creadas, personalizadas y gestionadas internamente por los administradores de la organización, lo que otorga un control mucho más preciso y adaptado a las necesidades del negocio.
	-  **Políticas incrustadas (Inline):** Son reglas de acceso asociadas de forma directa y exclusiva a una única entidad (usuario, grupo o rol). Mantienen una relación estricta de uno a uno, lo que resulta útil para evitar que sus permisos se asignen por error o de forma inadvertida a otros elementos.
-  **Diferencia clave: Permisos vs. Políticas vs. Roles**

	Para despejar tu confusión sobre qué son los permisos, las políticas y los roles, y cómo interactúan con los grupos, vamos a desglosarlo:
	
	1.  **Políticas Administradas por la plataforma/cliente (Managed Policies):** Son independientes. Viven por su cuenta en el menú global de "Políticas" y puedes asignarlas a múltiples usuarios, grupos o roles a la vez.
	2.  **Políticas Incrustadas (Inline Policies / "Cliente insertado"):** Son políticas creadas "a medida" y **viven dentro de una única entidad** (un solo usuario, un solo grupo o un solo rol). Como están pegadas exclusivamente a ese `DevelopersGroup`, no existen de forma independiente y por eso el buscador global no las encuentra.
	    
	-  **Diferencia clave: Permisos vs. Políticas vs. Roles**
	
		-  **Permisos:** Son las acciones individuales en sí (por ejemplo, permitir `s3:CreateBucket` o prohibir `iam:DeleteUser`). No son un objeto que se asigne suelto; son el contenido lógico.
		-  **Políticas:** Son el documento (el archivo JSON que vimos en la imagen) que empaqueta esos permisos. Las políticas se pueden adjuntar a los usuarios, grupos o roles.
		-  **Roles:** **No son un tipo de permiso ni una política**, sino una **identidad independiente** en AWS (igual que un usuario o un grupo). Un rol tiene sus propias políticas de confianza y permisos. **A un grupo no se le asigna un rol como si fuera una etiqueta**, sino que a los usuarios o al grupo se les da permiso (a través de una política) para _asumir_ ese rol temporalmente (como veíamos en el bloque `sts:AssumeRole`).
	-  **¿Qué se le puede asignar a un grupo y cómo elegir?**
	
		A un **grupo de usuarios** solo se le pueden asignar dos cosas:
		
		1. **Usuarios:** Metes personas dentro del grupo para que hereden los permisos colectivos.
		2. **Políticas de permisos:** Ya sean _Administradas_ (reutilizables) o _Incrustadas_ (exclusivas del grupo, como el `user1DefaultPicker` que ves en tu imagen).
	-  **¿Cómo escoger entre una política administrada y una incrustada (como esta)?**
	
		-  **Usa políticas administradas** (las del catálogo global) cuando quieras aplicar un estándar repetible, como la política predeterminada de AWS `AmazonS3ReadOnlyAccess`, que vas a querer usar en varios departamentos o usuarios distintos.
		-  **Usa políticas incrustadas** (como el "cliente insertado" de la imagen) únicamente cuando necesites una regla de seguridad **extremadamente específica y única** para ese grupo o usuario en particular, asegurando que nadie más la comparta ni la modifique por error desde fuera.


































