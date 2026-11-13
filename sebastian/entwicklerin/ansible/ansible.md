
-  **Enlaces**
  
	  -  **[AnsibleFest ](https://goetzrieger.github.io/)**
-  **[Documentación ](https://docs.ansible.com/)**
![[barra.gif]]
-  **Componentes**
  
	-  **Molecule**
	
		Molecule es una herramienta diseñada para probar roles de Ansible de forma automatizada. Para realizar estas pruebas, necesita levantar entornos limpios donde aplicar los playbooks y comprobar que la configuración se ejecuta sin errores.
-  **Comprobaciones iniciales**
  
	-  **`sudo apt update && sudo apt install -y ansible-core`**
	-  **`curl -LsSf https://astral.sh/uv/install.sh | sh`**
	-  **`sudo apt update && sudo apt install -y git`**
	-  **`uv tool install molecule --with molecule-plugins[docker]`**
	-  **`sudo apt update && sudo apt install -y docker.io`**
	-  **`ansible --version`**
	
		ansible [core 2.20.1]
			
			config file = None
			configured module search path = ['/home/uhm/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
			ansible python module location = /usr/lib/python3/dist-packages/ansible
			ansible collection location = /home/uhm/.ansible/collections:/usr/share/ansible/collections
			executable location = /usr/bin/ansible
			python version = 3.14.4 (main, Jun 18 2026, 14:25:02) [GCC 15.2.0] (/usr/bin/python3)
			jinja version = 3.1.6
			pyyaml version = 6.0.3 (with libyaml v0.2.5)
		
		-  **Significado de los parámetros**
		
			-  **ansible [core 2.20.1]**: Muestra la versión exacta del núcleo de Ansible instalada en el sistema.
			-  **config file = None**: Indica que no se ha detectado ni cargado un archivo de configuración (`ansible.cfg`), por lo que Ansible opera con sus valores predeterminados.
			-  **configured module search path**: Directorios locales o del sistema donde Ansible busca módulos adicionales para ejecutar.
			-  **ansible python module location**: La ruta física en el sistema de archivos donde se encuentran instalados los paquetes de Python que componen Ansible.
			-  **ansible collection location**: Las rutas de directorios donde se buscan y almacenan las colecciones de Ansible.
			-  **executable location**: La ruta del archivo binario ejecutable de Ansible.
			-  **python version**: La versión del intérprete de Python que utiliza Ansible para su ejecución.
			-  **jinja version**: La versión del motor de plantillas Jinja encargado de procesar variables y estructuras dinámicas en los playbooks.
			-  **pyyaml version**: La versión de la librería PyYAML utilizada para interpretar los archivos de configuración, inventarios y playbooks en formato YAML.
		-  **Alcance del archivo de configuración**
		
			El archivo `ansible.cfg` no es estrictamente global por defecto, sino que **depende del directorio** desde el que ejecutes el comando. Ansible busca el archivo de configuración siguiendo un orden jerárquico estricto:
			
			1. La variable de entorno `ANSIBLE_CONFIG` si está definida.
			2. Un archivo llamado `ansible.cfg` en el directorio actual de trabajo donde ejecutas el comando.
			3. Un archivo `.ansible.cfg` dentro del directorio personal (`home`) del usuario que ejecuta la acción.
			4. El archivo de configuración global ubicado en `/etc/ansible/ansible.cfg`.
			
			Si no encuentra ninguno en las primeras ubicaciones, muestra `config file = None` y aplica los valores internos predeterminados del núcleo.
			
			**Directorios de instalación y rutas**
			
			Las rutas que visualizaste con `/home/uhm/` correspondían al usuario `uhm`. Dado que ahora operas a través del alias `unt` bajo el usuario `unternehmer`, esas rutas se adaptarán automáticamente al directorio personal de dicho usuario (`/home/unternehmer/.ansible/...`).
			
			- Las rutas de plugins y módulos (`plugins/modules`) almacenan fragmentos de código ejecutables que realizan tareas atómicas en los equipos.
			    
			- Las rutas de colecciones (`collections`) agrupan paquetes estructurados de contenido. Ambos tipos de recursos operan de forma independiente y se ubican en directorios separados según su función.
			    
			**Qué son las colecciones de Ansible**
			
			Una colección es un formato de distribución estandarizado que agrupa múltiples recursos de Ansible bajo un mismo ecosistema. En lugar de descargar módulos, plugins, roles y documentación por separado, una colección empaqueta todo de forma modular (por ejemplo, para gestionar servicios de Docker, AWS o sistemas Linux específicos) facilitando su actualización y control de versiones mediante un espacio de nombres unificado.
			
			**Motores Jinja y PyYAML**
			
			-  **Jinja**: Es el motor de plantillas integrado que permite evaluar expresiones lógicas, insertar variables de entorno, recorrer bucles y generar archivos de configuración de forma dinámica antes de aplicarlos en la infraestructura.
			-  **PyYAML**: Es la librería interna de Python que utiliza Ansible para analizar, leer y validar la sintaxis estructurada de todos los archivos escritos en formato YAML, tales como playbooks, inventarios y archivos de variables.





















