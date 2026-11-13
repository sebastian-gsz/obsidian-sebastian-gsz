
**[AWS Organizations ](https://docs.aws.amazon.com/organizations/)** es un servicio sin costo adicional que permite consolidar, crear y administrar de forma centralizada múltiples cuentas de AWS para optimizar la gobernanza, seguridad y presupuesto corporativo (solo se pagan los recursos consumidos en las cuentas miembro).

-  Permite crear cuentas nuevas al escalar la nube y agruparlas en unidades organizativas (OU).
-  Facilita la aplicación de políticas de control de servicios (SCP) a las cuentas u OU para controlar el acceso a los recursos, servicios y regiones.
-  Permite compartir recursos en la organización mediante AWS RAM, como crear subredes de Amazon VPC una vez y compartirlas.
-  Proporciona una única factura consolidada, seguimiento de costos con el explorador de costes y optimización con AWS Compute Optimizer.
![[barra.gif]]
-  **¿Qué problemas resuelve Organizations?**

	Organizations lo ayuda a gobernar y administrar de manera centralizada su entorno de la nube al proporcionar herramientas y capacidades para resolver lo siguiente:
	
	-  **Problemas que resuelve AWS Organizations**
	  
		-  **Centralización:** administración unificada de múltiples entornos cloud con flexibilidad organizativa y adaptación a los procesos empresariales.
		-  **Gobernanza:** control absoluto sobre el acceso a las cuentas, las regiones permitidas y los servicios disponibles.
		-  **Cumplimiento:** refuerzo de la seguridad mediante la aplicación de políticas automatizadas y la supervisión continua de la actividad.
		-  **Intercambio de recursos:** distribución rápida y segura de elementos centrales entre los equipos de desarrollo.
	-  **Administración centralizada**
	
		-  Consolidación de múltiples cuentas en una sola organización con escalabilidad integrada.
		
			Cuando invitas a una cuenta de AWS existente que ya tiene recursos y servicios en ejecución, **absolutamente nada se detiene ni se borra**. Todas tus instancias, bases de datos y aplicaciones siguen funcionando exactamente igual que antes del proceso de unión.
			
			-  **Facturación consolidada:** Los cargos generados por los recursos de esa cuenta pasan a depender de la cuenta de administración (la cuenta raíz) de la organización, unificando los pagos en una sola factura global.
			-  **Aplicación de políticas (SCP):** Las reglas de control y restricciones de la organización (o de la Unidad Organizativa donde la ubiques) empiezan a aplicarse de inmediato. Si la organización tiene una SCP que bloquea ciertos servicios o regiones, la cuenta adoptará esas restricciones.
			-  **Acceso de administración:** Se habilita un rol de IAM estándar (por defecto llamado `OrganizationAccountAccessRole`) que permite a la cuenta principal de la organización gestionar la cuenta miembro de forma centralizada.
		-  Capacidad para agregar, invitar o eliminar cuentas de forma eficiente.
		-  Organización de cuentas mediante unidades organizativas (OU) para asignar políticas de acceso específicas.
	-  **Optimización de costes**
	
		-  Consolidación de la facturación en un pago único para toda la estructura.
		-  Acceso a descuentos por volumen en los servicios compatibles.
		-  Visibilidad para los equipos financieros en el seguimiento de costes y tendencias de uso.
	-  **Seguridad, auditoría y cumplimiento**
	
		-  Activación obligatoria e inalterable de AWS CloudTrail en todas las cuentas miembro para registrar toda la actividad.
		-  Integración avanzada con AWS IAM y AWS IAM Identity Center para la gestión de accesos.
		-  Auditoría global de permisos mediante AWS IAM Access Analyzer.
	-  **Políticas y control operativo**
	
		-  Aplicación de políticas de control de servicios para limitar permisos y acciones.
		-  Establecimiento de políticas de etiquetas uniformes y políticas de respaldo automatizadas.
		-  Operación global a través de un punto de enlace unificado aplicable en todas las regiones.
	-  **Compartición eficiente de recursos**
	
		-  Distribución de recursos centrales utilizando AWS RAM.
		-  Uso compartido de aplicaciones de software con AWS Service Catalog y directorios organizativos a nivel global, de OU o por roles específicos.
	-  **Costo del servicio**
	
		-  Uso incluido sin costo adicional en la cuenta de AWS; solo se generan cargos por los recursos consumidos directamente por los usuarios y roles de las cuentas miembro.
-  **¿Cómo se utiliza Organizations para diseñar una solución en la nube?**

	**AWS Organizations facilita la gestión centralizada y programática de cargas de trabajo en múltiples cuentas mediante una facturación unificada con un único método de pago y la aplicación de políticas de gobernanza y seguridad**. 
	
	Las cuentas se estructuran jerárquicamente en unidades organizativas o OU anidadas bajo una raíz, permitiendo que una OU contenga múltiples OU hijas con una única entidad principal, donde cada cuenta pertenece a una sola OU y las políticas adjuntas a cualquier nodo se heredan y aplican de forma descendente a todos sus subniveles.
	![[design-of-organizational-units.png]]
	Las OU no están diseñadas para reflejar la estructura de informes de su propia organización. En cambio, las OU están diseñadas para agrupar cuentas que tienen políticas de seguridad y necesidades operativas generales comunes. **La pregunta principal que debe hacerse es: ¿cuál es la probabilidad de que el grupo necesite un conjunto de políticas similares?**
	![[grouping-of-organizational-units-according-to-their-objective.png]]
	-  **Política de control de servicios (SCP)**
	
		Una SCP es una política que especifica los servicios y las acciones que los usuarios y los roles pueden utilizar en las cuentas afectadas por la SCP. Las SCP son similares a las políticas de permisos de IAM, excepto que no conceden permisos. En su lugar, las SCP especifican los permisos máximos para una organización, OU o cuenta.  
		  
		Las SCP por sí solas no son suficientes para permitir el acceso a las cuentas de la organización. Una SCP no concede permisos. Una SCP define una medida de seguridad o establece límites en las acciones que el administrador de la cuenta puede delegar a usuarios y roles de IAM en las cuentas afectadas.
	-  **Políticas de administración**
		
		Las **SCP** (_Service Control Policies_) son un tipo de política fundamental en AWS Organizations que funcionan como **un techo o límite máximo de qué servicios y acciones pueden utilizar los usuarios y roles en las cuentas afectadas. No configuran recursos, solo prohíben o limitan lo que se puede hacer**:
		
		-  **No otorgan permisos:** Por sí solas no permiten realizar ninguna acción en una cuenta.
		-  **Establecen techos de seguridad:** Definen el conjunto máximo de servicios y acciones que los usuarios y roles _pueden_ utilizar en las cuentas afectadas.
		-  **Delimitan la delegación:** Sirven para acotar y controlar qué acciones puede delegar el administrador de una cuenta local a sus usuarios o roles de IAM, asegurando que ningún nivel inferior rebase las restricciones de seguridad corporativas.










































































