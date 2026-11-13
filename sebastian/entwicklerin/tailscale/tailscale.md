
- **[GitHub ](https://github.com/tailscale-dev)**
- **[Enlaces ](https://console.tailscale.com/admin/machines)**
- **[Documentación ](https://tailscale.com/docs/install/start)**
![[barra.gif]]
-  **Instalación general** 

	-  **Paso 1: Instalar Tailscale en el portátil de la empresa (Servidor)**
	
		-  Abre la terminal en el portátil corporativo y ejecuta el script oficial de instalación para Linux: **`curl -fsSL https://tailscale.com/install.sh | sh`**
		-  Una vez instalado, inicia el servicio y conéctate a tu cuenta: **`sudo tailscale up`**
		
		El comando te arrojará un **enlace URL en la terminal**. Cópialo, pégalo en un navegador web, inicia sesión.
	-  **Paso 2: Instalar Tailscale en tu equipo remoto (Donde te conectarás)**
	
		En el ordenador personal o dispositivo desde el que vayas a trabajar de forma remota:
		
		1. Entra a [tailscale.com/download ](https://tailscale.com/download) y descárgalo para tu sistema operativo (Windows, macOS, Linux, tablet o móvil).
		2. Instálalo e **inicia sesión con la misma cuenta** que usaste en el paso anterior. ¡Listo, ambos equipos ya forman parte de tu red privada virtual!
	-  **Paso 3: Conectarte a ERPNext de forma remota**
	
		-  Para conocer la dirección IP interna que Tailscale le asignó a tu portátil de la oficina, ejecuta esto en su terminal: **`    tailscale ip -4`** _(También puedes ver esta IP fácilmente desde la consola web de administración de Tailscale)._
		-  Desde tu equipo remoto, abre tu navegador web y escribe la IP de Tailscale seguida del puerto `8080`: **`http://<IP-DE-TAILSCALE-DEL-PORTATIL>:8080`**
		
		Con esto podrás acceder a ERPNext de forma completamente segura y cifrada,
		
		-  Hacer que Tailscale se inicie automáticamente con el sistema: **`sudo systemctl enable --now tailscaled`**
		-  Activar Tailscale SSH: **`sudo tailscale set --ssh`**
		-  Una vez dentro, comprueba el estado real de Tailscale ejecutando: **`sudo tailscale status`**
-  **Instalación Visual Studio**

	Tailscale es un servicio gratuito y de código abierto, basado en WireGuard®, que ayuda a los usuarios a crear redes privadas virtuales (VPN) sin complicaciones. Con una red Tailscale (tailnet), puedes acceder de forma segura a los servicios y dispositivos de esa red desde cualquier lugar del mundo. Las redes Tailscale pueden incluir desde un servidor virtual de Digital Ocean hasta una Raspberry Pi, una cámara de seguridad doméstica o incluso un Steam Deck. Puedes compartir nodos con amigos o compañeros de trabajo, o incluso exponer puertos a internet con Tailscale Funnel.
	
	La extensión Tailscale para VS Code integra la conectividad de red segura y sin complicaciones con tu código. Con Tailscale Funnel, puedes compartir cualquier dispositivo o nodo de tu red Tailscale (tailnet) con cualquier persona en internet.
	
	  **Funcionalidades**
	
	-  **Explora máquinas remotas**
	
		Visualiza e interactúa con las máquinas de tu red Tailscale dentro de VS Code. Con la tecnología de [Tailscale SSH ](https://tailscale.com/tailscale-ssh/), puedes administrar archivos de forma remota, abrir sesiones de terminal o conectarte a sesiones remotas de VS Code.
		![VS Code con el Explorador de máquinas de Tailscale expandido, mostrando una red Tailnet con diversos servicios](https://raw.githubusercontent.com/tailscale-dev/vscode-tailscale/main/resources/readme/machine-explorer.png)
	-  **Conéctate a una máquina de tu red Tailnet**
	
		Puedes iniciar una nueva sesión de terminal o conectarte a una máquina para desarrollar de forma remota con un solo clic. Coloca el cursor sobre la máquina a la que deseas conectarte y haz clic en el icono de la terminal de VS Code. Haz clic en el icono para iniciar una sesión de terminal, o en el icono para conectar la ventana de VS Code a la máquina.
	-  **Editar archivos en una máquina de tu red tailnet**
	
		  Para ver y editar archivos en una máquina de tu red tailnet, expande la máquina y haz clic en el elemento **Explorador de archivos**. Para usar el explorador de archivos, debes tener habilitado Tailscale SSH en tu equipo.
	-  **Exponer un puerto a través de internet**
	
		  Enruta el tráfico de internet a un nodo de tu red Tailscale para compartirlo públicamente con cualquier persona, incluso si no usa Tailscale.
		
		  **_Cuando quieras que algo local esté disponible en todas partes_**
		
		  Por ejemplo, puedes recibir un webhook de GitHub, compartir un servicio local con un compañero de trabajo o incluso alojar un blog personal o una página de estado en tu propio ordenador.
	-  **Panel de Tailscale Funnel**
		
		![Demostración del panel de la extensión de VS Code para servir el puerto local 3000 (una aplicación base de Next.js) a una URL pública con Tailscale Funnel](https://github.com/tailscale-dev/tailscale-dev/assets/40265/e9d1eac5-cf11-4075-bf8d-e8a377e2c9ed)
		1. Abre el panel. Puedes usar el atajo de teclado `CMD` + `J`.
		2. Introduce el puerto local que deseas exponer en internet en el campo **Puerto**.
		3. Haz clic en **Iniciar** para comenzar a servir este puerto en internet.
		
		Puedes abrir la URL pública en tu navegador predeterminado o copiarla al portapapeles.
	-  **Con la paleta de comandos**
	
		![Demostración de la vista de paleta de la extensión de VS Code utilizada para servir el puerto local 3000 (una aplicación base de Next.js) a una URL pública con Tailscale Funnel](https://github.com/tailscale-dev/tailscale-dev/assets/40265/97a177a3-3632-4dea-8a95-0ec3c631995d)
		1. Abre la paleta de comandos con el atajo de teclado CMD + Shift + P.
		2. Escribe **Tailscale** para ver todos los comandos de la extensión.
		3. Selecciona **Tailscale: Compartir puerto públicamente usando Funnel**.
		4. Introduce el número de puerto local que deseas compartir a través de Funnel.
	-  **Detección de puertos**
	
		![Demostración de la función de detección de puertos de la extensión de VS Code utilizada para servir el puerto local 3000 (una aplicación base de Astro) a una URL pública URL pública con Tailscale Funnel](https://github.com/tailscale-dev/tailscale-dev/assets/40265/63b0a26b-018b-4158-a20d-22789bbca707)
		  Cuando inicie un servidor local desde VS Code, Tailscale le preguntará si desea compartir ese puerto a través de Internet con Funnel. Esta funcionalidad se puede deshabilitar mediante la opción `tailscale.portDiscovery.enabled`.
	-  **Cómo funciona Funnel**
	
		tailscale funnel organiza su funcionamiento de la siguiente manera:
		
		-  **Accesible desde internet:** Los registros dns públicos y estables apuntan a los servidores de entrada de tailscale, por lo que sus nombres de host siempre son predecibles.
		-  **Túnel seguro:** Los servidores de entrada de tailscale reenvían el tráfico cifrado con TLS a sus nodos privados mediante túneles seguros y ligeros.
		-  **Cifrado de extremo a extremo:** Los certificados TLS de aprovisionamiento automático finalizan en sus nodos privados, por lo que nunca vemos su tráfico no cifrado.
		-  **Reenvía o sirve solicitudes:** Sirva archivos locales, directorios o contenido estático, o bien, envíe solicitudes de proxy inverso a un servidor web o TCP local.
	    
		para obtener más información, consulte la documentación completa sobre tailscale funnel o la referencia de CLI. Para obtener más información, consulte la documentación completa sobre [Tailscale Funnel ](https://tailscale.com/kb/1223/tailscale-funnel/) o la referencia de [CLI ](https://tailscale.com/kb/1242/tailscale-serve/).






















