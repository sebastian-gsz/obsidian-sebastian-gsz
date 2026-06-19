---
def-type: atomic
aliases:
  - NIC
  - Private Endpoints
  - Private Endpoint
---
**Arquitectura de private endpoints y gobernanza de red**

Los private endpoints representan la piedra angular en la implementación de arquitecturas de seguridad de tipo Zero Trust en entornos de nube. A continuación, se detalla la definición, operación e integración estratégica de este componente dentro de una red virtual gobernada.

-  **Definición técnica y operativa**

	Un private endpoint es un recurso de red, específicamente una interfaz de red (NIC), alojado dentro de una subred de una VNet. Su función es proporcionar un punto de acceso privado aun servicio de plataforma como servicio (PaaS), como Azure SQL, Azure Storage o Azure Key Vault, utilizando una dirección IP privada asignada dinámicamente desde el direccionamiento de la propia VNet.
	
	Es imperativo desmitificar su función:
	
	-  **Es**: Una interfaz de red privada que proyecta un servicio gestionado dentro del perímetro de la red corporativa.
	-  **No es**: Un endpoint público expuesto a internet, un gateway de red, ni un recurso de computo (como una máquina virtual).
-  **Mecánica de funcionamiento**

	El flujo de comunicación mediante un private endpoint elimina la dependencia de la infraestructura pública de Microsoft. Cuando se establece la conexión:
	
	1. Se instancia una NIC dentro de la subred designada.
	2. Se vincula esta NIC, mediante el servicio Azure Private Link, directamente al recurso PaaS objetivo.
	3. La aplicación, ubicada en el mismo entorno, se comunica con el servicio PaaS mediante
	
	la IP privada de la NIC, en lugar de utilizar el endpoint público.
	Esto garantiza que el tráfico nunca abandone el backbone de red de Microsoft y, por extensión, no transite por internet público.
-  **Integración con la gobernanza de red**

	La implementación de private endpoints no ocurre de forma aislada, sino que debe integrarse en los pilares de gobernanza de la red:
	
	-  **IPAM y direccionamiento**: Dado que el private endpoint consume una IP privada, esta debe ser parte del espacio de direcciones gobernado por el sistema IPAM corporativo, evitando conflictos y garantizando la predictibilidad del direccionamiento.
	-  **Control de acceso** (Private endpoint vnet policies): Al habilitar las políticas de red en la subred (private endpoint vnet policies), es posible aplicar Network Security Groups (NSG) directamente al tráfico que se dirige al endpoint privado, permitiendo un filtrado granular basado en la identidad de la red.
-  **Resolución DNS**

	El 90% de los fallos en la implementación de arquitecturas con private endpoints reside en una configuración DNS inadecuada. Dado que el servicio PaaS conserva su nombre de dominio público (ejemplo: servicio.database.windows.net), es necesario implementar Private DNS Zones. Estas zonas sobreescriben la resolución de nombres, asegurando que el cliente reciba la IP privada del private endpoint y no la IP pública del servicio.
