
-  **Tools**
  
	-  **[Microsoft Graph PowerShell SDK ](powershell-module-microsoft.md)**
	
		Es el estándar principal para interactuar con toda la API de Microsoft. Sirve para auditar y administrar el directorio activo (Entra ID), controlar usuarios, revocar o asignar licencias masivamente, revisar registros de auditoría y automatizar la gestión de identidades y seguridad del tenant.
		
		- <strong style="color: 4CAF50;">Instalado</strong>: v2.41.2 (meta + 39 submódulos) · 2026-11-05 · PS 5.1
		
		**PowerShell (Requisito)**
		       **│**
		       **▼ ----> Comando de instalación**
		**Install-Module Microsoft.Graph -Scope CurrentUser**
		       **│**
		       **▼ ----> Comprobar existencia**
		**Get-InstalledModule -Name Microsoft.Graph***
	-  **Microsoft Teams PowerShell**
	
		Módulo oficial y específico para el gobierno de las comunicaciones de la empresa. Es clave para crear o archivar equipos masivamente, configurar políticas de reuniones (quién puede grabar o compartir pantalla), gestionar canales y controlar la configuración de telefonía (Teams Phone).
		
		-  <strong style="color: 4CAF50;">Instalado</strong>: v8.0.0 · 2026-11-05 · PS 5.1
		
		**PowerShell (Requisito)**
		       **│**
		       **▼ ----> Comando de instalación**
		**Install-Module MicrosoftTeams -Scope CurrentUser**
		       **│**
		       **▼ ----> Comprobar existencia**
		**Get-InstalledModule -Name MicrosoftTeams**
	-  **Power Platform (PAC)**
	
		Es tu herramienta técnica profunda para el ciclo de vida de aplicaciones (ALM). Te permite desplegar y empaquetar soluciones (como transformar tu código en un archivo `.zip` listo para producción), conectarte a entornos Dataverse, crear componentes de código (PCF) y automatizar pipelines de CI/CD.
		
		-  <strong style="color: 4CAF50;">Instalado</strong>: v2.14.1 · 2026-11-05 · requiere .NET SDK 10 (instalado, ver abajo)
		
		**.NET SDK / dotnet (Requisito)**
		       **│**
		       **▼ ----> Comando de instalación**
		**dotnet tool install --global Microsoft.PowerApps.CLI.Tool**
		       **│**
		       **▼ ----> Comprobar existencia**
		**dotnet tool update --global Microsoft.PowerApps.CLI.Tool**
		       **│**
		       **▼ ----> Actualización**
		**dotnet tool list -g**
		       **│**
		       **▼**
		**pac help**
		
		-  **Recargar cache: ``dotnet restore --no-cache``**
	-  **Power Apps Administration Module**
	
		Este es el módulo oficial y fundamental si te vas a encargar de la administración y gobernanza de la Power Platform (Power Apps, Power Automate, etc.). Es vital para la seguridad. Puedes definir qué conectores (SQL Server) se pueden mezclar con otros (Twitter) para evitar que los datos de la empresa se filtren. Te permite crear, eliminar o consultar los distintos entornos (desarrollo, pruebas, producción) que tienes en la compañía.
		
		-  <strong style="color: 4CAF50;">Instalado</strong>: v2.0.219 · 2026-11-05 · PS 5.1
		
		**PowerShell (Requisito)**
		       **│**
		       **▼ ----> Comando de instalación**
		**Install-Module Microsoft.PowerApps.Administration.PowerShell -Scope CurrentUser**
		       **│**
		       **▼ ----> Comprobar existencia**
		**Get-InstalledModule -Name Microsoft.PowerApps.Administration.PowerShell**
		       **│**
		       **▼**
		**Get-AdminPowerAppEnvironment**
	-  **[Microsoft 365 (PnP) ](https://pnp.github.io/cli-microsoft365/user-guide/installing-cli/)**
	
		En lugar de abrir PowerShell para Graph, otro para SharePoint y otro para Teams, el CLI te permite gestionarlo todo desde un solo lugar. Piensa en esta herramienta como una "navaja suiza". Puedes sacar listados de usuarios, sitios de SharePoint, equipos inactivos o permisos de forma mucho más rápida que con los módulos tradicionales.
		
		-  <strong style="color: 4CAF50;">Instalado</strong>: v12.0.0 · 2026-11-05 · vía pnpm global // npm también válido, pero corepack de Node 26 está roto (ver Proceso real)
		
		**Node.js / npm (Requisito)**
		       **│**
		       **▼ ----> Comando de instalación**
		**npm install -g @pnp/cli-microsoft365**
		       **│**
		       **▼ ----> Comprobar existencia**
		**m365 --version**
		       **│**
		       **▼** 
		**m365 login**
	-  **MCP NuGet**
	
		Es un servidor de contexto (MCP) diseñado para que los asistentes de inteligencia artificial puedan interactuar directamente con el ecosistema de paquetes de .NET. Su caso de uso principal es permitir que herramientas impulsadas por IA busquen paquetes NuGet, inspeccionen vulnerabilidades y analicen metadatos de dependencias directamente desde tu terminal o entorno de desarrollo.
		
		-  <strong style="color: 4CAF50;">Instalado</strong>: v1.4.23 · 2026-11-05 · registrado en ZCode (`~/.zcode/cli/config.json`, efectivo tras reiniciar ZCode)
		
		**.NET SDK / dotnet (Requisito)**
		       **│**
		       **▼ ----> Comando de instalación**
		**dotnet tool install -g nuget.mcp.server**
		       **│**
		       **▼ ----> Comprobar existencia**
		**dotnet tool list -g**
		       **│**
		       **▼**
		**nuget-mcp-server**
	-  **Microsoft Dataverse Service SDK**
	
		Este es el SDK oficial de .NET para interactuar programáticamente con Dataverse. Es la herramienta fundamental para desarrolladores que necesitan construir aplicaciones personalizadas en C#, crear Azure Functions, webhooks o plugins. Te permite conectarte de forma segura a Dataverse (mediante Service Principals u OAuth), realizar consultas complejas (con FetchXML o LINQ) y crear, actualizar o eliminar registros de manera masiva y automatizada.
		
		-  <strong style="color: 9E9E9E;">Pendiente</strong>: se instala por proyecto, no global — cuando tengas el proyecto .NET: **`dotnet add package Microsoft.PowerPlatform.Dataverse.Client`**
		
		**.NET SDK / Proyecto .NET (Requisito)**
		       **│**
		       **▼ ----> Comando de instalación (dentro de tu carpeta de proyecto)**
		**dotnet add package Microsoft.PowerPlatform.Dataverse.Client**
		       **│**
		       **▼ ----> Comprobar existencia**
		**dotnet list package**
		       **│**
		       **▼** 
		**(Verificar en el archivo .csproj)**
	-  **GitHub CLI**
	
		Es la herramienta oficial de GitHub desde la terminal (CLI). Te permite llevar el flujo de trabajo de GitHub directamente a tu línea de comandos. Es clave para gestionar repositorios, crear y revisar Pull Requests, administrar _issues_, realizar búsquedas en el código, gestionar flujos de trabajo de GitHub Actions y autenticarte de forma segura mediante claves o tokens sin necesidad de abrir el navegador web.
		
		-  <strong style="color: 4CAF50;">Instalado</strong>: v2.103.3 · 2026-11-05 · vía winget
		
		**Gestor de paquetes de Windows (WinGet) (Requisito)**
		**│**
		**▼ ----> Comando de instalación**
		**winget install GitHub.cli**
		**│**
		**▼ ----> Comprobar versión instalada**
		**gh --version**
		**│**
		**▼ ----> Comprobar estado de autenticación y cuenta activa**
		**gh auth status**
		**│**
		**▼ ----> Iniciar sesión (Autenticación)**
		**gh auth login**
	
	^uhm4
-  **Proceso real de instalación del stack 20261105**

	-  **Orden real de instalación**

		-  **Módulos PowerShell (PS 5.1)**

			**│**
			**▼ ----> Instalar (los tres de golpe)**
			**`Install-Module Microsoft.Graph,MicrosoftTeams,Microsoft.PowerApps.Administration.PowerShell -Scope CurrentUser -Force`**
			**│**
			**▼ ----> Comprobar**
			**`Get-InstalledModule Microsoft.Graph*,MicrosoftTeams,Microsoft.PowerApps.Administration.PowerShell`**
		-  **pnpm (reparación sobre Node 26)**

			**│**
			**▼ ----> Instalar el binario real**
			**`npm install -g --allow-scripts=pnpm pnpm@latest`**
			**│**
			**▼ ----> Configurar (crea PNPM_HOME y lo añade al PATH de usuario)**
			**`pnpm setup`**
			**│**
			**▼ ----> Comprobar**
			**`pnpm --version`** // antes: eliminar los shims rotos de corepack (ver Problemas)
			// config persistida durante la reparación: `global-bin-dir` = C:/Users/sebastian/AppData/Local/pnpm/bin (inofensiva, fija dónde viven las CLIs globales de pnpm)
		-  **m365 con pnpm**

			**│**
			**▼ ----> Instalar**
			**`pnpm add -g @pnp/cli-microsoft365`**
			**│**
			**▼ ----> Comprobar**
			**`m365 --version`**
		-  **.NET SDK 10**

			**│**
			**▼ ----> Instalar**
			**`winget install --id Microsoft.DotNet.SDK.10 -e`**
			**│**
			**▼ ----> Comprobar**
			**`dotnet --list-sdks`**
		-  **PAC + MCP NuGet**

			**│**
			**▼ ----> Instalar**
			**`dotnet tool install --global Microsoft.PowerApps.CLI.Tool`**
			**`dotnet tool install -g nuget.mcp.server`**
			**│**
			**▼ ----> Comprobar**
			**`dotnet tool list -g`** · **`pac help`**
	-  **Problemas encontrados y solución**

		-  **EPERM al instalar con npm (mkdir denegado)**

			-  Causa: **`C:\Users\sebastian\.cache`** tenía la herencia de permisos desactivada y tu usuario solo lectura; npm configura ahí su caché vía **`~/.npmrc`**
			-  Solución: **`icacls "C:\Users\sebastian\.cache" /reset /t`** // restaura la herencia del perfil; sin admin (eres propietario)
		-  **pnpm no funcional (corepack roto en Node 26)**

			-  Causa: el shim **`C:\Program Files\nodejs\pnpm*`** delega a corepack y corepack no encuentra su módulo
			-  Solución: instalar el pnpm real vía npm y **eliminar los 6 shims** (`pnpm`, `pnpm.CMD`, `pnpm.ps1`, `pnpx`, `pnpx.CMD`, `pnpx.ps1`) // requiere admin
		-  **El shim roto ganaba al pnpm real en el PATH**

			-  Causa: el PATH de sistema (**Program Files\nodejs**) se evalúa antes que el de usuario (**%LOCALAPPDATA%\pnpm\bin**)
			-  Solución: eliminar los shims (ver arriba) — añadir al PATH de usuario NO basta
		-  **SDK 8 vs SDK 10**

			-  Causa: **.NET 8 termina soporte el 10-nov-2026**; el 10 es el LTS actual (hasta nov-2028) y convive con el runtime 8 ya presente
			-  Regla: instalar siempre el LTS vigente; STS/RC solo si necesitas algo nuevo concreto
		-  **Registro del MCP de NuGet en ZCode**

			-  Añadir a **`~/.zcode/cli/config.json`** → `mcp.servers`: `{"nuget": {"type": "stdio", "command": "cmd", "args": ["/c", "C:\\Users\\sebastian\\.dotnet\\tools\\nuget-mcp-server.cmd"], "enabled": true}}`
			-  Verificación: handshake `initialize` por stdio responde `serverInfo: NuGet.Mcp.Server` // el wrapper `.cmd` sobrevive a actualizaciones de la tool
	-  **Lecciones**

		-  **Token ≠ Consentimiento**: el token vive ~1h en tu PowerShell; el consentimiento vive en el tenant hasta que lo revoques
		-  **Dominó**: cada **`Connect-MgGraph`** cierra la sesión anterior, incluso si falla → reconectar tras cualquier error
		-  Ser Global Admin no exime del scope en el token: la API autoriza **por token, no por rol** (ej. 403 al consentir sin `DelegatedPermissionGrant.ReadWrite.All`)
		-  Borrar un app registration lleva su SP y va a papelera 30 días; borrar el SP de una app de Microsoft se autorepara al usarla
		-  Antes de algo destructivo: **`(Get-MgContext).Scopes`** · para descubrir cmdlets: **`Get-Command -Module <modulo>`**

![[barra.gif]]

-  **Azure**

	-  **Autenticación**
	
		-  **Iniciar sesión Microsoft Azure**
		
			-  **Inicio de sesión sin suscripción**
			  
				**``az login --tenant luxsovereign.onmicrosoft.com --allow-no-subscriptions``**
				
				// **Other**
				- **``az account show``**
				- **``az account list``**
				- **``az login``**
				- **``az logout``**
			-  **Inicio de sesión**
			
				// **Listar todos los tenants en los que tu cuenta existe**
				**``az account show --output table``**
				// **Inicia sesión**
				**``az login --tenant 3460129e-baf1-43cc-8dc6-b958a1c4f625``**
-  **Teams**

	-  **Procesos**
	
		-  **[Obtener detalles de equipo ](auditoria-teams.ps1)**
	-  **Teams**
	  
		-  **Crear un nuevo equipo: `New-Team -DisplayName "DevProgram" -Visibility Private`**
	-  **Autenticación**
	  
		-  **Autenticación en MS Teams: `Connect-MicrosoftTeams`**
-  **Windows**

	-  **Procesos**
	
		-  <strong style ="color: 40C4FF;">Protección</strong>: **[[cybersicherheit/cybersicherheit#^uhm6|Obtener información sobre usuarios y permisos en Windows]]**
		-  <strong style ="color: 40C4FF;">Protección</strong>: **[[cybersicherheit/cybersicherheit#^uhm7|Directorios y rutas susceptibles a ataques en Windows]]**
		-  <strong style ="color: Red;">Ataque</strong>: **[[cybersicherheit/cybersicherheit#^uhm8|Flujos de datos alternativos]]**
		![[Barra.gif]]
		-  **Multi-cuenta SSH**
		
			-  **Gestión de identidades vía SSH**
			
				No permitir el uso de **HTTPS** con contraseñas básicas; es una vulnerabilidad. Implementa un archivo **config** de **SSH** para mapear cada cuenta a una **SSH Key** específica.
				
				-  Generar pares de claves **Ed25519** (las más seguras y eficientes) para cada cuenta.
				-  **Componentes:** 
				
					-  **Crea las claves ssh pertinentes `ssh-keygen -t ed25519 -C "tuCorreo@gmail.com"` o `ssh-keygen -t rsa -b 4096 -C "tuCorreo@gmail.com"`**
					  
						-  **Te pedirá una asignación: `/c/Users/jseba/.ssh/id_ed25519_ejemplo_github_personal`**
						-  Posteriormente una clave de acceso 
					-  **Configurar el archivo `~/.ssh/config`.**
					
						**Host github.uhm**
						    **HostName github.com**
						    **User git**
						    **IdentityFile ~/.ssh/id_ed25519_github_uhm**
						**Host github.gsz**
						    **HostName github.com**
						    **User git**
						    **IdentityFile ~/.ssh/id_ed25519_github_gsz**
						**Host ssh.dev.azure.com**
						    **HostName ssh.dev.azure.com**
						    **User git**
						    **IdentityFile ~/.ssh/id_rsa_azure_devops_unternehmer**
						    **IdentitiesOnly yes**
			-  **Sobreescritura de configuración local**
			
				Tu plantilla global es un buen inicio, pero los proyectos de **Azure DevOps** suelen requerir un `email` corporativo o diferente al de tus proyectos personales en **GitHub**.
				
				-  **Uso de conditional ``Includes`` en Git o configuración de Local Config**
				-  **Configura el archivo ``.gitconfig``:** Incluye configuraciones para directorios de proyectos específicos
				  
						[includeIf "gitdir/i:E:/Obsidian/Ressourcen/Projekte/sebastian_uhm/"]
						    path = .gitconfig-github-uhm
						[includeIf "gitdir/i:E:/Obsidian/Ressourcen/Projekte/sebastian_gsz/"]
						    path = .gitconfig-github-gsz
						[includeIf "gitdir/i:E:/Obsidian/Ressourcen/Projekte/unternehmer_devops/"]
						    path = .gitconfig-azure-uhm
			-  **Autenticación avanzada y credential managers**
			
				Dado que mencionas **Azure DevOps**, el **Git Credential Manager (GCM)** será tu mejor aliado para manejar el **OAuth** y los **Personal Access Tokens (PAT)** sin que sufras en el intento. **Vincula tus claves ssh con los respectivos repositorio**
			
			^RefCreacionMultiCuenta
		-  **Deshabilitar Recall**
		
			- **Verificar si la función Recall está activa: ``dism /online /Get-featureInfo /Featurename:Recall``**
			- **Desactivar Recall: ``dism /online /Disable-feature /Featurename:Recall``**
		-  **Borrar historial PowerShell**
		
			-  **Abre PowerShell y ejecuta para ver si el archivo de perfil existe: ``Test-Path $PROFILE``**
			
			     Si devuelve `False`, significa que el archivo no existe y necesitas crearlo.
			-  **Crea el archivo de perfil ``New-Item -Path $PROFILE -ItemType File -Force``**
			
			    Este comando creará el archivo de perfil si no existe. El parámetro `-Force` asegura que el archivo se cree incluso si los directorios intermedios no existen.
			-  **Editar el archivo de perfil ``notepad.exe $PROFILE``**
			-  **Agregar el alias**: Dentro del archivo, agrega la siguiente línea para crear el alias:
			
				function clear-history {
				    Remove-Item "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt" -Force
				}
			-  **Guardar y cerrar**: Guarda el archivo y cierra Notepad.
			-  **Cargar el perfil**: Finalmente, recarga el perfil para que los cambios tengan efecto: ``. $PROFILE``
			 
			Ahora, podrás usar el alias `clear-history` en cualquier nueva sesión de PowerShell para borrar el historial de comandos.
		-  **Limpiar directorio temporal**
		
			**``Get-ChildItem "$env:LOCALAPPDATA\Temp" -Recurse -Force | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue``**
		-  **Establecer escritorio remoto**
		  
			**``runas /u:MicrosoftAccount\jsebastiangott@outlook.com cmd.exe``**
		-  **Creación de clave asimétrica**
		
			-  **Generar asimétrica: `ssh-keygen -t ed25519 -C "seogomezfull@gmail.com"`**
			-  **Asignar una clave si no la proporcionaste: `ssh-keygen -p -f ~/.ssh/id_ed25519`**
			-  **Túnel de confianza**
			
				-  Permisos para la carpeta (Lectura, escritura y ejecución solo para el dueño)
				
					**``chmod 700 ~/.ssh``**
				-  Permisos para la llave privada (Solo lectura y escritura para el dueño)
				
					**``chmod 600 ~/.ssh/id_ed25519``**
				-  Permisos para la llave pública y known_hosts
				  
					**``chmod 644 ~/.ssh/id_ed25519.pub``**
					**``chmod 644 ~/.ssh/known_hosts``**
					
				^RefGenerarKeyAsimetrica
		-  **Instalar y configurar un servidor web**
		
			Este conjunto de comandos está diseñado para configurar un servidor web en un sistema Windows utilizando **PowerShell**.
			
			``Install-WindowsFeature -name Web-Server -IncludeManagementTools`` 
			``New-Item -Path "C:\inetpub\wwwroot\index.html" -ItemType "file" -Value '<html><h1>Hello From Your Windows Web Server!</h1></html>``
			``Start-Service W3SVC``
			
			-  **Instalar el servicio de servidor web (IIS)**
			
				- **`Install-WindowsFeature`**: Este cmdlet instala una característica o rol en una máquina con Windows Server.
				- **`-name Web-Server`**: Especifica que deseas instalar el rol **Web-Server**, que es el rol de **Internet Information Services (IIS)** en Windows. IIS es el servidor web de Microsoft, utilizado para alojar sitios web y aplicaciones.
				- **`-IncludeManagementTools`**: Incluye las herramientas de gestión de IIS, como la consola de administración, para facilitar la configuración y administración del servidor web.
			-  **Crear un archivo HTML básico**
			
				- **`New-Item`**: Crea un nuevo elemento (archivo, carpeta, etc.) en una ubicación especificada.
				- **`-Path "C:\inetpub\wwwroot\index.html"`**: Especifica la ruta donde se va a crear el archivo HTML. En este caso, se crea un archivo llamado **`index.html`** en la carpeta predeterminada de **IIS** (`C:\inetpub\wwwroot`), que es donde se almacenan los archivos del sitio web por defecto.
				- **`-ItemType "file"`**: Especifica que el tipo de elemento a crear es un archivo.
				- **`-Value '<html><h1>Hello From Your Windows Web Server!</h1></html>'`**: El contenido del archivo **`index.html`** es un código HTML básico que muestra un título con el texto **"Hello From Your Windows Web Server!"**.
			-  **Iniciar el servicio de IIS (W3SVC)**
			
				- **`Start-Service`**: Este cmdlet inicia un servicio en Windows.
				- **`W3SVC`**: Este es el nombre del servicio de **World Wide Web Publishing Service**, que es el servicio principal que ejecuta IIS. Iniciar este servicio permite que el servidor web IIS comience a aceptar solicitudes HTTP y sirva el contenido web.
		-  **Habilitar característica OpenSSH**
		
			-  **Opción A: Instalar a través de la configuración de Windows (GUI)**
			
			    1. Abre la **configuración** de Windows.
			    2. Haz clic en **Aplicaciones**.
			    3. Haz clic en **características opcionales**.
			    4. Haz clic en **agregar una característica**.
			    5. En la lista, busca y selecciona **servidor OpenSSH**.
			    6. Haz clic en **instalar**.
			    7. Espera a que se complete la instalación. 
				
				 A continuación, hay que abrir la ventana de servicios y habilitar este servicio de OpenSSH, además de comprobar que los otros dos servicios de SSH que están al lado que se encuentren también habilitados: 
				 
				 A continuación, crearemos una **nueva regla en el Firewall de Windows** para permitir las conexiones entrantes dirigidas al **Servidor OpenSSH (`sshd`)**.
			    
			    Vamos a desglosar los parámetros para entender mejor su función:
			    
			    - **`New-NetFirewallRule`**: Este es el cmdlet de PowerShell que se utiliza para crear una nueva regla de firewall.
			    - **`-Name sshd`**: Asigna un nombre interno a la regla del firewall (en este caso, `sshd`). Este nombre es el identificador único de la regla dentro del firewall.
			    - **`-DisplayName 'OpenSSH Server (sshd)'`**: Le da a la regla un nombre más descriptivo y amigable que aparecerá en la interfaz gráfica del Firewall de Windows con Seguridad Avanzada.
			    - **`-Service sshd`**: **Importante**: Este parámetro especifica que esta regla se aplica al tráfico asociado con el **servicio de Windows** llamado `sshd` (que es el servicio del Servidor OpenSSH). Esto es mejor que simplemente especificar un puerto, ya que la regla queda ligada directamente al ejecutable del servicio, haciéndola más segura y precisa.
			    - **`-Enabled True`**: Habilita la regla de firewall inmediatamente después de crearla.
			    - **`-Direction Inbound`**: Indica que esta regla se aplica al **tráfico de red que intenta ENTRAR** a tu máquina.
			    - **`-Protocol TCP`**: Especifica que la regla se aplica al protocolo **TCP** (el protocolo que usa SSH).
			    - **`-Action Allow`**: Determina la acción que el firewall tomará para el tráfico que coincida con esta regla; en este caso, es **PERMITIR** la conexión.
			    - **`-Profile Domain`**: Define el perfil de red al que se aplica esta regla. `Domain` significa que la regla estará activa cuando la máquina esté conectada a una red que autentique en un dominio de Active Directory. Si quisieras que aplicara también en redes privadas o públicas, necesitarías agregar o cambiar este parámetro (ej. `-Profile Domain,Private,Public` o simplemente omitirlo si aplica por defecto).: **`New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Service sshd -Enabled True -Direction Inbound -Protocol TCP -Action Allow -Profile Domain`** 
			-  **Opción B: Instalar a través de PowerShell (Como Administrador)**
			
			    1. Abre **Windows PowerShell como Administrador**. Haz clic derecho en el botón de Inicio y selecciona "Windows PowerShell (Administrador)" o "Terminal (Administrador)".
			    2. Ejecuta el siguiente comando para ver si el Servidor OpenSSH ya está disponible para instalar: **`Get-WindowsCapability -Online | Where-Object {$_.Name -like 'OpenSSH.Server*'}`**
			    3. Ejecuta el siguiente comando para instalar el Servidor OpenSSH: **`Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0`**
			    
			    -  **Paso 1: Iniciar y configurar el servicio del servidor OpenSSH**
			     
			        - Abre **Windows PowerShell como Administrador**.
			        - Establece el tipo de inicio del servicio `sshd` (el Servidor OpenSSH) a Automático: **`Set-Service -Name sshd -StartupType Automatic`**
			        - Inicia el servicio `sshd`: **`Start-Service -Name sshd`**
			        - Verifica el estado del servicio para confirmar que se está ejecutando: **`Get-Service -Name sshd`**
			        - Deberías ver `Status : Running`.
			    -  **Paso 2: Configurar el firewall de Windows**
			     
			        El Firewall de Windows bloqueará por defecto las conexiones SSH entrantes en el puerto 22. Debes crear una regla para permitir estas conexiones.
			        
			        1. Abre **Windows PowerShell como Administrador**.
			        2. Crea una regla de firewall para permitir el tráfico entrante TCP en el puerto 22: **`New-NetFirewallRule -DisplayName "OpenSSH-Server-Inbound-TCP" -Protocol TCP -LocalPort 22 -RemoteAddress Any -Action Allow`**
			    -  **Paso 3: Conectarse al servidor SSH**
			     
			        Ahora que el servidor está instalado, iniciado y el firewall configurado, puedes conectarte desde un cliente SSH (como PuTTY, el cliente `ssh` en Linux/macOS, o el cliente `ssh` que también se instala como característica opcional en Windows).
			        
			        - Abre una terminal o cliente SSH en la máquina cliente.
			        - Usa el siguiente comando, reemplazando `NombreUsuario` por tu nombre de usuario en la máquina Windows y `DireccionIP` por la dirección IP de la máquina Windows donde instalaste el servidor SSH: **`ssh NombreUsuario@DireccionIP`**
			        - La primera vez que te conectes, es posible que se te pida confirmar la huella digital del servidor. Escribe `yes`.
			        - Se te pedirá la contraseña del usuario en la máquina Windows. Introduce la contraseña.
			        
			        Si todo está configurado correctamente, deberías obtener una línea de comandos remota en tu máquina Windows.
		-  **Extraer historial cache DNS `ipconfig /displaydns`**
		-  **Eliminar componentes y actualizaciones de Windows**
		
			- **``Dism.exe /online /Cleanup-Image /StartComponentCleanup``**
			- **``Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase``**
	-  **[Sintaxis CMDlets](process-microsoft.md)**
	
		-  `Get-Command`: Obtener información sobre comandos disponibles en la sesión actual de PowerShell.
		  
			- Buscar un Comando Específico: `Get-Command -Name Get-ChildItem`
			- Puedes filtrar los comandos por el módulo al que pertenecen: `Get-Command -Module ActiveDirectory`
			- Puedes filtrar los comandos por su tipo, como cmdlet, función, alias o script: `Get-Command -CommandType Cmdlet`
			- Puedes usar `Get-Command` para obtener la definición y detalles de un comando específico: `Get-Command -Name Get-ChildItem | Get-Help`
		-  `Select-String`: El comando `Select-String` en PowerShell se utiliza para buscar patrones de texto dentro de archivos. Es especialmente útil cuando necesitas encontrar líneas que contienen ciertas cadenas de texto o patrones específicos dentro de archivos de texto o incluso en la salida de otros comandos. 
		  
			Te permite filtrar y seleccionar solo las líneas que cumplen con los criterios de búsqueda que especificas. `Select-String -Path "ruta/al/archivo.txt" -Pattern "error"`
		
		-  <strong style ="color:;">Comandos básicos</strong>
		
			- **`dir` or `Get-ChildItem`: Lista todos los archivos en el directorio actual.**
			-  **`ls`: Lista los archivos de un directorio**
			-  **`cd directory`: Cambia al directorio especificado.**
			-  **`cd..`: Navega al directorio superior.**
			-  **`cd \` : Navega al directorio raíz (usualmente C:).**
			-  **`copy origen destino`: Copia archivos a otra ubicación.**
			-  **`del nombre_archivo`: Borra archivos.**
			-  **`find`: Busca texto en archivos.**
			-  **`findstr`: findstr es una herramienta más potente que ofrece mayor flexibilidad.**
			
				- **Buscar expresiones regulares: Esto significa que puedes buscar patrones más complejos, como números, rangos de caracteres, o combinaciones de texto.**
				- **Más opciones de búsqueda: `findstr` ofrece una amplia variedad de opciones para personalizar la búsqueda, como buscar al principio o al final de una línea, omitir mayúsculas y minúsculas, y más.**
			-  **``md CarpetaNueva``: Crea un nuevo directorio.**
			-  **``rd ArchivoNuevo``: Crear archivo.**
			-  **`del ArchivoNueva`: Eliminar.** 
			-  **`ren nombre_antiguo nombre_nuevo`: Renombra un archivo.**
			-  **`help`: Muestra todos los comandos disponibles.**
			-  **`help comando`: Proporciona ayuda detallada sobre un comando específico.**
			-  **`cls`: Borrar entradas.**
			  
			-  <strong style ="color: 26c6da;">Seguridad</strong>
			
				-  ``whoami ``: Se utiliza para mostrar los privilegios de seguridad de la cuenta de usuario actual.
			-  <strong style ="color: 26c6da;">Red</strong>
			
				-  **`netstat`: Monitorizar y diagnosticar las conexiones de red en un sistema operativo. Nos proporciona una visión detallada de cómo se está comunicando tu dispositivo con otros equipos a través de la red. Estadísticas de protocolos y puertos.**
				  
					- **``-f``: Muestra la tabla de rutas para el protocolo IPv4.**
					- **`-a`: Muestra todas las conexiones activas y puertos de escucha (TCP y UDP).**
					- **`-b`: Muestra el nombre del ejecutable asociado a cada conexión o puerto (requiere permisos de administrador).**
					- **`-e`: Muestra estadísticas Ethernet (bytes, paquetes enviados/recibidos).**
					- **`-n`: Muestra direcciones y puertos en formato numérico (sin resolver nombres).**
					- **`-o`: Muestra el PID del proceso asociado a cada conexión.**
					- **`-p [protocolo]`: Filtra conexiones por protocolo específico (TCP, UDP, etc.).**
					- **`-q`: Muestra estadísticas de la cola de conexión TCP IPv4.**
					- **`-r`: Muestra la tabla de enrutamiento.**
					- **`-s`: Muestra estadísticas de protocolos separados (TCP, UDP, etc.).**
					- **`-t`: Muestra solo conexiones TCP activas.**
					- **`-x`: Muestra conexiones NetBIOS en Windows.**
					- **`-c`: Actualiza la salida continuamente (solo en sistemas Unix/Linux).**
					- **``-u`` (udp): Muestra las conexiones UDP establecidas: `netstat -u`**
					- **``-i`` (interface): Muestra estadísticas de las interfaces de red: `netstat -i`**
					- **``-v`` (verbose): Proporciona una salida más detallada con información adicional sobre las conexiones y estadísticas: `netstat -v`**
					- **``-y`` (ip type): Muestra información específica de IP, como la versión de IP utilizada (IPv4 o IPv6): `netstat -y`**
					- **``-W`` (wide): Muestra la salida en un formato más ancho, útil para visualizar detalles adicionales en la pantalla: `netstat -W`**
					- **``-F`` (fib): Muestra la tabla FIB (Forwarding Information Base), que contiene información sobre cómo reenviar paquetes de red: `netstat -F`**
					- **``-M`` (masquerade): Muestra información sobre conexiones enmascaradas: `netstat -M`**
					- **``-Z`` (context): Muestra el contexto de seguridad asociado con cada conexión:  ``netstat -Z``**
		
					  <strong style ="color: Red;">Comandos adicionales de Netstat</strong>
		
					**Básicos y filtrados**
					
					- **`netstat -l`**: Enumera todas las condiciones de escucha.
					- **`netstat -lu`**: Enumera solo los puertos UDP en escucha.
					- **`netstat -F`**: Muestra el nombre de dominio en lugar de la dirección IP.
					- **`netstat -tcp`**: Muestra las conexiones TCP de forma continua.
					
					**Con información extendida**
					
					- **`sudo netstat -ltpe`**: Muestra conexiones de escucha TCP con información del proceso e información extendida.
					- **`netstat -aple | grep [servicio]`**: Comprueba si un servicio específico se está ejecutando, como HTTP, SMTP o NTP.
					
					**Análisis de puertos y direcciones IP**
					
					- **`netstat -anp | grep ":[puerto]"`**: Muestra todas las conexiones abiertas a un puerto específico.
					- **`netstat -atnp | grep ESTA`**: Muestra las conexiones activas/establecidas.
					- **`watch -d -n0 "netstat -atnp | grep ESTA"`**: Lista continuamente conexiones activas destacando cambios.
					- **`netstat -plntu`**: Verifica los puertos abiertos (IPv4 e IPv6).
					- **`netstat -plnt`**: Verifica solo los puertos abiertos.
					
					**Comandos de seguridad**
					
					- **`netstat -tn 2>/dev/null | grep :80 | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr | head`**: Muestra direcciones IP con un gran número de conexiones al puerto 80.
					- **`netstat -n -p|grep SYN_REC | wc -l`**: Muestra el número de conexiones SYNC_REC activas.
					- **`netstat -n -p | grep SYN_REC | awk '{print $5}' | awk -F: '{print $1}'`**: Lista direcciones IP únicas que envían conexiones SYN_REC.
					- **`netstat -antu | grep :80 | grep -v LISTEN | awk '{print $5}'`**: Muestra solo direcciones IP extranjeras conectadas al puerto 80.
					
					**Análisis de conexiones por IP**
					
					- **`netstat -antu | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | sort -n`**: Cuenta las conexiones por IP remota.
					- **`netstat -antu | awk '$5 ~ /[0-9]:/{split($5, a, ":"); ips[a[1]]++} END {for (ip in ips) print ips[ip], ip | "sort -k1 -nr"}'`**: Alternativa avanzada para contar conexiones por IP remota.
					
					**Conexiones y estadísticas continuas**
					
					- **`netstat -pnut -w | column -t -s $'\t'`**: Muestra conexiones activas a Internet de forma tabulada.
					- **`netstat -an | grep 80 | wc -l`**: Cuenta el número de conexiones abiertas al puerto 80.
				-  ``arp -a``: Muestra la tabla MAC e IP guardas en cache, según el protocolo ARP
					- **-a**: Muestra las entradas ARP en la tabla.
					- **-d inet_addr**: Borra una entrada ARP específica correspondiente a la dirección IP especificada.
					- **-s inet_addr eth_addr**: Agrega una entrada estática a la tabla ARP. `inet_addr` es la dirección IP y `eth_addr` es la dirección MAC.
					- **inet_addr**: Especifica una dirección IP. Si se omite, muestra todas las entradas de la tabla ARP.
				-  `ipconfig /all`: Muestra toda las configuraciones de las interfaces de red.
		-  <strong style ="color:;">Administración de directorios</strong>
		
			-  `Get-ChildItem` or `gci`: Lista todos los archivos en el directorio actual.
			
				- Especifica la ruta o las rutas de los directorios a listar: `Get-ChildItem -Path "C:\Directorio"`
				- Permite filtrar los resultados basados en un patrón de nombre de archivo: `Get-ChildItem -Path "C:\Directorio" -Filter "*.txt"`
				- Incluye o excluye archivos específicos basados en patrones de nombre de archivo: `Get-ChildItem -Path "C:\Directorio" -Include "*.txt" -Exclude "archivo1.txt"`
				- Lista los archivos y directorios de manera recursiva dentro de todos los subdirectorios: `Get-ChildItem -Path "C:\Directorio" -Recurse`
				- Especifica el nivel de profundidad para listar subdirectorios recursivamente: `Get-ChildItem -Path "C:\Directorio" -Recurse -Depth 2`
				- Filtra los resultados para mostrar solo archivos o solo directorios: `Get-ChildItem -Path "C:\Directorio" -File` or `Get-ChildItem -Path "C:\Directorio" -Directory`
				- Muestra archivos y directorios ocultos y del sistema: `Get-ChildItem -Path "C:\Directorio" -Force`
				- Filtra los archivos y directorios basados en atributos específicos, como de solo lectura o de sistema: `Get-ChildItem -Path "C:\Directorio" -Attributes ReadOnly, System`
				- Ordena los resultados por propiedades como nombre, fecha o tamaño: `Get-ChildItem -Path "C:\Directorio" | Sort-Object -Property Name` or `Get-ChildItem -Path "C:\Directorio" | Sort-Object -Property LastWriteTime -Descending`
		-  <strong style ="color:;">Networking</strong>
		
			-  `Invoke-Command`: Se utiliza para ejecutar comandos en una o más máquinas remotas de manera simultánea. Es una herramienta poderosa que permite administrar sistemas distribuidos de forma centralizada desde una sola consola de PowerShell.
			
				- **``Automatización y escalabilidad``**: Permite la automatización de tareas en entornos distribuidos y la ejecución de comandos en múltiples máquinas de manera eficiente.
				- **``Administración remota``**: Facilita la administración remota de sistemas Windows al ejecutar comandos en máquinas sin la necesidad de conectarse físicamente a cada una.
				- **``Seguridad``**: Soporta la autenticación mediante credenciales para garantizar la seguridad al acceder a máquinas remotas.
				
				- `Invoke-Command` permite ejecutar comandos en una o más máquinas remotas especificadas: `Invoke-Command -ComputerName "Server01" -ScriptBlock { Get-Process }`
				- Puedes iniciar sesiones de PowerShell en máquinas remotas y ejecutar comandos dentro de esas sesiones: `Invoke-Command -ComputerName "Server01" -Credential $cred -ScriptBlock { Get-Service }`
				- `Invoke-Command` admite parámetros adicionales como `-Credential` para autenticación, `-ScriptBlock` para el bloque de script a ejecutar y otros para configuración avanzada de la sesión remota: `Invoke-Command -ComputerName "Server01" -Credential $cred -ScriptBlock { | Get-Service | Get-Process }`
				- Puedes ejecutar comandos simultáneamente en múltiples máquinas remotas especificadas utilizando `Invoke-Command`: `Invoke-Command -ComputerName "Server01", "Server02", "Server03" -ScriptBlock { Restart-Service -Name "ServiceName" }`
		-  <strong style ="color:;">Otros Cmdlets</strong>
		
			-  `Measure-Command`: Mide el tiempo de ejecución de un bloque de script o un comando específico. Es una herramienta útil para evaluar el rendimiento y la eficiencia de los scripts y comandos en PowerShell.
			
				- **Optimización de Rendimiento**: Ayuda a identificar áreas del script que pueden optimizarse para mejorar el tiempo de ejecución.
				- **Evaluación de Scripts y Comandos**: Facilita la evaluación del impacto del tiempo de ejecución antes y después de realizar cambios en los scripts.
				- **Análisis Detallado**: Proporciona estadísticas detalladas que ayudan en el análisis de rendimiento y la toma de decisiones.
				
				- `Measure-Command` calcula y muestra el tiempo que tarda en ejecutarse un bloque de script o comando dentro de un script: `Measure-Command { | Get-Process | }`
				- Permite obtener estadísticas detalladas como `TotalMilliseconds`, `TotalSeconds`, `TotalMinutes`, `TotalHours` que indican el tiempo total empleado en la ejecución del comando o script: `$result = Measure-Command { | Start-Sleep -Seconds 5 | } | $result.TotalSeconds`
				- Puedes utilizar `Measure-Command` para comparar el tiempo de ejecución entre diferentes enfoques o versiones de un script y así optimizar el rendimiento: ``$result1 = Measure-Command { | # Primer enfoque del script | } $result2 = Measure-Command { | # Segundo enfoque del script | } | $result1.TotalSeconds | $result2.TotalSeconds``
				
				Ejemplo, medir el tiempo de ejecución de un bloque de script: ``$result = Measure-Command { |Get-ChildItem -Path "C:\" | } | $result.TotalMilliseconds``
-  **Power Platform**

	-  **Procesos**
	
		-  **Auditoría de Offboarding / Planificación de reasignación de datos**
		
			-  **[[auditar_propiedades_registros_usuario_mpp.ps1|Descubrir entidades y registros en las que un usuario es propietario]]**
	-  **Identidad y licenciamiento (Microsoft Graph)**
	
		-  **Conexión al Graph: `Connect-MgGraph -Scopes "Organization.Read.All", "User.ReadWrite.All", "TeamMember.Read.All"`**
		-  **Listar usuarios del tenant: `Get-MgUser -All -Property "DisplayName,UserPrincipalName,AccountEnabled" | Select-Object DisplayName, UserPrincipalName, AccountEnabled`**
		-  **Inventario de licencias: `Get-MgSubscribedSku | Select-Object SkuPartNumber, ConsumedUnits, @{N='Enabled';E={$_.PrepaidUnits.Enabled}}`**
		-  **Ver detalle de licencias (Usuario): `Get-MgUserLicenseDetail -UserId "sebastian@luxsovereign.onmicrosoft.com"`**
		-  **Ver planes de servicio activos (Usuario): `Get-MgUserLicenseDetail -UserId "sebastian@luxsovereign.onmicrosoft.com" | Select-Object -ExpandProperty ServicePlans | Select-Object ServicePlanName, ProvisioningStatus`**
		-  **Asignar licencia a usuario: `Set-MgUserLicense -UserId "sebastian@luxsovereign.onmicrosoft.com" -AddLicenses @{SkuId = "5b631642-bd26-49fe-bd20-1daaa972ef80"} -RemoveLicenses @()`**
	-  **Administración y gobernanza**
	
		-  **Grupos**
		
			- **Listado de equipos: `pac env fetch -x "<fetch><entity name='team'><attribute name='name'/></entity></fetch>"`**
			- **Tipos de equipos: `pac env fetch -x "<fetch><entity name='team'><attribute name='name'/><attribute name='teamtype'/><attribute name='businessunitid'/></entity></fetch>"`**
			- **Administrador asociado al equipo: `pac env fetch -x "<fetch><entity name='team'><attribute name='name'/><attribute name='administratorid'/></entity></fetch>"`**
			- **Miembros de un equipo: `pac env fetch -x "<fetch><entity name='teammembership'><attribute name='systemuserid'/><attribute name='teamid'/></entity></fetch>"`**
			- **Roles asignados a cada equipo: `pac env fetch -x "<fetch><entity name='teamroles'><attribute name='teamid'/><attribute name='roleid'/></entity></fetch>"`**
			- **Búsqueda directa GUIDs: `pac env fetch -x "<fetch><entity name='team'><all-attributes/><filter><condition attribute='teamid' operator='in'><value>3049173b-2e4b-f111-becf-000d3a32d9b8</value><value>d45f2132-2e4b-f111-becf-000d3a32d9b8</value></condition></filter></entity></fetch>"`**
			- **Consultar vinculación Entra ID: `pac env fetch -x "<fetch><entity name='team'><attribute name='name'/><attribute name='azureactivedirectoryobjectid'/><attribute name='teamtype'/></entity></fetch>"`**
		-  **Usuarios**
		
			- **Filtrar usuarios habilitados: `pac env fetch -x "<fetch><entity name='systemuser'><attribute name='fullname'/><attribute name='internalemailaddress'/><attribute name='accessmode'/><filter type='and'><condition attribute='accessmode' operator='eq' value='0'/><condition attribute='isdisabled' operator='eq' value='0'/></filter><link-entity name='businessunit' from='businessunitid' to='businessunitid' alias='bu'><attribute name='name'/></link-entity></entity></fetch>"`**
			- **Listar usuarios: `pac env fetch -x "<fetch><entity name='systemuser'><attribute name='fullname'/><attribute name='accessmode'/><attribute name='internalemailaddress'/></entity></fetch>"`**
			- **Lista de usuarios no interactivos: `pac env fetch -x "<fetch><entity name='systemuser'><attribute name='systemuserid'/><attribute name='fullname'/><attribute name='accessmode'/><attribute name='internalemailaddress'/><filter type='and'><condition attribute='accessmode' operator='neq' value='4'/></filter></entity></fetch>"`**
			- **Fetch usuario específico por atributo: **`pac env fetch -x "<fetch><entity name='systemuser'><attribute name='fullname'/><attribute name='domainname'/><filter><condition attribute='domainname' operator='eq' value='unternehmer@luxsovereign.onmicrosoft.com'/></filter></entity></fetch>"`**
			- **Consulta personalizada: `pac env fetch -x "<fetch><entity name=''><attribute name=''/><filter><condition attribute='' operator='eq' value=''/></filter></entity></fetch>"`**
			- 
		-  **Seguridad**
		
			- **Lista roles de entorno: `pac admin list-roles --environment 60b13b3d-253d-e5e6-a822-75dfe5d2a40a`**
			- **Listar roles: `pac env fetch -x "<fetch><entity name='role'><attribute name='name'/></entity></fetch>"`**
			- **Relación de usuarios y roles: `pac env fetch -x "<fetch><entity name='systemuserroles'><attribute name='systemuserid'/><attribute name='roleid'/></entity></fetch>"`**
			- **Asignar rol a usuario en entorno: `pac admin assign-user --environment 60b13b3d-253d-e5e6-a822-75dfe5d2a40a --user sebastian@luxsovereign.onmicrosoft.com --role "Environment Maker"`**
			- **Asignar rol: `pac admin assign-user --environment 60b13b3d-253d-e5e6-a822-75dfe5d2a40a --user sebastian@luxsovereign.onmicrosoft.com --role "Environment Maker"`**
		-  **Early Binding**
		
			**``pac modelbuilder build --outdirectory .\Models --namespace GymNexus.Models --serviceContextName GymContext``**
			
			Cuando ejecutas esto, estás creando una capa de abstracción que te permite trabajar con tus tablas de Dataverse como si fueran objetos normales de C#, obteniendo beneficios de autocompletado (IntelliSense) y validación en tiempo de compilación.
			
			**Desglose de los argumentos**
			
			-  **`pac modelbuilder build`**: Es el comando principal que invoca al generador de código de la CLI de Power Platform.
			-  **`--outdirectory .\Models`**: Define la carpeta de destino donde se guardarán todos los archivos `.cs` generados. En tu caso, creará una carpeta llamada "Models" en el directorio actual.
			-  **`--namespace GymNexus.Models`**: Establece el espacio de nombres (C# namespace) para las clases generadas. Esto es esencial para organizar tu código; todas tus entidades (tablas) estarán bajo esta jerarquía.
			-  **`--serviceContextName appgimnasiocontext`**: Define el nombre de la clase principal (que hereda de `OrganizationServiceContext`). Esta clase actuará como tu "puerta de entrada" para interactuar con Dataverse, permitiéndote realizar consultas LINQ sobre tus tablas de manera sencilla, `appgimnasiocontext` es tu **"operador de almacén"** que mueve esas cajas dentro y fuera de Dataverse. Tú, en tus archivos de lógica, solo tienes que rellenar las cajas y dárselas al operador. No necesitas tocar el archivo `aaduser.cs` para nada. El comando lo creó una vez y, a menos que cambies la tabla en Dataverse, no necesitas volver a mirarlo. Solo úsalo como una herramienta más.
			
			**¿Por qué deberías usarlo? (Ventajas de Early-Bound)**
			
			Al utilizar este comando, pasas de trabajar con **Late-Bound** (donde accedes a datos mediante cadenas de texto "mágicas" como `entity["nombre_campo"]`) a **Early-Bound** (donde accedes mediante propiedades reales como `entidad.NombreCampo`).
			
			**Beneficios para tu arquitectura:**
			
			1. **IntelliSense:** Visual Studio te mostrará automáticamente los campos disponibles al escribir `.`. No tendrás que recordar los nombres exactos de las columnas o buscar esquemas constantemente.
			2. **Seguridad de tipos:** Si intentas asignar un valor de texto a un campo que es un número entero, el compilador te dará un error antes de que ejecutes el programa.
			3. **Consultas LINQ:** Al generar el `ServiceContext` (en tu caso, `GymContext`), podrás realizar consultas de datos utilizando LINQ, lo cual es mucho más legible y menos propenso a errores que escribir FetchXML manualmente para cada operación de lectura.
			
			**Ejemplo de cómo cambia tu código:**
			
			-  **Sin este comando (Late-Bound):** `string nombre = cuenta["accountname"].ToString();`
			-  **Con este comando (Early-Bound):** `string nombre = cuenta.AccountName;`
			
			Este comando es, esencialmente, el primer paso para estructurar un proyecto de desarrollo robusto sobre Dataverse, transformando tu base de datos en un modelo de objetos de C# listo para ser utilizado en plugins, aplicaciones de consola o servicios de integración.
		-  **Listar organización**
		
			**`pac org list`**
		-  **Consultar entidades**
		  
			-  **Consultar la entidad: `pac env fetch -x "<fetch><entity name='systemuser'><all-attributes/></entity></fetch>"`**
		-  **Creación de soluciones**
		  
			**Comando: ``pac solution init --publisher-name juansebastian --publisher-prefix jsgz && dotnet build && pac solution import --path .\bin\Debug\appgimnasio.zip --async``**
			
			**Flujo cronológico**
			
			El proceso de construcción sigue un ciclo de vida de tres etapas, donde cada comando cumple una función específica:
			
			1. **`pac solution init`**: Define la estructura base y la identidad del editor.
			2. **`dotnet build`**: Compila el código fuente, gestiona dependencias y empaqueta el producto final.
			3. **`pac solution import`**: Despliega el producto final en el entorno de Dataverse.
			![[create_solutions_mpp.svg]]
			Por orden cronológico del comando que ejecutaste: `pac solution init --publisher-name juansebastian --publisher-prefix jsgz` Este comando fue el primero que generó archivos. Los primeros archivos creados fueron: **``.gitignore``** y **``appgimnasio.cdsproj``**.
			
			-  **`src/` (El código fuente)**
			
				Aquí vive el ADN de tu aplicación. Si pierdes `src`, pierdes la aplicación.
				
				-  **Identidad:** Contiene los archivos que definen qué es tu solución.
				-  **Archivo clave:** `src\Other\Solution.xml`.  Es el `package.json`, `*.csproj` o `Cargo.toml` de tu solución. Define quién eres, quién es el publicador y las dependencias de tu solución.
			-  **`obj/` (La cocina)**
			
				Aquí ocurre la magia interna de MSBuild. Todo lo que está aquí es efímero; se genera para que el compilador entienda el contexto.
				
				**¿Por qué no versionarlo?** Porque son archivos generados automáticamente que dependen del entorno local de tu máquina.
				
				**Archivos relevantes:**
				    
				-  `project.assets.json`: Es el "mapa de ruta" de tus dependencias. Si tienes errores de compilación, este archivo es el primero en ser analizado.
				-  `SolutionPackager.log`: **El archivo de auditoría.** Es el registro oficial de qué hizo el `Solution Packager` durante el build. Si la importación falla o algo falta en tu ZIP, léelo.
				-  `*.cache`: Archivos de rendimiento. Evitan que el sistema recalcule lo que no ha cambiado.
			-  **`bin/` (El producto)**
			
				Contiene el artefacto listo para ser entregado. **`appgimnasio.zip`**: Es el resultado del esfuerzo. Es el único archivo que Dataverse entiende. Es generado por el `SolutionPackager` y es el que consumes mediante `pac solution import`.
				
			**Anatomía del proceso de Build (`dotnet build`)**
			
			Cuando ejecutas `dotnet build`, ocurre una secuencia lógica invisible:
			
			1. **Restauración:** Se analiza `appgimnasio.cdsproj` y se descargan las herramientas necesarias (NuGet).
			2. **Preparación (`obj/`):**
			    
			    - Se validan las dependencias (`project.assets.json`).
			    - Se verifica qué ha cambiado (`CoreCompileInputs.cache`).
			    - Se prepara el empaquetado.
			3. **Empaquetado (`SolutionPackager`):**
			
			    - El motor toma los archivos XML de `src` (Customizations, Relationships, Solution).
			    - Los comprime según las reglas del archivo `.cdsproj`.
			    - Genera el `SolutionPackager.log` para reportar éxitos o fallos.
			4. **Salida (`bin/`):**
			
			    - Se deposita el `appgimnasio.zip` final.
			
			**Guía de inspección (Troubleshooting)**
			
			Si algo falla, sigue este orden para diagnosticar:
			
			1. **`appgimnasio.cdsproj`**: Revisa si la configuración del proyecto es correcta. Es el puente entre MSBuild y Dataverse.
			2. **`obj\Debug\SolutionPackager.log`**: Busca errores de empaquetado, dependencias faltantes o componentes.
			3. **`bin\Debug\appgimnasio.zip`**: Si sospechas que un cambio no se aplicó, descomprime este ZIP y verifica si el archivo XML interno realmente contiene tus cambios.
			    
			**Notas para el equipo (o para tu futuro "yo"):**
			
			-  **Regla de oro:** Nunca modifiques manualmente el contenido de `obj` o `bin`.
			-  **La verdad vive en `src`:** Cualquier cambio permanente debe hacerse en los archivos XML dentro de `src` o, idealmente, a través de la interfaz gráfica y luego exportar (hacer "pull") los cambios hacia `src`.
		-  **Autenticación: `pac auth list`**
		-  **Seleccionar entorno activo: `pac env select --environment 60b13b3d-253d-e5e6-a822-75dfe5d2a40a`**
		-  **Comprobar entorno: `pac org who`**
		-  **Listar entornos: `pac env list`**
		-  **Listar políticas DLP: `pac admin dlp-policy list`**
		-  **Listar Business Unit: `pac env fetch -x "<fetch><entity name='businessunit'><attribute name='name'/></entity></fetch>"`**
		-  **Listar configuración del tenant: `pac admin list-tenant-settings`**
		-  **Respaldo de configuración del tenant: `pac admin list-tenant-settings > tenant-settings-backup.yaml`**
		-  **Ayuda sobre comando fetch: `pac env fetch help`**
		-  **Ayuda sobre asignación de usuarios: `pac admin assign-user help`** 
		-  **Ayuda sobre actualización de configuración: `pac admin update-tenant-settings help`**
		-  **Ayuda sobre políticas DLP: `pac admin dlp-policy help`**
		-  **Ayuda sobre visualización de políticas DLP: `pac admin dlp-policy show help`**
	-  **Políticas de restricción de entornos**
	
		-  **Restringir creación de entornos de Teams a no administradores:** `pac admin update-tenant-settings -n disableTeamsEnvironmentCreationByNonAdminUsers -v true`
		-  **Restringir creación de entornos de desarrollo a no administradores:** `pac admin update-tenant-settings -n powerPlatform.governance.disableDeveloperEnvironmentCreationByNonAdminUsers -v true`
		-  **Restringir creación general de entornos a no administradores:** `pac admin update-tenant-settings -n disableEnvironmentCreationByNonAdminUsers -v true`
		-  **Restringir creación de entornos de prueba a no administradores:** `pac admin update-tenant-settings -n disableTrialEnvironmentCreationByNonAdminUsers -v true`






