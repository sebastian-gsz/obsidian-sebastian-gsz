
![[barra.gif]]

-  **Enlaces**

	-  **[[azure-virtual-network]]**
	-  **[[azure-dns-private-resolver]]**
	-  **[[azure-virtual-network-manager]]**

![[barra.gif]]

-  **Arquitectura de red Multicloud: Control de acceso de salida, traducción de direcciones y abstracciones de interfaz**

	El diseño de arquitecturas de red en entornos de nube pública exige una delimitación estricta entre las capacidades de conectividad híbrida, los mecanismos de traducción de direcciones de red de origen (SNAT) para flujos de salida (egress) y las políticas de aislamiento perimetral. Históricamente, la abstracción de configuraciones implícitas por parte de ciertos proveedores introdujo discrepancias conceptuales en la gestión de la seguridad. Este documento técnico desglosa los paradigmas modernos de control de acceso, analiza la transición hacia modelos explícitos y unifica los componentes homólogos en entornos multicloud.
	
	-  **Evolución del acceso de salida en Azure y el fin del SNAT implícito**
	
		En el modelo clásico de infraestructura de Azure, el mecanismo denominado _Default Outbound Access_ proporcionaba conectividad implícita a internet para cualquier máquina virtual ubicada en una subred, incluso si carecía de una dirección IP pública explícita o de un dispositivo de traducción dedicado. Este flujo de salida se sustentaba en un pool dinámico de direcciones IP públicas administradas por la plataforma, distribuidas de forma transparente entre múltiples clientes.
		
		Si bien este enfoque agilizaba los despliegues iniciales y las pruebas de concepto, presentaba vulnerabilidades y deficiencias de diseño críticas para entornos empresariales:
		
		- **Violación del principio de mínimo privilegio:** Toda carga de trabajo poseía capacidad nativa de iniciar conexiones hacia el exterior, contradiciendo los fundamentos de la arquitectura Zero Trust.
		- **Impredictibilidad de direccionamiento:** Al emplear un pool de IPs públicas compartidas y mutables, resultaba inviable implementar directivas de filtrado IP (whitelisting) en firewalls corporativos o servicios externos de terceros.
		- **Riesgo de agotamiento de puertos (SNAT port exhaustion):** La concurrencia de flujos sin asignaciones dedicadas exponía a los servicios a caídas por denegación de puertos efímeros disponibles.
		
		Para adquirir un control estricto y corregir esta asimetría respecto a otros proveedores, la directiva global establece que el 31 de marzo de 2026 será la fecha límite para la eliminación del acceso de salida predeterminado en redes virtuales de nueva creación. La propiedad `defaultOutboundAccess` pasará a ser falsa de forma nativa, obligando a los arquitectos a definir canales explícitos (como Azure NAT Gateway o Azure Firewall) para posibilitar el tráfico de salida.
		
		Para forzar de manera inmediata el aislamiento perimetral mediante la interfaz de línea de comandos, se debe ejecutar la siguiente instrucción: **``az network vnet subnet update --resource-group rg-nombre --name subnet-nombre --vnet-name vnet-nombre --default-outbound false``**
	-  **Desacoplamiento de responsabilidades: Propósito de subred frente a control de salida**
	
		Un error recurrente en ingeniería de redes cloud consiste en confundir la naturaleza del recurso alojado en una subred con las políticas generales de enrutamiento y SNAT de la plataforma. El caso más evidente ocurre al configurar la subred denominada obligatoriamente `GatewaySubnet`.
		
		La `GatewaySubnet` es una subred reservada exclusivamente para el aprovisionamiento de instancias de _Virtual Network Gateway_ (responsables de terminaciones VPN de sitio a sitio, de punto a sitio o circuitos de ExpressRoute). Las funciones de este componente están ligadas estrictamente al plano de control y al establecimiento de túneles cifrados para conectividad híbrida; no actúa como un enrutador de internet general para las máquinas virtuales del entorno ni realiza funciones de NAT residencial o empresarial corporativo.
		
		Por consiguiente, mantener habilitado el acceso de salida predeterminado en subredes de infraestructura carece de justificación técnica y amplía innecesariamente la superficie de exposición. Para subnets de infraestructura dedicada, se deben aplicar las siguientes directrices de diseño:
		
		1. **Aislamiento total:** Subredes como `GatewaySubnet`, `AzureFirewallSubnet`, `AzureBastionSubnet` y `RouteServerSubnet` deben configurarse explícitamente con `defaultOutboundAccess = false`.
		2. **Separación funcional:** La salida general a internet de los workloads debe centralizarse en recursos diseñados específicamente para esa escala, delegando en un Azure NAT Gateway para traducciones de puertos masivas o en Azure Firewall para inspección profunda de paquetes (L4-L7).
		3. **Determinismo:** Al eliminar flujos ocultos o implícitos, el comportamiento de las tablas de enrutamiento de la plataforma se vuelve totalmente predecible y auditable.
