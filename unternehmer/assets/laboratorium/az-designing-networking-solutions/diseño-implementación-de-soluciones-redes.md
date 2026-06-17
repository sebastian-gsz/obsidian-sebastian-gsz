
-  **Tareas**

	- [ ] Realizar el despliegue vía "**Asignación mediante grupos de direcciones IPAM (IP Address Management)**"
	- [ ] Como se implementa gobernanza a un Root Pool en IPAM RBAG
	- [ ] Como implementar un **``Private Endpoint``**

![[barra.gif]]

-  **M01.0 - [[Diseñar e implementar una red virtual en Azure]]**
-  **M01.1 - [[Configurar la configuración DNS en Azure]]**













---


# Laboratorio: Transición a IPAM Governance

Para que este laboratorio funcione, dividiremos el trabajo en dos partes:

1. **Plano de Control (IPAM Pools):** Desplegamos el "banco de IPs".
    
2. **Plano de Ejecución (VNets):** Refactorizamos tu `main.bicep` actual para que consuma desde ese banco.
    

### Paso 1: El Banco de IPs (`ipam-infra.bicep`)

Antes de crear tus VNets, necesitas el recurso que gestiona el espacio. Crea este archivo; es la base de tu arquitectura.

Fragmento de código

```
// ipam-infra.bicep
resource ipamRootPool 'Microsoft.Network/ipamPools@2024-05-01' = {
  name: 'Corporate-Root-Pool'
  location: resourceGroup().location
  properties: {
    addressPrefix: '10.0.0.0/8' // Tu reserva global
    description: 'Pool raíz corporativo'
  }
}

// Sub-pool para servicios de Red (Hub)
resource hubPool 'Microsoft.Network/ipamPools@2024-05-01' = {
  name: 'Hub-Services-Pool'
  location: resourceGroup().location
  properties: {
    parentPoolId: ipamRootPool.id
    addressPrefix: '10.20.0.0/16' // Bloque para CoreServices
    description: 'Pool para infraestructura compartida'
  }
}

// Sub-pool para Research/S&D
resource spokePool 'Microsoft.Network/ipamPools@2024-05-01' = {
  name: 'Research-Spoke-Pool'
  location: resourceGroup().location
  properties: {
    parentPoolId: ipamRootPool.id
    addressPrefix: '10.40.0.0/16' // Bloque para Research
    description: 'Pool para entorno de Investigación'
  }
}
```

### Paso 2: Refactorización de `main.bicep` (Consumo Dinámico)

Ahora, en tu archivo `main.bicep`, eliminaremos la dependencia de valores estáticos como `10.40.0.0/16`.

**Nota técnica:** Observa cómo cambiamos `addressPrefixes` por `ipamPoolPrefixAllocations`. Necesitarás pasar el `poolId` como parámetro.

Fragmento de código

```
// main.bicep refactorizado
param location01 string = 'eastus'
param virtualNetworks_ResearchVnet_name string = 'ResearchVnet'
param researchPoolId string // El ID del pool que creamos en el Paso 1

resource vnet_Research 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  name: virtualNetworks_ResearchVnet_name
  location: location01
  properties: {
    // Cambio clave: de static addressPrefixes a IPAM
    addressSpace: {
      ipamPoolPrefixAllocations: [
        {
          numberOfIpAddresses: '65536' // /16 tiene 65536 direcciones
          pool: {
            id: researchPoolId
          }
        }
      ]
    }
    subnets: [
      // Aquí puedes mantener tus subnets estáticas o convertirlas a sub-pools
      {
        name: 'default'
        properties: {
          addressPrefix: '10.40.0.0/24' // OJO: La subnet sigue necesitando prefijo local, 
                                        // pero el AddressSpace de la VNet ya está gobernado.
        }
      }
    ]
  }
}
```

### Paso 3: El archivo de parámetros (`main.bicepparam`)

Aquí es donde "inyectas" la arquitectura en el despliegue. En lugar de escribir el CIDR (`10.40.0.0/16`), pasas el ID del recurso de IPAM.

Fragmento de código

```
using 'main.bicep'

param location01 = 'eastus'
param virtualNetworks_ResearchVnet_name = 'ResearchVnet'

// Aquí el Pipeline no escribe direcciones, solo apunta al Pool correcto
param researchPoolId = '/subscriptions/{sub-id}/resourceGroups/{rg}/providers/Microsoft.Network/ipamPools/Research-Spoke-Pool'
```

### Análisis del Arquitecto: ¿Qué hemos logrado con este laboratorio?

1. **Desacoplamiento total:** Si mañana el equipo de red decide cambiar el bloque de _Research_ de `10.40.0.0/16` a `172.16.0.0/16` por un tema de fusión empresarial, **no tienes que tocar tu `main.bicep`**. Solo actualizas el Pool en Azure y el próximo despliegue de la VNet tomará la nueva red automáticamente.
    
