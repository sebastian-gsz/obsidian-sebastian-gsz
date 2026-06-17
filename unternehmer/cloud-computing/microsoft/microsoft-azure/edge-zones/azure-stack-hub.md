
Azure Stack Hub es un sistema integrado diseñado como un "appliance". Se entrega como una unidad de hardware pre-configurada y probada. Representa una "mini-región" de Azure que reside en tu datacenter.

- **Modelo:** Sistema integrado (Appliance). El hardware y el software se entregan como un bloque monolítico. No es modificable.
- **Propósito:** Ofrecer una experiencia de API y portal idéntica a la región pública de Azure, permitiendo despliegues de servicios PaaS y IaaS en entornos donde la conectividad con la región pública es limitada, nula o donde existen requisitos estrictos de soberanía de datos.
- **Arquitectura:** Es, esencialmente, una región de Azure condensada. Los desarrolladores interactúan con sus APIs de la misma forma que lo harían en un datacenter de Microsoft.
- **Uso:** Escenarios de desconexión (Edge extremo), regulaciones gubernamentales de soberanía de datos o aplicaciones que requieren consistencia absoluta con los servicios de la región pública.

![[barra.gif]]

-  **Azure Arc: El puente hacia el plano de control unificado**

	Azure Arc no es hardware; es la capa de software que conecta estos modelos de infraestructura con el plano de control (ARM) de Azure. Su función varía dependiendo del modelo:
	
	**Integración en Azure Stack Hub**
	
	En Hub, Azure Arc es **opcional pero recomendado**.
	
	- **Gestión de cargas:** Hub actúa como una región autónoma. Azure Arc se utiliza para conectar las cargas de trabajo (VMs o contenedores) que corren _dentro_ de Hub hacia Azure, permitiendo que esas cargas sean gestionadas con políticas unificadas.
	- **Coherencia:** Hub no necesita Arc para existir como "región", pero lo necesita para integrarse en la gestión de gobernanza y operaciones globales que Azure provee.