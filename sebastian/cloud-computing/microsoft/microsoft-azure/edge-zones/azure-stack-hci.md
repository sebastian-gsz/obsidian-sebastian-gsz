
Azure Stack HCI es una solución de infraestructura hiperconvergente (HCI) basada en software. No es un dispositivo cerrado, sino un sistema operativo que tú instalas sobre hardware certificado de fabricantes diversos (Dell, HPE, Lenovo, entre otros).

- **Modelo:** Definido por software (Software-Defined). Permite máxima flexibilidad en la elección del hardware.
- **Propósito:** Modernizar los centros de datos locales para ejecutar cargas de trabajo virtualizadas (VMs) y contenedores con una experiencia de gestión integrada con Azure.
- **Arquitectura:** Agrupa computación, almacenamiento y redes en un solo clúster gestionado por el sistema operativo Azure Stack HCI.
- **Uso:** Es ideal para consolidar servidores físicos en un clúster virtualizado eficiente, ejecutar cargas de trabajo híbridas y aprovechar las capacidades de la nube para el monitoreo y la gobernanza.

![[barra.gif]]

-  **Azure Arc: El puente hacia el plano de control unificado**

	Azure Arc no es hardware; es la capa de software que conecta estos modelos de infraestructura con el plano de control (ARM) de Azure. Su función varía dependiendo del modelo:
	
	**Integración en Azure Stack HCI**
	
	En HCI, Azure Arc es **obligatorio**.
	
	- **Gestión de ciclo de vida:** El clúster HCI se conecta a Azure a través de los agentes de Arc. Esto permite que el clúster sea visible y gestionable desde el portal de Azure.
	- **Gobernanza:** Permite aplicar _Azure Policy_, _Microsoft Defender for Cloud_ y _Azure Monitor_ al clúster local como si fuera un recurso nativo.
	- **Facturación:** La suscripción y facturación del servicio se gestionan a través de la conexión con Arc.
	- **Despliegue:** Funciona como un `CustomLocation`. Cuando despliegas un recurso, Arc traduce la orden de ARM y la ejecuta en el clúster HCI local.