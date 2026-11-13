
-  **Documentación**

	-  **[Documentación de Gemini para Google Cloud ](https://docs.cloud.google.com/gemini/docs?hl=es-419)**
![[barra.gif]]
-  **Antigravity CLI**

	-  **Directorio**
	
		-  **builtin**
		  
			En la carpeta `builtin` dentro del directorio de configuración de la CLI de Antigravity se almacenan los **recursos, comandos del sistema, habilidades (_skills_) y complementos predeterminados** que vienen integrados de fábrica con la herramienta.
		-  **cache**
		  
			En la carpeta `cache` de la CLI de Antigravity se guardan archivos de control de estado y metadatos locales necesarios para el funcionamiento y la inicialización de la herramienta. Específicamente, los archivos encontrados contienen:
			
			-  **`default_project_id.txt`**: Almacena el identificador del proyecto predeterminado actual de la CLI, que en este caso es `default-cli-project`.
			-  **`onboarding.json`**: Contiene un registro en formato JSON que indica el estado del proceso de configuración inicial (_onboarding_), especificando que se ha completado el flujo para consumidores (`consumerOnboardingComplete: true`), pero no para empresas (`enterpriseOnboardingComplete: false`).
		-  **implicit**
		
			En la carpeta `implicit` se almacenan **archivos de datos binarios en caché o índices internos** utilizados por la CLI de Antigravity (como se observa en el contenido cifrado o serializado del archivo).
			
			Estos archivos no están diseñados para ser leídos por humanos, ya que contienen información en formato binario optimizado para el rendimiento del sistema, como estados intermedios, cachés de análisis o índices de vectores y metadatos que el agente procesa automáticamente de manera local.
		-  **knowledge**: 
		
			En la carpeta `knowledge` dentro del directorio de configuración de la CLI de Antigravity se almacena la **base de conocimientos del agente** (_Knowledge Base_).
			
			Esto incluye:
			
			-  **Resúmenes y documentación del proyecto:** Archivos de contexto, notas o estructuras del proyecto que el agente recopila o genera cuando se le solicita explícitamente guardar información persistente sobre el código o el espacio de trabajo actual.
			-  **Datos de referencia personalizados:** Información estructurada que los agentes de Antigravity utilizan para recordar detalles técnicos o instrucciones específicas de sesiones anteriores sin sobrecargar el contexto principal.
			
			Los archivos dentro de la carpeta `knowledge` de la CLI de Antigravity suelen estructurarse en formato **Markdown (`.md`)** para que el agente de IA pueda leerlos, interpretarlos y utilizarlos como contexto persistente.
			
			A continuación se muestra una arquitectura o estructura recomendada que debería contener un archivo de conocimiento para organizar correctamente la información del proyecto:
			
			**Estructura recomendada para un archivo de Knowledge (`.md`)**
			
				---
				title: "Título del Componente o Proyecto"
				description: "Breve descripción de qué abarca este documento de conocimiento."
				version: "1.0"
				---
				
				## 1. Descripción General
				* **Propósito:** Explica brevemente cuál es el objetivo principal del sistema, módulo o proyecto documentado.
				* **Alcance:** Define qué tecnologías, frameworks o entornos están involucrados.
				
				## 2. Arquitectura del Sistema
				* **Estructura de Directorios:** 
				  * `/src/components`: Descripción de los componentes de la interfaz o lógica principal.
				  * `/src/services`: Conexiones con APIs, bases de datos o servicios externos.
				* **Flujo de Datos:** Cómo se comunican los módulos principales entre sí.
				
				## 3. Convenciones y Reglas de Desarrollo
				* **Estándares de Código:** Guías de estilo o patrones de diseño obligatorios (ej. principios SOLID, manejo de errores).
				* **Restricciones:** Cosas que el agente o los desarrolladores **no** deben hacer en este entorno.
				
				## 4. Notas y Comandos Útiles
				* Comandos frecuentes para compilar, probar o desplegar el proyecto.
				* Enlaces a documentación externa o notas específicas de configuración.
			
			**Pautas clave para su redacción:**
			
			*  **Claridad y concisión:** Utiliza listas con viñetas y títulos claros para que el modelo procese el contexto rápidamente sin consumir demasiados tokens.
			*  **Enfoque práctico:** Incluye solo la información técnica esencial que el asistente necesites recordar de forma permanente (como reglas de negocio o arquitectura específica del repositorio).
	-  **conversation_summaries**
	
		El texto que estás visualizando en formato de caracteres extraños y binarios al principio confirma que **se trata de una base de datos SQLite** (puedes leer claramente la cabecera `SQLite format 3` y nombres de tablas internas como `conversation_summaries`). Este tipo de archivos almacenan historiales y resúmenes de tus conversaciones de manera local.
			
		Para ver su contenido de forma ordenada y legible en Visual Studio Code, puedes utilizar extensiones especializadas:
			
		**Extensiones de VS Code recomendadas:**
			
		1. **SQLite Viewer** (de _qwtel_ o alternativas similares como _SQLite Viewer PRO_): Es una de las mejores opciones porque te permite abrir el archivo directamente haciendo clic en él, mostrando una interfaz gráfica estilo tabla (similar a Excel o Airtable) con paginación, filtros y ordenamiento.
		2. **SQLite** (de _alexcvzz_): Añade un explorador lateral dedicado a SQLite (_SQLITE EXPLORER_) en tu editor. Te permite inspeccionar tablas, ver esquemas y ejecutar consultas personalizadas mediante comandos rápidos.
		3. **SQLite Explorer** (de _Zknpr_): Permite abrir archivos con extensiones `.sqlite`, `.db` o similares, explorar su contenido visualmente e incluso editar celdas haciendo doble clic.
			
		**Pasos para visualizarlo:**
			
		4. Ve a la sección de **Extensiones** en VS Code (`Ctrl+Shift+X` o `Cmd+Shift+X`).
		5. Busca e instala alguna de las opciones mencionadas (por ejemplo, **SQLite Viewer** o **SQLite**).
		6. Haz clic derecho sobre el archivo de la base de datos en tu explorador de archivos de VS Code (o usa la paleta de comandos con `Ctrl+Shift+P` y selecciona la opción para abrir bases de datos de la extensión) para empezar a explorar sus tablas e información de manera gráfica.
	-  **jetski_state.pbtxt**
	
		El archivo `jetski_state.pbtxt` es el archivo de configuración y estado interno de la CLI de Antigravity (asociada al entorno de Jetski). Funciona para almacenar de forma persistente metadatos sobre la instalación y el progreso de configuración inicial del usuario.
		
		En el contenido que muestras, se detalla específicamente:
		
		*  **`post_onboarding`**: Registra los pasos del proceso de bienvenida e inicialización que ya se han completado, como la bienvenida del administrador (`POST_ONBOARDING_STEP_TYPE_MANAGER_WELCOME`), el modo de uso (`POST_ONBOARDING_STEP_TYPE_USAGE_MODE`), la configuración del agente (`POST_ONBOARDING_STEP_TYPE_AGENT_CONFIGURATION`) y la adición del espacio de trabajo (`POST_ONBOARDING_STEP_TYPE_ADD_WORKSPACE`).
		*  **`installation_uuid`**: Contiene un identificador único universal (UUID) que distingue esta instalación específica en tu equipo.
		*  **`migrations`**: Registra el estado de las actualizaciones o migraciones internas de la base de datos o esquema de la herramienta (marcando las versiones 3, 4 y 5 como completadas).






































