---

kanban-plugin: board

---

## Unternehmer

- [ ] > [!WARNING]
	> **AWS + Power Platform + Colombia + Trabajo**
- [ ] ###### Kanban
	
	-  **[[kanban-learn-languages]]**
	-  **[[kanban-künstliche-intelligenz]]**
	-  **[[kanban-entwicklerin]]**
	-  **[[kanban-cybersicherheit]]**
	-  **[[kanban-cloud-computing]]**
	- **[[kanban-systemtechnik]]**
- [ ] ###### Documentación
	
	- [ ] **[[visual-studio-code]]**
	- [ ] **[[github]] + github-for-students**
	- [ ] **[[obsidian]]**
	- [ ] 
	- [ ] **replit**
	- [ ] **azure-devops**
	- [ ] **[[configcat]]**
	- [ ] **[[agents/zed]] + [[delta]]**
- [ ] - [ ] windows-fortress
		- [ ] PowerShell


## Diccionario

- [ ] - [ ] To
- [ ] - [ ] ad-hoc
- [ ] Casi — tu intuición va bien encaminada, pero el reparto de roles es al revés de como lo describes. Te lo aclaro:
	
	## ¿Qué es una SPA?
	
	**SPA = Single Page Application** (aplicación de página única). En lugar del modelo clásico — donde cada clic pide una página nueva al servidor y este te la entrega renderizada — la SPA **descarga una sola vez toda la aplicación** (HTML + JavaScript + CSS) y a partir de ahí **el JavaScript corre en tu navegador**, renderiza cada vista y solo le pide al servidor los **datos** que necesita.
	
	## La corrección a tu modelo
	
	Tu frase "la API toma código ya escrito y lo entrega según navegamos" describe al modelo clásico (MPA, multi-página): páginas pre-horneadas que el servidor entrega a demanda. En la SPA es al revés:
	
	| | MPA clásico | SPA |
	|---|---|---|
	| ¿Qué te entrega el servidor al navegar? | Una **página completa** (HTML renderizado) | **Solo datos** (JSON) |
	| ¿Quién "arma" la vista? | El **servidor** | Tu **navegador** (el JS que ya descargó) |
	| ¿Se recarga la página? | Sí, en cada navegación | No — el JS reemplaza el contenido |
	| El servidor es... | Cocina + camarero: entrega platos hechos | **Solo despensa**: entrega ingredientes |
	
	La metáfora correcta: el frontend es un **restaurante entero instalado en tu mesa** (se descarga al primer acceso), y el camarero (la API) solo trae ingredientes crudos (JSON) según pides. Tu navegador cocina — decide qué vista pintar, dónde colocar cada dato, qué animar.
	
	## Por qué esto explica lo del HAR
	
	En AMD Academy: al abrir la página, tu navegador descargó una vez el bundle JS (el "restaurante"). Todo lo demás que vimos en el HAR fue **JSON puro**: `GetSeriesCourseList` no devolvía páginas, devolvía *datos estructurados* — títulos, IDs, videoIds. El "código útil" de la aplicación viajaba por la red como datos, no como HTML.
	
	Por eso el HAR fue tan eficiente: en una MPA habríamos tenido que parsear HTML lleno de marcado. En una SPA, la red está **limpia de presentación** — es solo el contrato entre cliente y servidor. Y una consecuencia interesante: ese mismo backend JSON podría servir indistintamente a un navegador, una app móvil o un agente — como cuando te conectaste tú con `curl` y el servidor no notó la diferencia.
	
	Tu idea de "diferentes frontends según la navegación" sí es válida, pero en otro sentido: no es que el servidor te entregue frontends distintos, sino que **un mismo frontend descargado** compone infinitas vistas distintas según los datos que va pidiendo.


## Task

