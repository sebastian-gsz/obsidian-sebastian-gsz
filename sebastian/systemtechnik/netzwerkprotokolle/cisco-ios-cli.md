
-  **Enlaces**

	-  **Internos**

		-  **[[span-rspan]]**
		-  **[[systemtechnik|Systemtechnik]]**

![[barra.gif]]

-  **Tablas ARP**

	-  **``show ip arp``**: Se utiliza para mostrar la tabla ARP (Address Resolution Protocol) de un dispositivo de red, como un router o un switch. ARP es el protocolo que se utiliza para mapear direcciones IP a direcciones MAC en una red local.

		**Parámetros**: **``show ip arp GigabitEthernet0/1``**

		-  **`192.168.1.1`**: Puedes especificar una dirección IP para ver solo la entrada correspondiente a esa dirección.
		-  **`GigabitEthernet0/1`**: Muestra las entradas ARP para una interfaz específica.
	-  **``clear ip arp``**: Limpia la tabla ARP, eliminando todas las entradas dinámicas.

		**Parámetros**:

		-  **`clear ip arp 192.168.1.1`**: Permite eliminar una entrada específica de la tabla.
	-  **``show ip arp static``**: Muestra las direcciones IP que han sido mapeadas a direcciones MAC de forma estática. Las entradas estáticas no se eliminan hasta que se cambien manualmente o se reinicie el dispositivo.
	-  **``arp``**: Se usa para agregar entradas ARP estáticas a la tabla ARP.

		**Parámetros**: **``arp 192.168.1.1 0001.1234.5678 arpa``**

		-  **`ip-address`**: Dirección IP a asociar.
		-  **`mac-address`**: Dirección MAC a asociar.
		-  **`interface`**: Interfaz por la que se debe considerar la entrada.
	-  **``show ip arp summary``**: Este comando muestra un resumen de las entradas de la tabla ARP, sin detalles completos sobre cada una, pero sí información sobre la cantidad de entradas.
	-  **``show ip cache``**: Muestra la caché de la resolución de direcciones ARP, que es otra forma de ver las resoluciones IP a MAC que se han realizado recientemente.
	-  **``show mac address-table``**: Aunque no está estrictamente relacionado con ARP, este comando se puede usar junto con ARP para ver la tabla MAC en switches, lo cual puede ayudar a diagnosticar problemas de resolución de direcciones.
	-  **``show ip interface``**: Este comando muestra información sobre las interfaces del dispositivo y las direcciones IP asociadas a ellas, lo que puede ayudar a correlacionar con la tabla ARP.

-  **Habilitar Inter-VLAN Routing**

	-  Primero activas el enrutamiento: **``sdm prefer lanbase-routing``**
	-  Después: **``ip routing``**
	-  Creas la interfaz para la VLAN 10: **``interface Vlan10``**

		**``ip address 192.168.10.1 255.255.255.0``**
		**``no shutdown``**
	-  Creas la interfaz para la VLAN 20: **``interface Vlan20``**

		**``ip address 192.168.20.1 255.255.255.0``**
		**``no shutdown``**

-  **Creación y migración de puertos a VLAN**

	-  **(config)#``hostname S1``**
	-  **(config)#``no ip domain-lookup``**
	-  **(config)#``service password-encryption``**
	-  **(config)#``enable secret class``**
	-  **(config)#``banner motd #``**
	-  **(config)#``vlan 99``**
	-  **(config-vlan)#``name ADMIN``**
	-  **(config)#``interface vlan 99``**
	-  **(config-if)#``ip address 192.168.1.2 255.255.255.0``**
	-  **(config-if)#``no shutdown``**
	-  **(config)#``interface range gigabitEthernet 0/1 - 2``**
	-  **(config-if-range)#``switchport mode access``**
	-  **(config-if-range)#``switchport access vlan 99``**
	-  **(config)#``ip default-gateway 192.168.1.1``**
	-  **(config)#``line console 0``**
	-  **(config-line)#``password cisco``**
	-  **(config-line)#``logging synchronous``**
	-  **(config-line)#``login``**
	-  **(config)#``line vty 0 15``**
	-  **(config-line)#``password cisco``**
	-  **(config-line)#``login``**
	-  **(config-line)#``transport input telnet``**
	-  **(config-line)#``end``**
	-  **#``wr``**

![[barra.gif]]
