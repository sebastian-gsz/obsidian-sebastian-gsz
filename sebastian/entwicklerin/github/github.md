
-  **Enlaces**

	-  **Internos**
	-  **Externos**

		-  **GitBooks**
		
			-  **Documentación**
			
				- **[Documentación GitBooks ](https://gitbook.com/docs)**
				- **[Documentación GitBook para GitHub Copilot ](https://github.com/marketplace/gitbook-for-github-copilot?tab=readme)**
		-  **Learning**
		
			-  **[GitHub CLI ](https://cli.github.com/)**
			-  **[GitHub Blog ](https://github.blog/)**
			-  **[GitHub Learn ](https://learn.github.com/dashboard)**
			-  **[Encuentra el curso adecuado para ti ](https://learn.github.com/courses?product=GitHub%20Copilot)**
		-  **[Software libre](trash-projects-hackathon-or-github.md)**
		-  **GitHub Copilot**
		
			- **[GitHub ](https://github.com/)**
			- **[GitHub Blog ](https://github.blog/?utm_campaign=2023q3-em-ww-GDC-CopilotForBusiness-Azure)**
			- **[GitHub Copilot ](https://github.com/features/copilot)**
			- **[Seminarios web ](https://github.com/roadmap-webinar-series?utm_campaign=2023q3-em-ww-GDC-CopilotForBusiness-Azure)**
			- **[Copilot Pro - Settings ](https://github.com/settings/copilot/features)**
			- **[Awesome GitHub Copilot ](https://awesome-copilot.github.com/)**
		-  **[GitHub for Students ](https://education.github.com/pack)**
		
			-  **Developer**
			  
				-  **[imgbot ](https://imgbot.net/github-students/)**
				
					-  **[Repositorio ](https://github.com/imgbot/Imgbot)**
					-  **Personalizar ``.imgbotconfig``**
					
						#### Componentes de la configuración
						
						El archivo es un formato **JSON** que debe ubicarse en la raíz del repositorio. A continuación, detallo las opciones clave que se observan:
						
						-  **Schedule**: Define la frecuencia con la que el bot revisa el repositorio buscando imágenes para optimizar (`daily`, `weekly`, `monthly`).
						-  **IgnoredFiles**: Permite excluir imágenes específicas mediante extensiones, nombres de archivo o rutas de carpetas. Esto es vital para evitar que el bot altere activos intencionalmente sin comprimir o imágenes protegidas.
						-  **AggressiveCompression**: Activa algoritmos de compresión más intensos para reducir el peso al máximo.
						-  **MinKBReduced**: Establece un umbral de tamaño. El bot no creará una solicitud de extracción (PR) a menos que la reducción de tamaño supere este valor (en KB), evitando así ruido innecesario en el historial.
						-  **PrTitle / PrBody**: Personaliza el contenido y el título de las solicitudes de extracción que el bot genera automáticamente.
						
						{
						    "schedule": "daily", // daily|weekly|monthly
						    "ignoredFiles": [
						        "*.jpg",                   // ignore by extension
						        "image1.png",              // ignore by filename
						        "public/special_images/*", // ignore by folderpath
						    ],
						    "aggressiveCompression": "true", // true|false
						    "compressWiki": "true", // true|false
						    "minKBReduced": 500, // delay new prs until size reduction meets this threshold (default to 10)
						    "prTitle" : "",        
						    "prBody" : "",
						}
				-  **[[termius]]**
				-  **[pageclip ](https://pageclip.co/login?redirect=%2Faccount&error=github-no-email)**
				
					**Pageclip** es un **servicio backend ligero** para manejar formularios web: recibe datos enviados desde formularios (incluyendo archivos), los almacena y te permite acceder a esos envíos sin tener que programar ni desplegar un servidor propio. Es ideal para prototipos, sitios estáticos y proyectos donde no quieres gestionar infraestructura de backend.
				-  **[[configcat]]**
				-  **[todiagram ](https://todiagram.com/editor)**
				
					-  **[Documentación ToDiagram ](https://todiagram.com/docs)**
				-  **[algoexpert ](https://www.algoexpert.io/questions)**
			-  **Bases de datos**
	
				-  **[popsql ](https://education.github.com/pack/redeem/popsql-student)**
				
					Puedes extraer y analizar datos de las siguientes fuentes de datos provistas para PopSQL
					
					-  **Amazon Athena**
					-  **Azure Synapse**
					-  **BigQuery**
					-  **ClickHouse**
					-  **MySQL**
					-  **PostgreSQL**
					-  **Presto**
					-  **Redshift**
					-  **Snowflake**
					-  **Microsoft SQL Server**
					-  **TimescaleDB**
					-  **Trino**
		-  **[Community Exchange ](https://education.github.com/globalcampus/exchange)**
		-  **[Documentación GitHub ](https://docs.github.com/es)**
-  **[Procesos ](process-git-and-github.md)**
![[barra.gif]]
-  **Git**

	-  **Estructura del directorio**
	
		-  **Anatomía de un directorio `.git`**
		
			- **``HEAD``**: Es un puntero. Indica en qué rama o commit estás trabajando ahora mismo.
			- **``config``**: Se guardan las configuraciones específicas de este repositorio.
			- **``objects/``**: El "almacén". Aquí Git guarda todo el contenido de tus archivos y la historia comprimida.
			- **``refs/``**: Guarda los punteros a tus ramas (heads) y tus etiquetas (tags).
			- **``hooks/``**: Contiene scripts de ejemplo que Git puede ejecutar antes o después de acciones como commit o push.
			- **``index``**: (Aparecerá después de tu primer git add). Es el área de preparación o Staging Area.
		-  **Modelo de datos y ejecución**
		
			Aquí es donde ocurre la "magia". Git no es simplemente un sistema que guarda las diferencias entre un archivo y otro; Git es un **sistema de archivos direccionable por contenido**.
			
			Esto significa que Git toma el contenido de tu archivo, le aplica una fórmula matemática (llamada **SHA-1**) y genera un ID único de 40 caracteres. Si el contenido cambia aunque sea en una coma, el ID cambia totalmente.
			
			**Los tres objetos principales de Git:**
			
			-  **``Blobs`` (Binary Large Objects):** Es como Git guarda el **contenido** de tus archivos. Aquí no importa el nombre del archivo, solo lo que hay dentro. Si tienes dos archivos distintos con el mismo contenido, Git solo guarda un Blob.
			-  **``Trees`` (Árboles):** Es el equivalente a una **carpeta**. El Tree dice: "En esta carpeta hay un archivo llamado `index.html` que corresponde al Blob `abc123...` y una subcarpeta que es el Tree `xyz789...`".
			-  **``Commits``:** Es la "foto" del proyecto en un momento dado. Un commit apunta a un **Tree** raíz y contiene los metadatos: quién lo hizo, cuándo y, lo más importante, quién fue el commit anterior (el padre).
			  
			-  **Actividad**
			
				-  **Crea un archivo: `echo "Hola Git" > prueba.txt`**
				-  **Añádelo al índice: `git add prueba.txt`**
				-  **Busca el objeto creado en el Blob: `ls .git/objects`**
				-  **Lee el contenido desde la base de datos de Git: `git cat-file -p e69de29...`. Sustituye `e69de29...`** por el hash que te aparezca a ti.
				
				Hasta ahora solo has visto uno: el **Blob**.
				
				-  **El blob**
				
					- **¿Qué es?** Un archivo de datos puro.
					- **¿Qué guarda?** Solo el contenido. No guarda el nombre del archivo, ni la fecha, ni los permisos.
					- **Dato curioso:** Si creas 10 copias de una misma imagen con nombres distintos y haces `git add`, Git solo creará **un solo Blob** de 0152d71... porque el contenido es idéntico. Git ahorra espacio así.
				-  **El tree**
				
					- **¿Qué es?** El equivalente a una carpeta.
					- **¿Qué guarda?** Una lista de nombres de archivos y carpetas, y sus correspondientes IDs de Git (los hashes).
					- **Función:** Es lo que une el nombre `prueba.txt` con el contenido del Blob `0152d71...`.
				-  **El commit**
				
					-  **¿Qué es?** El sobre que envuelve a todo.
					-  **¿Qué guarda?** * Un puntero al **Tree** (la foto completa del proyecto).
					
					    - El autor y el mensaje del commit.
					    - El hash del **Commit Padre** (esto es lo que forma la "cadena" o historial).
				
				**Ejercicio para cerrar**
				
				Para que veas la diferencia entre el **Índice** y el **Directorio de Trabajo**, intenta esto:
				
				- Modifica tu archivo: `echo "Cambio algo" >> prueba.txt`
				- Ejecuta `git status` (o tu alias `git st`).
				
				Git te dirá que el archivo ha cambiado pero no está en el área de preparación. En este momento:
				
				- Tu **Directorio de Trabajo** tiene la versión nueva.
				- Tu **Índice** sigue apuntando al Blob `0152d71...` (la versión vieja).
				
				**Tarea:** Haz `git add prueba.txt` y luego mira de nuevo tu carpeta `.git/objects`. Verás que ha aparecido **otro objeto nuevo**.
		-  **Índice como "Portero"**
		
			Imagina que tu proyecto es una **sesión de fotos de grupo**:
			
			-  **``El directorio de trabajo`` (Tu carpeta):** Es el camerino. Aquí la gente se está cambiando, algunos están despeinados, otros están listos. Hay caos.
			-  **``El índice`` (Staging Area):** Es el **escenario**. Aquí es donde tú, como fotógrafo, decides quién sale en la foto.
			
			    - Si usas `git add archivo.txt`, estás llamando a ese "archivo" para que suba al escenario y se quede quieto.
			    - El **Portero** (el Índice) solo deja pasar al escenario lo que tú le indiques. Si haces cambios en el camerino (tu carpeta) pero no los subes al escenario, el fotógrafo no los verá.
			-  **``El commit``:** Es el **clic de la cámara**. Solo captura lo que está sobre el escenario en ese preciso instante.
			
			**¿Por qué esto es fundamental?**
			
			Sin este "portero", cada vez que hicieras un commit, Git guardaría absolutamente todo lo que hay en la carpeta, incluyendo archivos temporales, errores que estabas probando o archivos de configuración personal.
			
			**El Índice te da el poder de la "Selección Atómica":** Puedes tener 10 archivos modificados, pero usar el "portero" (`git add`) para dejar pasar solo 2 que pertenecen a un mismo arreglo. Así, tus fotos (commits) son limpias y tienen sentido.
		-  **Referencias y ramas**
		
			En otros sistemas de control de versiones, una "rama" es una copia física de todos tus archivos en otra carpeta. En Git, eso sería un desperdicio de espacio. En Git, una **rama** es simplemente un **archivo de texto de 41 bytes** que contiene el hash del último commit que hiciste. Nada más.
			
			**¿Qué es una referencia?**
			
			Es un nombre humano que apunta a un hash de Git. Hay dos tipos principales que verás en tu carpeta `.git/refs`:
				
			-  **Heads:** Son tus ramas locales (ej. `main`, `desarrollo`).
			-  **Tags:** Son puntos fijos en la historia (ej. `v1.0`).
			-  **El misterio del `HEAD`**
			
				Ya viste que el archivo `.git/HEAD` contiene algo como `ref: refs/heads/main`. El `HEAD` es el puntero que le dice a Git: **"Cualquier commit que hagas ahora, ponle la etiqueta de la rama `main`"**.
				
				**Ejercicio materializando la rama**
				
				-  **Asegúrate de que todo esté en el escenario: `git add .`**
				-  **Haz el primer commit: `git cm -m "Primer commit: Estructura de React y prueba.txt"`**
				-  **Mira dentro de la carpeta de referencias:** Ahora que el commit existe, Git ha tenido que crear el puntero. Ejecuta: `ls .git/refs/heads` _(Deberías ver un archivo llamado `main`)_.
				-  **Lee el contenido de la rama: `cat .git/refs/heads/main`**
				
				**🚩 El momento de la verdad**
				
				**Al ejecutar ese `cat`, verás un código de 40 caracteres (el hash del commit). Para confirmar que has entendido la conexión total, haz lo siguiente:**
				
				- Copia ese hash que te dio el archivo `main`.
				- Ejecuta: `git cat-file -t [TU_HASH]` (esto te dirá el **tipo** de objeto).
				- Ejecuta: `git cat-file -p [TU_HASH]` (esto te mostrará el **contenido** del objeto commit).
		-  **Los hooks**
		
			Los **Hooks** (o "ganchos") son scripts que Git ejecuta automáticamente cada vez que ocurre un evento importante en el ciclo de vida de tu repositorio.
			
			**¿Dónde viven?**
			
			Están en la carpeta que viste al principio: `.git/hooks`. Si entras ahora mismo y haces un `ls`, verás un montón de archivos con la extensión `.sample`. Ejecuta: `ls .git/hooks`
			
			**¿Cómo funcionan?**
			
			Git busca archivos con nombres específicos en esa carpeta. Si el archivo existe y es **ejecutable**, Git lo corre.
				
			- **`pre-commit`**: Se ejecuta _antes_ de que escribas el mensaje del commit. Si el script falla (devuelve un error), Git cancela el commit. Es ideal para pasar un corrector de errores (Linter).
			- **`post-commit`**: Se ejecuta justo después de terminar el commit. Sirve para enviar notificaciones.
			- **`pre-push`**: Se ejecuta antes de subir cambios a GitHub. Es el lugar perfecto para correr tus tests; si los tests fallan, Git no sube nada para no romper el código de tus compañeros.
			
			**Ejercicio: Creando tu primer "Guardián"**
			
			-  Crea el archivo: `touch .git/hooks/pre-commit`
			-  Dale permisos de ejecución: `chmod +x .git/hooks/pre-commit`
			-  Añade una acción sencilla: 
			
				`#!/bin/sh`
				`echo "🔍 Git Hook: Validando el código antes de permitir el commit..."`
	-  **Guía completa de Git y GitHub**
	
		-  **Configuración inicial y conceptos básicos**
		
			Para comenzar a usar **Git** en un proyecto, necesitas identificarte. La configuración es local al usuario del sistema operativo y no está vinculada a una cuenta remota como **GitHub**. 
			
			Ejemplo: **[[sebastian/assets/files/gitconfig_example|.gitconfig]]**
			
			- **`git config --global user.name "Tu Nombre"`**: Configura tu nombre de usuario de forma global para todos tus proyectos en tu máquina.
			- **`git config --global user.email "tu_email@ejemplo.com"`**: Configura tu dirección de correo electrónico global.
			- **`git config --list --global`**: Muestra una lista de las configuraciones globales que has establecido, lo que te permite verificar que la información es correcta.
			
			**Sintaxis de opciones**
			
			El instructor hace una distinción muy importante en la sintaxis de **Git**:
			
			- **`--` (Doble guión)**: Indica una palabra completa o un comando largo. Por ejemplo, **`git --version`** es la palabra `version` completa.
			- **`-` (Guión simple)**: Se utiliza para abreviaturas de una o más letras. Por ejemplo, en el futuro comando **`git commit -am "Mensaje"`**, el **`-a`** y el **`-m`** son abreviaturas de las opciones **`--all`** y **`--message`**.
		-  **Fundamentos de un repositorio**
		
			-  **Inicialización (`git init`)**
			
				Cuando ejecutas **`git init`**, Git crea una carpeta oculta llamada **`.git`**. Contiene:
				
				- **El historial de cambios**: todas las "fotografías".
				- **La configuración**: tus preferencias personales.
				- **Las ramas**: los diferentes caminos o versiones.
			-  **Ciclo de vida de los archivos**
			
				Git no le da seguimiento a todos los archivos de tu proyecto de forma automática. Solo se preocupa por los archivos que tú le has dicho que son importantes. Para Git, hay dos tipos de archivos:
				
				- **``Archivos rastreados`` (tracked)**: Son los archivos a los que Git les está haciendo seguimiento. Esto incluye a todos los archivos que estaban en tu último `commit`. Si borras o cambias uno de estos, Git se da cuenta y puedes usar `git checkout -- .` para recuperarlos.
				- **``Archivos no rastreados`` (untracked)**: Son los archivos que están en tu carpeta de proyecto, pero que Git ignora por completo. Si creas un archivo nuevo y no le haces `git add` y `git commit`, Git no lo conoce. Si lo borras, Git no tiene un historial para recuperarlo. Es como si el archivo nunca hubiera existido para él.
				  
				Por eso, en la clase, cuando se borró el archivo `otra cosa.html`, Git no pudo restaurarlo. Simplemente no le estaba dando seguimiento.
			-  **Estado actual (`git status`)**
			
				Muestra el estado del repositorio:
				
				1. **En la rama `master`**: Esto te dice en qué rama de tu proyecto estás trabajando. La rama **`master`** (o **`main`**) es, por convención, la rama principal del proyecto.
				2. **Aún no hay confirmaciones**: Esto significa que no has guardado ningún cambio en el historial del proyecto. Una **confirmación** (**`commit`**) es como una "foto" o un punto de guardado en el tiempo. Como es el principio del proyecto, es normal que no haya ninguna aún.
				3. **Archivos con seguimiento**: Esta es la parte más importante del mensaje. Te informa que hay archivos en tu directorio de trabajo que **Git** ha detectado, pero que no está "rastreando" aún.
				
					**``Archivos sin seguimiento``**: Son los archivos y carpetas que aparecen en la lista (como **`index.html`** o la carpeta **`css/`**). Para que **Git** comience a rastrear los cambios en estos archivos, debes usar el comando **`git add <archivo>`**.
			-  **Primeros comandos esenciales**
			
				Una vez que has inicializado tu repositorio con `git init`, es hora de empezar a usar los comandos que te permiten guardar esas "fotografías" de tu proyecto.
				
				- **`git status`**: Este comando te dice en qué estado se encuentra tu repositorio. Es como si le preguntaras a Git: "¿Hay algo nuevo o modificado desde la última vez que guardé una foto?" Te dirá qué archivos son nuevos, cuáles se han modificado y cuáles están listos para ser guardados.
				- **`git add`**: Cuando `git status` te muestra que hay archivos nuevos o modificados, tienes que decirle a Git cuáles de ellos quieres incluir en la siguiente "fotografía". Esto se hace con el comando `git add`. Puedes añadir archivos uno por uno (`git add index.html`), o puedes usar `git add .` para añadir todos los archivos nuevos y modificados a la vez. Al hacer esto, los archivos pasan a una zona de espera, como un estudio de fotografía donde los preparas antes de tomar la foto final.
				- **`git commit`**: Una vez que has añadido los archivos que quieres guardar, usas `git commit` para tomar la "fotografía" definitiva. Con este comando, Git guarda el estado de tu proyecto en ese momento y crea un punto de guardado en el historial. Es obligatorio añadir un mensaje al `commit` (usando `-m "Tu mensaje"`), que debe ser una descripción clara y corta de lo que has hecho. Por ejemplo: `"Añadida la página principal y estilos iniciales"`.
				
					- **`-a` (abreviatura de `--all`)**: Le dice a Git que **incluya automáticamente todos los archivos rastreados** que han sido modificados o eliminados. Es decir, no necesitas usar `git add` primero. Esto solo funciona con archivos que ya estaban en tu repositorio (archivos rastreados). Los archivos nuevos, que Git aún no conoce, no se incluirán.
					- **`-m "Nota"` (abreviatura de `--message`)**: Este es el mensaje del _commit_. `Git` requiere que cada _commit_ tenga un mensaje que describa los cambios.
			-  **Explorar el historial (`git log`)**
			
				Piensa en **`git log`** como un diario de tu proyecto. Cuando ejecutas este comando, Git te muestra una lista de todos los _commits_ que has hecho, desde el más reciente hasta el más antiguo.
				
				Cada entrada en este "diario" te da información muy útil sobre cada "fotografía" que tomaste:
				
				- **`commit`**: El identificador único del _commit_ (un código largo y hexadecimal). Es como el número de serie de tu fotografía.
				- **`Author`**: Quién hizo el cambio (tu nombre y correo electrónico).
				- **`Date`**: Cuándo se hizo el cambio.
				- **`Message`**: La descripción que pusiste al hacer el _commit_ (`-m "Tu mensaje"`). Por eso es tan importante que sea clara y significativa, porque con `git log` sabrás de un vistazo qué cambios se hicieron en ese momento.
			-  **Revisar cambios (`git diff`)**
			
				Su principal utilidad es **revisar tus cambios antes de guardarlos**. Antes de hacer un `commit`, puedes ejecutar `git diff` para asegurarte de que solo vas a guardar lo que realmente quieres. Es una herramienta muy útil para detectar errores o cambios no deseados antes de que queden registrados en el historial de tu proyecto.
		-  **Gestión de archivos y correcciones básicas**
		
			-  **Recuperar cambios (`git checkout -- .`)**
			
				Imagina que estás trabajando en un documento importante y, por error, borras un párrafo entero o, peor aún, ¡borras el archivo completo! Sin Git, sería un gran problema. Pero con Git, si ya habías hecho un `commit` (una "fotografía" de tu proyecto), puedes usar el comando **`git checkout -- .`** para restaurar todo a como estaba en el último `commit`.
				
				Este comando es como la función de "deshacer todo" a lo grande. Le dice a Git: "Por favor, ignora todos los cambios que he hecho desde la última vez que guardé una foto, y devuelve todos mis archivos a ese estado". Por eso, en la clase, cuando se borraron todos los archivos o se hicieron cambios incorrectos en el `index.html`, este comando sirvió para restaurarlo todo al instante.
			-  **Sacar archivos del staging (`git reset`)**
			
				Si el *staging area* es un escenario, **`git reset <archivo>`** baja al actor del escenario. El archivo vuelve a estar "no preparado" pero mantiene sus modificaciones.
			-  **Corregir el último commit (`git commit --amend`)**
			
				Imagina que acabas de guardar una "fotografía" (un _commit_), pero te das cuenta de que has cometido un error en el mensaje. En lugar de `"Arreglar el diseño de la web"`, escribiste `"Aregglar el diesño de la wueb"`.
				
				Para corregir esto de forma rápida y sencilla, puedes usar el comando **`git commit --amend`**. Este comando te permite **modificar el último _commit_** que hiciste, ya sea para cambiar el mensaje o para añadir más archivos que se te hayan olvidado. Es importante recordar que este comando solo funciona con **el último _commit_**. Si quieres corregir uno anterior, se necesita una técnica diferente.
		-  **Ramas (Branches) y fusiones**
		
			-  **Concepto de ramas**
			
				Desvíos del camino principal (`master`) para probar ideas, colaborar o aislar funciones sin romper el código estable.
				
				- **Seguridad**: El camino principal (la rama `main` o `master`) siempre se mantiene estable, con el código que funciona.
				- **Colaboración**: Múltiples personas pueden trabajar en diferentes funciones al mismo tiempo, cada una en su propia rama, sin interferir en el trabajo de los demás.
				- **Experimentación**: Puedes probar ideas locas o nuevas funciones sin miedo a romper el proyecto.
			-  **Comandos para ramas**
			
				-  **`git branch`**: Este comando te muestra la lista de ramas que tienes en tu repositorio y te dice en cuál estás trabajando actualmente (la que aparece con un asterisco y, a veces, en otro color).
				-  **`git branch -m <nombre-anterior> <nombre-nuevo>`**: Este comando te permite **renombrar una rama**. Por ejemplo, para cambiar el nombre de la rama principal de `master` a `main`, usarías `git branch -m master main`. Esto es algo que se hace a menudo en los proyectos modernos, como se menciona en el video.
				  
					-  **`git branch <nombre-de-la-rama>`: Crear y moverte entre ramas**
					-  **`git branch`**: Lista ramas.
					-  **`git branch <nombre>`**: Crea una rama nueva.
					-  **`git branch -m <viejo> <nuevo>`**: Renombra una rama.
					-  **`git branch -d <nombre>`**: Borra una rama fusionada.
					-  **`git branch -D <nombre>`**: Fuerza el borrado de una rama.
					-  **`git branch -a <nombre>`:** Listar ramas remotas
				-  **`git checkout <nombre-de-la-rama>`**: Este comando te permite **moverte** a la rama que acabas de crear. Cuando lo ejecutas, Git cambia todos los archivos de tu proyecto para que coincidan con la última versión de esa rama. Es un cambio visible y muy útil.
				-  **`git config --global init.defaultBranch <nombre>`**: Este comando es una **configuración global** que le dice a Git qué nombre debe usar por defecto para la rama principal cada vez que inicies un nuevo repositorio con `git init`. De esta manera, no tendrás que cambiarlo manualmente cada vez.
				-  **`git fetch origin --prune`**: Actualiza tu lista de ramas remotas y borra de tu historial local las referencias a ramas que ya fueron eliminadas en Azure DevOps
			-  **Tipos de fusiones (`git merge`)**
			
				Cuando terminas de trabajar en tu rama (`rama-villanos` en el ejemplo) y quieres que los cambios se unan a la rama principal, usas el comando `git merge`. Git intentará hacer esto de forma automática, y puede suceder de tres maneras:
				
				-  **`Fast-forward merge`**: Ocurre cuando la rama principal no ha tenido ningún cambio desde que creaste tu rama. Git simplemente mueve el puntero de la rama principal hasta el final de tu rama, como si esta nunca se hubiera separado.
				  
					**¿Qué es un fast-forward en detalle?**
					
					Imagine la rama principal (`main`) como una línea recta en el tiempo. Usted crea una nueva rama, trabaja en ella y hace varios _commits_. Mientras tanto, nadie más ha hecho _commits_ en `main`. Al fusionar, Git detecta que no hay divergencia y simplemente mueve el puntero.
					
					- **``Ventaja``:** Mantiene un historial de _commits_ limpio y lineal. No añade _commits_ de fusión innecesarios.
					- **``Desventaja``:** Al no crear un _commit_ de fusión, **se pierde el registro de cuándo y desde dónde se fusionó una rama**.
				-  **`Automatic merge`**: Sucede cuando tanto la rama principal como tu rama han tenido cambios, pero estos cambios no afectan a las mismas líneas de código. Git puede unir los cambios de forma automática sin conflictos, creando un nuevo _commit_ que une ambas ramas.
				-  **`Manual merge`**: Ocurre cuando los cambios en ambas ramas afectan a las mismas líneas de código. Git no puede decidir qué versión de la línea es la correcta, por lo que entra en un **estado de conflicto**. Te pedirá que resuelvas el conflicto manualmente, decidiendo qué líneas de código quieres mantener. Una vez que lo hagas, Git creará un nuevo _commit_ de fusión.
				  
				**Controlando el comportamiento**: `git merge --no-ff <rama>` obliga a crear un _commit_ de fusión para preservar el historial detallado.
			-  **Escenario de desarrollo**
			
				Flujo típico: Trabajas en una rama -> surge urgencia en `master` -> cambias a `master` y arreglas -> vuelves a tu rama -> terminas y fusionas con `master`.
			-  **Eliminar ramas que ya no son necesarias**
			
				 Una vez que has fusionado una rama y ya no la necesitas, es una buena práctica borrarla para mantener tu repositorio limpio.
				
				- **`git branch -d <nombre-de-la-rama>`**: Este comando borra una rama de forma segura. El `-d` (de _delete_) se asegura de que la rama que estás borrando ya haya sido fusionada. **Si Git detecta que hay cambios en esa rama que no han sido fusionados, te avisará y no la borrará.**
				- **`git branch -D <nombre-de-la-rama>`**: Si estás seguro de que quieres borrar la rama, sin importar si los cambios han sido fusionados o no, puedes usar la bandera `-D` (mayúscula). El instructor menciona que esto es útil para borrar ramas experimentales que no llegaron a nada.
			-  **Asignación de rama principal**
			
				-  **Comando:** `git remote set-head origin developer`
				-  **Verificación:** `git branch -r` (Ahora debería decir `origin/HEAD -> origin/developer`).
		-  **Manipulación avanzada del historial**
		
			-  **Combinar _commits_ con `git reset --soft` y `HEAD^`**
			
				A veces, te das cuenta de que has hecho dos o más _commits_ que deberían haber sido uno solo. Aquí entra en juego el comando **`git reset --soft HEAD^`**. Desglosemos lo que hace:
				
				-  **`git reset --soft`**: Este comando deshace el último _commit_ de tu historial, pero **mantiene los cambios en tus archivos**. Es decir, es como si nunca hubieras hecho ese _commit_, pero los cambios están ahí, listos para ser guardados de nuevo. Hay otros tipos de `reset` que sí borran los cambios, pero el `soft` es el más seguro en este caso.
				-  **`HEAD^`**: Esta es una referencia a la versión **anterior** de tu repositorio. Le dice a Git: "Quiero ir al _commit_ justo antes del último".
				
					- **`HEAD^`**: Como ya vimos, esto se refiere al **último _commit_** que has hecho. `HEAD` es la referencia a tu posición actual, y el `^` te mueve uno hacia atrás.
					- **`HEAD^^`**: Esto te mueve **dos _commits_** hacia atrás en el historial.
					- **`HEAD^3`**: Y aquí está la sintaxis que mencionas. Es una forma más corta de decir `HEAD^^^`, y te mueve **tres _commits_** hacia atrás.
				
				Una vez que has hecho el `git reset --soft HEAD^`, el último _commit_ desaparece de tu historial, y los cambios que contenía se vuelven a mostrar como si fueran nuevos. Entonces, puedes añadir los nuevos cambios que querías incluir y hacer un nuevo _commit_ que combine todo en una sola "fotografía" limpia.
			-  **Viaje en el tiempo: `git reset --soft`, `git reset --mixed`, `git reset --hard`**
			
				- **`git reset --soft <commit>`**: Este es el modo más suave. Deshace el _commit_ de tu historial, pero **mantiene los cambios en el _staging area_**. Es decir, los archivos están listos para hacer un nuevo `commit` de inmediato, sin necesidad de usar `git add` de nuevo. Es útil si solo quieres cambiar el mensaje del _commit_ o combinarlo con el siguiente.
				- **`git reset --mixed <commit>`** (el modo por defecto): Este es el término medio. Deshace el _commit_ de tu historial y **saca los cambios del _staging area_**. Los archivos se quedan modificados en tu directorio de trabajo, pero Git los marca como "no preparados" para el _commit_. Es el modo más usado porque te da la oportunidad de revisar los cambios antes de volver a guardarlos. Si usas `git reset` sin especificar `--soft` o `--hard`, este es el modo que usa Git.
				- **`git reset --hard <commit>`**: Este es el modo más agresivo. Deshace el _commit_ de tu historial, **borra los cambios en el _staging area_** y **elimina los cambios de tus archivos**. Básicamente, tu proyecto vuelve exactamente a como estaba en el _commit_ al que apuntaste. Es muy útil, como vimos, para "viajar en el tiempo" y descartar todo lo que ha sucedido después, **pero hay que usarlo con precaución**.
			-  **Recuperar historial perdido (`git reflog`)**
			
				Como has visto en la clase, cuando usas `git reset --hard` para volver a un _commit_ anterior, parece que todos los _commits_ que hiciste después desaparecen. Pero la realidad es que Git no borra nada de inmediato. En lugar de eso, los guarda en un "diario de referencias".
				
				El comando **`git reflog`** te da acceso a ese diario. Muestra una lista de todas las acciones que has realizado en tu repositorio, incluyendo _commits_, `resets`, `merges` y cualquier otro movimiento que haya cambiado la rama principal.
				
				**Es como el historial de navegación de Git.** Cada entrada del `reflog` tiene un identificador (`HEAD@{...}`) y una descripción de lo que sucedió. Lo más importante es que cada acción tiene asociado el _hash_ del _commit_ al que se movió tu `HEAD`.
			-  **Reescribiendo la historia (`git rebase`)**
			
				Imagina que tu rama (`misiones-completadas`) se separó de la rama principal (`master`) hace un tiempo. Mientras tú trabajabas en tus _commits_, tu compañero de equipo hizo cambios en la rama `master`.
				
				-  **`git merge`** crea un nuevo _commit_ de fusión (`merge commit`) que une las dos líneas de tiempo. Esto es útil para mantener un registro exacto de lo que sucedió.
				-  **`git rebase`** toma tus _commits_ de la rama (`misiones-completadas`) y los "reubica" en la cima del último _commit_ de la rama `master`. Esto hace que parezca que tus cambios se hicieron _después_ de los de tu compañero, creando una historia más limpia y fácil de seguir.
				
				-  **`git rebase` vs. `git rebase -i`**
				
					-  **`git rebase`**: Se usa para reubicar tu rama en la punta de otra. En el ejemplo, usas `git rebase master` para actualizar tu rama `misiones-completadas` con los últimos cambios de `master`.
					-  **`git rebase -i`**: Es una herramienta mucho más poderosa. Te permite editar los _commits_ antes de reubicarlos. El instructor menciona cuatro de los usos más comunes:
					
						- **Ordenar _commits_**.
						- **Corregir mensajes de _commits_**.
						- **Unir _commits_**.
						- **Separar _commits_**.
		-  **Almacenamiento temporal (`git stash`)**
		
			Imagina que estás trabajando en una funcionalidad compleja y de repente, tu jefe te pide que corrijas un error urgente en la rama principal. El problema es que tus cambios actuales no están listos para un _commit_.
			
			Ahí es donde entra **`git stash`**. Es como un cajón de sastre en el que puedes guardar temporalmente tus cambios sin tener que hacer un _commit_. Git toma tu directorio de trabajo (los archivos que has modificado) y lo guarda en una pila de "stashes". Una vez que has hecho esto, tu directorio de trabajo queda limpio, permitiéndote cambiar de rama o trabajar en el error urgente sin perder tu progreso.
			
			-  **Guardar y recuperar cambios**
			
				- **`git stash` o `git stash push`**: Guarda tus cambios actuales. Es una buena práctica usar `git stash push -m "Mensaje"` para añadir un mensaje que te ayude a recordar lo que guardaste.
				- **`git stash pop`**: Aplica el `stash` más reciente y lo elimina de la pila.
				- **`git stash apply`**: Aplica el `stash` más reciente, pero lo mantiene en la pila. Esto es útil si quieres aplicar el mismo conjunto de cambios a varias ramas.
			-  **Limpiar y gestionar la pila de `stashes`**
			
				Como viste en la clase, la pila de `stashes` puede llenarse rápidamente con entradas sin nombre (`WIP on master: ...`). Para mantenerla limpia, puedes usar estos comandos:
				
				- **`git stash list`**: Muestra una lista de todos los `stashes` que has guardado.
				- **`git stash show <id_del_stash>`**: Te da un resumen de los cambios en un `stash` específico.
				- **`git stash drop <id_del_stash>`**: Elimina un `stash` específico.
				- **`git stash clear`**: Borra **todos** los `stashes` de forma permanente. Es como vaciar la papelera de reciclaje de Git.
		-  **Etiquetas (Tags)**
		
			Marcadores para versiones importantes (`v1.0`).
			
			-  **Tipos**
			
				-  **Ligeros**: `git tag <nombre>`. Solo un puntero.
				-  **Anotados**: `git tag -a <nombre> -m "Msg"`. Incluyen metadatos (recomendado para releases).
			-  **Gestión**
			
				- **`git show <tag>`**: Ver detalles.
				- **`git tag -d <tag>`**: Borrar.
				- Añadir a commit antiguo: `git tag -a <tag> <hash>`.
		-  **Colaboración remota (Git + GitHub)**
		
			-  **Conceptos**
			
				- **`push`**: Este comando te permite **subir** tus _commits_ locales a un repositorio remoto.
				- **`pull`**: Este comando te permite **descargar** los cambios de un repositorio remoto a tu máquina local.
				- **`clone`**: Este comando es especial. Se usa solo una vez al inicio para **descargar** una copia completa.
			-  **Comandos esenciales**
			
				- **`git remote add origin <URL>`**: Establece una conexión entre tu repositorio local y el remoto.
				- **`git remote -v`**: Lista todos los repositorios remotos a los que tu proyecto está conectado.
				- **`git push -u origin master`**: Comando para tu primer push. El `-u` establece el "upstream" o rama de rastreo, para que después solo escribas `git push`.
			-  **Comando `git pull` y sus estrategias**
			
				El comando **`git pull`** es en realidad una combinación de `git fetch` (traer cambios) y `git merge` (fusionarlos). El **``warning``** que suele aparecer le pide que elija qué estrategia de fusión utilizará por defecto:
				
				- **`git config pull.rebase`**: "Re-aplica" sus _commits_ locales sobre los remotos. Crea un historial lineal, sin _merge commits_.
				- **`git config pull.ff` (Fast-Forward Only)**: Fuerza a Git a usar un `fast-forward` **solo si es posible**. Si ha habido nuevos _commits_ en su rama local, el `pull` fallará y le forzará a resolverlo manualmente. Es una estrategia estricta que asegura un historial perfectamente lineal.
				- **`git config pull.merge` (por defecto)**: Si no se configura nada, Git intentará hacer un `fast-forward` si es posible. Si no, creará un _commit_ de fusión (`merge commit`) para unir las ramas divergentes.
-  **GitHub**

	-  **GitHub Action**
	-  **GitHub Copilot**
	
		-  **Personaliza tu experiencia de GitHub Copilot**
		  
			-  **Instrucciones personalizadas GitHub Copilot**
			
				[[copilot-instructions]]
				
				Las instrucciones personalizadas del repositorio permiten definir estándares específicos que Copilot seguirá automáticamente en todas sus sugerencias dentro del proyecto. Estas instrucciones se almacenan en el archivo: `.github/copilot-instructions.md`
				
				Este archivo proporciona contexto sobre:
				
				- **Propósito del proyecto**
				- **Estructura de carpetas**
				- **Estándares de codificación**
				- **Herramientas clave utilizadas**
				
				**Ejemplo**
				
				-  Project description
				
					This project is an educational website for sharing homework assignments and coding exercises with students. Students can browse, view, and download assignments directly from the portal.
				-  Project structure
				
					- `assignments/` Each homework assignment is stored in its own subfolder with a consistent structure.
					- `templates/` Reusable templates for new content
					- `assets/` Contains the website assets including CSS, JavaScript, images, and configuration files
					- `index.html` The main website page that serves as a static portal for browsing and viewing assignments. Content is configurable via `config.json` file to dynamically generate assignment lists and details.
				-  Project guidelines
				
					- Maintain consistent styling across all pages
					- Keep file and folder names descriptive and organized
				-  Educational standards
				
					When generating content for this project:
					
					- **Learning-focused**: All content should be designed with clear learning objectives and appropriate difficulty levels
					- **Student-friendly**: Use clear, encouraging language that motivates students
			-  **Instrucciones específicas del archivo**
			
				[[assignments.instructions]]
				
				Después de definir los estándares generales del proyecto, el Sr. Johnson quiere asegurarse de que los archivos de asignación sigan una estructura uniforme. Para evitar sobrecargar las instrucciones globales, se crean instrucciones específicas que solo se aplican a los archivos de tareas.
				
				Los archivos `.instructions.md` permiten definir reglas específicas para archivos o carpetas concretas del proyecto. Se activan automáticamente cuando Copilot trabaja en archivos que coinciden con el patrón definido en el campo `applyTo`.
				
				- Se almacenan en `.github/instructions/assignments.instructions.md`
				- Se aplican solo a los archivos que coincidan con el patrón
				- VS Code los detecta automáticamente
				- También pueden agregarse manualmente en Copilot Chat con el botón **Agregar contexto**
			-  **Creación de indicaciones reutilizables**
			
				[[new-assignment.prompt]]
				
				Ahora que has definido instrucciones para las asignaciones, el siguiente paso es **automatizar** la creación de nuevas tareas. Como esta actividad implica múltiples pasos repetitivos, es ideal para usar un archivo de solicitud (`.prompt.md`) que simplifique el proceso con un solo comando.
				
				Los archivos de solicitud son plantillas reutilizables que definen flujos de trabajo comunes. Se activan en Copilot Chat mediante comandos de barra diagonal (`/`) y permiten: `.github/prompts/new-assignment.prompt.md`
				
				- Ejecutar tareas complejas con un solo comando
				- Referenciar otros archivos del proyecto (instrucciones, plantillas, configuraciones)
				- Mantener consistencia en la estructura y estilo de las tareas
	-  **GitHub Spec Kit**
	
		-  **Instalación**
		
			-  **Intento inicial de instalación de `specify-cli`:**
			
			    -  **``Comando``**: `uv tool install specify-cli --from git+https://github.com/github/spec-kit.git`
			    -  **``Resultado``**: `uv` versión 0.9.5 fue instalado exitosamente.
		-  **Implementación de ``specify``**
		
			-  **`specify init FirstProof-SpecKit`**
			
			    Se inicializa el proyecto `FirstProof-SpecKit` usando el repositorio `spec-kit` desde GitHub.
				  
				-  **``Ruta de trabajo``**: C:\Users\jseba\Model Context Protocol
				-  **``Ruta destino``**: C:\Users\jseba\Model Context Protocol\FirstProof-SpecKit
			-  **`initialize specify project`**
			
			    - Verificación de herramientas requeridas (ok)
			    - Selección de asistente AI: gemini
			    - Selección de tipo de script: ps
			    - Descarga de última versión: v0.0.78 (52,879 bytes)
			    - Descarga de plantilla: spec-kit-template-gemini-ps-v0.0.78.zip
			    - Extracción de plantilla
			    - Archivos extraídos: 26 entradas
			    - Resumen de extracción: 2 elementos de nivel superior
			    - Asegurar que los scripts sean ejecutables
			    - Limpieza de archivos temporales
			    - Inicialización de repositorio git (completado)
			    - Finalización del proceso (proyecto listo)
			-  **`agent folder security`**
			
			    - Algunos agentes pueden almacenar credenciales, tokens de autenticación u otros artefactos privados dentro de la carpeta del agente en tu proyecto.
			    - Se recomienda añadir .gemini/ (o partes de esta) al .gitignore para evitar filtraciones accidentales de credenciales.
			-  **`next steps`**
			
			    Ir a la carpeta del proyecto: **``cd FirstProof-SpecKit``**
			    Comenzar a usar comandos con el agente AI:
				
			     - /speckit.constitution - Establecer principios del proyecto
			     - /speckit.specify - Crear especificación base
			     - /speckit.plan - Crear plan de implementación
			     - /speckit.tasks - Generar tareas accionables
			     - /speckit.implement - Ejecutar implementación
			-  **`enhancement commands`**
			
			    Comandos opcionales para mejorar la calidad y confianza de las especificaciones:
				
			     - /speckit.clarify (opcional) - Formular preguntas estructuradas para reducir ambigüedades antes de la planificación (ejecutar antes de /speckit.plan si se usa)
			     - /speckit.analyze (opcional) - Informe de coherencia y alineación entre artefactos (después de /speckit.tasks, antes de /speckit.implement)
			     - /speckit.checklist (opcional) - Generar listas de verificación de calidad para validar la integridad, claridad y coherencia de los requisitos (después de /speckit.plan)
		-  **Línea de tiempo y razonamiento del proceso ``/speckit.specify``**
		
			-  **Recepción del comando y análisis del contexto inicial:**
			
				**``Comando del usuario``: Recibí tu comando ``/speckit.specify`` seguido de la descripción de la característica: "Estoy creando un sitio web moderno para pódcast. Quiero que se vea elegante, algo que destaque. Debe tener una página de inicio con un episodio destacado.**
				
				**También debe haber una página de episodios, una página "Acerca de" y una página de preguntas frecuentes (FAQ). Debe haber 20 episodios, y los datos son simulados; no necesitas extraer nada de un feed real."**
				
				-  **``Contexto del proyecto``**: Tenía acceso a la estructura de tu directorio, incluyendo scripts de PowerShell en .**``specify/scripts/powershell/``** y plantillas en **``.specify/templates/``**. También conocía las instrucciones detalladas para el comando **``/speckit.specify``** que me guían en cada paso.
				-  **``Decisión``**: Mi primera tarea, según las instrucciones, era generar un nombre corto para la rama.
			-  **Generación del nombre corto de la rama (`podcast-website`):**
			
				-  **``Razonamiento``**: Analicé tu descripción. Los conceptos clave eran "sitio web" y "pódcast". Para crear un nombre conciso de 2 a 4 palabras, como se indica en las instrucciones, podcast-website fue la opción más clara y descriptiva.
				-  **``Archivos/Herramientas``**: No se usó ninguna herramienta en este paso; fue un proceso de razonamiento interno.
			-  **Ejecución del script `create-new-feature.ps1`:**
			
				-  **``Decisión``**: Las instrucciones del comando /speckit.specify me indicaban explícitamente que debía ejecutar el script .specify/scripts/powershell/create-new-feature.ps1 con el nombre corto generado y tu descripción de la característica.
				-  **``Razonamiento``**: Este script es fundamental para automatizar la configuración inicial de una nueva característica: crea una nueva rama Git y establece la estructura de carpetas para la especificación.
				
				-  **``Archivos/Herramientas``**:
				
					-  **``default_api.run_shell_command``**: Utilicé esta herramienta para ejecutar el script de PowerShell.
					-  C:\Users\jseba\Model Context Protocol\FirstProof-SpecKit\.specify\scripts\powershell\create-new-feature.ps1: El script ejecutado.
					-  **``Argumentos``**: Le pasé **``-ShortName``** "podcast-website" y tu descripción completa como argumento final, tal como se especifica en el formato de PowerShell.
				-  **``Resultado``**: El script me devolvió un objeto JSON que contenía BRANCH_NAME (001-podcast-website) y SPEC_FILE (C:\Users\jseba\Model Context Protocol\FirstProof-SpecKit\specs\001-podcast-website\spec.md). Estos valores son esenciales para los siguientes pasos.
		    -  **Carga de la plantilla de especificación (`spec-template.md`)**:
			
			     - **``Decisión``**: Las instrucciones me pedían "Load .specify/templates/spec-template.md to understand required sections." (Cargar la plantilla para entender las secciones requeridas).
			     - **``Razonamiento``**: Para asegurar que la especificación final cumpliera con el formato y las secciones esperadas, era crucial leer y comprender la estructura de la plantilla antes de generar el contenido.
			       
			     - **``Archivos/Herramientas``**:
				
				     - default_api.read_file: Usé esta herramienta para leer el contenido de la plantilla.
					- C:\Users\jseba\Model Context Protocol\FirstProof-SpecKit\.specify\templates\spec-template.md: El archivo de plantilla leído.
		    -  **Generación del contenido de la especificación (`spec.md`)**:
		     
				- **``Decisión``**: Este fue el paso más intensivo en razonamiento, donde transformé tu descripción en una especificación estructurada, siguiendo las pautas de "Quick Guidelines" y "Section Requirements" (enfocarse en el QUÉ y POR QUÉ, no en e CÓMO, para stakeholders no técnicos).
				  
			     - **``Razonamiento``**:
				
					- **``Análisis de la descripción``**: Identifiqué los elementos clave:
					- **``Actores``**: Usuarios del sitio web (oyentes de podcast).
					- **``Acciones``**: Navegar, escuchar episodios, leer información.
					- **``Datos``**: Episodios (simulados), información "Acerca de", preguntas frecuentes.
					- **``Restricciones``**: Moderno, elegante, destacado, 20 episodios simulados, sin feed real.
				- **``Escenarios de usuario``**: Creé tres historias de usuario priorizadas (P1, P1, P2) que cubrían las interacciones principales (navegación por la página de inicio, exploración de episodios, acceso a información adicional). Cada una incluía una descripción, justificación de prioridad, una prueba independiente y escenarios de aceptación (Given/When/Then).
			     - **``Casos extremos``**: Identifiqué dos casos extremos relevantes para la reproducción de audio (URL inválida, compatibilidad con navegadores).
			     - **``Requisitos funcionales``**: Derivé ocho requisitos funcionales específicos (FR-001 a FR-008) directamente de tu descripción y las historias de usuario.
			     - **``Entidades clave``**: Definí las entidades Episodio y Sitio Web con sus atributos relevantes, manteniendo un nivel de abstracción adecuado.
			     - **``Criterios de éxito``**: Establecí cuatro criterios de éxito medibles (SC-001 a SC-004) que son agnósticos a la tecnología y se centran en resultados para el usuario y el negocio (ej. tiempo de carga, tasa de reproducción, satisfacción del diseño).
		       - **``Archivos/Herramientas``**: Principalmente razonamiento interno y aplicación de las reglas de las instrucciones.
		    -  **Escritura de la especificación al archivo `spec.md`**:
			
				-  **``Decisión``**: Una vez generado el contenido, debía guardarlo en el archivo de especificación.
				-  **``Razonamiento``**: Utilicé la ruta SPEC_FILE obtenida del script de PowerShell para escribir el contenido.
				
				-  **``Archivos/Herramientas``**:
				
				     - **``default_api.write_file``**: Para escribir el contenido generado en **``C:\Users\jseba\Model Context Protocol\FirstProof-SpecKit\specs\001-podcast-website\spec.md``**.
		    -  **Creación de la lista de verificación de calidad (`requirements.md`)**:
			
				- **``Decisión``**: Las instrucciones me indicaban "**``Create Spec Quality Checklist: Generate a checklist file at FEATURE_DIR/checklists/requirements.md...``**" (Crear la lista de verificación de calidad de la especificación...). 
				- **``Razonamiento``**: Este paso es crucial para validar la calidad de la especificación. La creación de un archivo de lista de verificación dedicado proporciona un registro formal de esta validación.
				
			       - **``Archivos/Herramientas``**:
				
			          - **``default_api.write_file``**: Para crear y escribir el contenido de la lista de verificación.
			          - C:\Users\jseba\Model Context Protocol\FirstProof-SpecKit\specs\001-podcast-website\checklists\requirements.md: La ruta del archivo de la lista de verificación.
			          - **``Error y corrección``**: En este punto, cometí un error al pasar los argumentos a write_file (confundí file_path con content). La herramienta me lo indicó con un error de "File path must be absolute", lo que me permitió corregirlo inmediatamente en el siguiente intento. Esto demuestra cómo la validación de las herramientas ayuda a mantener la precisión.
		    -  **Primera verificación de validación y manejo de resultados**:
			
				-  **``Decisión``**: Las instrucciones me pedían "**``Run Validation Check: Review the spec against each checklist item``**" (Ejecutar la verificación de validación...). 
				-  **``Razonamiento``**: Realicé una revisión interna de la spec.md contra cada punto de la lista de verificación que acababa de crear.
				
			     -  **``Archivos/Herramientas``**:
				
				     - **``default_api.read_file``**: Para leer el contenido de spec.md y poder evaluarlo.
			     - **``Resultado``**: Identifiqué que la sección "Dependencies and assumptions identified" (Dependencias y suposiciones identificadas) de la lista de verificación no estaba cubierta en la spec.md. Esto me llevó a la decisión de añadir una sección de "Assumptions" (Suposiciones) a la especificación.
		    -  **Actualización de la especificación con la sección de suposiciones**:
			
			     - **``Decisión``**: Para corregir el fallo de validación, decidí añadir la sección "**``Assumptions``**" a spec.md.
			     - **``Razonamiento``**: Las suposiciones son vitales para establecer el contexto y los límites del proyecto, evitando malentendidos futuros. Formulé suposiciones razonables basadas en tu descripción (ej. datos simulados, no CMS, reproducción HTML5 estándar, sin autenticación de usuario).
			     - **``Archivos/Herramientas``**:
				
				     - **``default_api.replace``**: Utilicé esta herramienta para insertar la nueva sección en el archivo spec.md. Elegí replace para hacer un cambio atómico y preservar el resto del archivo, en lugar de reescribirlo completamente.
		    -  **Re-ejecución verificación de validación y actualización final de la lista de verificación**:
			
			     -  **``Decisión``**: Después de actualizar la especificación, realicé una segunda verificación de validación.
			     -  **``Razonamiento``**: Es crucial revalidar después de cualquier cambio para asegurar que la corrección no introdujo nuevos problemas y que todos los puntos de la lista de verificación ahora se cumplen.
			     -  **``Resultado``**: Todos los elementos de la lista de verificación pasaron.
			       
			     **``Archivos/Herramientas``**:
				
			     **``default_api.write_file``**: Para actualizar el archivo requirements.md marcando todos los elementos como completados ([x]).
		    -  **Reporte de finalización**:
			
			     - **``Decisión``**: Finalmente, las instrucciones del comando /speckit.specify me indicaban que debía informar la finalización del proceso.
			     - **``Razonamiento``**: Proporcioné un resumen claro, indicando que la tarea se había completado, los detalles de la rama y el archivo de especificación, y que la especificación estaba lista para el siguiente paso (/speckit.plan).
	-  **GitHub Copilot | Learning**
	
		**[GitHub Copilot ](https://learn.microsoft.com/es-es/credentials/certifications/github-copilot/?practice-assessment-type=certification)** | **[Levelup ](https://learn.mslevelup.com/learner_module/show/1807479?lesson_id=11587543&section_id=103593435)** 
		
		-  **Governance Frameworks**: Implementing robust governance frameworks is essential to manager AI risks effectively.
		-  **Transparency and oversight**: Ensuring transparency in IA processes and incorporating human.
	-  **Arquitectura del flujo de trabajo (GitHub CLI)**
	
		Para que esta separación funcione sin romper la integridad de Git ni volverte loco con conflictos, te sugiero estructurarla de esta manera:
		
		-  **`projekte-uhm` (Laboratorio / Desarrollo):** Es tu zona de pruebas y trabajo diario. Aquí usas Gitflow completo con ramas `feature`, `develop` y múltiples pull requests sin importar cuántos commits intermedios hagas.
		-  **`sebastian-gsz` (Producción / Release):** Contará con una única rama (`main`). Este repositorio **no acepta commits ni PRs manuales**. Su única fuente de verdad es la automatización.
		
		**El papel de la automatización (GitHub Actions o Azure DevOps)**
		
		Hacer este traspaso mediante comandos manuales de Gitflow es propenso a errores. Lo ideal es delegarlo a un pipeline de CI/CD:
		
		-  **Disparador (Trigger):** Cada vez que se hace un merge exitoso a `main` en `projekte-uhm`, se dispara la pipeline.
		-  **Limpieza de historial (Squash):** En lugar de clonar los miles de commits de desarrollo, la pipeline genera un paquete limpio o un **squash commit** (un único commit que resume todos los cambios aprobados) o actualiza la versión mediante etiquetas (Tags).
		-  **Sincronización:** La pipeline utiliza un Token de Acceso Personal (PAT) con permisos para hacer un `git push` automatizado hacia `sebastian-gsz`.
		-  **Herramienta:** Puedes usar **GitHub Actions** de forma nativa (es más rápido de configurar entre dos cuentas de GitHub) o **Azure DevOps** si quieres entrenarte específicamente en la creación de pipelines empresariales con artefactos y aprobaciones.
-  **Metodologías Branching Strategy**

	Es imperativo reconocer que plataformas como **GitHub** y **Azure DevOps** (o **GitLab**) implementan la colaboración de formas técnicamente divergentes:
	
	- **``GitHub``**: Centraliza su flujo en el concepto de **Pull Request (PR)** y **GitHub Actions**. Es ideal para entornos distribuidos donde la revisión de código es el cuello de botella de calidad.
	- **``Azure DevOps``**: Se apoya en **Pipelines** y **Branches** con políticas de rama estrictas, integrándose de forma nativa con tableros de gestión empresarial.
	
	Debes dominar estas dos aproximaciones como si fueran las leyes de la termodinámica:
	
	-  **[Gitflow ](https://nvie.com/posts/a-successful-git-branching-model/)**: Es una metodología robusta, pero compleja. Utiliza ramas de **long-lived** como 'develop' y 'master', además de ramas efímeras para **feature**, **release** y **hotfix**. Es perfecta para proyectos con ciclos de publicación tradicionales y rigurosos.
	  
		![[gitflow.svg]]
	-  **[Trunk-based development ](https://trunkbaseddevelopment.com/)**: Es la preferida en la **Ingeniería de inteligencia artificial** y entornos de **Cloud Computing** de alto rendimiento. Todos los ingenieros integran sus cambios en una única rama principal ('main' o 'trunk') varias veces al día. Requiere un nivel de madurez técnica superior y un sistema de **Automated Testing** impecable.
	
		![[trunk-based-development.jpg]]
	
	**Criterios de selección técnica**:
	
	- **``Frecuencia de despliegue``**: ¿Despliegas una vez al mes o cien veces al día?
	- **``Complejidad del equipo``**: ¿Son juniors que necesitan supervisión o expertos en **DevSecOps**?
	- **``Herramientas de orquestación``**: Configurar correctamente los **Triggers** en los **Pipelines** de **Azure** o los **Workflows** de **GitHub** según la rama afectada.



















