2. **Validación proactiva:** Si alguien intenta desplegar una VNet que requiere más IPs de las que el `Research-Spoke-Pool` tiene disponibles, el despliegue fallará en la validación del plano de control, no en tiempo de ejecución (runtime).
    
3. **Seguridad:** El `main.bicep` ahora solo tiene permisos para _consumir_ de un pool específico, no tiene libertad total sobre el direccionamiento IP de la organización.
    

Este laboratorio es la base de una red de nivel empresarial. ¿Quieres que veamos cómo convertir las **subredes** internas (`GatewaySubnet`, `SharedServicesSubnet`) para que también consuman desde sub-pools delegados, o prefieres enfocarte en cómo conectar estas VNets una vez desplegadas?


---

# **Laboratorio**: Escenario híbrido control granular

- Objetivo:
    - Validar propagación de prefijos y segmentación mediante BGP sobre VPN
- Topología:
    - Azure VNet: `10.10.0.0/16`
        - Subnet-App: `10.10.1.0/24`
        - Subnet-DB: `10.10.2.0/24`
    - On-prem simulado:
        - `192.168.0.0/16`
    - VPN Gateway con BGP activado
- Configuración:
    - Prefijos anunciados desde Azure:
        - Solo `10.10.1.0/24`
    - On-prem anuncia:
        - `192.168.1.0/24`
- Validaciones:
    - On-prem → `10.10.1.x` → OK
    - On-prem → `10.10.2.x` → FAIL
    - Azure → `192.168.1.x` → OK
- Resultado esperado:
    - Confirmación de:
        - Segmentación por prefijos
            
        - Control de visibilidad por BGP

**LAB-02_EXPRESSROUTE_BGP**: escenario empresarial optimizado

- Objetivo:
    - Evaluar control de routing en conexión dedicada
- Topología:
    - Azure VNet: `10.20.0.0/16`
        - Subnet-API: `10.20.1.0/24`
        - Subnet-Internal: `10.20.2.0/24`
    - Red corporativa:
        - `172.16.0.0/16`
    - ExpressRoute + BGP
- Configuración:
    - Prefijos anunciados:
        - `10.20.1.0/24` únicamente
    - Ruta preferente:
        - ExpressRoute (no Internet)
- Validaciones:
    - Corporativo → `10.20.1.x` → OK
    - Corporativo → `10.20.2.x` → FAIL
    - Latencia inferior vs VPN
- Resultado esperado:
    - Confirmación de:
        - Aislamiento de capas
            
        - Exposición controlada de servicios productivos

**LAB-03_VNET_PEERING_GATEWAY**: escenario intra-Azure avanzado

- Objetivo:
    - Validar propagación de prefijos entre VNets con gateway transitivo
- Topología:
    - VNet-Hub: `10.30.0.0/16` (Gateway)
    - VNet-Spoke-1: `10.31.0.0/16`
        - Subnet-App: `10.31.1.0/24`
    - VNet-Spoke-2: `10.32.0.0/16`
    - Peering con:
        - “Use remote gateway” activado
- Configuración:
    - Gateway anuncia:
        - Solo `10.31.1.0/24`
- Validaciones:
    - Spoke-2 → `10.31.1.x` → OK
    - Spoke-2 → `10.31.2.x` → FAIL
    - Ver tabla de rutas efectiva
- Resultado esperado:
    - Confirmación de:
        - Control de visibilidad entre VNets
            
        - Uso eficiente de arquitectura Hub-Spoke

**LAB-04_MULTI-CLOUD_VPN_BGP (Azure + AWS)**: caso realista

- Objetivo:
    - Validar exposición selectiva entre clouds
- Topología:
    - Azure: `10.40.0.0/16`
        - Subnet-Service: `10.40.1.0/24`
    - AWS VPC:
        - `172.31.0.0/16`
    - VPN site-to-site con BGP
- Configuración:
    - Azure anuncia:
        - `10.40.1.0/24`
    - AWS anuncia:
        - `172.31.10.0/24`
- Validaciones:
    - AWS EC2 → `10.40.1.x` → OK
    - AWS EC2 → `10.40.2.x` → FAIL
- Resultado esperado:
    - Confirmación de:
        - Aislamiento multi-cloud
            
        - Exposición mínima viable

**CONCLUSIÓN_OPERATIVA**: síntesis ejecutable

- Prefijos anunciados:
    - Controlan visibilidad, no acceso
- BGP:
    - Propaga rutas dinámicamente
- VPN / ExpressRoute:
    - Son el canal obligatorio
- Peering:
    - Permite reutilización de gateway
- Estrategia óptima:
    - Dividir red en `/24` funcionales
    - Anunciar únicamente lo necesario
    - Validar siempre con:
        - `Effective routes`
        - Pruebas reales de conectividad

Francamente, con estos 4 laboratorios cubres el espectro completo; cualquier variante adicional es redundante o académicamente irrelevante.