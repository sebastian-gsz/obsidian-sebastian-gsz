
-  **Habilitar MCP Server Cloud**

	-  **[Atlassian MCP Server (GitHub oficial) ](https://github.com/atlassian/atlassian-mcp-server)**
	-  **[Documentación: Getting started ](https://support.atlassian.com/atlassian-rovo-mcp-server/docs/getting-started-with-the-atlassian-remote-mcp-server/)**
	-  **[Control de la configuración del servidor MCP ](https://support.atlassian.com/security-and-access-policies/docs/control-atlassian-rovo-mcp-server-settings/)**
	-  **[Tokens de API ](https://id.atlassian.com/manage-profile/security/api-tokens)**
	-  **[Mi Jira ](https://sebastian-gsz.atlassian.net/)**
	
	-  **Resumen**
	
		Conexión de Jira a **ZCode** mediante el **servidor MCP remoto oficial de Atlassian** (`https://mcp.atlassian.com/v2/mcp`) con transporte **HTTP (streamable-http)** y autenticación **OAuth 2.1** gestionada por el propio ZCode. Resultado: acceso al catálogo completo de herramientas (Jira, Confluence, Bitbucket…) **sin procesos locales** (~180 MB liberados frente al servidor stdio) y **sin secretos en el archivo de configuración**.
	
		-  **Sitio:** `https://sebastian-gsz.atlassian.net` (plan personal, soy el admin de la organización)
		-  **Cliente MCP:** ZCode (`type: http`), el flujo OAuth lo resuelve él solo (PKCE + registro dinámico de cliente + refresco automático de token)
		-  **Estado final (07-nov-2026):** servidor **conectado** con **26 herramientas** expuestas — verificado en los logs de ZCode (**`mcp.server.connected … toolCount: 26`**)
	-  **Configuración final en ZCode**
	
		Archivo: **`C:\Users\sebastian\.zcode\cli\config.json`**, dentro de **`mcp.servers`**:

		```json
		"jira": {
		  "type": "http",
		  "url": "https://mcp.atlassian.com/v2/mcp",
		  "enabled": true,
		  "timeoutMs": 60000
		}
		```

		Tras editar el archivo hay que **reiniciar la sesión** (o ZCode completo) para que el servidor se conecte. El estado se revisa en **Settings → MCP**.
	-  **Proceso realizado (cronología)**
	
		-  **Paso 1: Servidor local stdio (mcp-atlassian)**
		
			Primera aproximación con el servidor comunitario [sooperset/mcp-atlassian ](https://github.com/sooperset/mcp-atlassian) vía **`uvx`**:
			
			-  Comando: **`uvx --python 3.12 mcp-atlassian`** — el `--python 3.12` es obligatorio: con Python 3.15 (free-threaded) **`pyyaml`** no tiene wheel precompilado y falla la compilación por falta de MSVC.
			-  Configuración por variables de entorno: **`JIRA_URL`**, **`JIRA_USERNAME`**, **`JIRA_API_TOKEN`**.
			-  Credenciales verificadas contra la API REST: **`GET /rest/api/3/myself`** → HTTP 200.
			-  Costo medido: **~180 MB** de RAM (árbol uvx → uv → python) por cada sesión abierta, CPU solo en el arranque. Los servidores stdio **no se apagan por inactividad**: viven mientras la sesión viva, una instancia por sesión/ventana.
		-  **Paso 2: Búsqueda de una vía HTTP (serverless)**
		
			-  Los MCP de tipo **http** (como tavily o appwrite) no tienen proceso local: el backend corre en la nube.
			-  El transporte **streamable-http** es el que habilita este patrón; **stdio no puede ser serverless** por diseño.
			-  Alternativa intermedia: proxies locales que arrancan el stdio bajo demanda y lo matan tras un idle (p. ej. **`mcp-proxy`**).
		-  **Paso 3: Vía headless con token de API**
		
			El servidor oficial acepta autenticación sin navegador mediante cabecera: **`Authorization: Basic <base64(email:api_token)>`** sobre **`https://mcp.atlassian.com/v2/mcp`**.
			
			-  Requisito previo: en **Atlassian Administration → Conectores → Servidor MCP de Atlassian → Autenticación** hay que activar **"Permite la autenticación de token de API"** (verificado con pruebas curl: primero *"You don't have permission to connect via API token"*, tras activar el toggle el **`search`** devolvió datos reales del sitio).
			-  Limitación encontrada: con token API el catálogo queda **reducido a la herramienta `search`** (Rovo Search). El modo **`?tools=all`** y el descubrimiento dinámico (**`discover`**, catálogo de 350 operaciones) devuelven 0 herramientas de CRUD: leer/crear/actualizar está reservado a **OAuth 2.1**. No es error de configuración: es el diseño actual del servidor.
		-  **Paso 4: OAuth 2.1 (vía definitiva)**
		
			ZCode implementa el flujo OAuth de MCP completo (verificado en su runtime: PKCE, registro dinámico de cliente, **`refresh_token`**, persistencia en su auth config). Solo hizo falta ajustar la administración de Atlassian:
			
			-  **Dominios:** añadir en **Dominios → Añadir dominio** los patrones **`http://127.0.0.1:*/**`** y **`http://localhost:*/**`** (comodín de puerto **obligatorio**: ZCode usa un puerto dinámico distinto en cada intento; la ruta **`/**`** cubre **`/oauth/callback/mcp/jira`**). El toggle *"Permitir los dominios compatibles con Atlassian"* no basta: sus entradas de localhost van sin comodines.
			-  **Permisos:** los **cinco conjuntos permitidos al completo** — Leer 17/17, Escribir 17/17, Buscar 4/4, Eliminar 1/1, Gestionar 1/1 — para que el agente trabaje con todas las capacidades del MCP.
			-  **Autenticación:** OAuth 2.1 por defecto; el toggle de token API quedó activado (inofensivo) de la fase anterior.
			-  Flujo: reiniciar sesión → ZCode abre el navegador con el consentimiento (cliente "ZCode jira") → **Aceptar**. El token queda guardado y **se renueva solo**.
	-  **Cómo funciona el servidor MCP de Atlassian (panel de administración)**
	
		Ruta: **Atlassian Administration → Conectores → Servidor MCP de Atlassian** (`https://admin.atlassian.com`). Tres pestañas:
		
		-  **Dominios:** gobierna qué clientes (orígenes) pueden completar el flujo **OAuth 2.1**. Solo aplica a OAuth; los token API no usan esta lista.
		-  **Permisos:** conjuntos de herramientas permitidos/bloqueados por categoría (Leer, Escribir, Buscar, Eliminar, Gestionar). Al aparecer conjuntos nuevos, hay que revisarlos para permitirlos o bloquearlos.
		-  **Autenticación:** OAuth 2.1 (por defecto, recomendado) + interruptores para token de API y autenticación empresarial (IdP).
		
		Además, si la organización usa **lista de permisos de IP**, esas reglas también aplican a las llamadas vía MCP, sea OAuth o token.
	-  **Diferencias stdio vs http (lo aprendido)**
	
		-  **stdio:** proceso hijo local arrancado por el cliente al conectar; siempre encendido durante la sesión, sin auto-apagado por inactividad; RAM reservada constante (~70 MB nuget, ~120 MB python de mcp-atlassian); una instancia por sesión abierta.
		-  **http:** cada llamada es una petición HTTP independiente; cero consumo local; el token lo gestiona el cliente (OAuth) o viaja en cabeceras.
		-  **timeoutMs** de la config solo aplica al arranque/listado de herramientas, no al tiempo de vida del servidor.
	-  **Comandos útiles (diagnóstico)**
	
		-  Verificar credenciales contra Jira REST: **`curl -u "email:token" https://sebastian-gsz.atlassian.net/rest/api/3/myself`**
		-  Medir consumo de los servidores stdio locales (PowerShell): **`Get-CimInstance Win32_Process`** filtrando por **`uvx|python|NuGet.Mcp`** y sumando **`WorkingSetSize`**.
		-  Handshake MCP a mano contra el endpoint remoto: **`initialize`** → cabecera **`Mcp-Session-Id`** → **`notifications/initialized`** → **`tools/list`** / **`tools/call`**.
	-  **Pendientes / notas**
	
		-  Rotar o revocar el token de API original (quedó expuesto en chat y ya no se usa).
		-  Si Atlassian abre el catálogo CRUD a tokens API en el futuro, la vía headless volvería a ser opción (el toggle ya está activo).
		-  El servidor remoto cubre también Confluence, JSM, Bitbucket, Compass, Loom y el Teamwork Graph, sujetos a los permisos de cada producto.
		-  Con OAuth, las llamadas respetan los permisos del usuario conectado y la lista de dominios permitidos.























