
-  **Enlaces**

	- **[Zed for student ](https://zed.dev/education)** 
	- **[Documentación ](https://zed.dev/docs/ai/overview)**
![[barra.gif]]
-  **Windows y proyectos**

	Zed permite trabajar en **múltiples proyectos dentro de una misma ventana**, organizados en la barra lateral de hilos (similar a las pestañas del navegador pero para repositorios).
	
	-  **Rutas del sistema**
	
		- **`C:\Users\jseba\AppData\Local\Zed\`**
			- **Extensiones: ``C:\Users\jseba\AppData\Local\Zed\extensions``**
			- **External agent: ``C:\Users\jseba\AppData\Local\Zed\external_agents``**
		- **``C:\Users\jseba\AppData\Local\Programs\Zed\``**
		- **``C:\Users\jseba\AppData\Roaming\Zed\``**
		- **`C:\Users\jseba\Zed`**
	-  **Apertura predeterminada**
	
		*  Por defecto, al abrir una carpeta (desde el menú, arrastrándola o mediante la terminal), esta **se abre en la ventana actual** como un nuevo proyecto en la barra lateral en lugar de crear una ventana nueva.
		*  Cada proyecto conserva de forma independiente:
		  
			*  Su propio **árbol de archivos**.
			*  Su estado de **Git**.
			*  Su alcance de **búsqueda**.
			*  Sus **hilos de agentes** y diseño de espacio de trabajo.
		
		**Cómo abrir en una ventana nueva**
		
		Si necesitas una ventana completamente separada, puedes hacerlo de tres formas:
		
		* **Desde Archivos Recientes:** Usa `Cmd + Enter` (en macOS) o `Ctrl + Enter` (en Linux/Windows) al hacer clic en un proyecto reciente.
		* **Desde la Terminal (CLI):** Utiliza la bandera `-n` o `--new` (ej. `zed -n ~/projects/other-project`). También existen las opciones `-a` (añadir a la ventana actual) y `-r` (reemplazar).
		* **Mediante Configuración:** Cambia el comportamiento predeterminado del CLI añadiendo esto a tus ajustes:
  
		```json
		"cli_default_open_behavior": "new_window"
		```

		**Añadir carpetas al proyecto actual**
		
		Si prefieres añadir una carpeta como una raíz adicional dentro del *mismo* proyecto (estilo espacios de trabajo multi-raíz de VS Code), puedes hacerlo desde:
		
		* El menú de archivos (`File > Add Folder to Project`).
		* El panel de proyectos (clic derecho).
		* El menú de archivos recientes.
		
		**Diseño del panel**
		
		Puedes alternar entre dos distribuciones desde el menú de usuario:
		
		* **Agentic:** Mantiene la barra lateral de hilos y el panel de agentes juntos a la izquierda.
		* **Classic:** Restaura el diseño tradicional enfocado en el editor.
	-  **Edición de código**
	
		-  **Atajos**
		
			* **Paleta de Comandos (`Ctrl + Shift + P`):** Es el menú universal de Zed. Escribes lo que quieres hacer (por ejemplo, cambiar el tema, instalar una extensión) y lo ejecutas con Enter.
			* **Panel de Proyecto (`Ctrl + Shift + E`):** Abre el árbol de archivos a la izquierda para crear, borrar o renombrar carpetas y ver qué archivos tienen cambios o errores de un vistazo.
			* **Buscador de Archivos (`Ctrl + P`):** Te permite abrir cualquier archivo del proyecto escribiendo solo un par de letras de su nombre, sin buscar en carpetas.
			* **Buscador de Texto (`Ctrl + Alt + F`):** Una búsqueda rápida de texto plano en todo el proyecto. Si necesitas filtros más avanzados, te permite saltar a la búsqueda completa.
			* **Búsqueda de Proyecto (`Ctrl + Shift + F`):** La búsqueda avanzada de la que hablamos antes. Te devuelve los resultados en un **multibuffer** para que puedas editar las coincidencias directamente en el sitio.
			* **Ir a la definición (`F12` o `Ctrl + Clic`):** Te transporta instantáneamente a la línea exacta donde fue creada una función o variable. Si hay varias definiciones, te las abre en un multibuffer.
			* **Jerarquía de llamadas (`Ctrl + K` y luego `Ctrl + H`):** Muestra una ventana para ver **qué funciones llaman** a la función en la que estás situada, o a la inversa (qué funciones llama ella). Muy útil para entender flujos de código complejos.
			* **Símbolo en el archivo actual (`Ctrl + Shift + O`):** Despliega un menú flotante con la lista de funciones, clases y variables de tu archivo actual para saltar a ellas al instante.
			* **Símbolo en todo el proyecto (`Ctrl +_T`):** Busca una función o clase específica en **cualquier** archivo de tu proyecto.
			* **Panel Outline (`Ctrl + Shift + B`):** Abre un panel lateral persistente con el índice de símbolos del archivo actual.
			* **Selector de pestañas (`Ctrl + Tab`):** Funciona igual que el alt-tab de Windows, pero para tus archivos abiertos. Te muestra las pestañas ordenadas por uso reciente para que saltes de una a otra sin soltar la tecla Ctrl.
			
			**Tabla resumen de atajos (para Windows/Linux)**
			
			* **Paleta de comandos:** `Ctrl + Shift + P`
			* **Abrir archivo:** `Ctrl + P`
			* **Búsqueda de proyecto:** `Ctrl + Shift + F`
			* **Búsqueda rápida de texto:** `Ctrl + Alt + F`
			* **Ir a definición:** `F12`
			* **Buscar referencias:** `Alt + Shift + F12`
			* **Símbolos en el archivo:** `Ctrl + Shift + O`
			* **Símbolos en el proyecto:** `Ctrl + T`
			* **Panel Outline:** `Ctrl + Shift + B`
			* **Selector de pestañas:** `Ctrl + Tab`
			* **Panel de proyecto (árbol):** `Ctrl + Shift + E`

			**Acceso rápido (Atajos para Windows/Linux)**
			
			-  **Abrir la terminal:** Presiona **`Ctrl + \``** para alternar/mostrar el panel de la terminal, o **`Ctrl + ~`** para abrir una terminal nueva.
			-  **Ejecutar una tarea o comando:** Presiona **`Ctrl + Shift + R`** para abrir el selector de tareas e introducir cualquier comando de consola.
			-  **Iniciar el depurador:** Presiona **`Ctrl + Shift + D`** para abrir el panel de depuración y elegir una configuración.
			-  **Ejecutar código interactivamente (REPL):** Selecciona un fragmento de código (por ejemplo, en Python o TypeScript) y presiona **`Ctrl + Shift + Enter`** para correrlo en directo.
		-  **Terminal**
		
			1. **¿Qué son y dónde se guardan?**
			
				Las tareas son scripts o comandos de terminal que puedes guardar para reutilizar. Se pueden definir en dos lugares:
				
				* **Globales:** En tu archivo `~/.config/zed/tasks.json` (disponibles en cualquier proyecto).
				* **Locales del proyecto:** En `.zed/tasks.json` dentro de la carpeta de tu proyecto de trabajo.
			2. **Acciones principales**
			
				* **`task: spawn`:** Abre un menú flotante con todas las tareas disponibles para el archivo actual.
				* **`task: rerun`:** Vuelve a ejecutar la última tarea que lanzaste.
			3. **El gran poder: Variables de contexto**
			
				Las tareas de Zed pueden leer información del archivo en el que estás trabajando en ese momento mediante variables de entorno especiales. Algunas de las más útiles son:
				
				* **`$ZED_FILE`:** Ruta absoluta del archivo actual.
				* **`$ZED_FILENAME`:** Solo el nombre del archivo (ej. `main.py`).
				* **`$ZED_SELECTED_TEXT`:** El texto que tengas seleccionado en el editor.
				* **`$ZED_WORKTREE_ROOT`:** La ruta raíz de tu proyecto.
				
				*Ejemplo:* Puedes crear una tarea cuyo comando sea `python3 $ZED_FILE` para ejecutar siempre el script de Python que tengas abierto en ese instante con solo pulsar una tecla.
			4. **Automatización y Hooks (Ganchos)**
			
				Puedes configurar tareas para que se ejecuten **automáticamente** ante ciertos eventos de Zed (por ejemplo, mediante el hook `create_worktree`, que clona o copia archivos de configuración como el `.env` automáticamente al crear una nueva rama o entorno de trabajo Git).
			5. **Compatibilidad con VS Code y Scripts Bash**
			
				*  **Formato de VS Code:** Zed puede importar automáticamente las tareas estructuradas en archivos `.vscode/tasks.json` (como scripts de npm, gulp, o comandos de terminal).
				*  **Scripts Bash:** Si abres un archivo `.sh` o `.bash`, Zed lo detecta automáticamente como ejecutable y lo añade al selector de tareas.
		-  **Debugger**
		
			1. **Lenguajes soportados**
			
				Zed incluye soporte nativo o mediante extensiones para depurar código en una gran variedad de lenguajes:
				
				*  **Nativos (integrados):** C, C++, Go, JavaScript, PHP, Python, Rust y TypeScript.
				*  **Mediante extensiones:** Java, Ruby y Swift.
			2. **Cómo empezar a depurar**
			
				*  **La forma rápida (`F4`):** Presiona `F4` (o ejecuta el comando `debugger: start`) para abrir el modal de procesos. Zed te mostrará automáticamente una lista contextual con tareas preconfiguradas basadas en tus tests o funciones principales (como `main`).
				*  **Configuración manual (`.zed/debug.json`):** Para lenguajes como C o C++ (o si necesitas una configuración muy específica), puedes crear un archivo `.zed/debug.json` en la raíz de tu proyecto detallando el adaptador y los parámetros de ejecución. También es compatible con el archivo de configuración clásico de VS Code (`.vscode/launch.json`).
			3. **Puntos de interrupción (*Breakpoints*)**
			
				*  **Poner un breakpoint:** Haz clic con el ratón justo al lado del número de línea en el margen del editor (gutter).
				*  **Opciones avanzados:** Si haces clic derecho sobre el icono del punto de interrupción en el margen, puedes:
				
					**Opciones del depurador (Breakpoints)**
					
					* **Set Breakpoint (Establecer punto de interrupción):** Es el clásico freno de mano. Detiene la ejecución de tu programa justo en esa línea para que puedas inspeccionar las variables, el estado de la memoria y decidir cómo continuar paso a paso.
					* **Set Log Breakpoint (Establecer punto de interrupción con registro):** En lugar de pausar la ejecución del programa (lo cual puede congelar una app o interrumpir un bucle), **escribe un mensaje en la consola** cada vez que el código pasa por ahí. Es ideal para hacer *prints* automáticos sin tener que modificar tu código fuente ni compilar de nuevo.
					* **Set Condition Breakpoint (Establecer punto de interrupción condicional):** Pausa el programa **únicamente si se cumple una regla matemática o lógica** que tú escribas (por ejemplo, `i == 50`). Te ahorra tener que darle 49 veces al botón de "continuar" en un bucle largo hasta llegar al momento que te interesa.
					* **Set Hit Condition Breakpoint (Establecer punto de interrupción por contador de impactos):** Le indica al depurador que ignore las primeras $N$ veces que el programa pasa por esa línea y que **solo se detenga a partir de la vez número $X$** (por ejemplo, detenerse exactamente en la décima iteración de un bucle).
					
					**Opciones de navegación y control de código**
					
					* **Open Git Blame (Abrir autoría de Git):** Te muestra qué usuario modificó esa línea de código por última vez, en qué fecha y en qué commit. Es una herramienta clave para rastrear el origen de una función o entender por qué se escribió un fragmento de código específico.
					* **Add Bookmark (Añadir marcador):** Coloca una marca permanente o un indicador en esa línea de código. Te permite saltar rápidamente a puntos clave de tus archivos más adelante, sin importar en qué parte del proyecto estés trabajando.
			4. **Opciones de configuración clave**
			
				Puedes personalizar el comportamiento del depurador añadiendo estas opciones en tu archivo `settings.json`:
				
				*  **`debugger.dock`:** Define dónde se muestra el panel de depuración (`"bottom"`, `"left"` o `"right"`).
				*  **`debugger.stepping_granularity`:** Controla qué tan fino es el avance paso a paso al depurar (`"statement"`, `"line"` o `"instruction"`).
				*  **Valores en línea (*Inlay Hints*):** Muestra los valores actuales de las variables directamente junto al código mientras depuras (puedes activarlo o desactivarlo con `"inlay_hints.show_value_hints"`).
		-  **REPL**
		
			1. **¿Cómo funciona?**
			
				* **Ejecución interactiva:** Seleccionas una línea, un bloque o dejas el cursor en una sección y presionas **`Ctrl + Shift + Enter`** (el comando por defecto para `repl: run`).
				* **Resultados en línea:** El resultado de la ejecución se muestra de forma inmediata justo debajo de tu código.
				* **Modo Celdas (*Cell Mode*):** Si escribes separadores de celdas como `# %%` (en Python) o `// %%` (en TypeScript), puedes dividir un archivo normal de texto para que se comporte como un cuaderno interactivo (estilo Jupyter Notebook), ejecutando el código celda por celda.
			2. **Configuración para Python (Lo que te interesa)**
			
				Dado que usas Python, para que el REPL funcione necesitas tener instalado el paquete `ipykernel` en tu entorno virtual o global.
				
				Si en algún momento creas un entorno virtual y Zed detecta que le falta el paquete, **el propio Zed te mostrará la opción atenuada y, al seleccionarla, instalará `ipykernel` por ti automáticamente**. Si prefieres hacerlo a mano en tu terminal, los comandos habituales son:
	
				```bash
				pip install ipykernel
				python -m ipykernel install --user
				```

				También puedes definir un núcleo predeterminado para tus lenguajes favoritos añadiendo esto a tu `settings.json`:

				```json
				{
				  "jupyter": {
				    "kernel_selections": {
				      "python": "tu-entorno-o-kernel"
				    }
				  }
				}
				```
			3. **Otras funciones útiles**
			
				*  **Entrada interactiva:** Si tu código de Python usa funciones como `input()`, el REPL de Zed te desplegará una caja de texto interactiva abajo del resultado para que escribas tu respuesta y presiones Enter.
				*  **Limpiar salidas:** Puedes borrar los resultados generados ejecutando el comando `repl: clear outputs` desde la paleta de comandos.
				*  **Actualizar núcleos:** Si instalas nuevos kernels de Jupyter y Zed no los detecta al momento, puedes refrescarlos ejecutando `repl: refresh kernelspecs`.
		-  **Git**
		
			1. **Panel de Git y estado del repositorio**
			
				-  **Panel visual:** Te muestra el estado de tu árbol de trabajo, los cambios realizados y el área de preparación (_staging_). Se actualiza en tiempo real incluso si haces cambios desde la terminal del sistema.
				-  **Activación de repositorios:** Los repositorios se activan automáticamente según la estructura de tu proyecto. Puedes controlar esto con la profundidad de escaneo (`file_scan_depth`).
				-  **Personalización:** Puedes cambiar la posición del panel (izquierda, derecha o abajo) y alternar entre una vista de lista plana o una **vista en árbol** jerárquica por carpetas.
			2. **Flujo de preparación (_Staging_) y confirmaciones (_Commits_)**
			
				-  **Preparación flexible:** Puedes usar el panel de Git o la vista de diferencias de proyecto (_Project Diff_, con `ctrl-g d`) para preparar (_stage_) o descartar bloques específicos (_hunks_) de código de forma individual o completa.
				-  **Dos editores de commit:**
				    
				    - Un campo rápido en la parte inferior del panel de Git (pulsa `ctrl-enter` para confirmar).
				    - Un editor expandible (`shift-escape`) para mensajes más largos.
				-  **Deshacer un commit:** Justo después de confirmar un cambio, aparece una barra en el panel con el botón **"Uncommit"**, que ejecuta un `git reset HEAD^ --soft` de manera inmediata.
			3. **Funciones avanzadas: Trabajo diario y Git Worktrees**
			
				-  **Git Worktrees:** Te permiten mantener múltiples copias de trabajo del mismo repositorio en disco al mismo tiempo para trabajar en diferentes ramas en paralelo sin alterar tu espacio principal (accedes mediante el selector o el atajo `alt-ctrl-shift-w`).
				-  **Conflictos de fusión (_Merge Conflicts_):** Zed destaca visualmente los conflictos de código (verde para tus cambios, azul para los entrantes) y ofrece botones directos para aceptar los cambios de una rama, de la otra, o combinar ambos (_Use Both_).
				-  **Stashes:** Puedes guardar temporalmente tus cambios con o sin archivos no rastreados usando las acciones de _stash_, y gestionarlos cómodamente desde su propio selector o vista de diferencias.
			4. **Inteligencia artificial en Git (Commits con IA)**
			
				-  Zed te permite generar mensajes de confirmación automáticamente utilizando un modelo de lenguaje (LLM).
				-  Si estás en el campo de texto del commit, haz clic en el icono del lápiz o presiona **`alt-l`** (o ejecuta `git: generate commit message`) para que la IA redacte el mensaje por ti basándose en tus cambios actuales. Puedes personalizar las instrucciones de formato en tu archivo de configuración de agente (`settings.json`).
			5. **Enlaces y enlaces permanentes (_Permalinks_)**
			
				-  **Integración con servicios:** Los hashes de commits y las referencias a incidencias o pull requests en plataformas como GitHub, GitLab, Bitbucket, Gitea, etc., se convierten automáticamente en enlaces interactivos.
				-  **Permalinks:** Puedes copiar o abrir un enlace permanente exacto de una línea o selección de código haciendo clic derecho y seleccionando _Copy Permalink to Line_.
		- **Modelines**
		
			Utiliza los **Modelines** (líneas de modo), que son comentarios especiales situados al principio o al final de un archivo para configurar opciones específicas de ese archivo (como el tamaño de las pestañas o la indentación) sin alterar la configuración global del editor.
			
			1. **¿Qué son y cómo funcionan?**
			
				* Son comentarios que lee el editor para aplicar ajustes locales de formato o lenguaje al archivo actual.
				* **Compatibilidad:** Zed admite los formatos tradicionales de **Emacs** y de **Vim**.
				* **Dónde se buscan:** Se escanean por defecto en el primer kilobyte del archivo (puedes controlar cuántas líneas busca con el ajuste `"modeline_lines": 5`, o desactivarlos por completo poniendo `0`).
			2. **Ejemplos de formatos soportados**
			
				* **Formato Emacs:** **`# -*- mode: python; tab-width: 4; indent-tabs-mode: nil; -*-`**
				* **Formato Vim:** **`# vim: set ft=python ts=4 sw=4 et:`**
			3. **Ajustes principales que puedes controlar**
			
				Dependiendo del formato que uses, Zed traduce automáticamente las opciones a su propia configuración interna. Entre las más útiles se encuentran:
				
				* **Tipo de archivo / Lenguaje** (`mode` / `filetype` o `ft`)
				* **Tamaño de tabulación** (`tab-width` / `tabstop` o `ts`)
				* **Uso de espacios en lugar de tabulaciones** (`indent-tabs-mode` / `expandtab` o `et`)
				* **Longitud preferida de línea** (`fill-column` / `textwidth` o `tw`)
			 
			**Reglas de prioridad**:
			
			4. Si un archivo tiene ambos estilos, los comandos de **Emacs** tienen preferencia sobre los de **Vim**.
			5. Las líneas situadas al **principio** del archivo tienen prioridad sobre las que se encuentran al final.
	-  **Desarrollo remoto**

		1. **¿Cómo funciona?**
		
			*  **Arquitectura dividida:** Tu máquina local ejecuta la interfaz de Zed, procesa la IA, analiza la sintaxis y guarda los cambios no guardados. El servidor remoto ejecuta el código fuente, los servidores de lenguaje (LSP), las tareas, la terminal y los *debuggers*.
			*  **Conexión:** Todo se comunica mediante **SSH**, aprovechando la configuración de tu archivo `~/.ssh/config` y permitiendo el reenvío de puertos (*port forwarding*).
		2. **Cómo conectarte por primera vez**
		
			1. Abre el diálogo de proyectos remotos con el atajo **`Alt + Ctrl + Shift + O`**.
			2. Haz clic en **"Connect New Server"** e introduce tu comando de SSH (por ejemplo, `usuario@tu-servidor`).
			3. Zed se conectará, descargará automáticamente el servidor remoto necesario y te pedirá que elijas una ruta o carpeta para abrir.
			
			**Nota**: También puedes iniciar una conexión directamente desde la línea de comandos con `zed ssh://usuario@host/ruta`.
		3. **Configuración y opciones clave (`settings.json`)**
		
			Puedes gestionar tus conexiones en el archivo de configuración global:
		
			*  **Conexiones SSH:** Puedes definir parámetros avanzados como puertos específicos, claves de identidad o reenvío de puertos:
		
			```json
			{
			  "ssh_connections": [
			    {
			      "host": "192.168.1.10",
			      "port": 22,
			      "username": "me",
			      "args": ["-i", "~/.ssh/work_id_file"],
			      "port_forwards": [{ "local_port": 8080, "remote_port": 80 }]
			    }
			  ]
			}
			```
		
			*  **Carga de binarios si hay restricciones:** Si el servidor remoto no tiene salida libre a Internet para descargar el binario de Zed, puedes activar `"upload_binary_over_ssh": true` para enviarlo desde tu ordenador local.
		4. **Soporte para WSL (Windows)**
		
			Si usas Windows, Zed permite interactuar de forma nativa con **WSL** (Windows Subsystem for Linux), permitiéndote abrir carpetas locales dentro de un contenedor WSL o conectarte directamente a distribuciones ya existentes desde el panel de proyectos remotos.
		5. **¿Dónde se aplican los ajustes y extensiones?**
		
			*  **Ajustes locales:** Afectan a la interfaz (como el tamaño de la fuente).
			*  **Ajustes del servidor:** Afectan al entorno remoto (rutas de servidores de lenguaje, variables de entorno para proxies, etc.).
			*  **Ajustes del proyecto:** Afectan al código (indentación, formateadores).
			*  *Importante:* Las extensiones que tengas instaladas localmente se propagan automáticamente al servidor remoto para garantizar que el resaltado y los lenguajes funcionen a la perfección.
	-  **Environment Variables**

		1. **¿De dónde saca Zed las variables de entorno?**
		
			Dependiendo de cómo inicies el editor, el origen de las variables varía:
			
			*  **Iniciado desde la CLI (Línea de comandos):**
			  
				* Zed hereda directamente las variables de la sesión de terminal desde donde lo abriste (ej. si haces `export MY_ENV_VAR=hello` y luego `zed .`, esa variable estará disponible). A partir de la versión 0.152.0, esto siempre funciona sin importar si ya había otra ventana de Zed abierta.
			*  **Iniciado desde el Dock, Lanzador o Gestor de Ventanas:**
			  
				*  Al no tener una terminal previa, Zed inicia una **shell de inicio de sesión (*login shell*)** en el directorio de usuario para capturar un entorno base.
				*  Además, al abrir un proyecto específico, Zed ejecuta *otra* shell en la carpeta raíz de ese proyecto para capturar variables locales (útil para herramientas como `direnv`, `asdf` o `mise` que cambian según el proyecto).
		2. **¿Cómo se usan en las distintas funciones?**
		
			*  **Tareas (*Tasks*) y Terminal integrada:**
			
				Utilizan un entorno combinado por orden de prioridad (de menor a mayor):
				
				1. El entorno general del proceso Zed.
				2. El entorno de la CLI (si se abrió por comandos).
				3. O el entorno específico del proyecto obtenido mediante la shell en su carpeta raíz.
				4. Variables opcionales configuradas explícitamente en los ajustes.
			*  **Búsqueda de Servidores de Lenguaje (LSP):**
			  
				Para lenguajes que buscan sus binarios en el `$PATH` (como Go, Zig, Rust, C o TypeScript), Zed utiliza:
				
				* El entorno de la CLI (si se abrió por comandos).
				* O el entorno específico del proyecto obtenido en su carpeta raíz.
			*  **Ejecución de Servidores de Lenguaje:**
			  
				* Heredan el entorno general de Zed.
				* Si el servidor se encontró dentro del `$PATH` del proyecto, se le pasa ese entorno específico del proyecto. Si no, se instala globalmente y hereda el entorno base de Zed (y de la CLI si aplica).
	-  **Dev Containers**
	
		1. **Requisitos previos**
		
			*  **Motor de contenedores:** Debes tener **Docker** o **Podman** instalado y disponible en tu `$PATH`. Si usas Podman, debes activar la opción `"use_podman": true` en tu `settings.json`.
			*  **Configuración:** El proyecto debe incluir una carpeta y archivo de configuración `.devcontainer/devcontainer.json`.
			*  **BuildKit:** Por defecto, Zed usa BuildKit para compilar las imágenes si está disponible. Si tu motor no lo soporta (por ejemplo, Apple Container con puente API), puedes desactivarlo en el `settings.json` añadiendo `"dev_container_use_buildkit": false`.
		2. **¿Cómo abrir un Dev Container en Zed?**
		
			* **Aviso automático:** Al abrir un proyecto que contenga un archivo `.devcontainer/devcontainer.json`, Zed te mostrará un aviso preguntándote si deseas abrirlo en el contenedor. Al aceptar, compilará la imagen (si es necesario), lanzará el contenedor y reconectará el proyecto.
			* **Apertura manual:** Si cerraste el aviso, puedes abrirlo en cualquier momento desde la paleta de comandos con **"Project: Open Remote"** o abriendo el modal de proyectos remotos con el atajo **`Alt + Ctrl + Shift + O`** y seleccionando **"Connect Dev Container"**.
		3. **¿Cómo funciona por dentro?**
		
			Una vez conectado, Zed ejecuta las tareas, terminales y servidores de lenguaje (LSP) **dentro del contenedor**.
			
			Además, puedes especificar extensiones de Zed directamente en el archivo de configuración bajo el campo de personalizaciones:
		
			```json
			{
			  "customizations": {
			    "zed": {
			      "extensions": ["vue", "ruby"],
			    },
			    "vscode": {
			    },
			    "codespaces": {
			    },
			  }
			}
			```
		
			* **⚠️ Limitación importante:** Modificar el archivo `devcontainer.json` no reconstruye ni recarga el contenedor de forma automática. Si haces cambios en la configuración, deberás detener el contenedor manualmente (ej. con `docker kill`) y volver a abrir el proyecto en Zed.
-  **[Resaltado de lenguaje incrustado](https://zed.dev/docs/languages/python#embedded-language-highlighting)**

	Zed soporta el resaltado de sintaxis para el código incrustado en cadenas de Python añadiendo un comentario con el nombre del lenguaje.

	```sql
	# sql
	query = "SELECT * FROM users"
	
	#sql
	query = """
	    SELECT *
	    FROM users
	"""
	result = func( #sql
	    "SELECT * FROM users"
	)
	```














































