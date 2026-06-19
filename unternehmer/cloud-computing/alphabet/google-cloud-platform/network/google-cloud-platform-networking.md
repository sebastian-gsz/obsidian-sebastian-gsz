
![[barra.gif]]

La arquitectura de GCP se basa en un plano de control unificado y una red troncal global privada. A diferencia de otros proveedores, Google no construyó su nube replicando centros de datos aislados que luego necesitaban interconexión; construyeron una red global desde el principio, impulsada por su tecnología de SDN (Software Defined Networking), conocida internamente como **Andromeda**.

-  **Abstracción global:** En Google Cloud Platform, una VPC es un recurso global. Cuando creas una VPC, estás definiendo un espacio de nombres lógico que abarca todas las regiones. No necesitas provisionar una red en cada región por separado; simplemente defines las subredes dentro de esa VPC global.
-  **Eliminación del peering regional:** Al ser un tejido global, las instancias pueden comunicarse a través de direcciones IP privadas entre regiones sin necesidad de configurar **_VPC Peering_, _VPN Gateways_ o _Transit Gateways_**. La infraestructura de Google maneja el enrutamiento a través de su red troncal privada de alta velocidad.
-  **Gestión de direcciones IP:** El espacio de direcciones IP de una VPC es único. Esto simplifica enormemente el diseño de red, ya que no tienes que preocuparte por gestionar tablas de rutas complejas o el solapamiento de rangos CIDR entre regiones dentro de la misma VPC.

**Por qué eligieron este camino**

Google apostó por la simplicidad operativa y el rendimiento predecible:

-  **Menor carga administrativa:** Al no requerir conexiones manuales entre regiones, reduces la complejidad operativa y el riesgo de errores en la configuración de la conectividad.
-  **Seguridad unificada:** Las políticas de firewall se aplican a nivel de VPC o mediante etiquetas, no restringidas por límites regionales, lo que permite una postura de seguridad coherente en todo el despliegue global.
-  **Escalabilidad:** Esta arquitectura permite desplegar recursos en cualquier región del mundo y tenerlos conectados instantáneamente a la red corporativa sin necesidad de configurar servicios de interconexión adicionales.

![[barra.gif]]

