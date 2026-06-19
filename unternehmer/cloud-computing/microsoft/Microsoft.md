
![[Barra.gif]]

-  **Tareas**

	- [ ] **Qué es un Management Group**
-  **Enlaces**

	-  **Internal**
	
		- **[[microsoft-security]]**
		- **[[microsoft-migration]]**
		- **[[microsoft-devsecops]]**
		- **[[microsoft-networking]]**
	-  **[Learning ](https://learn.microsoft.com/es-es/training/support/integrations)**
	
		-  **[Microsoft Show ](https://learn.microsoft.com/en-us/shows/)**
	
			Descubre miles de horas de programación original divertida, auténtica e informativa de la mano de expertos técnicos de Microsoft.
		-  **[Microsoft - Azure](https://github.com/Azure)**
		-  **[Microsoft - GitHub ](https://github.com/microsoft)**
		-  **[Microsoft - Learning ](https://github.com/MicrosoftLearning)**
		-  **[Microsoft - Templates](https://github.com/Azure-Samples)**
		-  **[Microsoft - Copilot Studio](https://microsoft.github.io/agent-academy/)**
		-  **[Evaluaciones de Microsoft](https://learn.microsoft.com/es-es/assessments/browse/?searchterm=&page=1&pagesize=30)**
		-  **[Microsoft 365 Developer  - GitHub ](https://github.com/OfficeDev/)**
		-  **[Días de aprendizaje virtual de Microsoft ]([https://www.microsoft.com/es-es/events/category/microsoft-virtual-training-days?filters=delivery-language%3Aspanish%2Cdelivery-language%3Aenglish&scenario=mvtd](https://www.microsoft.com/es-es/events/category/microsoft-virtual-training-days?scenario=mvtd))**
	-  **[Microsoft ](https://www.microsoft.com/es-es/sitemap)**
	-  **Documentación**
	
		-  **[Documentación de Azure](https://learn.microsoft.com/es-es/azure/?product=networking)**
		-  **[Documentación Microsoft ](https://learn.microsoft.com/es-es/docs/)**
		-  **[Centro de arquitectura de Azure](https://learn.microsoft.com/es-es/azure/architecture/)**
	-  **[Microsoft Developer Blogs ](https://devblogs.microsoft.com/)**
	-  **[Microsoft Tech Community ](https://techcommunity.microsoft.com/)**
-  **Servicios**

	-  **[Networks ](https://learn.microsoft.com/es-es/azure/networking/)**
	
		-  **[[azure-virtual-network]]**
		-  **[[azure-dns-private-resolver]]**
		-  **[[azure-virtual-network-manager]]**
	-  **Containers**
	
		-  
	-  **Edge Zones**
	
		- **[[azure-arc]]**
		- **[[azure-stack-hci]]**
		- **[[azure-stack-hub]]**
	-  **[Resource Manager ](https://learn.microsoft.com/en-us/azure/azure-resource-manager/)**
	-  **Cloud Adoption Framework**
	
		-  **[[azure-advisor]]**
		-  **[[azure-cloud-adoption-framework]]**
		-  **[[azure-well-architected-framework]]**
-  **Laboratorios**

	-  **Azure Network**
	
		-  **[[diseño-implementación-de-soluciones-redes]]**
	-  **Azure Containers Instances**
	
		-  **[[wordpress-container-for-virtual-network]]**
-  **Herramientas**

	-  **[Microsoft Work IQ ](https://github.com/microsoft/work-iq)**
	-  **[Awesome GitHub Copilot ](https://awesome-copilot.github.com/)**
	-  **[Agent Governance Toolkit ](https://github.com/microsoft/agent-governance-toolkit)**

![[Barra.gif]]

-  **Naturaleza de las zonas de borde**

	Para un arquitecto, la forma más sencilla de comprender este concepto es visualizarlo como una "fragmentación" de la región. Azure toma un subconjunto de sus servicios (computación, almacenamiento, redes) y los despliega en instalaciones que están en la periferia de la red pública, a menudo en instalaciones de operadores de telecomunicaciones o centros de datos metropolitanos.
	
	Su objetivo es eliminar los saltos innecesarios en la red troncal (backbone) de Internet, permitiendo que las aplicaciones alcancen latencias de un solo dígito (en milisegundos).
	
	**Tipos de edge zones**
	
	Microsoft categoriza estas zonas en tres vertientes, cada una con un propósito arquitectónico distinto:
	
	- **Azure edge zones (Propósito general):** Son instalaciones propiedad de Microsoft o gestionadas directamente por ellos en áreas metropolitanas. Funcionan como una extensión de una región de Azure cercana, ofreciendo los mismos servicios básicos pero con una latencia mucho menor debido a la proximidad física.
	- **Azure edge zones con operador (MEC - Multi-access Edge Compute):** Aquí es donde la infraestructura de Azure se despliega dentro de la red del operador de telecomunicaciones (telco). Se utiliza para aplicaciones que requieren integración directa con redes 5G o LTE, ideal para servicios de streaming, juegos en la nube o aplicaciones de realidad aumentada que no pueden tolerar la latencia de una red 4G/5G convencional.
	- **Azure private edge zones:** Esta variante permite llevar la nube a un entorno privado, como una planta de fabricación, un hospital o un centro logístico. Es un entorno de red cerrada que combina cómputo local con una red privada (5G o LTE) para gestionar maquinaria industrial o sistemas críticos que deben mantenerse aislados por razones de seguridad o soberanía de datos.
	
	-  **[[microsoft-networking#^1ab1ab|El vínculo con extendedLocation]]**
	
		Aquí es donde todo lo que hemos analizado anteriormente cobra sentido práctico. Cuando decides desplegar un recurso (como una VNet o una máquina virtual) en una Azure Edge Zone, no puedes simplemente declarar la región estándar. Debes utilizar el parámetro `extendedLocation`.
		
		- **La región (`location`):** Sigue siendo la región "padre" o región de control (ej. `westeurope`). Es donde se gestionan los metadatos y la configuración del recurso.
		- **La ubicación extendida (`extendedLocation`):** Define el plano de ejecución real. Si despliegas una VNet en una Edge Zone, el objeto lógico vive en la región, pero la red se materializa en la zona de borde que especificaste en el campo `name` de la `extendedLocation`.
		
		Este modelo permite una gestión centralizada y uniforme. Puedes tener una arquitectura _Hub-and-Spoke_ donde el _Hub_ reside en una región de Azure y los _Spokes_ residen en múltiples Edge Zones distribuidas geográficamente, todo controlado bajo las mismas políticas, grupos de seguridad (NSG) y plantillas de despliegue.