- [ ] ###### Learning
	
	- [ ] **Bachillerato**
		- [ ] [Learning to english ](https://www.youtube.com/watch?v=Aobp23eub8U)
	- [ ] **Learning**
		- [ ] Coding
		- [ ] Coursera
			- [ ] Ciencia de datos
			- [ ] Project Manager
			- [ ] Inteligencia artificial
		- [ ] Google Skills
			- [ ] IAM
			- [ ] BigQuery
				- [ ] **[Leer ](https://cloud.google.com/blog/products/data-analytics/unveiling-new-bigquery-capabilities-for-the-agentic-era)**
				- [ ] **[Leer](https://cloud.google.com/blog/products/ai-machine-learning/gemini-enterprise-agent-platform-remote-mcp-server)** | **[Leer ](https://cloud.google.com/ai?utm_source=cloud_sfdc&utm_medium=email&utm_campaign=FY26-Q3-global-GlobalNurture-STO136-emailnurture-dl-juniper&utm_content=q3aiemail1juniper&utm_term=&mkt_tok=ODA4LUdKVy0zMTQAAAGjA88M6WgqlE0CaSsqArMB5n0soHdyN675qLfh3B-IUCnfLnuurQ3u-6WSO6yNlrR5bwB5iS3cP2-TCb7GybBIA9hMvTS8uQ6w6VtOGzqOEHPMjgHzbZsj)**
			- [ ] Data Professional
			- [ ] Colab
		- [ ] Microsoft Azure 
			- [ ] IAM
			- [ ] Tests
			- [ ] Power Platform
		- [ ] AWS Builds Skills
			- [ ] IAM
			- [ ] Quest Security
			- [ ] Migrations Path
			- [ ] [Agent Toolkit ](https://aws.amazon.com/es/products/developer-tools/agent-toolkit-for-aws/?trk=ed75e000-d20f-4392-82ac-ffc7e5ab3b5b&sc_channel=el)
		- [ ] Watsonx Orchestrate
		- [ ] GitHub Levelup
- [ ] ###### Settings
	
	- [ ] Orquestar apagado de servicios redundantes
		- [ ] SQL Server
- [ ] - [ ] **Lux Sovereign**
	- [ ] **Capcut**
	- [ ] **Crear cuenta Alibaba**
	- [ ] **Conexión SSH - Azure DevOps**
- [ ] ###### Clear
	
	- [ ] **YouTube**
		- [ ] Watch Later
	- [ ] **LinkedIn**
		- [ ] sebastian-gsz
	- [ ] **Instagram**
		- [ ] thisebas
		- [ ] sebastian-gsz
	- [ ] **TikTok**
	- [ ] **Google Sheets**
	- [ ] **Skills for agents**
	- [ ] **One Drive**
- [ ] ###### Task
	
	- [ ] Comprobar Tailscale en Windows y VS Code
- [ ] ###### Obsidian
	
	- [ ] GitHub
	- [ ] System
	- [ ] Ciberseguridad
- [ ] ###### Clean
	
	- [ ] trash-certification
	- [ ] process-microsoft - "Windows"
	- [ ] trash-learning
	- [ ] trash-blogs
	- [ ] cybersicherheit-certification-x.509
	- [ ] process-alphabet
	- [ ] gemini-and-antigravity




%% kanban:settings
```
{"kanban-plugin":"board","list-collapse":[false,false,false],"show-checkboxes":false,"new-line-trigger":"enter","hide-card-count":true,"new-note-folder":"sebastian/kanban","move-tags":true,"tag-colors":[{"tagKey":"#blocked","color":"rgba(255, 255, 255, 1)","backgroundColor":"rgba(0, 0, 0, 1)"},{"tagKey":"#impedimento","color":"rgba(255, 255, 255, 1)","backgroundColor":"rgba(0, 0, 0, 1)"},{"tagKey":"#prio/alta","color":"rgba(255, 255, 255, 1)","backgroundColor":"rgba(255, 71, 71, 1)"},{"tagKey":"#prio/media","color":"rgba(0, 0, 0, 1)","backgroundColor":"rgba(252, 224, 84, 1)"},{"tagKey":"#prio/baja","color":"rgba(0, 0, 0, 1)","backgroundColor":"rgba(60, 255, 42, 1)"}],"move-dates":true,"tag-action":"kanban","tag-sort":[],"date-trigger":"@","time-trigger":"@@","date-format":"DD-MM-YYYY","date-display-format":"DD-MM-YYYY","time-format":"HH:mm","show-relative-date":true,"link-date-to-daily-note":true,"date-colors":[],"archive-with-date":true,"append-archive-date":true,"date-picker-week-start":1,"inline-metadata-position":"body"}
```
%%