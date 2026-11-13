
-  **[Task ](kanban-cloud-computing.md)**
-  **[Enlaces ](https://www.oracle.com/)**

	-  **Internos**
	
		-  **servicios**
		
			-  **networking**
			  
				- 
			-  **identity-and-access**
			
				- **[[oracle-identity-and-access-management]]**
			-  **infrastructure services**
			
				- **[Java Management ](https://docs.oracle.com/en-us/iaas/jms/index.html)**
			-  **services for developers**
			
				- **[[oracle-apex]]**
			-  **observation and management**
			
				- **[[oracle-weblogic-management-service]]**
			-  **intelligence artificial database**
			
				- **[[oracle-autonomous-database]]**
				- **[[oracle-rest-data-services]]**
		-  **[[trash-examen-final-oracle-cloud-infrastructure]]**
	-  **Externos**
	
		-  **Learning**
		
			-  **[Oracle Podcast ](https://oracleuniversitypodcast.libsyn.com/)**
			-  **[Oracle Sandbox ](https://livelabs.oracle.com/ords/r/dbpm/livelabs/livelabs-workshop-cards?p100_workshop_type=135&clear=100&session=6726799436626)**
			-  **Oracle University**
			  
				-  **Inteligencia artificial**
				  
					-  **[Oracle Agentic AI Foundations ](https://mylearn.oracle.com/ou/learning-path/become-an-oci-agentic-ai-foundations-associate/163239)**
		-  **Documentación**
		  
			- **[Documentación Always Free ](https://www.oracle.com/es/cloud/free/?intcmp=ohp052322ocift_es)** 
			- **[Documentación de Oracle Cloud Infrastructure ](https://docs.oracle.com/es-ww/iaas/Content/home.htm)**
![[barra.gif]]
-  **Información general Oracle OCI**

	-  **Regiones:** Las regiones son centros de datos distribuidos globalmente. OCI cuenta con 36 regiones comerciales y 8 gubernamentales. Se mencionaron ejemplos en América (Montreal, Toronto, Chicago, etc.), Europa (Ámsterdam, Zúrich, París, etc.) y Asia-Pacífico (Tokio, Osaka, Australia).
	-  **Dominios de disponibilidad:** Se definieron como centros de datos tolerantes a fallas dentro de una región, conectados por una red de baja latencia y alto ancho de banda, garantizando alta disponibilidad.
	-  **Dominios de falla:** Se describieron como agrupaciones de hardware e infraestructura dentro de un dominio de disponibilidad.
	-  **Consideraciones al elegir una región:**
	
	    -  **Localización:** Elegir una región cercana a los usuarios.
	    -  **Residencia de datos y cumplimiento:** Considerar las regulaciones sobre dónde se almacenan los datos.
	    -  **Disponibilidad de servicios:** Tener en cuenta que los nuevos servicios se implementan según la demanda regional y otros factores.
	
	**Oracle Cloud Always Free**
	**│**
	**├── Compute**
	**│   ├── AMD Compute**
	**│   └── Ampere A1 Compute (ARM)**
	**│**
	**├── Almacenamiento**
	**│   ├── Block Volume**
	**│   ├── Object Storage**
	**│   └── Archive Storage**
	**│**
	**├── Bases de Datos**
	**│   ├── HeatWave**
	**│   ├── Autonomous Data Warehouse**
	**│   ├── Autonomous Transaction Processing**
	**│   ├── Autonomous JSON Database**
	**│   └── NoSQL Database (Phoenix)**
	**│**
	**├── Red**
	**│   ├── Flexible Load Balancer**
	**│   ├── Flexible Network Load Balancer**
	**│   ├── Virtual Cloud Networks (VCN)**
	**│   └── Site-to-Site VPN**
	**│**
	**├── Observabilidad y Operaciones**
	**│   ├── Monitoring**
	**│   ├── Notifications**
	**│   ├── Logging**
	**│   ├── Application Performance Monitoring**
	**│   └── Service Connector Hub**
	**│**
	**├── Seguridad**
	**│   ├── Vault**
	**│   ├── Bastions**
	**│   └── Security Advisor**
	**│**
	**├── Desarrollo**
	**│   ├── APEX Application Development**
	**│   └── Resource Manager (Terraform)**
	**│**
	**└── Otros**
	    **├── Content Management Starter Edition**
	    **└── Email Delivery**
	
	-  **AMD Compute Instance**
	
		-  **2 máquinas virtuales basadas en AMD**: Puedes crear hasta dos servidores virtuales independientes que utilizan procesadores AMD.
		- **1/8 OCPU por máquina**: Cada una de estas dos máquinas cuenta con una fracción  equivalente a un octavo de una OCPU, lo que corresponde a un recurso de procesamiento muy ligero enfocado en tareas básicas.
		-  **1 GB de memoria RAM por máquina**: Cada servidor virtual dispone de 1 GB de memoria RAM.
	-  **ARM Compute Instance**
	
		-  **Instancia de Cómputo ARM**: Utiliza procesadores con arquitectura ARM, diseñados para ofrecer un rendimiento eficiente en tareas de servidor.
		-  **Distribución de recursos**: Proporciona núcleos Ampere A1 y **12 GB de memoria RAM**, los cuales puedes configurar y utilizar como **1 sola máquina virtual o dividirlos en hasta 2 máquinas virtuales**.
		-  **Límites Always Free**: Ofrece un consumo máximo mensual de **1.500 horas de OCPU** y **9.000 GB-horas**, lo que cubre exactamente el funcionamiento continuo de estos recursos durante todo el mes sin costo alguno.






