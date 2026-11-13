
-  **Linux**

	-  **AntiX**
	
		-  **Docker**

			-  **Docker root path**
			
				-  **Obtener la ruta del directorio raíz de Docker: `docker info --format '{{.DockerRootDir}}'`**
				-  **Visualizar el archivo de configuración daemon.json de Docker: `cat /etc/docker/daemon.json`**
				-  **Consultar el espacio en disco utilizado por Docker y containerd: `sudo du -sh /var/lib/docker /var/lib/containerd 2>/dev/null`**
			-  **Levantar, cerrar y limpiar clúster**
			  
				-  **`docker compose --env-file .env -f pwd.yml down -v`**
				-  **`docker compose --env-file .env -f pwd.yml up -d`**
				-  **`docker system prune -a --volumes -f`**
		-  **Networks**
		
			-  **Set static IP**
			
				-  **``connmanctl``**
				-  **`connmanctl services`**
				-  **`connmanctl config wifi_XXXXXX --ipv4 manual 192.168.1.135 255.255.255.0 192.168.1.1`**
				-  **`connmanctl config wifi_XXXXXX --nameservers 1.1.1.1 8.8.8.8`**
				-  **`connmanctl quit`**
			-  **Set network**
			  
				-  **``connmanctl``**
				-  **`connmanctl scan wifi`**
				-  **`connmanctl services`**
				-  **`connmanctl agent on`**
				-  **`connmanctl connect wifi_681401399dbd_XXXXXXXXXXXXXXXX_managed_psk`**
		-  **Remove graphic section**
		
			-  **`ps aux | grep -iE 'xorg|wayland|slim|lightdm|gdm|startx'`**
			-  **`sudo service slimski stop`**
			-  **`sudo update-rc.d slimski disable`**
		-  **Virtualization preparation**
		
			Se preparó el sistema operativo base actualizando los paquetes e instalando las herramientas necesarias para la gestión de certificados y montajes:
			
			-  **`sudo apt update`**
			-  **`sudo apt install -y ca-certificates curl gnupg lsb-release`**
			
				Este comando se utiliza principalmente como un **paso previo y obligatorio** para preparar tu sistema (en distribuciones basadas en Debian o Ubuntu) antes de añadir repositorios de software de terceros o externos (como Docker, Node.js, Google Cloud SDK, etc.).
				
				**Desglose de los paquetes**
				
				-  **`sudo`**: Ejecuta el comando con privilegios de administrador (superusuario), necesario para instalar software en el sistema.
				-  **`apt install -y`**: Invoca al gestor de paquetes APT para instalar las herramientas indicadas, respondiendo automáticamente "sí" (`-y`) a cualquier aviso de confirmación.
				-  **`ca-certificates`**: Permite al sistema verificar certificados SSL/TLS. Es indispensable para establecer conexiones HTTPS seguras al descargar datos o paquetes de internet.
				-  **`curl`**: Una potente herramienta de línea de comandos para transferir datos mediante URLs. Se utiliza frecuentemente en los scripts de instalación para descargar archivos o claves directamente desde la web.
				-  **`gnupg` (GnuPG)**: Herramienta de criptografía utilizada para firmar y verificar firmas digitales. Es vital para comprobar la autenticidad y seguridad de las claves GPG de los repositorios externos que vayas a añadir.
				-  **`lsb-release`**: Proporciona información detallada sobre la versión de tu distribución de Linux (nombre en clave, versión, etc.). Los scripts de instalación lo utilizan para detectar automáticamente qué versión de tu sistema operativo está corriendo y configurar el repositorio correcto.
				
				**Uso común:** Verás esta combinación exacta de comandos en la gran mayoría de guías oficiales de instalación de software externo (por ejemplo, para instalar Docker o Kubernetes), ya que aseguran que tu sistema pueda descargar archivos de forma segura, validar su autenticidad y detectar tu versión exacta de Linux.
			-  **`sudo apt install -y cgroupfs-mount`**
			  
				-  **`cgroups` (Control Groups):** Es una funcionalidad nativa del núcleo de Linux que permite aislar, contabilizar y limitar el uso de los recursos del sistema (como la CPU, la memoria RAM, el tráfico de red o la velocidad de lectura/escritura en disco) asignados a un grupo de procesos.
				-  **`cgroupfs-mount`:** Su único propósito es automatizar el montaje de este árbol de directorios virtuales de control para que las aplicaciones o servicios del sistema puedan interactuar con él.
			-  **`sudo cgroupfs-mount`**
			
				Al ejecutar este comando, pones en marcha el script que instalaste previamente. Su función principal es **montar manualmente los sistemas de archivos virtuales de los _cgroups_** (Control Groups) en la estructura de directorios del sistema (normalmente en `/sys/fs/cgroup`).
				
				-  **Lo que ocurre en segundo plano:**
				
					- **Consulta al Kernel:** El script lee el archivo `/proc/cgroups` para identificar qué controladores de recursos soporta actualmente el núcleo de Linux (por ejemplo: `cpu`, `memory`, `blkio`, `pids`).
					- **Creación de directorios:** Verifica y crea las carpetas necesarias dentro de la ruta `/sys/fs/cgroup` para cada uno de esos controladores si aún no existen.
					- **Montaje de los sistemas de archivos:** Ejecuta de forma automatizada comandos de montaje del tipo `mount -t cgroup` para enlazar cada subsistema del núcleo con su respectivo directorio en el espacio de usuario.
				-  **¿Cuál es el resultado práctico?**
				
					- **Activación de la gestión de recursos:** Deja operativos los mecanismos para que el sistema operativo (o aplicaciones externas como contenedores) pueda limitar el uso de CPU, memoria y otros recursos por proceso.
					- **Corrección de entornos sin systemd completo:** Es útil especialmente en contenedores ligeros (como LXC) o entornos de desarrollo donde el sistema de inicio no montó automáticamente estos directorios de control, evitando errores del tipo _“cgroup filesystem not mounted”_.
				
				**Nota:** En un sistema Linux estándar con systemd, este comando suele ser redundante porque el propio sistema de inicio ya se encarga de realizar este montaje durante el arranque. Se utiliza principalmente para forzarlo cuando falta esa configuración automática.
			
			**Añadir la clave GPG oficial de Docker**
			
			Dado que Docker no forma parte de los repositorios oficiales por defecto de tu distribución (antiX), tu sistema necesita una forma criptográfica de verificar que los paquetes que descargues realmente provienen de Docker y no han sido modificados por terceros.
			
			-  **`sudo mkdir -p /etc/apt/keyrings`**
			
				-  **`sudo`**: Ejecuta el comando con privilegios de administrador.
				-  **`mkdir -p`**: Crea el directorio indicado (`-p` asegura que no devuelva un error si la carpeta ya existe y crea las carpetas intermedias necesarias).
				-  **`/etc/apt/keyrings`**: Es el **directorio estándar moderno** recomendado en sistemas basados en Debian/Ubuntu para almacenar las claves GPG de repositorios externos de forma segura y aislada (reemplazando al antiguo método de guardarlas en `/etc/apt/trusted.gpg.d/`).
			-  **`curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg`**
			
				Este comando descarga la clave pública de Docker y la convierte al formato que el gestor de paquetes de tu sistema comprende:
				
				-  **`curl -fsSL <URL>`**: Descarga el archivo de la clave desde los servidores de Docker de forma silenciosa y segura (`-f` para fallar ante errores, `-s` silencioso, `-S` muestra errores si los hay, `-L` sigue redirecciones). _Nota: Aunque uses antiX (que está basado en Debian), se utiliza la clave del repositorio de Debian de Docker porque es totalmente compatible._
				-  **`|` (Tubería/Pipe)**: Envía el contenido de la clave descargada directamente al siguiente comando sin necesidad de guardarla primero como un archivo temporal en el disco.
				-  **`sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg`**: Toma esa clave en formato de texto plano (armored) y la convierte a un formato binario (`--dearmor`), guardándola finalmente en el archivo `/etc/apt/keyrings/docker.gpg`.
			-  **`sudo chmod a+r /etc/apt/keyrings/docker.gpg`**
			
				-  **`sudo`**: Ejecuta la orden con permisos de superusuario.
				-  **`chmod a+r`**: Cambia los permisos del archivo de la clave GPG.
				
				    - `a`: Significa "todos los usuarios" (_all_).
				    - `+r`: Añade permiso de **lectura** (_read_).
				-  **¿Por qué es necesario?** Asegura que el gestor de paquetes (APT), que a veces opera bajo permisos restringidos de lectura del sistema, pueda leer correctamente la clave GPG cada vez que verifique las actualizaciones de Docker.
			
			**Configurar el repositorio de Docker**
			
			Este comando tiene una única y gran misión: **crear un archivo de configuración que le indique a tu sistema operativo (antiX) exactamente dónde debe buscar, descargar y actualizar los paquetes de Docker**, utilizando los canales oficiales.
			
			**`echo \ "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \ $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`**
			
			**Instalar Docker Engine**
			
			-  **`sudo apt update`**
			-  **`sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin`**
			
				-  **`apt install -y`**: Ordena al gestor de paquetes APT instalar las herramientas indicadas, aceptando automáticamente cualquier aviso de confirmación (`-y`).
				-  **`docker-ce`** (**Docker Community Edition**): Es el núcleo del motor de Docker. Se encarga de gestionar y ejecutar los contenedores en el sistema.
				-  **`docker-ce-cli`** (**Command Line Interface**): La interfaz de comandos que te permite interactuar con Docker desde la terminal utilizando órdenes como `docker run`, `docker ps` o `docker images`.
				-  **`containerd.io`** (**Container Runtime**): El componente subyacente encargado de supervisar el ciclo de vida completo de los contenedores (gestión de imágenes, almacenamiento, redes y ejecución a nivel de sistema operativo).
				-  **`docker-compose-plugin`**: El plugin oficial para **Docker Compose**, que permite definir y levantar arquitecturas de múltiples contenedores de forma simultánea utilizando un único archivo de configuración (`docker-compose.yml`).
				
				**Nota importante para antiX (Sin systemd):** En distribuciones que usan systemd, el servicio de Docker se activa y arranca automáticamente tras la instalación. Dado que antiX utiliza sistemas de inicio alternativos (`sysvinit` o `runit`), el demonio de Docker (`dockerd`) no se iniciará mediante `systemctl`. Deberás asegurarte de que el servicio esté corriendo (por ejemplo, ejecutando manualmente el demonio en segundo plano con `sudo dockerd &` o configurándolo en los scripts de inicio de tu sistema) para poder empezar a usar contenedores.
			
			**Iniciar el servicio de Docker**
			
			-  **`sudo service docker start`**
			-  **`sudo service docker stop`**
			-  **`sudo service docker status`**
	-  **Ubuntu**
	  
		-  **Networks**
		
			-  **Set static IP**
			
				-  **``ls -la /etc/netplan/``**
				-  **`sudo nano /etc/netplan/00-installer-config.yaml`**
				
					network:
					  version: 2
					  ethernets:
					    eno1:
					      match:
					        macaddress: 70:5a:0f:29:05:03
					      set-name: eno1
					  wifis:
					    wlo1:
					      dhcp4: false
					      addresses:
					        - 192.168.1.101/24
					      routes:
					        - to: default
					          via: 192.168.1.1
					      nameservers:
					        addresses:
					          - 1.1.1.1
					          - 8.8.8.8
					      access-points:
					        DIGIFIBRA-nb3J:
					          password: xULAxaNjs4bU
				-  **`sudo netplan apply`**
	-  **Networks**

		-  **Instalación y despliegue del zcode**
		  
			-  **Enlaces**
			
				-  **[[unternehmer]]**
				-  **[noVNC ](https://github.com/novnc/noVNC)**
			-  **Runbook** — zcode GUI en dev-server-01 (.110)
			
				-  **Tipo**: runbook · **Estado**: activo · **Creado**: 2026-11-12
				-  **Sistema**: zcode desktop (Electron) · dev-server-01 (192.168.1.110) · Xvfb + x11vnc + noVNC
				-  **Contexto**: prueba de concepto del owner — ¿corre la GUI del zcode en la máquina más pequeña de la flota y puede verse desde Windows?
				-  **Objetivo y resultado**: comprobar si la **GUI de escritorio del zcode** (AppImage Electron, 247 MB) corre en .110 — la máquina más pequeña de la flota (2 núcleos, 3,1 GiB RAM útil) y **headless** (sin pantalla) — y verla **desde su Windows**. Resultado: **corre, se ve por VNC/noVNC y se cierra limpio**.
				-  **Nota de historial**: esa misma máquina tuvo el **agente-servidor de zcode** cerrado y deshabilitado esa misma mañana por consumir 67 % de un núcleo. Esta GUI es otra pieza (aplicación de escritorio Electron), montada tras la decisión informada del owner.
			-  **Arquitectura montada**
			
				```mermaid
				graph TB
				    subgraph cliente["Windows (cliente)"]
				        browser["Navegador noVNC"]
				        vnccli["Cliente VNC / TigerVNC"]
				    end
				    subgraph puente["Puente de acceso"]
				        novnc["noVNC /vnc.html"]
				        websockify["websockify :6080"]
				        x11vnc["x11vnc :5900"]
				    end
				    subgraph server["dev-server-01 (.110) — headless"]
				        xvfb["Xvfb :99 — pantalla virtual 1440×900"]
				        zcode["zcode (Electron) — usuario vscode"]
				    end
				    browser --> novnc
				    novnc --> websockify
				    websockify -->|"WebSocket → RFB"| x11vnc
				    vnccli -->|"RFB directo :5900"| x11vnc
				    x11vnc -->|"adjunto al display"| xvfb
				    zcode -->|"render por software"| xvfb
				    style cliente fill:#e7f5ff,stroke:#1971c2
				    style puente fill:#ffe8cc,stroke:#d9480f
				    style server fill:#e5dbff,stroke:#5f3dc4
				```
			-  **Requisitos previos**
			
				-  Acceso root en .110 (identidades `sebastian`/`ansible` vía su/polkit — el usuario `vscode` NO es admin en esta máquina).
				-  El AppImage **`ZCode-3.17.2-linux-x64.AppImage`** (247 MB) en el home.
				-  Red: LAN o Tailscale (ambas rutas verificadas; Tailscale IP de .110 = 100.91.9.86).
			-  **Instalación paso a paso (reproducible desde cero)**
			
				```bash
				# 1. transferir el AppImage (desde cualquier máquina con el fichero)
				scp ZCode-3.17.2-linux-x64.AppImage dev-server-01:~/
				ssh dev-server-01 'chmod +x ~/ZCode-3.17.2-linux-x64.AppImage'
			
				# 2. extraer COMPLETO (no usar --appimage-extract-and-run: ver problema 2)
				ssh dev-server-01 'cd ~ && ./ZCode-3.17.2-linux-x64.AppImage --appimage-extract'
				# → crea ~/squashfs-root/ con el binario zcode (219 MB) + chrome-sandbox
			
				# 3. dependencias GTK/Electron + pantalla virtual + VNC (como root)
				apt update && apt install -y libgtk-3-0 libnss3 libasound2t64 libgbm1 \
				  libxss1 libx11-xcb1 xvfb x11vnc novnc websockify
			
				# 4. pantalla virtual + ajuste del sandbox de Chromium
				Xvfb :99 -screen 0 1440x900x24 &
				chown root:root /home/vscode/squashfs-root/chrome-sandbox
				chmod 4755 /home/vscode/squashfs-root/chrome-sandbox
			
				# 5. lanzar el zcode COMO USUARIO vscode (no root: el sandbox lo exige)
				su vscode -c "export DISPLAY=:99 && cd ~/squashfs-root && nohup ./zcode > /tmp/zcode-gui.log 2>&1 &"
			
				# 6. VNC clásico con contraseña + puente noVNC para navegador
				VNC=$(openssl rand -hex 6); echo "VNC_PASS=$VNC" > /home/vscode/VNC_CREDENTIALS.txt
				chmod 600 /home/vscode/VNC_CREDENTIALS.txt
				su vscode -c "DISPLAY=:99 x11vnc -display :99 -forever -rfbport 5900 -passwd $VNC &"
				su vscode -c "DISPLAY=:99 websockify -D --web /usr/share/novnc 6080 localhost:5900 &"
			
				# 7. verificación
				ps aux | grep -E "[z]code|[X]vfb|[x]11vnc|[w]ebsockify"  # 4 familias vivas
				ss -tlnp | grep -E "5900|6080"
				```
			
				**Acceso desde Windows**: navegador → **`http://100.91.9.86:6080/vnc.html`** (Tailscale) o **`http://192.168.1.110:6080/vnc.html`** (LAN) → Conectar → contraseña de `/home/vscode/VNC_CREDENTIALS.txt`. Cliente VNC tradicional: mismo host en el puerto 5900.
			-  **Problemas encontrados y cómo se resolvieron**
			
				| # | Problema | Síntoma | Causa | Solución |
				|---|---|---|---|---|
				| 1 | **libfuse2 ausente** | `dlopen(): error loading libfuse.so.2` al ejecutar el AppImage | Ubuntu 26.04 no trae libfuse2 y el AppImage lo necesita | Ruta sin root: `--appimage-extract` completo (elegida). Alternativa: `apt install libfuse2` |
				| 2 | **Extracción incompleta** | AppRun falla: `…/zcode: No such file or directory` tras reintentos que solo decían "File exists… skipping" | Un primer `--appimage-extract-and-run` fue matado por un timeout a mitad de extracción; los reintentos **saltan** los ficheros existentes y el binario grande nunca llegó a extraerse | `rm -rf /tmp/appimage_extracted_*` + extracción limpia y completa con `--appimage-extract` (sin timeout encima) |
				| 3 | **La extracción va al cwd, no a /tmp** | buscar `/tmp/squashfs-root` tras extraer → no existe | `--appimage-extract` crea `./squashfs-root` relativo al directorio de trabajo | Buscar en el cwd del comando (en nuestro caso `~/squashfs-root`) |
				| 4 | **Librerías GTK ausentes** | `error while loading shared libraries: libatk-1.0.so.0` | servidor headless sin stack gráfico | `apt install libgtk-3-0 libnss3 libasound2t64 libgbm1 libxss1` (root) |
				| 5 | **Sandbox de Chromium** | `FATAL:… chrome-sandbox is owned by root and has mode 4755` — el app aborta | el binario suid `chrome-sandbox` llegó mal propietario tras la extracción como vscode | `chown root:root chrome-sandbox && chmod 4755 chrome-sandbox` (se conserva el sandbox: NO usar `--no-sandbox`) |
				| 6 | **Ejecutar Electron como root** | (evitado por diseño) Chromium se niega a correr como root sin `--no-sandbox` | el sandbox suid exige usuario no-root | lanzar siempre con `su vscode -c …` |
				| 7 | **Acceso por navegador fallido** | `ERR_INVALID_HTTP_RESPONSE` al poner `:5900` en el navegador | VNC es protocolo RFB, no HTTP — un navegador no puede hablarlo | puente **noVNC + websockify** (`apt install novnc websockify`; websockify :6080 → 5900) y acceder a `/vnc.html` |
				| 8 | **Aviso dconf en el log** | `dconf-CRITICAL: unable to create directory '/run/user/0/dconf'` | lanzado vía su sin sesión de systemd --user completa | **cosmético** — la app funciona; desaparece lanzándolo desde una sesión login de vscode |
			-  **Verificación realizada (2026-11-12)**
			
				-  Proceso zcode vivo (zygote + render por software en Xvfb) ✓
				-  **`x11vnc`** escuchando en :5900 (IPv4+IPv6) ✓ · **`websockify`** en :6080 ✓
				-  Acceso desde Windows vía navegador (noVNC) — el owner vio la interfaz ✓
				-  **Cierre limpio**: cerrar la ventana del zcode desde noVNC dispara un `app-quit` ordenado (no es un crash) ✓
				-  Consumo: pico del host ~1,0 GB con todo corriendo; tras cerrar la GUI, 675 MiB usados / 2,4 GiB disponibles
			-  **Ciclo de vida (estado actual y opciones)**
			
				-  **Actual**: los 4 procesos (Xvfb, zcode, x11vnc, websockify) corren con setsid/nohup — **mueren si reinicia .110** (no son systemd).
				-  **Relanzar tras reinicio**: como root, el bloque de los pasos 4-6, arrancando Xvfb primero.
				-  **Persistencia opcional**: convertir a unidades systemd --user (o system) — pendiente si el owner lo adopta en firme.
				-  **Desmontar**: **`pkill -f squashfs-root/zcode; pkill Xvfb; pkill x11vnc; pkill websockify`** + **`rm -rf ~/squashfs-root ~/ZCode-3.17.2-linux-x64.AppImage`** + **`apt remove xvfb x11vnc novnc websockify`** si se quiere cero rastro.
			-  **Seguridad y secretos**
			
				-  **Contraseña VNC**: aleatoria, en `/home/vscode/VNC_CREDENTIALS.txt` (chmod 600). El puerto 5900/6080 queda expuesto en LAN y Tailscale con esa contraseña como única puerta.
				-  **Acceso root de sesión**: se instaló la clave pública `id_ed25519_alfa_interserver` en `/root/.ssh/authorized_keys` de .110 (permite root-SSH desde alfa sin contraseña). **Eliminarla al cerrar el uso**: **`sed -i '/alfa-interserver/d' /root/.ssh/authorized_keys`**.
				-  **Contraseña de root compartida por chat durante la operación**: el owner la rotará al finalizar — pendiente de su lado.
				-  La GUI del zcode corre con el sandbox de Chromium ACTIVO (chrome-sandbox 4755) y como usuario no-root.
	-  **Storage and data**
	
		-  **Data transfer**
		
			-  **Montaje de la unidad**: **`sudo mkdir -p /media/disco_externo && sudo mount -t auto /dev/sdb1 /media/disco_externo`**
			-  **Mover datos**: **`rsync -avhP /media/disco_externo/Personal/drive/2020_2022.zip ~/Documentos/Personal_Nuevo/drive/`**
			-  **Finalización y desmontaje seguro**: **`sudo umount /media/disco_externo`**
	-  **Security and governance** 
	
		-  **Set update**
		  
			-  **`sudo apt update`**
			-  **``sudo apt dist-upgrade -y``**
			-  **`sudo apt autoremove --purge -y`**
			-  **`sudo apt clean`**
		-  **Set passwords**
		
			-  **``passwd``**
			-  **`sudo passwd root`**
		-  **Secure SSH configuration**
		
			-  **Generar claves asimétricas: `ssh-keygen -t ed25519 -C "tu_correo@ejemplo.com"`**
			
				-  Conecta el USB al servidor Ubuntu Server.
				-  Identifica el nombre asignado al USB ejecutando: `lsblk`. *(Busca tu USB por su tamaño, por ejemplo, `sdb1` o `sdc1`).*
				-  Crea una carpeta temporal para montar el USB: `sudo mkdir -p /mnt/usb`
				-  Monta la partición del USB en esa carpeta (reemplaza `sdb1` con el nombre que identificaste): `sudo mount /dev/sdb1 /mnt/usb`
				-  Asegúrate de que la carpeta `.ssh` exista en tu usuario de Ubuntu y tenga los permisos correctos: `mkdir -p ~/.ssh` y `chmod 700 ~/.ssh`
				-  Copia los archivos desde el USB a tu carpeta `.ssh`: `cat ~/.ssh/id_ed25519_ubuntu_pavilion.pub >> ~/.ssh/authorized_keys`
				-  **Para la clave privada** (solo tú debes poder leerla/escribirla): `chmod 600 ~/.ssh/nombre_de_tu_clave`
				-  **Para la clave pública** (puede ser legible): `chmod 644 ~/.ssh/nombre_de_tu_clave.pub`
				-  Desmonta el USB de forma segura antes de retirarlo físicamente: `sudo umount /mnt/usb`
			-  **Extracción de clave pública: ``ssh-keygen -y -f ~/.ssh/id_ed25519_27062026_antix_pavilion``** Este comando lee un archivo de clave privada existente y muestra en pantalla su clave pública correspondiente
			-  **Cambio de contraseña (Passphrase) de la clave privada``ssh-keygen -p -f ~/.ssh/id_ed25519_27062026_antix_pavilion``**
			-  **Edición de la configuración del servidor SSH: `sudo nano /etc/ssh/sshd_config`**
			
				**``PasswordAuthentication``** **no**
				**``PubkeyAuthentication``** **yes**
				**``PermitEmptyPasswords``** **no**
				**``PermitRootLogin``** **no**
			-  **`sudo service ssh restart` or `sudo systemctl restart ssh`**
-  **Windows**





