
![[barra.gif]]

-  **Enlaces**

	-  **[Documentación Azure DNS ](https://learn.microsoft.com/en-us/azure/dns/)**

![[barra.gif]]

-  **Arquitectura moderna: Azure DNS Private Resolver**
	
	Esto es **infraestructura pura**. Aquí no gestionas dominios públicos; gestionas **cómo tus servidores se encuentran entre sí dentro de tu red privada**.
	
	-  **¿Qué sucede realmente cuando configuras una IP en `dhcpOptions`?**
	
		- **DNS de Azure**  (`168.63.129.16`):Es el servicio "mágico" de Azure que resuelve automáticamente tanto nombres internos como servicios PaaS.
		- **El cambio (`dhcpOptions`):** Es una orden a la VM para que **ignore** a Azure y pregunte _exclusivamente_ a tus servidores DNS.
		- **El riesgo crítico:** Toda tu resolución (incluyendo la salida a Internet) pasa a depender al 100% de la disponibilidad y configuración de tus servidores. Si estos fallan o no tienen configurados "forwarders" hacia Internet, la VM se queda "ciega": dejará de resolver tanto tus recursos internos como cualquier dirección pública.
		
		Es un punto de fallo único: si pierdes conectividad con tus DNS, pierdes la capacidad de comunicación basada en nombres de toda la VM.
	-  **¿Por qué lo harías? (Arquitectura de red)**
	
		Como arquitecto, solo cambias esto en `dhcpOptions` en dos escenarios principales:
		
		- **Entornos híbridos con Active Directory:** Tienes servidores DNS locales en tu oficina que conocen tus nombres de servidor (`servidor.empresa.local`). Quieres que tus VMs en Azure sepan quiénes son esos servidores.
		- **DNS centralizado (Hub-and-Spoke):** Tienes un clúster de servidores DNS dedicado en una VNet central (el Hub) y quieres que todos los Spokes apunten a ellos para mantener una base de datos de nombres centralizada.
	-  **El orden de los factores**
	
		Efectivamente, hay una **dependencia de conectividad**. Para que esto funcione, debes garantizar lo siguiente:
		
		- **Reachability (Conectividad):** Tus VMs deben poder llegar a la IP que configuraste en `dhcpOptions`. Si configuras una IP de un servidor en tu oficina, pero tu túnel VPN o ExpressRoute está caído, tus VMs en Azure se quedarán ciegas.
		- **DNS forwarders:** Tus servidores DNS deben estar configurados para que, si alguien pregunta por un nombre que no conocen (como `microsoft.com`), sepan "reenviar" (forward) esa consulta a Internet. Si no, solo resolverán nombres internos.
	
	Hoy en día, para evitar esta configuración manual es rígida y difícil de gestionar, Azure ha sacado un servicio llamado **Azure DNS Private Resolver**.
	
	-  Despliegas un "Resolver" (un servicio gestionado) en tu VNet Hub.
	-  Conectas las zonas DNS privadas a este resolver.
	-  Tu red se vuelve inteligente sin necesidad de tocar la configuración de DHCP en cada VNet individualmente.