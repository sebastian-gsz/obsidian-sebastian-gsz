
-  **Enlaces**

	-  **Internos**

		-  **[[span-rspan]]**
		-  **[[network-authentication-protocols]]**
		-  **[[quality-of-service]]**
		-  **[[cisco-ios-cli]]**
		-  **[[wireshark-icmpv6-arp-analysis]]**

![[barra.gif]]

-  **Protocolos de red**

	-  **SMB**
	
		El protocolo SMB es fundamental en entornos Windows para compartir recursos de red, como archivos y carpetas. Aquí algunos puntos clave:
		
		- **``Universal Naming Convention`` (UNC)**: Se utiliza para especificar la ubicación de recursos compartidos en la red. Por ejemplo, `\\servername\sharename\file`, donde `servername` puede ser un nombre de DNS, NetBIOS o una dirección IP, `sharename` es la raíz de la carpeta remota, y `file` es el recurso específico.
		- **``Recursos compartidos administrativos``**: Son recursos especiales creados automáticamente por Windows, identificados por un signo `$` al final de su nombre (por ejemplo, `C$`, `D$`). Estos recursos están destinados a la administración remota y solo pueden ser accesibles por usuarios con privilegios administrativos.
	-  **Conexión a recursos compartidos**
	
		Para conectar con un recurso compartido remoto:
		
		- **``Explorador de archivos``**: Escribe la UNC en la barra de direcciones del Explorador de Archivos de Windows. Windows solicitará las credenciales adecuadas para acceder al recurso remoto.
		- **``Control de acceso``**: Es posible aplicar control de acceso a carpetas y archivos en recursos compartidos para limitar las acciones que usuarios y grupos pueden realizar, como leer, escribir o denegar acceso.
	-  **Protocolo de escritorio remoto (RDP)**
	
		El Protocolo de Escritorio Remoto permite controlar computadoras remotas como si estuvieras físicamente presente en ellas. Es especialmente útil para administrar sistemas y resolver problemas a distancia:
		
		- **``RDP``**: Busca "Escritorio Remoto" y abre la aplicación para iniciar una conexión a una computadora remota.
		- **``Seguridad de RDP``**: Dado que RDP puede ser un objetivo para actores maliciosos, es crucial implementar medidas de seguridad robustas, como limitar la exposición a Internet y aplicar políticas de acceso como Zero Trust para minimizar riesgos.