
![[barra.gif]]

-  **Documentación**

	-  **[Documentación de Virtual Network ](https://learn.microsoft.com/es-es/azure/virtual-network/)**
	-  **[Documentación de Azure NAT Gateway ](https://learn.microsoft.com/es-es/azure/nat-gateway/)**
	-  **[Documentación de Virtual Network IP Services ](https://learn.microsoft.com/es-es/azure/virtual-network/ip-services/)**

![[barra.gif]]

-  **[Parámetros ](https://learn.microsoft.com/es-es/azure/templates/microsoft.network/virtualnetworks?pivots=deployment-language-terraform)**

	![[assets/files/microsoft.virtualnetworks.ipynb]]

	-  **``extendedLocation``**
	
		resource vnet 'Microsoft.Network/virtualNetworks@2025-07-01' = {
		  name: 'vnet-edge'
		  location: 'westeurope'
		  extendedLocation: {
		    name: '/subscriptions/.../customLocations/my-edge'
		    type: 'CustomLocation'
		  }
		  properties: {
		    addressSpace: {
		      addressPrefixes: [
		        '10.1.0.0/16'
		      ]
		    }
		  }
		}
		
		Define que el plano de ejecución del recurso reside fuera del centro de datos regional tradicional de Azure, proyectándose hacia infraestructura propia o de terceros (como Azure Stack HCI o entornos Edge). Aunque la configuración (plano de control) es gestionada por Azure, la materialización (plano de datos) ocurre en una ubicación personalizada (`CustomLocation`). ^1ab1ab
		
		Es vital no confundir el _servicio_ con el _objeto de referencia_.
		
		- **`EdgeZone` (Tipo de `extendedLocation`):** Se refiere a ubicaciones físicas que son propiedad de Microsoft o de operadores de telecomunicaciones integrados, donde tú no gestionas el hardware. Es decir, Microsoft o el Telco gestionan el rack, el servidor y la red física. Tú solo despliegas recursos.
		- **`CustomLocation` (Tipo de `extendedLocation`):** Este es un objeto de **Azure Arc**. Representa tu propia infraestructura física (un servidor en tu oficina, una planta industrial o un clúster de Azure Stack HCI). Para que Azure pueda "ver" tu hardware como un destino de despliegue, primero debes crear un recurso de tipo `CustomLocation` en Azure que apunte a tu clúster de Kubernetes habilitado para Arc.
	-  **``addressSpace``**
	
		El bloque `addressSpace` es la base fundamental de tu red virtual. Es, literalmente, el "canvas" o lienzo donde defines los límites de direccionamiento IP privado que tendrá tu VNet. Todo recurso que despliegues dentro (VMs, servicios, balanceadores) debe residir dentro de este espacio.
		
	    addressSpace: {
	      addressPrefixes: [
	        'string'
	      ]
	      ipamPoolPrefixAllocations: [
	        {
	          numberOfIpAddresses: 'string'
	          pool: {
	            id: 'string'
	          }
	        }
	      ]
	    }
	    
		-  **`addressPrefixes`**: El método tradicional (Static Allocation)
		
			Es la forma clásica de definir redes en Azure. Utilizas notación CIDR (Classless Inter-Domain Routing) para reservar un bloque específico de direcciones privadas.
			
			-  **Naturaleza:** Estática y manual.
			-  **Función:** Define el rango IP que la VNet "posee" y que puede subdividir posteriormente en subredes.
			-  **Ejemplo:** `['10.0.0.0/16']`.
			-  **Ventaja:** Determinismo total. Tú decides exactamente qué IPs se usan.
			-  **Desventaja a escala:** En entornos empresariales grandes con cientos de redes, gestionar manualmente los bloques CIDR para evitar solapamientos (IP overlap) es una pesadilla administrativa.
		-  **`ipamPoolPrefixAllocations`**: La modernización (IPAM - Dynamic Allocation)
		
			Aquí es donde entra la verdadera gobernanza de red a escala. **IPAM** (IP Address Management) es el servicio de Azure que centraliza la asignación de IPs. En lugar de escribir un CIDR a mano, le pides al sistema que "separe" un bloque por ti desde un repositorio central.
			
			-  **`pool` (id):** Es la referencia a un objeto central (el "Pool de IPAM") donde tienes definida la estrategia global de direccionamiento de tu organización.
			-  **`numberOfIpAddresses`:** En lugar de calcular el CIDR (¿necesito un /24 o un /23?), simplemente solicitas la cantidad de direcciones que requieres. Azure calcula y asigna el prefijo adecuado automáticamente.
		
		**¿Por qué esta distinción es crítica para un arquitecto?**
		
		La introducción de `ipamPoolPrefixAllocations` cambia la forma en que diseñas la infraestructura:
		
		1. **Evitas el "IP Overlap" (Colisiones):** Si intentas asignar un bloque que ya está en uso, el servicio de IPAM lo detectará antes de que intentes desplegar el recurso, evitando conflictos de enrutamiento que son extremadamente difíciles de depurar en arquitecturas híbridas.
		2. **Gobernanza centralizada:** Los equipos de infraestructura pueden gestionar los bloques grandes (los "Pools") y los equipos de aplicación solo solicitan bloques más pequeños. Esto separa la **administración de la red** del **consumo de la red**.
		3. **Escalabilidad:** Si tu organización decide migrar su esquema de direccionamiento, no tienes que editar miles de plantillas Bicep; solo ajustas las políticas en el Pool central y las nuevas asignaciones respetarán la nueva lógica.
	-  **``bgpCommunities``**
	
		Para entender este parámetro, debemos mirar más allá de la red virtual (VNet) y enfocarnos en cómo esta "habla" con el resto del mundo (On-Premises, otras nubes o regiones) mediante **BGP (Border Gateway Protocol)**.
		
		**El concepto: Las "etiquetas" del protocolo**
		
		Imagina que BGP es el sistema postal global. Cada ruta (hacia dónde enviar paquetes) es un paquete con un remitente y un destino. Las **BGP Communities** son, en esencia, **etiquetas adhesivas** que tú pegas en esos paquetes antes de enviarlos.
		
		Cuando un router (por ejemplo, el de tu centro de datos On-Premises conectado por ExpressRoute) recibe una ruta de Azure, mira si tiene una "etiqueta" (Community). Si la tiene, el router puede ejecutar una política basada en ella: _"Si el paquete tiene la etiqueta 'X', envíalo por el enlace secundario porque es más barato"_ o _"Si tiene la etiqueta 'Y', descártalo porque es tráfico de desarrollo"_.
		
		-  **¿Qué hace `virtualNetworkCommunity`?**
	
			Este campo te permite definir una cadena (un identificador) que será adjuntada automáticamente a todos los prefijos IP que esta VNet anuncie hacia tus dispositivos de red externos (a través de un VPN Gateway o ExpressRoute).
			
			- **`virtualNetworkCommunity`**: Es el valor que le das a tu VNet. Cada vez que Azure anuncie tu VNet hacia tu router on-premises, lo hará "firmando" el anuncio con este valor.
		-  **¿Por qué esto es vital para un arquitecto?**
	
			Sin este parámetro, el enrutamiento es "plano": tu router on-premises ve todas las redes de Azure como iguales. Con `bgpCommunities`, puedes implementar **segmentación y control de rutas dinámico**.
		
		**Caso de uso: Control de tráfico híbrido complejo**
		
		Imagina una arquitectura donde tienes una sede central en Madrid y un centro de datos secundario en Barcelona, ambos conectados a Azure por ExpressRoute.
		
		1. **Sin Communities:** El router de Madrid podría recibir una ruta hacia tu VNet de Azure tanto por el camino de Madrid como por el de Barcelona, y podría decidir erróneamente enviar el tráfico hacia la nube pasando por Barcelona.
		2. **Con `bgpCommunities`:**
		
		    - Configuras tu VNet con una comunidad específica (ej. `65515:100`).
		    - En tu router de Madrid, aplicas una política de BGP: _"Si recibes una ruta etiquetada con `65515:100`, dale preferencia alta (Local Preference)"_.
		    - En tu router de Barcelona, aplicas: _"Si recibes esa misma ruta, dale preferencia baja"_.
		
		**Resultado:** Has influenciado el comportamiento de la red física (tu router) basándote exclusivamente en el valor que definiste en el `bgpCommunities` de tu archivo Bicep.
		
		**Consideraciones arquitectónicas**
		
		- **No es para comunicación VNet-a-VNet:** Las VNets que se conectan entre sí mediante _Peering_ dentro de Azure no usan BGP; usan el enrutamiento interno de Azure. Este parámetro **solo tiene efecto cuando sales de Azure** hacia un entorno donde gestionas un router BGP (como en un Hub-and-Spoke con ExpressRoute o VPN).
		- **Estandarización:** En entornos Enterprise, no elijas números al azar. Debes tener una política corporativa (un "BGP Community Map") para saber qué significa cada etiqueta (ej. `:100` para Producción, `:200` para Test, `:300` para Entornos aislados).
	-  **``ddosProtectionPlan``**
	
		ddosProtectionPlan: {
		 id: 'string' // Referencia a un recurso externo
		}
		
		Es crucial entender que Azure tiene dos niveles de protección contra DDoS (Distributed Denial of Service).
		
		- **Protección Básica (DDoS Protection Basic):** Viene activada por defecto en todas las VNets de Azure sin coste adicional. Es una protección "de plataforma" que Microsoft gestiona para proteger el tejido de red global.
		- **Network Protection (DDoS Protection Network Protection):** Aquí es donde entra este parámetro. Es un servicio de pago (de nivel Enterprise) que tú despliegas como un recurso independiente en tu suscripción y luego **"adjuntas"** a tus VNets mediante este ID.
		
		**¿Por qué es un recurso separado?**
		
		Porque el `ddosProtectionPlan` es un servicio regional. Al definirlo como un recurso aparte y referenciarlo por `id`, puedes aplicar el mismo plan de protección a 50 VNets diferentes.
		
		**Relación con el diseño:**
		
		Si `bgpCommunities` define cómo _tú_ anuncias tus redes hacia afuera para que los demás lleguen a ti, el `ddosProtectionPlan` define _qué tan seguro_ es que te alcancen. Es el complemento de "entrada":
		
		- `bgpCommunities` = "Este es el camino preferido para llegar a mi red".
		- `ddosProtectionPlan` = "Esta es la limpieza de tráfico que aplico antes de permitir que el tráfico entre a mi red".
	-  **`dhcpOptions`**
	
		dhcpOptions: {
		  dnsServers: [
		    'string' // Lista de IPs de servidores DNS
		  ]
		}
		
		Mucha gente se confunde por el nombre `dhcpOptions`. En Azure, **no puedes configurar servidores DHCP**. Microsoft te entrega las IPs vía DHCP de forma estática y gestionada por el tejido de red. Sin embargo, sí puedes configurar qué servidor DNS deben usar tus máquinas virtuales.
		
		- **Si está vacío:** Tus VMs usan el DNS nativo de Azure (168.63.129.16). Este es el que resuelve nombres de servicios PaaS, Private Links, etc.
		- **Si configuras IPs:** Tus VMs dejarán de usar el DNS de Azure como resolución principal y apuntarán a los servidores que tú definas.
		
		**¿Por qué es crítico arquitectónicamente?**
		
		1. **Active Directory / [[azure-dns-private-resolver|DNS]] On-premises:** Si tienes un entorno híbrido, tus VMs necesitan resolver nombres de dominio internos (`servidor.empresa.local`). Debes poner las IPs de tus Controladores de Dominio aquí.
		2. **Dependencia de Red:** Al configurar esto, creas una **dependencia estricta**. Si tus servidores DNS están en tu datacenter local y tu conexión VPN/ExpressRoute cae, tus VMs en Azure perderán la capacidad de resolver nombres y, por ende, dejarán de funcionar (aunque tengan red).
	-  **``EnableDdosProtection``**
	
		Este parámetro es un booleano (`true`/`false`) que actúa como el "interruptor" para habilitar el plan de protección contra DDoS en la red virtual específica.
		
		-  **Relación:** Mientras que `ddosProtectionPlan` es el _recurso_ (el contrato de servicio), `enableDdosProtection` es la _acción_ que vincula tu VNet a ese contrato.
		-  **Comportamiento:** Si lo estableces en `true`, la VNet se beneficia de las capacidades de mitigación adaptativa de la plataforma. Si no hay un `ddosProtectionPlan` asociado, habilitar esto por sí solo no activará la protección de nivel empresarial.
		-  **Comando CLI:** `az network vnet update --resource-group rg-nombre --name vnet-nombre --ddos-protection true`
	-  **``EnableVmProtection``**
	
		Este parámetro determina si la red virtual está habilitada para proteger los recursos de cómputo (máquinas virtuales) que residen en ella bajo el paraguas de la protección DDoS.
		
		-  **Función:** Cuando se habilita, la plataforma de protección DDoS puede aplicar políticas de mitigación específicas sobre las direcciones IP públicas que están asociadas a las máquinas virtuales dentro de esta VNet.
		-  **Contexto arquitectónico:** Es una capa adicional de "seguridad en el borde" para tus cargas de trabajo. Sin este parámetro activo, aunque tengas protección DDoS a nivel de VNet, la visibilidad y mitigación granular sobre las IPs de las VMs individuales podría ser limitada.
	-  **``Encryption``**
	
		Este es uno de los parámetros más avanzados, introducido para avanzar hacia arquitecturas de **Zero Trust**. Define el comportamiento de cifrado del tráfico dentro de la propia red virtual (tráfico Este-Oeste).
		
		- **Enabled (`bool`):** Si es `true`, el tráfico de red entre las máquinas virtuales dentro de la misma VNet se cifra automáticamente mediante el tejido de red de Azure, sin que las máquinas virtuales necesiten configurar protocolos de cifrado internos (como IPsec o TLS) para esa comunicación básica.
		- **Enforcement (`string`):** Define qué ocurre con el tráfico no cifrado.
		
		    - `AllowUnencrypted`: Permite el tráfico mixto (cifrado y no cifrado). Útil durante migraciones o despliegues graduales.
		    - `DropUnencrypted`: Fuerza el cumplimiento total. Todo tráfico que no pueda ser cifrado por el tejido de red de Azure será descartado.
	-  **``flowTimeoutInMinutes``**
	
		En Azure, todas las redes virtuales funcionan bajo un modelo de red definida por software (SDN). Cuando una conexión (flujo) atraviesa la infraestructura de Azure, esta mantiene un "estado" de esa conexión.
		
		-  **Función:** Define cuánto tiempo (en minutos) se mantiene abierta la tabla de estados de un flujo TCP/UDP cuando no hay tráfico (estado de reposo).
		-  **Valor por defecto:** Típicamente 4 minutos.
		-  **Arquitectura:** Aumentar este valor no es una configuración trivial.
		
		    - **Cuándo subirlo:** Aplicaciones _legacy_ (antiguas) que mantienen conexiones inactivas durante largos periodos. Si el tiempo de espera expira antes de que la aplicación envíe un paquete, el _gateway_ o el tejido de red de Azure "olvidará" la conexión y el siguiente paquete será descartado.
		    - **El trade-off:** Mantener estados de flujo durante mucho tiempo consume recursos de memoria en el tejido de red de Azure. En arquitecturas de alta escala, usar timeouts excesivamente altos puede degradar el rendimiento del plano de datos.
		-  **Regla de arquitecto:** Si tu aplicación requiere timeouts superiores a 30 minutos, el problema no es la red; es la aplicación que no implementa mecanismos de _keep-alive_ (paquetes de mantenimiento) en la capa de aplicación.
	-  **``ipAllocations``**
	
		Este parámetro no gestiona el direccionamiento IP dinámico (eso lo hace IPAM/DHCP); gestiona la **reserva de objetos**.
		
		-  **Función:** Referencia recursos de tipo `Microsoft.Network/ipAllocations`.
		-  **Arquitectura:** Es un mecanismo para el **Bring Your Own IP (BYOIP)** o para la reserva de bloques de IPs específicos que deben ser garantizados antes de que los recursos se desplieguen.
		-  **Diferencia clave con IPAM:**
		
		    -  **IPAM (`ipamPoolPrefixAllocations`):** Gestiona el "espacio" (la lógica de qué red pertenece a quién).
		    -  **IPAllocations:** Gestiona el "objeto" (la reserva física y pre-asignada de bloques de IPs para evitar conflictos de direccionamiento en escenarios críticos).
		-  **Caso de uso:** Se utiliza principalmente en redes de proveedores o escenarios donde necesitas garantizar que un rango de IPs específico esté "anclado" a un recurso de red antes de que cualquier otra cosa pueda intentar reclamar ese espacio.
	-  **``privateEndpointVNetPolicies``**
	
		Este es, probablemente, el parámetro más importante para un arquitecto que diseña entornos bajo el modelo **Zero Trust**.
		
		- **Función:** Define si las políticas de red (Network Security Groups - NSG) y las rutas definidas por el usuario (UDR) se aplican a los _Private Endpoints_ que se despliegan en la subred.
		- **Valores:**
		
		    - `Disabled`: Los NSGs y UDRs se ignoran para el tráfico hacia los Private Endpoints. Esto es inseguro.
		    - `Enabled`: Las políticas se aplican. El tráfico hacia el Private Endpoint pasa por las mismas reglas de filtrado que cualquier otro tráfico en la subred.
		
		**Por qué es crítico:** Imagina que despliegas un `Private Endpoint` para una base de datos SQL. Si `privateEndpointVNetPolicies` está en `Disabled`, cualquier máquina en esa subred puede alcanzar la base de datos, ignorando cualquier regla de NSG que intentes poner. Al activarlo (`Enabled`), obligas a que el tráfico hacia tu servicio privado pase por tus **reglas de filtrado de seguridad**, permitiendo un control granular (por ejemplo: "Solo el servidor de aplicaciones X puede hablar con la base de datos Y").
	-  **Subnets**

	-  **``DefaultOutboundAccess``**
	
		Esta propiedad define el plano de datos y cómo interactúa la subred con el tejido de red de Azure.
		
		-  **Función:** Controla si la infraestructura de Azure (el fabric) aplica automáticamente una traducción de direcciones de red (SNAT) para proporcionar conectividad a Internet.
		-  **Comportamiento:**
		
		    - **`true`** (o no definido): Permite el SNAT implícito gestionado por el proveedor, proporcionando conectividad de salida automática.
		    - **`false`**: Deshabilita el SNAT implícito. Obliga a que cualquier tráfico de salida sea gestionado explícitamente mediante recursos de red diseñados (ej. NAT Gateway, Azure Firewall).
		-  **Impacto:** Es un control de **determinismo**. Su objetivo es eliminar comportamientos ocultos de la plataforma, alineando el despliegue con modelos de Zero Trust.
		
		Para forzar el aislamiento perimetral mediante la interfaz de línea de comandos, utiliza: **`az network vnet subnet update --resource-group rg-nombre --name subnet-nombre --vnet-name vnet-nombre --default-outbound false`**
	-  **``Delegations``**
	
		Esta propiedad define el contrato técnico entre la subred y los Proveedores de Recursos (Resource Providers) de Azure.
		
		-  **Función:** Autoriza a servicios específicos de Azure a realizar operaciones de "inyección" de recursos dentro de una subred.
		-  **Comportamiento:** Indica que la subred cumple con los requisitos técnicos (como permisos de red y direccionamiento) para que un servicio específico (ej. `Microsoft.ContainerService/managedClusters` para AKS) pueda alojar sus componentes internos.
		-  **Limitaciones:**
		
		    - No automatiza el despliegue del servicio.
		    - No otorga permisos de ejecución (RBAC).
		    - No define quién puede crear recursos, solo habilita la posibilidad técnica de hacerlo en ese segmento de red.
	-  **``SharingScope``**
	
		Esta propiedad define el perímetro de consumo administrativo dentro de un mismo inquilino (Tenant) de Azure AD.
		
		-  **Función:** Determina el alcance organizativo en el que la subred puede ser consumida.
		-  **Comportamiento:**
		
		    - `DelegatedServices`: Uso restringido a los servicios definidos en la propiedad `delegations`.
		    - `Tenant`: Permite que la subred sea utilizada por suscripciones distintas dentro del mismo inquilino de Entra ID.
		-  **Limitaciones:**
		
		    - No altera el enrutamiento ni el tráfico.
		    - No es una herramienta de automatización ni de permisos. El despliegue de recursos en la subred compartida sigue requiriendo permisos explícitos (RBAC) en la suscripción del consumidor.
		    - El alcance está estrictamente confinado al Tenant. No permite la compartición entre inquilinos (Cross-tenant).
		
		**Intersección y restricciones de seguridad**
		
		Aunque son ejes independientes, la plataforma impone restricciones lógicas para garantizar la seguridad. El caso más relevante es la dependencia obligatoria de seguridad:
		
		- **Restricción:** El uso de `sharingScope` en modo `Tenant` requiere obligatoriamente que `defaultOutboundAccess` sea `false`.
		- **Justificación técnica:** Azure impide la compartición de infraestructura de red entre suscripciones si el comportamiento de salida no es determinista. Al compartir una subred, el proveedor elimina el SNAT implícito para evitar que flujos de tráfico provenientes de distintos entornos (suscripciones) se mezclen o sean imposibles de auditar mediante una IP pública compartida y dinámica.
-  **¿Cómo se relacionan estos con la arquitectura Enterprise?**

	Si unimos los bloques que hemos analizado, empezamos a ver el "contrato" de una VNet Enterprise:
	
	- **`addressSpace` + `ipamPoolPrefixAllocations`**: Define la **soberanía** del direccionamiento (Evita solapamientos).
	- **`bgpCommunities`**: Define la **influencia** en el enrutamiento externo (Ingeniería de tráfico saliente).
	- **`ddosProtectionPlan`**: Define la **seguridad** del tráfico entrante (Seguridad perimetral).
	- **`dhcpOptions`**: Define la **resolución de identidades** (Control de la lógica interna). 
	- **``enableDdosProtection``**: Activar mitigación de ataques volumétricos. Nivel de aplicación VNet (Perímetro)
	- **``enableVmProtection``**: Permitir protección granular en VMs. Nivel de aplicación VNet (Workloads)
	- **``encryption``**: Cifrado nativo del tráfico entre recursos. Nivel de aplicación VNet (Fabric)
	-  **``flowTimeoutInMinutes``**: Evita que el tejido de Azure cierre conexiones inactivas.
	- **``ipAllocations``**: Asegura la reserva de bloques de IP específicos. 
	- **``privateEndpointVNetPolicies``**: Fuerza el cumplimiento de seguridad en servicios privados. Rol Arquitectónico (Gobernanza)

	Históricamente, el cifrado entre servidores requería gestionar certificados y protocolos complejos en el sistema operativo. Al mover esta capacidad al nivel de `encryption` en la VNet, delegas la seguridad del transporte al proveedor, garantizando privacidad de datos a nivel de capa de enlace, independientemente de la aplicación.




























