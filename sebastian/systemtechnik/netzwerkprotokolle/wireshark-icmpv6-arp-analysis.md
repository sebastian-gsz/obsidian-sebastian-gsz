
-  **Enlaces**

	-  **[Documentación — SampleCaptures de Wireshark ](https://wiki.wireshark.org/SampleCaptures)**
	-  **Internos**

		-  **[[span-rspan]]**

![[barra.gif]]

-  **Laboratorio 1: análisis de ICMPv6 y ARP**

	Captura a analizar: `Udemy - laboratorio1.pcapng` (no incluida en la migración — quedó fuera del vault viejo)

	-  **Análisis: ICMPv6**

		![[wireshark-lab1-icmpv6-router-advertisement.png]]
		-  Comprobamos la **``MAC``** de origen y destino:

			-  Origen: 00:01:5c:31:bb:c1
			-  Destino: 33:33:00:00:00:01 (es una dirección multicast bien conocida en IPv6)
		-  Comprobamos la **``IP``**, dirección de origen y destino del paquete:

			-  Origen: fe80::201:5cff:fe31:bbc1
			-  Destino: ff02::1 (es una dirección multicast bien conocida en IPv6)
		-  Comprobamos el protocolo ICMPv6

			-  Type: Router Advertisement (134): Es un mensaje enviado por un router para proporcionar información importante a los nodos (dispositivos) en la red local. Este tipo de mensaje es fundamental para el funcionamiento del protocolo IPv6 y forma parte del proceso de **Neighbor Discovery Protocol (NDP)**.
	-  **Análisis: ARP**

		![[wireshark-lab1-arp-request.png]]
		-  **Comprobar Sender MAC/IP y Target MAC/IP**

			-  **Sender MAC address**: Cadant_31:bb:c1 (00:01:5c:31:bb:c1)
			-  **Sender IP address**: 24.6.168.1
			-  **Target MAC address**: 00:00:00_00:00:00 (00:00:00:00:00:00)
			-  **Target IP address**: 24.6.175.56

			-  **Sender MAC:**

				-  **Propósito:** Indica la dirección MAC del dispositivo que está enviando la solicitud ARP.
				-  **Ejemplo en tu caso:** `00:01:5c:31:bb:c1` (pertenece al remitente, identificado como `Cadant_31:bb:c1`).
			-  **Sender IP:**

				-  **Propósito:** Indica la dirección IP del dispositivo que está enviando la solicitud ARP.
				-  **Ejemplo en tu caso:** `24.6.168.1`.
			-  **Target MAC:**

				-  **Propósito:** Representa la dirección MAC del dispositivo al que se dirige la solicitud ARP. En una solicitud ARP (Opcode = request), este campo **siempre será `00:00:00:00:00:00`**, ya que el objetivo es precisamente descubrir la dirección MAC correspondiente a una dirección IP.
			-  **Target IP:**

				-  **Propósito:** Indica la dirección IP del dispositivo cuya dirección MAC se está buscando.

			Esto significa que el dispositivo con dirección IP `24.6.168.1` está enviando una solicitud ARP a toda la red (broadcast, `ff:ff:ff:ff:ff:ff`) preguntando: "¿Quién tiene la dirección IP `24.6.175.56`? Dame tu dirección MAC."
	-  **Topología final**

		![[wireshark-lab1-topologia.png]]

![[barra.gif]]
