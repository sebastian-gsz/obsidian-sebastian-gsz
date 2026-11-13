
**Security Command Center (SCC)**, que es el "cerebro" de seguridad de Google Cloud. Como profesional de TI, debes ver al SCC como el panel de control donde convergen las **Personas, los Procesos y la Tecnología**

-  **Documentación**

	- **[Documentación Security Command Center ](https://docs.cloud.google.com/security-command-center/docs?hl=es)**
![[barra.gif]]
-  **Los tres pilares del SCC**

	-  **``Prevención de amenazas`` (Postura):** Escanea constantemente tus configuraciones. Por ejemplo, si alguien deja un bucket de Cloud Storage abierto al público (un error de configuración común), el SCC lo detecta y te da la recomendación exacta para cerrarlo.
	-  **``Detección de amenazas`` (Logs):** Utiliza inteligencia artificial y detectores integrados en la infraestructura de Google para identificar comportamientos sospechosos, como minería de criptomonedas en tus VMs o ataques de fuerza bruta.
	-  **``Simulación de rutas de ataque`` (Análisis de Riesgo):** Esta es la función más avanzada. El SCC "piensa como un hacker" y traza un mapa: "Si un atacante compromete esta VM, puede saltar a esta Service Account y de ahí llegar a la base de datos de los estudiantes". Esto te permite priorizar qué arreglar primero.
-  **Niveles de facturación** 

	-  **Nivel estándar**
	
		Este nivel viene incluido por defecto en Google Cloud. Es ideal para una seguridad básica.
		
		-  **Costo:** **$0 (Gratis)**.
		-  **Qué incluye:** * Inventario de recursos.
		
			- Algunos detectores de seguridad para errores de configuración críticos.
			- Escaneo de vulnerabilidades básicas.
			- Integración con el panel de control de Google Cloud.
	-  **Nivel premium**
	
		Este es el nivel que ofrece las funciones avanzadas que vimos antes (como la simulación de rutas de ataque y el cumplimiento del NIST). Tiene dos formas de cobro:
		
		- **Pago por uso (Pay-as-you-go):** Pagas una tarifa basada en el consumo de los servicios que SCC monitorea (como la cantidad de computación en Compute Engine o el almacenamiento en BigQuery).
		- **Suscripción anual:** Acuerdas un pago fijo basado en el uso proyectado de tu infraestructura. Es ideal para empresas con presupuestos predecibles.