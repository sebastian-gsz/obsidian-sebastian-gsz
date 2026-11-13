
-  **Enlaces**

	-  **Externos**
	
		-  **[Administración ](https://admin.atlassian.com/o/e0cd3198-0b1b-4b6b-96a1-39c4667e9521/login-customisation)**
		-  **[Administración de perfil ](https://id.atlassian.com/manage-profile/security/api-tokens)**
-  **[Procesos](process-jira.md)**

![[barra.gif]]

-  **Herramientas y casos de uso del MCP Server**

	Esta sección es una **guía operativa para agentes de IA** que usen el servidor MCP de Atlassian conectado a cualquier harness. Describe con qué herramientas trabajar, en qué orden y con qué reglas.

	-  **Datos de conexión**

		-  Servidor: **MCP oficial de Atlassian** — endpoint **`https://mcp.atlassian.com/v2/mcp`** (streamable-http), transport **`http`** en ZCode, autenticación **OAuth 2.1** gestionada por el propio cliente (PKCE + registro dinámico + **refresh automático**; no hay tokens en config).
		-  **`cloudId`** del sitio: **`5746e2fe-92b7-4e8a-b490-0d15356a4c4e`** → **`https://sebastian-gsz.atlassian.net`**. Si se desconoce, obtenerlo siempre con **`getAccessibleAtlassianResources`** (devuelve además los productos accesibles y su nivel: read-write).
		-  Cuenta conectada: seogomezfull@gmail.com — Juan Sebastián Gómez Sánchez (Sebastian G), admin de la organización.
	-  **Reglas de trabajo (orden y decisiones)**

		-  Flujo general: **`getAccessibleAtlassianResources`** → **`discover`** → **`executeRead` / `executeWrite` / `executeDestructive`** con el nombre de la operación devuelta.
		-  **`discover`** se consulta con UNA intención por llamada, formato *"verbo + objeto + producto"* ("transition a jira issue", "list confluence spaces"). Si no hay resultados, reintentar con el sustantivo propio del producto (issue, page, space, sprint), nunca sinónimos.
		-  **`cloudId` va como parámetro superior del runner execute*, NO dentro de `inputs`** — si va dentro, falla con *"Failed to fetch cloud ID: Invalid URL"*.
		-  Antes de escribir, leer el estado actual: **`getJiraIssue`** del issue, **`getConfluenceSpace`** del espacio (además devuelve las instrucciones de autoría del espacio, si las hay) y para editar cuerpos ricos, releer como **`html`**.
		-  Transiciones: primero **`listJiraIssueTransitions`** del issue — el **id** de la transición o su **nombre propio** (no el estado destino). Para mover a sprint/backlog usar **`sprintId`** / **`assignToBacklog`** en la misma llamada.
		-  Campos al crear: **`createJiraIssue`** resuelve campos personalizados por nombre humano; si un campo falla, la respuesta trae **`repairHint`** y los valores permitidos — corregir desde ahí, no reintentar a ciegas.
		-  Cuerpos con multimedia/paneles: crear y editar en **`html`** con contentFormat; markdown descarta imágenes y menciones.
		-  Operaciones **Eliminar / Gestionar** requieren **confirmación explícita del usuario** antes de llamar **`executeDestructive`**.
		-  Paginación: respetar **`nextPageToken`** / **`cursor`** / **`isLast`** de cada respuesta; nunca inventar tokens.
	-  **Herramientas directas (ya registradas como mcp__jira__*)**

		-  Lectura Jira: **`getJiraIssue`** (views compact/evidence/full), **`searchJiraIssuesUsingJql`** (JQL; view evidence mapea campos custom), **`listJiraIssueComments`** (pagina hasta isLast), **`atlassianUserInfo`**.
		-  Escritura Jira: **`createJiraIssue`**, **`editJiraIssue`** (incluye ranking con **`rankBeforeIssue`/`rankAfterIssue`**), **`transitionJiraIssue`**, **`addOrEditJiraIssueComment`**.
		-  Búsqueda semántica: **`search`** (Rovo) — citas exactas con comillas para claves ("PROJ-123"); **`targetApp`** filtra JIRA/CONFLUENCE/THIRD_PARTY.
		-  Confluence: **`searchConfluence`** (CQL), **`getConfluenceContent`** (summary/outline/full, drafts), **`createConfluenceContent`** (page, live_doc, whiteboard, database…), **`updateConfluenceContent`** (draft + snapshotToken).
		-  Graph y personas: **`getGraphContext`**, **`getGraphObject`**, **`addGraphContext`**, **`getPeopleInfo`**, **`getCollaborators`**, **`getWorkActivity`**, **`getWorkPortfolio`** (betas con consumo de Rovo Credits).
		-  Ejecutores genéricos del catálogo completo: **`executeRead`**, **`executeWrite`**, **`executeDestructive`** — admiten **`responseFields`** (dot-notation) para recortar respuestas y **`view`** para presets.
	-  **Operaciones del catálogo más útiles (vía execute*)**

		-  Jira: **`listJiraProjects`** (expand `insight,issueTypes,lead`), **`listJiraStatuses`** (modes project/status/site), **`getJiraProjectVersions`**, **`manageJiraProjectVersion`**, **`listJiraBoards`**, **`listJiraDashboards`**, **`listJiraIssueAssignableUsers`**, **`listJiraProjectComponents`**, **`listJiraProjectIssueTypesMetadata`**, **`getJiraIssueTypeMetaWithFields`** (esquema de campos antes de crear).
		-  Confluence: **`listConfluenceSpaces`**, **`getConfluenceSpace`**, **`listConfluenceContent`** (por tipo y espacio), **`listConfluenceTemplates`**, **`getConfluenceContentAncestors`**, **`listConfluenceComments`**, **`listConfluenceAttachments`**.
		-  Guías internas: **`getContentFormatGuide`** (antes de componer/editar cuerpos de Confluence o descripciones HTML de Jira).
	-  **Casos de uso probados (recetas)**

		-  Listar proyectos con métricas: **`executeRead`** → **`listJiraProjects`** con **`expand: "insight,issueTypes,lead"`**, **`maxResults: 100`**.
		-  Issues abiertos de un proyecto: **`searchJiraIssuesUsingJql`** con JQL **`project = SAH AND resolution = Unresolved ORDER BY created DESC`** (statusCategory != Done equivale a lo mismo a efectos prácticos).
		-  Espacios de Confluence: **`executeRead`** → **`listConfluenceSpaces`** con **`limit: 250`**. **NO usar CQL `type = space`** — el buscador devuelve 500 en este sitio.
		-  Recursos y permisos del sitio: **`getAccessibleAtlassianResources`** — primer call de cualquier sesión.
		-  Crear + transicionar de prueba: **`createJiraIssue`** (projectKey, summary, issueType) → **`listJiraIssueTransitions`** → **`transitionJiraIssue`** con el transitionId.
	-  **Estado del sitio y advertencias (07-nov-2026)**

		-  **Confluence desactivada por inactividad** por Atlassian: los datos aún existen vía API (1 espacio plantilla: `unternehmer` UHM, solo la página de bienvenida) pero la web muestra bloqueo y el contenido se borrará pronto. Esperar fallos de Confluence (p. ej. CQL 500) hasta reactivación; Jira **no** está afectado.
		-  Jira activo: 5 proyectos — **UHM** unternehmer (software, 70 issues, el más activo), **FEN** saas-zenith-enterprise (36), **LS** web-luxsovereign (7), **JSGS** personal (262, con tipos JSM), **SAH** saas-adepthub (2). Todos con lead = la cuenta conectada.
		-  Permisos otorgados en administración: **5/5 conjuntos** (Leer, Escribir, Buscar, Eliminar, Gestionar) — con Eliminar/Gestionar exigir siempre confirmación.
		-  Dominios OAuth permitidos en la org: **`http://127.0.0.1:*/**`** y **`http://localhost:*/**`** (puerto dinámico del callback de ZCode). No eliminarlos o el flujo de re-autenticación se bloquea.
		-  Si un tool responde 401 tras mucho tiempo inactivo: reiniciar la sesión de ZCode y re-intentar (el refresh del token es automático, pero la sesión puede cachear credenciales viejas).

