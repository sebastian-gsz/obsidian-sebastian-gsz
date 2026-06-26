
![[barra.gif]]

Una **Organization** en Google Cloud es el **nivel más alto de toda la jerarquía de recursos**. Piensa en ella como **la raíz absoluta** desde la cual se estructura y gobierna todo lo que existe dentro de tu empresa en Google Cloud.

| **Nivel de jerarquía**      | **Función / Descripción**                                                                                                                          |
| --------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Concepto Raíz**           | **Organization** es el nivel más alto de la jerarquía; funciona como el contenedor maestro y raíz absoluta de toda la empresa.                     |
| **Carpetas (Folders)**      | Permiten dividir, agrupar y aislar departamentos, entornos (producción/desarrollo) o equipos de trabajo.                                           |
| **Proyectos**               | Son el contenedor necesario para habilitar servicios y donde viven todos los recursos operativos.                                                  |
| **Recursos**                | Elementos finales y funcionales de la plataforma, como VMs (Compute Engine), buckets (Cloud Storage), funciones y redes (VPC).                     |
| **Políticas IAM**           | Define las políticas de identidad y acceso (quién tiene permiso para hacer qué) a nivel corporativo.                                               |
| **Organizational Policies** | Establece restricciones globales y reglas de cumplimiento que se aplican a toda la jerarquía hacia abajo.                                          |
| **Servicios Transversales** | Agrupa elementos esenciales como las cuentas de facturación (Billing), Service Accounts para automatización y registros de auditoría (Audit Logs). |

-  **Documentación**

	- **[Documentación de Resource Manager ](https://docs.cloud.google.com/resource-manager/docs/?hl=es_419)**

![[Barra.gif]]

-  **¿Qué cubren las políticas de organización?**

	Las **Organization Policies** son reglas **globales y estructurales** que se aplican a nivel de:
	
	- **Organización**
	- **Carpeta**
	- **Proyecto**
	
	Su propósito es **establecer límites técnicos y de cumplimiento** sobre cómo se pueden usar los recursos en GCP.
	
	Ejemplos típicos:
	
	- **Restringir regiones**: evitar que se creen recursos fuera de Europa.
	- **Forzar cifrado CMEK**: exigir claves gestionadas por el cliente.
	- **Bloquear servicios**: impedir el uso de APIs como BigQuery o Cloud Functions.
	- **Controlar tipos de máquinas virtuales**: limitar a ciertas familias o tamaños.
	
	📌 Estas políticas no se asignan a usuarios individuales, sino que **afectan a todos los usuarios** que interactúan con los recursos en ese ámbito.
	
	-  **Superadministrador vs Administrador de la organización**
	
		-  **Superadministrador (Google Workspace/Cloud Identity)**
		
			- **``Alcance principal``:** Se centra en la **identidad** y el **acceso inicial**.
			- **``Responsabilidades``:** Administrar **usuarios**, **grupos**, **licencias** y el **ciclo de vida** de la cuenta de identidad.
			- **``Poder sobre GCP``:** Es **indirecto**. Su función clave es asignar el rol de **Administrador de la organización** (Organization Admin) a usuarios específicos, estableciendo el vínculo inicial con el recurso de la **Organización** de GCP. **No gestiona** los recursos diarios de GCP (VMs, bases de datos).
		-  **Administrador de la organización (GCP IAM)**
		
			- **``Alcance principal``:** La **gobernanza** de la **Jerarquía de Recursos de GCP** ($\text{Organización} \rightarrow \text{Carpetas} \rightarrow \text{Proyectos}$).
			- **``Responsabilidades``:** **Definir políticas de IAM** (estructura de permisos), **establecer la estructura de recursos** y **delegar** grandes responsabilidades (Facturación, Redes) a niveles inferiores.
			- **``Permisos de base``:** El rol típicamente incluye amplios permisos de **lectura/visualización** sobre las **políticas** y los **metadatos** de la jerarquía (Carpetas, Proyectos) para poder administrarlos.
		-  **Acceso a contenido detallado de proyectos**
		
			- **``Principio``:** Se aplica rigurosamente el **Principio de Privilegio Mínimo**. El rol de **Administrador de la organización** por sí mismo **NO** incluye permisos para realizar **acciones operativas detalladas** (como ver los recursos _dentro_ de un Proyecto, o crear carpetas).
			- **``Mecanismo de obtención``:** Para que el **Administrador de la organización** pueda **ver los recursos creados** en un **Proyecto** (VMs, buckets, etc.), debe **autodelegarse** permisos adicionales.
			- **``Acción requerida``:** Usando su poder para **Definir políticas de IAM**, el **Organization Admin** debe asignarse a sí mismo un rol como **Visualizador** (`roles/viewer`) a nivel de la **Organización** o **Proyecto** para obtener la visibilidad operativa.
-  **Análisis de la jerarquía de recursos en Google Cloud**
	
	-  **``Nodo de organización``:** El nivel más alto. Representa a su empresa o dominio. Aquí es donde se aplican las políticas de seguridad y gobernanza más amplias, como la creación de proyectos y el control de quién puede gastar dinero. Todo lo que se crea bajo este nodo está sujeto a sus políticas.
	
		Este es el concepto más importante. Las políticas (permisos de acceso, restricciones, etc.) se aplican en los niveles superiores (Organización y Carpetas) y se **heredan** automáticamente por los niveles inferiores (Proyectos y Recursos). Esto significa que si define una política en el nodo de su organización, se aplicará a todos los proyectos y recursos de su empresa. Esto evita la tediosa y propensa a errores tarea de configurar políticas individuales en cada proyecto.
	-  **``Carpetas``:** El nivel intermedio, diseñado para agrupar proyectos, permite aplicar políticas de forma lógica. Por ejemplo, puede crear carpetas para departamentos o entornos  `producción` o `desarrollo`) y aplicar políticas de seguridad o permisos específicos a todos los proyectos y recursos dentro de ellas.
	
		No se puede tener un recurso sin un proyecto. La facturación, los permisos y las APIs se gestionan a nivel de proyecto. Esto permite una separación clara de responsabilidades y costos. Si tiene un proyecto para su equipo de marketing y otro para el de ingeniería, los costos se mantendrán separados.
	-  **``Proyectos``:** El nivel fundamental. Es la unidad de organización, facturación y control de acceso. Cada recurso de Google Cloud, sin excepción, debe vivir dentro de un proyecto. Son el lugar donde se habilitan servicios como APIs y donde se asocian las cuentas de facturación. Cada proyecto tiene un ID único, nombre y número.
	
		El **Project ID** es un identificador único, global e inmutable. Esto es crucial en la ingeniería de sistemas. Si usted diseña un script o una automatización que hace referencia a un recurso usando el Project ID, puede estar seguro de que esa referencia nunca cambiará. Esto es vital para pipelines de datos robustos y automatizaciones de infraestructura como código (IaC). Por otro lado, el nombre del proyecto es solo una etiqueta legible por humanos y puede cambiar, lo cual enfatiza la importancia de usar el ID en contextos de programación.
	-  **``Recursos``:** El nivel más bajo. Son los servicios individuales que se utilizan, como máquinas virtuales (Compute Engine), bases de datos (BigQuery) o almacenamiento (Cloud Storage).
	
		Si su empresa tiene un dominio de Google Workspace, automáticamente tiene un nodo de organización. Este es el punto de control central para gestionar todos los proyectos y recursos. Permite delegar responsabilidades, como la creación de proyectos, de manera segura y controlada, lo que evita que cualquiera dentro de la organización pueda generar costos inesperados.
