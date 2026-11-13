
-  **Documentación**

	-  **[Documentación de Dataverse ](https://learn.microsoft.com/es-es/power-apps/maker/data-platform/)**
![[barra.gif]]
-  **Dataverse: El núcleo de control en la sombra**

	Aunque a menudo se le percibe simplemente como una base de datos, Dataverse es, en realidad, un motor de plataforma que proporciona metadatos, seguridad, identidad de negocio, API y un modelo de aplicaciones completo. Su naturaleza de "control en la sombra" se debe a que actúa como un estrato intermedio invisible que gobierna el comportamiento de la plataforma, ocultando su complejidad física bajo abstracciones de alto nivel.
	
	Dataverse almacena la información en **SQL Azure**, pero Microsoft oculta completamente esta base de datos física. Los administradores y desarrolladores no acceden a ella mediante T-SQL, sino a través de Web API (OData), SDK, FetchXML, Power Fx y conectores. Al ocultar la capa física, Dataverse impone su propia lógica de negocio y seguridad, forzando a que cualquier interacción pase por su motor de control antes de tocar los datos.
	
	-  **La separación de poderes: Identidad vs. Autorización**
	
		El control se divide de forma estricta entre dos capas:
		
		-  **Microsoft Entra ID (Autenticación):** Responde a la pregunta de _¿Quién eres?_ (ej. "Juan existe y es parte del grupo CRM-Users").
		-  **Dataverse (Autorización y Lógica):** Responde a _¿Qué puedes hacer?_ (ej. "Juan puede leer cuentas, pero solo las de su unidad de negocio").
		
		Al residir dentro de Dataverse **tablas** del sistema como `systemuser`, `team`, `businessunit`, `role` y `roleprivileges`, la plataforma mantiene su propio modelo de seguridad que opera independientemente de la estructura de grupos de Entra ID. Esto lo convierte en el verdadero decisor de las capacidades operativas dentro de la plataforma.
		
		Dataverse aplica su seguridad a nivel de **entorno (Environment)**, no de tenant completo. Puedes tener un mismo tenant de Microsoft con múltiples entornos de Dataverse, y cada uno de ellos puede tener configuraciones de seguridad, roles y unidades de negocio totalmente independientes entre sí.
	-  **El salto de "Integración" a "Plataforma Empresarial"**
	
		La arquitectura de Power Platform permite entornos sin Dataverse (usando fuentes externas como SAP, SQL o SharePoint), pero estos entornos pierden las capacidades de "centro de control". 
		
		**Cuando se integra Dataverse, la plataforma se transforma**: Se añaden Business Units, seguridad por filas/columnas, auditoría nativa, lógica de negocio avanzada (Plugins, Business Rules) y gobernanza corporativa. Es esta capacidad de imponer una estructura uniforme lo que lo convierte en el corazón de la gobernanza empresarial.
	-  **Herramienta de inspección**
	
		-  **`pac env fetch`**
		
			Para ver lo que ocurre en este "centro de control en la sombra", los administradores requieren herramientas de bajo nivel como `pac env fetch`. Dado que Dataverse utiliza **FetchXML** en lugar de SQL, esta herramienta actúa como un puente directo al núcleo de metadatos.
			
			Su papel como "ojo clínico" del arquitecto es fundamental por tres razones:
			
			-  **Auditoría y diagnóstico:** Permite inspeccionar metadatos de seguridad (`role`, `businessunit`, `team`) y verificar permisos de usuarios sin depender de las capas de abstracción de la interfaz gráfica.
			-  **Precisión:** Extrae el dato exacto y las relaciones (lookup) tal como existen en la base de datos, eliminando la ambigüedad de la UI.
			-  **Documentación como código:** Permite guardar consultas en repositorios (Git), convirtiendo la gobernanza en un proceso auditable y repetible que cualquier miembro del equipo puede ejecutar.
		-  **Espacio de diseño Pro-code**
			
			-  **Opción 1: Visual Studio Code**
			
				- Power Platform CLI
				- Power Fx
				- JavaScript
				- TypeScript
				- PCF Controls
				- Power Pages
				- Git
				- YAML
				- JSON
				- FetchXML
				- SQL Server Management Studio (SSMS)
				
				**Ventajas:**
				
				- ✓ Ligero
				- ✓ Arranque rápido
				- ✓ Excelente integración Git
				- ✓ Excelente terminal integrada
				- ✓ Excelente para PAC CLI
				- ✓ Excelente para desarrollo web
				- ✓ Excelente para Copilot
			-  **Opción 2: Visual Studio Community/Professional**
			
				- Plugins Dataverse
				- Custom Workflow Activities
				- Azure Functions .NET
				- Bibliotecas C#
				- Integraciones complejas
				- SQL Server Management Studio (SSMS)
				
				**Ventajas:**
				
				- ✓ Mejor depuración .NET
				- ✓ Mejor diseñador de proyectos
				- ✓ Mejor experiencia C#
				- ✓ Herramientas Dataverse maduras
				
				**Ejemplos:**
				
				- PluginBase.cs
				- IPlugin
				- Custom APIs
				- Plugin Registration
	-  **Seguridad de nivel empresarial**
	
		- Todos los datos se cifran en reposo y en tránsito. 
		- Microsoft gestiona la configuración de la base de datos y las copias de seguridad.
		- Microsoft gestiona el almacenamiento en segundo plano.
	-  **Tipos de usuarios**
	
		- Usuarios humanos.
		- Usuarios de aplicación (Application Users).
		- Service Principals.
		- Cuentas internas de Microsoft.
		- Identidades de servicios Power Platform.
		- Cuentas de Dynamics 365.
		- Cuentas de Copilot Studio.
		- Cuentas de integración.
	-  **Relación entre entorno y Dataverse**
	
		La relación no siempre es obligatoriamente 1:1. Aunque la arquitectura recomendada es que cada entorno tenga su propia base de datos, es posible que varios entornos accedan a la misma base Dataverse.
		
		**Development Environment**
			      **│**
			       **├── Dataverse**
			       **│**
		**Test Environment**
		
		Este enfoque puede resultar útil en escenarios de desarrollo o pruebas donde se desea trabajar sobre el mismo conjunto de datos. Para entornos productivos se recomienda mantener bases de datos independientes para garantizar:
		
		- Aislamiento de datos.
		- Menor riesgo operativo.
		- Gestión independiente de seguridad.
		- Mejor gobierno y cumplimiento normativo.
	-  **Consumo de capacidad de almacenamiento**
	
		Al crear una instancia Dataverse se reserva capacidad de almacenamiento del tenant. Aspectos importantes:
		
		- Cada base Dataverse consume capacidad del inquilino.
		- La formación simplifica este requisito indicando un consumo mínimo aproximado de 1 GB por entorno con Dataverse.
		- Si no existe capacidad disponible, no será posible crear nuevas bases Dataverse hasta ampliar la capacidad contratada.
	-  **Dataverse y capacidades de Copilot**
	
		Muchas funcionalidades avanzadas de IA en Power Platform se apoyan en Dataverse porque proporciona:
		
		- Metadatos de las tablas.
		- Relaciones entre entidades.
		- Modelo de seguridad.
		- Reglas de negocio.
		- Información estructurada para IA.
		
		Al habilitar Dataverse se desbloquean capacidades como:
		
		- Creación asistida de tablas mediante lenguaje natural.
		- Generación de aplicaciones basadas en datos empresariales.
		- Consultas inteligentes sobre información almacenada.
		- Agentes y experiencias Copilot apoyadas en datos corporativos.
		- Aplicaciones basadas en modelos (Model-Driven Apps).
		
		Sin Dataverse, Copilot sigue disponible en determinados escenarios, pero con capacidades significativamente más limitadas.
	
	^uhm5
-  **Tablas: Estructuras lógicas**

	Los datos en Dataverse se almacenan en registros denominados **tablas**. Una tabla es una estructura lógica de filas y columnas, similar a una tabla de base de datos. Las tablas pueden representar objetos físicos, como mascotas, edificios o productos, o conceptos abstractos, como proyectos, capacidades y ventajas.
	
	Dataverse facilita la definición de un modelo de datos para las aplicaciones mediante tablas integradas y personalizadas. Incluye un conjunto básico de tablas _estándar_ para escenarios empresariales típicos. También puede crear tablas _personalizadas_ específicas de su organización y rellenarlas con datos de Microsoft SharePoint, Microsoft Excel o Power Query.
	
	**Propiedades de tablas**
	
	-  **Name**: el nombre sencillo que define la tabla, como _Mascotas_.
	-  **Rows**: los registros individuales en los datos, como un gato llamado _Ashley_.
	-  **Columns**: metadatos para cada registro, como la _Especie_ y la _Raza_ de las mascotas.
	-  **Relationships**: define los vínculos a otras tablas, como una mascota que pertenece a un propietario.
	-  **Keys**: columnas que identifican inequívocamente cada fila (como un número de id.).
	-  **Forms**: utilizados por aplicaciones basadas en modelos para ver y editar filas de tablas.
	-  **Views**: definen cómo se muestran las filas y las columnas.
	-  **Charts**: para visualizar datos de tablas.
	-  **Dashboards**: resúmenes visuales de datos mediante gráficos y filtros.
	-  **Business rules**: aplicación de lógica en las columnas de las tablas.
	-  **Metadata**: configuración en el nivel de tabla que afecta a la interacción de las aplicaciones y los flujos con la tabla.
	-  **Commands**: botones personalizables añadidos a las barras de comando de las aplicaciones basadas en modelo.
	
	Las tablas son los principales bloques de creación en Microsoft Dataverse. En Dataverse, una tabla no es solo una tabla de base de datos con columnas y relaciones. Una tabla de Dataverse incluye componentes adicionales para el desarrollo de aplicaciones y la automatización de procesos. Las tablas en Dataverse tienen las siguientes propiedades.

	-  **Exploración de entidades** 
	
		-  **systemuser**





















































































































