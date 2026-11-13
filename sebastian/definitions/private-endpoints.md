---
def-type: atomic
version: 1.0
id: def-private-endpoint
status: estandar
category: arquitectura-de-redes
contexto: infraestructura
date: 2026-06-26
tags:
  - redes
  - cloud
  - azure
  - seguridad
  - zero-trust
aliases:
  - nic
  - private endpoints
  - private endpoint
---
Un Private Endpoint es un recurso de red, implementado como una interfaz de red (NIC) dentro de una subred de una Red Virtual (VNet), que proporciona acceso privado a servicios PaaS (Platform as a Service) sin exponerlos al internet público. Es un componente crítico para implementar arquitecturas de seguridad _Zero Trust_.

#### Arquitectura y Funcionamiento

-  **Naturaleza técnica:** No es un _gateway_ ni un recurso de computo. Se trata de una NIC dedicada que proyecta un servicio gestionado (ej. Azure SQL, Storage, Key Vault) dentro del perímetro de la red corporativa.
-  **Mecánica de conexión:** La comunicación se establece mediante el servicio Azure Private Link, vinculando la NIC a la instancia específica del servicio PaaS. El tráfico de red permanece enteramente dentro del _backbone_ de Microsoft, eliminando el tránsito por internet.
-  **Gobernanza:**
    
    -  **IPAM y direccionamiento:** El endpoint consume una IP privada de la subred, por lo que debe integrarse en el esquema de direccionamiento IPAM para evitar conflictos.
    -  **Filtrado granular:** Al habilitar políticas de red en la subred (_private endpoint vnet policies_), es posible aplicar _Network Security Groups_ (NSG) directamente sobre el tráfico hacia el endpoint.

#### Consideraciones Críticas de Implementación

-  **Resolución DNS:** Este es el punto de fallo más frecuente. Dado que el servicio PaaS mantiene su FQDN público original, es obligatorio implementar **Private DNS Zones** que sobreescriban la resolución de nombres, redirigiendo las consultas hacia la IP privada del endpoint en lugar de la pública.

#### Gestión vía CLI (Azure CLI)

Para verificar la configuración de un endpoint privado y su interfaz de red asociada: `az network private-endpoint show --name mi-endpoint --resource-group mi-rg --query "networkInterfaces[0].id" -o tsv`


