
-  **[[kanban-cloud-computing|Task]]**
-  **Enlaces**

	-  **Internos**
	
		- **[[microsoft-dataverse]]**
		- **[[trash-examen-final-power-platform]]**
	-  **Learning**
	
		-  **[Blog ](https://www.microsoft.com/en-us/power-platform/blog/)**
		
			- **[Ryan Cunningham ](https://www.microsoft.com/en-us/power-platform/blog/author/ryan-cunningham/?paged=5)**
		-  **[GitHub ](https://github.com/microsoft)**
		
			- **[Power Apps Tools ](https://github.com/microsoft/powerapps-tools/tree/master)**
			- **[Microsoft 365 Developer ](https://github.com/OfficeDev/)**
		-  **[Dev Blog ](https://devblogs.microsoft.com/powerplatform/)**
		
			-  **[April Dunnam ](https://devblogs.microsoft.com/powerplatform/author/apdunnam/)**
		-  **[Microsoft Power Platform | YouTube ](https://www.youtube.com/@mspowerplatform)**
	-  **[Power Platform ](https://www.microsoft.com/en-us/power-platform)**
	
		-  **[Power Platform Adoption ](https://adoption.microsoft.com/es-es/powerplatform/)**
	-  **[Microsoft Marketplace ](https://appsource.microsoft.com/)**
	
		- **[Publicar la aplicación en AppSource ](https://learn.microsoft.com/es-es/power-apps/developer/data-platform/publish-app-appsource)**
	-  **[Power Platform Community ](https://community.powerplatform.com/)**
	-  **[Documentación Microsoft Power Platform ](https://learn.microsoft.com/en-us/power-platform/)**
	
		-  **[Power Platform Well-Architected ](https://learn.microsoft.com/en-us/power-platform/well-architected/)**
		-  **[Plan de desarrollador de Power Apps ](https://learn.microsoft.com/es-es/power-apps/maker/developer-plan)**
		-  **[Documentación Toolkit Power Platform ](https://learn.microsoft.com/en-us/power-platform/guidance/toolkits/)**
		-  **[Documentación de la guía de Microsoft Power Platform ](https://learn.microsoft.com/en-us/power-platform/guidance/)**
		-  **[Microsoft Power Platform Application lifecycle management (ALM) ](https://learn.microsoft.com/en-us/power-platform/alm/)**
		-  
	-  **[Comunidad de Microsoft 365 y Power Platform ](https://pnp.github.io/)**
	-  **[Planes de lanzamiento Microsoft Power Platform ](https://releaseplans.microsoft.com/en-us/?app=Microsoft+Dataverse&culture=en-us&country=us&availability=)**
-  **Laboratorios**

	- **[mpp-crear-entorno-power-platform](mpp-crear-entorno-power-platform.md)**
	- **[[mpp-environment-solutions]]**
![[barra.gif]]
-  **Introducción a Power Platform**

	Un entorno es un espacio lógico para gestionar recursos, aplicaciones y bases de datos. Permite administrar el acceso de usuarios, las políticas de seguridad y el almacenamiento asociado. Facilita el despliegue de aplicaciones y procesos automatizados, permitiendo crear uno o múltiples entornos según la necesidad operativa.
	
	Cada entorno suele estar vinculado a un inquilino de identidad corporativa (**Microsoft Entra ID**), restringiendo el acceso únicamente a los usuarios autorizados de dicho suscriptor. Asimismo, se asocia a una región geográfica específica, garantizando que todos los recursos, conexiones y datos residan en los centros de datos de esa ubicación.
	
	Es posible implementar entornos aislados para gestionar el ciclo de vida de las soluciones, como entornos de desarrollo, pruebas y producción, o para cumplir con requisitos de soberanía de datos y latencia, permitiendo configurar instancias dedicadas según la región geográfica requerida.
	
	**Tenant (Microsoft Entra ID)**
	**│**
	**├── Power Platform Governance**
	**│   ├── Tenant Settings**
	**│   └── DLP Policies**
	**│**
	**└── Power Platform Environments**
	    **│**
	    **├── Environment: Development**
	    **│   │**
	    **│   ├── Dataverse**
	    **│   │   │**
	    **│   │   ├── Business Units (businessunit)**
	    **│   │   │**
	    **│   │   ├── Users (systemuser)**
	    **│   │   │   ├── Humanos**
	    **│   │   │   ├── Application Users**
	    **│   │   │   └── Internal Service Users**
	    **│   │   │**
	    **│   │   ├── Teams (team)**
	    **│   │   │   ├── Owner Teams**
	    **│   │   │   └── Access Teams**
	    **│   │   │**
	    **│   │   ├── Roles (role)**
	    **│   │   │   └── Privileges**
	    **│   │   │**
	    **│   │   ├── Team Memberships (teammembership)**
	    **│   │   └── User Roles (systemuserroles)**
	    **│   │**
	    **│   ├── Power Apps**
	    **│   ├── Power Automate**
	    **│   ├── Connections**
	    **│   └── Gateways**
	    **│**
	    **├── Environment: Test**
	    **└── Environment: Production**
		
	-  **[[microsoft-dataverse#^uhm5|Consideraciones sobre Dataverse y los entornos]]**
	
		Un entorno de Power Platform puede existir con o sin una base de datos Dataverse. Escenarios habituales donde un entorno puede no utilizar Dataverse:
		
		-  Aplicaciones que consumen datos directamente desde SharePoint.
		-  Aplicaciones conectadas a SQL Server, Oracle o SAP.
		-  Flujos de Power Automate que solo realizan integraciones.
		-  Entornos utilizados para desarrollar conectores personalizados.
	-  **Copias de seguridad del sistema**
	
		Las copias de seguridad del sistema se hacen continuamente y no cuentan para la capacidad.
		
		Si utiliza Microsoft Power Platform para crear entornos de producción que tienen una base de datos y aplicaciones Dynamics 365 habilitadas, puede beneficiarse de las copias de seguridad del sistema que se hacen automáticamente para esos entornos. Las copias de seguridad del sistema se almacenan hasta durante 28 días.
		
		Para entornos que no tienen habilitadas las aplicaciones de Dynamics 365, el periodo de retención de la copia de seguridad predeterminado es de solo siete días. Sin embargo, para entornos administrados, los administradores pueden usar PowerShell para cambiar la configuración y extender el periodo de retención de la copia de seguridad. Las opciones de disponibilidad son 7, 14, 21 y 28 días.
		
		Se hace una copia de seguridad de todos los entornos, excepto los de prueba.






















































































































