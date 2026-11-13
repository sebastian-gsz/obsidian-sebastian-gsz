
-  **[Documentación ](https://frappe.github.io/frappe_docker/getting-started.html#how-to-use-this-guide)**
![[barra.gif]]
Frappe Docker proporciona un entorno contenedor integral para desarrollar y desplegar aplicaciones Frappe/ERPNext. Utiliza una **arquitectura multiservicio** que gestiona desde el servicio web hasta el procesamiento de trabajos en segundo plano.

-  **Containers**

	-  **[Backend ](estructura_frappe_bench.txt)**
	
		La diferencia principal y fundamental entre ambas carpetas radica en que **`frappe`** es el motor base (el framework) y **`erpnext`** es la aplicación de negocio que corre sobre ese motor. En la arquitectura de ERPNext siempre se necesitan **ambas** para funcionar. Aquí te detallo para qué sirve cada una y qué contiene su estructura:
		
		-  **`frappe/` (El Framework / El motor)**
		
			Es el **esqueleto tecnológico y la infraestructura**. Frappe por sí solo no es un ERP (no tiene módulos de contabilidad, inventario, ventas, etc.), sino que es el entorno de desarrollo web en el que todo lo demás está construido.
			
			**¿Para qué sirve?**
			
			* Gestiona el ORM (la forma en que Python interactúa con la base de datos MariaDB de manera abstracta).
			* Provee el sistema de autenticación, sesiones, control de usuarios y permisos (Roles y Permisos).
			* Controla la interfaz de usuario por defecto (el Desk de Frappe).
			* Maneja las tareas en segundo plano (workers), colas de Redis, generadores de reportes, API REST, etc.
			
			**Dentro de su carpeta (`apps/frappe/frappe/`)**: Encontrarás el código fuente principal en Python y JavaScript que hace que todo el sistema web de Frappe funcione.
		-  **`erpnext/` (La aplicación de negocio)**
		
			Es la aplicación empresarial propiamente dicha construida **sobre** el framework Frappe.
			
			**¿Para qué sirve?**
			
			* Añade toda la lógica de negocio y los módulos comerciales que utilizas en tu día a día: **Contabilidad, Inventario, Compras, Ventas, Recursos Humanos, Fabricación, Proyectos**, etc.
			* Define los Doctypes (formularios, tablas y campos) específicos de un ERP tradicional.
			
			**Dentro de su carpeta (`apps/erpnext/erpnext/`)**: Encontrarás los módulos de negocio divididos por carpetas (ej. `accounts`, `stock`, `selling`, `buying`, `hr`), con sus respectivos scripts de Python y vistas de JavaScript.
		
		### Resumen de la relación:
		
		* **Frappe** es como el sistema operativo (Windows o Linux).
		* **ERPNext** es como el programa o software principal que instalas en ese sistema operativo para trabajar.
		
		Si crearas una aplicación personalizada en el futuro (por ejemplo, para controlar la logística específica de tu empresa), aparecería como una tercera carpeta aquí al lado (`apps/tu_app_personalizada`).
-  **Servicios principales**

	El archivo base de composición incluye estos servicios esenciales:
	
	- **Configurator** - Servicio de inicialización que configura conexiones de base de datos y Redis; Funciona al arrancar y salir
	- **Backend** - Werkzeug servidor de desarrollo para procesamiento dinámico de contenido
	- **Frontend** - Proxy inverso Nginx que sirve activos estáticos y enruta solicitudes
	- **Websocket** - Node.js servidor que ejecuta Socket.IO para comunicaciones en tiempo real
	- **Queue-short/long** - Trabajadores en Python usando RQ (Redis Queue) para procesamiento asíncrono de trabajos en segundo plano
	- **Scheduler** - Servicio Python que ejecuta tareas programadas usando la biblioteca de programación
	
	Se añaden servicios adicionales mediante anulaciones de composición:
	
	- **db** - Servidor de bases de datos MariaDB o PostgreSQL (vía o `compose.mariadb.yaml``compose.postgres.yaml`)
	- **redis-cache/queue** - Instancias de Redis para caché y colas de trabajos (vía `compose.redis.yaml`).
	
	**Cómo funcionan juntos los servicios**

	```
	User Request
	    ↓
	[frontend (Nginx)] → Static files served directly / Archivos estáticos servidos directamente
	    ↓
	[backend (Werkzeug)] → Dynamic content processing / Procesamiento de contenido dinámico
	    ↓                    ↓
	[db (MariaDB)]      [redis-cache]
	
	Background Tasks / Tareas en segundo plano:
	[scheduler] → [redis-queue] → [queue-short/long workers]
	
	Real-time / Tiempo real:
	[websocket (Socket.IO)] ←→ [redis-cache]
	```
-  **Guía de despliegue | Prod**

	-  **Detener y eliminar el entorno actual (pwd.yml)**:  **`docker compose --env-file .env -f pwd.yml down --remove-orphans`**
	
		-  Elimina contenedores y redes pero **conserva volúmenes y datos**.
		-  Borrado total (¡elimina la base de datos y los sitios!): **`	docker compose --env-file .env -f pwd.yml down --volumes --remove-orphans`**
	-  **Levantar producción**: **``docker compose --env-file .env.production -f compose.yaml -f compose.prod.yml up -d --pull always --remove-orphans``**
	
		El repositorio oficial usa `compose.yaml` como base (políticas de reinicio, frontend, backend, websocket, colas y configuración por variables). Con un override `compose.prod.yml`. Si todo está definido directamente en `compose.prod.yml`: **``docker compose --env-file .env.production -f compose.prod.yml up -d --pull always --remove-orphans``**
	-  **Verificar el despliegue**: **`docker compose --env-file .env.production -f compose.prod.yml ps`**
	
		-  Y los logs: **`docker compose --env-file .env.production -f compose.prod.yml logs -f --tail=100`**
	
	**Advertencia, nunca usar `pwd.yml` como producción** sin revisar: persistencia, secretos, proxy HTTPS, copias de seguridad y políticas de reinicio.
	
	-  **El mount `.ssh` del `devcontainer.json`**
	  
		Es imperativo desacoplar esta línea de `.devcontainer/devcontainer.json` antes de "**Reopen in Container**":  **`"source=${localEnv:HOME}${localEnv:USERPROFILE}/.ssh,target=/home/frappe/.ssh,type=bind,consistency=cached"`** 
		
		-  **¿Por qué falla?** En Windows no existe `HOME` y `USERPROFILE` vale `C:\Users\jseba`: la ruta resultante con letra de unidad se interpreta como URI con esquema → *"If a URI contains an authority component..."*.
		-  **Segundo motivo:** los bind mounts se resuelven respecto al host donde corre el daemon Docker (`dev-server-02`), no respecto al cliente — pedirle al Docker del servidor Linux que monte una carpeta del PC Windows es imposible.
		-  Diagnóstico por aislamiento; poner **`"mounts": []`** y hacer **`Rebuild and Reopen in Container`**.
		
		**Usuarios y UID en el contenedor**
		
		-  **En Linux los usuarios son números**: el usuario de VS Code es **1003** y `frappe` dentro del contenedor es **1000** → el contenedor no puede escribir en el proyecto (dueño 1003).
		-  VS Code lo "apaña" reconstruyendo la imagen cambiando `frappe` al UID del usuario: recorre decenas de miles de archivos con `chown` → en un disco mecánico 5400 rpm son 30+ minutos **sin feedback** (parece colgado, no lo está). Cada reload reinicia el proceso de cero.
		-  **Solución definitiva:** asignar al usuario local el UID **1000** (libre en el servidor) — VS Code comprueba "¿son iguales? sí" y arranca en segundos.
	
		```
		Windows
		  │
		  ├── VS Code ── Remote SSH
		  │
		  └── Tailscale (transporte/red privada)
		              │
		              ▼
		      dev-server-02
		              │
		          Docker Engine
		              │
		              ▼
		      Dev Container (usuario frappe)
		```
	
		-  **Tailscale** provee la conectividad privada; **La extensión "Remote SSH"** es la sesión sobre la que trabaja VS Code; **Dev Containers** usa el Docker Engine del remoto. Remote SSH va conceptualmente encima de Tailscale.
		-  Con Remote SSH activo y la carpeta `/home/vscode/projects/frappe_docker` abierta, `Ctrl + Shift + P` → `Dev Containers: Reopen in Container` sí aparece (no aparece si solo hay conexión por Tailscale sin carpeta abierta, ni en workspaces multirraíz sin guardar).
		-  La clave privada **permanece en Windows**; el servidor y el contenedor reciben acceso a una capacidad de autenticación (socket reenviado), nunca el fichero privado. Preferible al bind mount de `.ssh`.
		-  El contenedor solo necesita GitHub para operar repos privados (`git push`, `bench get-app` privado). Frappe/ERPNext oficiales se obtienen por HTTPS público.
		
		1.  **Activar el servicio en Windows (PowerShell admin)**:  **`Set-Service ssh-agent -StartupType Automatic`**
		
			-  Arrancar y comprobar: **`Start-Service ssh-agent`** → **`Get-Service ssh-agent`**
		2.  **Cargar la identidad (mínimo privilegio)**:  **`ssh-add $HOME\.ssh\id_ed25519_tu_access_key`**
		
			-  Comprobar: **`ssh-add -l`**
			-  `ssh-agent Running` ≠ identidades cargadas: `ssh-add -l` es la comprobación real. Las identidades **no sobreviven al apagado** (el servicio sí arranca solo).
		3.  **ForwardAgent solo en los hosts de confianza (nunca `Host *`)**: **`~/.ssh/config`**, **`Host dev-server-02`** con **`ForwardAgent yes`**
		
			-  Tras crear una conexión nueva (la existente nació sin forwarding), verificar en el servidor y dentro del contenedor: **`echo "$SSH_AUTH_SOCK"`** (→ `/tmp/vscode-ssh-auth-....sock`) y **`ssh-add -l`** (misma identidad que en Windows).
			-  Prueba final de la cadena: **`ssh -T git@github.com`** → *"Hi projekte-uhm! You've successfully authenticated"*.
		4.  **Diseño de claves por función**
		
			| Clave | Propósito |
			|---|---|
			| `ubuntu_server` | Windows ↔ servidores |
			| `github_gsz` | GitHub personal — **nunca dentro del contenedor** |
			| `github_projekte_uhm` | Dev Container → GitHub (apps privadas) |
	-  **Mapa real de almacenamiento**
	
		-  **Los tres orígenes de lo que se ve dentro del contenedor**
		
			-  **Imagen Docker** → `/etc`, `/usr`, `/bin`, `/home/frappe` (filesystem aislado propio).
			-  **Bind mounts** → `/workspace` ↔ `/home/vscode/projects/frappe_docker` en el host (`RW=true`): modificar desde el contenedor **modifica el servidor**.
			-  **Volúmenes Docker** → ciclo de vida independiente del contenedor.
		-  **Estado real auditado con `docker inspect`**
		
			| Contenedor | Persistencia |
			|---|---|
			| frappe | bind `/workspace` + volume `vscode` |
			| mariadb | volume `frappe_docker_devcontainer_mariadb-data` en `/var/lib/mysql` ✓ |
			| redis-cache | **sin mounts** → capa escribible, NO tratar como persistente |
			| redis-queue | **sin mounts** → ídem |
		-  **Auditoría**: por contenedor, **`docker inspect --format '{{.Name}}{{range .Mounts}}{{printf "\n  Type=%s Source=%s Destination=%s RW=%v" .Type .Source .Destination .RW}}{{end}}' <ID>`** — y el listado global de volúmenes con **`docker volume ls`**.
	
	**Ruta PROD siguiente (Single Server oficial)**
	
	Docker + Compose → 2. Configuración GitOps → 3. Reverse proxy / Traefik (80/443) → 4. HTTPS / Let's Encrypt → 5. MariaDB persistente → 6. Configuración ERPNext → 7. Generación del Compose de producción → 8. Despliegue de servicios → 9. Creación del site → 10. ERPNext instalado → 11. Operación / backups / mantenimiento.



































































