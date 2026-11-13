
-  **Enlaces**

	- **[zed](sebastian/künstliche-intelligenz/agents/zed)**
	- **[[kiro]]**
	- **[[jules]]**
	- **[[devin]]**
	- **[[zcode]]**
	- **[[nvidia]]**
	- **[[cursor]]**
	- **[[mistral]]**
	- **[[deepseek]]**
	- **[[opencode]]**

![[barra.gif]]

-  **Fundamentos creación de agentes**

	Un agente es un sistema de IA autónomo que desglosa objetivos de alto nivel en pasos secuenciales, utiliza herramientas externas y se autocorrige de forma iterativa para completar tareas de desarrollo.
	
	![[agent-loop.png]]
	
	El sistema combina el **razonamiento** del modelo de lenguaje, el **contexto** del entorno (archivos e historiales aportados por VS Code) y la **acción** a través de herramientas, unificándose en un bucle controlado y supervisado por el usuario.
	
	-  **Bucle de agentes**
	
		Ciclo dinámico y continuo basado en tres etapas principales:
		
		-  **Entender:** lectura de archivos y análisis de código.
		-  **Actuar:** modificación de código y ejecución de comandos.
		-  **Validar:** ejecución de pruebas y corrección de errores hasta finalizar la tarea.
	-  **Personalizar el bucle de agentes**
	
		Permite adaptar el comportamiento del sistema mediante **agentes personalizados** (personas con instrucciones y herramientas específicas), **habilidades** de dominio y **hooks** para ejecutar comandos en puntos clave del ciclo de vida.
	-  **Arneses de agentes**
	
		Infraestructuras que determinan **dónde se ejecuta** el agente (en la máquina local o en la nube) y **qué tecnología** lo impulsa (como Copilot, Claude o Codex).
	-  **Subagentes**
	
		Agentes independientes que realizan subtareas específicas en **ventanas de contexto aisladas**, evitando saturar el contexto principal y optimizando el uso de tokens mediante ejecución síncrona o paralela.
	-  **Sesiones**
	
		Unidades de trabajo independientes y ejecutables en paralelo que agrupan la conversación actual junto con su contexto acumulado, permitiendo su gestión y transferencia entre distintos agentes.
	-  **Memoria**
	
		Sistemas que permiten a los agentes retener preferencias y conocimientos entre conversaciones. Se divide en una **herramienta de memoria local** (con ámbitos de usuario, repositorio y sesión) y **Copilot Memory** alojada en GitHub.
	-  **Planificación**
	
		Flujo de trabajo colaborativo de cuatro fases (**Descubrimiento, Alineación, Diseño y Refinamiento**) que genera un plan de implementación detallado y aprobado por el usuario _antes_ de que el agente empiece a escribir o modificar código.
