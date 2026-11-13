

![[barra.gif]]
-  **powershell-module-microsoft-graph**

	-  **Enlaces**
	
		-  **[Microsoft Graph PowerShell ](https://learn.microsoft.com/en-us/powershell/microsoftgraph/?view=graph-powershell-1.0)**
		-  **[Documentación Microsoft Graph](microsoft-graph.md)**
		-  **[Microsoft Graph PowerShell | GitHub ](https://github.com/microsoftgraph/msgraph-sdk-powershell)**
	
	El **módulo de Microsoft Graph** (`Microsoft.Graph`) para PowerShell es la herramienta oficial proporcionada por Microsoft para administrar, automatizar e interactuar con los servicios de la nube de Microsoft 365 (como Azure AD / Entra ID, Exchange Online, SharePoint, Teams, OneDrive, entre otros) utilizando la API de Microsoft Graph.
	
	A continuación, te detallo sus características y capacidades principales:
	
	-  **Estructura Modular (Submódulos):** Anteriormente se utilizaban módulos separados para cada servicio (como AzureAD o MSOnline), pero Microsoft unificó todo en un único gran SDK modular. Al instalar el módulo principal, este se divide en submódulos especializados (por ejemplo, `Microsoft.Graph.Users`, `Microsoft.Graph.Authentication`, `Microsoft.Graph.Teams`), cargando los comandos según los necesites.
	-  **Autenticación Segura:** Permite conectarse tanto de forma interactiva (usando comandos como `Connect-MgGraph`) mediante cuentas de usuario delegadas, como de manera desatendida utilizando secretos de aplicación o certificados (_App-only authentication_).
	-  **Control de Permisos por Scopes:** Las acciones que puedes realizar en el tenant están estrictamente limitadas por los permisos (_scopes_) que autorices durante la conexión (por ejemplo, `User.ReadWrite.All` o `Directory.Read.All`), garantizando un modelo de seguridad basado en el principio de mínimo privilegio.
	-  **Gran Catálogo de Cmdlets:** Incluye miles de comandos estandarizados con el prefijo `-Mg` (por ejemplo, `Get-MgUser`, `New-MgGroup`, `Get-MgTeam`), lo que facilita la lectura y modificación de recursos en la nube directamente desde la terminal de PowerShell.
	
	-  **Web Account Manager (WAM)**
	
		**WAM (Web Account Manager)** es el componente nativo de Windows que gestiona las ventanas emergentes de inicio de sesión y el almacenamiento de tokens de forma segura y unificada en el sistema operativo. Por defecto, es la opción recomendada porque permite un inicio de sesión fluido, reutiliza cuentas corporativas ya conectadas a Windows y maneja la autenticación multifactor (MFA) de forma nativa.
		
		Sin embargo, los desarrolladores y administradores a veces necesitan desactivarlo por las siguientes razones:
		
		1. **Uso de una aplicación personalizada (Client ID propio):** Si estás desarrollando una automatización o script avanzado y necesitas autenticarte utilizando el ID de una aplicación registrada por ti mismo en lugar de la aplicación predeterminada del SDK, WAM no te dejará usar ese Client ID personalizado a menos que lo desactives.
		2. **Entornos automatizados o desatendidos:** En ciertos scripts complejos o pruebas donde se requiere un control estricto sobre el flujo de autenticación, WAM puede interferir al intentar forzar la interfaz gráfica o las cuentas vinculadas de Windows.
		3. **Problemas de compatibilidad o políticas estrictas:** En algunos equipos corporativos con restricciones muy específicas de seguridad o cuentas múltiples (por ejemplo, mezclar cuentas personales y profesionales en el mismo Windows), WAM puede generar errores extraños de bucle en el login, por lo que desactivarlo fuerza un flujo de autenticación alternativo basado en navegador o código de dispositivo.


















































