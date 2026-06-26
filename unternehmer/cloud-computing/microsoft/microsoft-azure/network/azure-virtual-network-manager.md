

![[barra.gif]]

-  **Documentación**

	-  **[Documentación de Azure Virtual Network Manager ](https://learn.microsoft.com/es-es/azure/virtual-network-manager/)**

Imagina que eres un arquitecto en una multinacional. Tienes 50 suscripciones (en Azure), 50 cuentas (en AWS) o 50 proyectos (en GCP). Si cada equipo de desarrollo decide su propio rango IP (`10.0.0.0/16`), llegará un día en que necesites conectar esas redes (peering o VPN) y será **imposible** porque todas las rutas chocan.

La práctica enterprise de IPAM resuelve esto mediante tres pilares:

1. **Jerarquización (Pools):** El equipo de red central crea un "Pool Maestro" (ej. `10.0.0.0/8`).
2. **Delegación:** El equipo central "le presta" un bloque pequeño (`10.1.0.0/20`) a la suscripción de "Facturación" y otro (`10.2.0.0/20`) a la de "Logística".
3. **Validación Proactiva:** El sistema no te deja crear una red virtual si el rango que intentas usar ya ha sido reservado por otra parte de la organización.

![[barra.gif]]

-  **Arquitectura y Gobernanza de IPAM (IP Address Management)**

	La estrategia de jerarquización de **IP Address Management (IPAM)** no es una simple configuración; es el pilar de un diseño de red escalable. En un ecosistema empresarial, el objetivo es evitar colisiones de rutas (el temido "CIDR Hell") y permitir que cada equipo de trabajo consuma bloques de red sin interferir con los demás, centralizando la autoridad y delegando la capacidad de ejecución.
	
	Para implementar una práctica sólida, el equipo de plataforma o redes centraliza la autoridad sobre el espacio de direccionamiento global y delega bloques a las suscripciones o entornos específicos.
	
	-  **A. Pool Maestro (Root Pool)**
	
		Este pool reside a nivel de **Organización** o **Management Group** (el nodo padre de todo tu árbol corporativo).
		
		-  **Función:** Es la "Fuente de la verdad". Ninguna VNet debe ser creada fuera de este direccionamiento global.
		-  **Propósito Estratégico:** Garantizar que todo el espacio IP esté bajo control, evitando que suscripciones aisladas "secuestren" bloques de IP que podrían ser necesarios para otras áreas.
		-  **Ejemplo:** `10.0.0.0/8`.
	-  **B. Pools Delegados (Spoke Pools)**
	
		A partir del pool maestro, se crean subdivisiones (sub-pools) para cada función, entorno o unidad de negocio. Esto permite la segregación de responsabilidades.
		
		-  **Pool del Hub:** Reservado exclusivamente para servicios de red compartidos (Firewalls, Bastions, Gateways, VPNs).
		-  **Pools de los Spokes:** Bloques específicos asignados a cada suscripción o unidad de negocio (ej. Producción vs. Desarrollo).
		-  **Ejemplo:**
		
		    - Hub: `10.0.0.0/16`
		    - Spoke A (Producción): `10.1.0.0/16`
		    - Spoke B (Desarrollo): `10.2.0.0/16`
	
	**Definición del Pool Central: Metodología Enterprise**
	
	Para definir este Pool Central en cualquier nube moderna, el flujo lógico que un arquitecto debe implementar sigue un camino de cuatro etapas:
	
	-  **Establecimiento del alcance (Scope)**
	
		Antes de escribir una dirección IP, define **dónde vive** este Pool. No se define a nivel de VNet, sino en el nivel superior (`Management Group`).
		
		- **Heredabilidad:** Al definirlo en la raíz, todas las suscripciones debajo heredan la capacidad de solicitar IPs de él.
		- **Práctica Enterprise:** Nunca definas un Pool Maestro en una suscripción de producción. Defínelo en el nodo padre del árbol para garantizar consistencia total.
	-  **Definición de la jerarquía**
	
		El pool maestro actúa como un presupuesto. Lo estructuras mediante niveles:
		
		- **Nivel 1 (Root Pool):** Tu reserva global (`10.0.0.0/8`).
		- **Nivel 2 (Sub-Pools):** División por unidad de negocio o entorno.
		- **Nivel 3 (Allocation):** El momento en que el servicio de IPAM "separa" el CIDR para una VNet específica (como vimos en el parámetro `ipamPoolPrefixAllocations`).
	-  **La "Guardia" del Pool (RBAC y Delegación)**
	
		Este es el control de acceso fundamental. El plano de control de IPAM permite aplicar **RBAC** en cada nivel del árbol.
		
		- **Administrador del Pool raíz:** Solo el equipo central de redes puede modificar el bloque `10.0.0.0/8`.
		- **Contribuidor de Pool de Spoke:** El equipo de desarrollo tiene acceso de _solo lectura_ al Pool Raíz, pero _escritura_ en su pool específico (ej. `10.2.0.0/16`).
		- **Valor arquitectónico:** Esto elimina la capacidad de un usuario de "robar" o "reservar" IPs que pertenecen a otros departamentos o entornos.
	-  **Definición de "Guardrails" (Políticas de validación)**
	
		Para mantener la red ordenada, se definen reglas de negocio dentro del plano de control:
		
		- **Tamaño mínimo:** Ninguna VNet puede pedir un bloque menor a un `/24` (evita la fragmentación excesiva).
		- **Tamaño máximo:** Ninguna VNet puede pedir más de un `/20` (evita que un solo despliegue agote el pool).
	-  **Implementación operativa y automatización**
	
		Cuando el equipo de redes crea este "Pool Maestro", están desplegando un recurso de infraestructura. A partir de ahí, la automatización elimina el error humano.
	-  **Flujo de aprovisionamiento (Bicep/ARM)**
	
		- **Solicitud:** Un pipeline de CI/CD despliega una VNet.
		- **Asignación:** El parámetro `ipamPoolPrefixAllocations` llama al ID del pool del Spoke correspondiente.
		- **Validación:** El servicio de IPAM verifica (de forma proactiva) si hay espacio.
		- **Ejecución:** El ARM asigna automáticamente un prefijo (ej. `10.1.0.0/24`) a la nueva VNet.
	
	**Ejemplo de implementación:**
	
		ipamPoolPrefixAllocations: [
		  {
		    numberOfIpAddresses: '256' // Pide 256 IPs, IPAM calcula el /24
		    pool: {
		      id: '/subscriptions/.../providers/Microsoft.Network/ipamPools/Dev-Spoke-Pool'
		    }
		  }
		]
	
	**Ventajas estratégicas y visión final**
	
	Este modelo transforma la red en un **servicio gobernado**:
	
	- **Desacoplamiento:** Los equipos de aplicación operan bajo un modelo de _self-service_, consumiendo su presupuesto asignado sin intervención manual para cada red nueva.
	- **Visibilidad:** El equipo de red central audita en tiempo real el espacio disponible antes de que ocurra una crisis de agotamiento.
	- **Integración híbrida:** Al tener un orden jerárquico, la conexión con infraestructuras on-premises (mediante `extendedLocation` o VPN) es mucho más sencilla. El esquema de rutas es predecible y no requiere re-direccionamiento masivo.