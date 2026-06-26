
![[barra.gif]]

-  **Cloud Identity (La gestión de quién es quién):**

	- **Función principal:** Actúa como el sistema de administración de identidades. Su propósito es definir, crear y gestionar el ciclo de vida de los usuarios, grupos y dispositivos.
	- **Acciones:** Se encarga de procesos como dar de alta a un empleado, gestionar contraseñas y organizar usuarios en grupos dentro de un dominio.
	- **Pregunta que resuelve:** ¿Quién es esta persona y qué credenciales tiene?
-  **IAM (La gestión de qué se puede hacer):**

	- **Función principal:** Actúa como el motor de control de acceso a los recursos de Google Cloud.
	- **Acciones:** Utiliza las identidades previamente creadas por Cloud Identity para asignarles permisos específicos (roles) sobre los recursos de la nube, como permitir que un usuario vea una base de datos o edite una máquina virtual.
	- **Pregunta que resuelve:** Una vez que la identidad ha sido verificada, ¿a qué recursos tiene permiso para acceder?

Cloud Identity es la base necesaria: sin él, no existirían las identidades que IAM debe gestionar. Mientras que Cloud Identity se encarga de la identidad pura, IAM consume esas identidades para aplicar las políticas de seguridad y acceso necesarias en tus proyectos.

| **Escenario**                                       | **Valor de la activación**                                                                                                                                                                                         | **Por qué es limitado**                                                                                                                                                  |
| --------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Cuenta personal (`@gmail.com`)**                  | **Valor bajo.** Puedes usar la API de forma limitada para hacer consultas de identidad básicas sobre los usuarios y grupos que _tú_ creas en proyectos personales (si usas la API para crear grupos, por ejemplo). | **No hay una organización que gestionar.** No tienes miles de usuarios ni grupos que automatizar, y la gestión de tu propia cuenta la haces directamente en la interfaz. |
| **Dominio de la Organización (`@gastromarkit.es`)** | **Valor crítico.** La API es la única forma de **automatizar** la gestión del ciclo de vida de los usuarios y grupos de tu organización.                                                                           | El valor se desbloquea **sólo después** de completar el proceso de Cloud Identity y tener usuarios con el dominio `gastromarkit.es`.                                     |
-  **Enlaces**

	- **[Cloud Identity API ](https://docs.cloud.google.com/identity/docs/reference/rest?apix=true)**
	- **[Documentación de Cloud Identity ](https://docs.cloud.google.com/identity/docs?hl=es)**

![[Barra.gif]]

-  **Usos de la API de Cloud Identity en entornos de organización**

	-  **Tipos de licencia**
	  
		1. **Cloud Identity Free (Edición Gratuita)**
		
			- **Modelo:** No necesitas "comprar" una suscripción de pago para empezar.
			- **Límite de usuarios:** Tienes un límite inicial (típicamente de hasta 50 usuarios gratuitos adicionales).
			- **Cómo escalar:** Si alcanzas ese límite, **no significa que tengas que empezar a pagar por Cloud Identity**. Puedes solicitar un aumento de este límite mediante un formulario oficial en la consola de administración. Además, si compras otros servicios de pago de Google (como Google Workspace), tu límite de usuarios gratuitos aumenta automáticamente.
		2. **Cloud Identity Premium (Edición de Pago)**
		
			- **Modelo:** Esta sí es una **suscripción de pago por usuario/mes**.
			- **Cuándo se usa:** Se contrata específicamente cuando necesitas funcionalidades avanzadas que no están en la versión gratuita, como gestión avanzada de dispositivos móviles, mayor seguridad empresarial, automatización de reglas de seguridad o protección contra amenazas.
			- **Gestión de licencias:** A diferencia de la versión gratuita (que es "basada en sitio" y se asigna sola), la versión Premium requiere que asignes licencias a los usuarios específicos que necesiten esas funciones avanzadas.
	-  **Gestión del ciclo de vida de usuarios corporativos (Provisión)**
	
		El uso principal es la gestión automatizada de las identidades bajo tu dominio (`@gastromarkit.es`).
		
		-  **``Provisión``/``Desprovisión`` (SCIM):** Sincronizar automáticamente usuarios y grupos desde tu directorio corporativo principal (como **Microsoft Entra ID** o un AD/LDAP local usando GCDS) hacia Cloud Identity.
		
		    - **Ejemplo**: Cuando un nuevo empleado es añadido en el sistema de RR.HH., un script usa esta API para *crear inmediatamente* su cuenta `usuario@gastromarkit.es`.
		    - **Ejemplo**: Cuando un empleado abandona la empresa, la API es utilizada para *suspender o eliminar* la cuenta, revocando instantáneamente el acceso a GCP y otros servicios de Google.
		-  **``Actualizaciones masivas``:** Modificar nombres de usuarios, direcciones de correo electrónico secundarias o unidades organizativas (OU) de cientos de usuarios a través de una sola llamada a la API.
	-  **Gestión centralizada de grupos de seguridad**
	
		Los grupos de google son los pilares de la seguridad en GCP IAM. La API permite automatizar esta gestión:
		
		- **``Creación de grupos dinámicos``:** Crear grupos específicos (`gcp-billing-viewers@gastromarkit.es`) y agregar automáticamente a todos los usuarios de un departamento específico a ese grupo.
		- **``Auditoría de pertenencia``:** Ejecutar _scripts_ nocturnos que auditan la pertenencia a grupos críticos (aquellos con roles altos en GCP) y generar informes o alertas si la pertenencia no cumple con la política de seguridad.
	-  **Aplicación de políticas de seguridad**
	
		Aunque las políticas de _Organización_ se gestionan con otra API, la API de Cloud Identity apoya la seguridad de las credenciales:
		
		- **``Control de claves SSH``:** Gestionar y distribuir programáticamente las claves SSH de los usuarios que acceden a las máquinas virtuales de Compute Engine.
		- **``Gestión de dispositivos``:** Auditar y gestionar los dispositivos que los usuarios utilizan para acceder a los recursos (esto es más relevante en la edición Premium, pero la API es la base).
	-  **Integración con sistemas internos**
	
		La API se convierte en el punto de integración para tus herramientas corporativas:
		
		- **``Sistemas de ticketing``:** Un sistema de _ticketing_ puede usar la API para consultar el estado de la cuenta de un usuario antes de asignarle una tarea.
		- **``Portales de autoservicio``:** Puedes construir un portal web interno para que los usuarios finales gestionen su propia pertenencia a grupos de forma limitada, utilizando la API para actualizar la información.














