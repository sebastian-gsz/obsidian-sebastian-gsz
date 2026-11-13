
-  **Enlaces**

	-  **[Port mirroring — Wikipedia ](https://en.wikipedia.org/wiki/Port_mirroring)**
	-  **Internos**

		-  **[[wireshark-icmpv6-arp-analysis|Captura práctica en Wireshark]]**

![[barra.gif]]

-  **SPAN**

	SPAN es una función que permite redirigir el tráfico de un puerto o VLAN en un switch hacia otro puerto para su captura o análisis. Esto permite que el tráfico que normalmente no se vería (por ejemplo, tráfico entre dos dispositivos en la misma red) pueda ser inspeccionado por una herramienta de monitoreo o análisis sin interrumpir la red.

	**Características de SPAN**:

	-  **Local**: El tráfico capturado se redirige a un puerto en el mismo switch.
	-  **Monitoreo de puertos específicos**: Puedes monitorear un solo puerto o múltiples puertos.
	-  **Solo tráfico dentro del switch**: SPAN solo monitorea el tráfico dentro de un mismo switch o entre switches que están conectados de manera directa.

-  **RSPAN**

	RSPAN es una extensión de SPAN que permite enviar el tráfico capturado desde un switch hacia un switch remoto. Esto es útil cuando no se puede realizar una captura de tráfico localmente en el mismo switch y se necesita monitorear el tráfico en un dispositivo remoto.

	**Características de RSPAN**:

	-  **Remoto**: El tráfico capturado se redirige a un switch remoto.
	-  **Monitoreo de tráfico entre switches**: Permite monitorear el tráfico que pasa entre switches y no solo el tráfico dentro de un único switch.
	-  **Usa VLAN dedicada**: Se utiliza una VLAN dedicada para el tráfico de monitoreo, lo que asegura que el tráfico SPAN/RSPAN no interfiera con el tráfico regular de la red.

-  **Habilitar SPAN (CLI Cisco IOS)**

	-  **``Seleccionar el switch``**: Haz clic en el switch donde deseas configurar SPAN.
	-  **``Entrar al modo de configuración``**: Abre la consola del switch y entra en el modo de configuración global: **``conf t``**
	-  **``Configurar el puerto fuente``**: Configura el puerto (o puertos) que deseas monitorizar: **``monitor session 1 source interface fa0/1``**

		-  Esto configura el puerto FastEthernet 0/1 como el puerto fuente desde donde se capturará el tráfico.
	-  **``Configurar el puerto de destino``**: Configura el puerto donde se redirigirá el tráfico para ser analizado: **``monitor session 1 destination interface fa0/24``**

		-  Esto configura el puerto FastEthernet 0/24 como destino donde se enviará el tráfico capturado.
	-  **``Verificar configuración``**: **``show monitor``**

-  **Habilitar RSPAN (CLI Cisco IOS)**

	-  **``Configurar una VLAN de RSPAN``**: Crea una VLAN dedicada para transmitir el tráfico capturado: **``vlan 100 name RSPAN-VLAN``**
	-  **``Configurar el puerto de origen en el switch remoto``**: Configura el puerto a monitorear en el switch de origen; el tráfico se envía a la VLAN RSPAN: **``monitor session 1 source interface fa0/1``** + **``monitor session 1 destination vlan 100``**
	-  **``Configurar el switch de destino``**: En el switch remoto, configura el puerto que recibe el tráfico de RSPAN (conectado a la herramienta de monitoreo): **``monitor session 1 source vlan 100``** + **``monitor session 1 destination interface fa0/24``**

![[barra.gif]]
