
-  **Enlaces**

	-  **[Quality of service — Wikipedia ](https://en.wikipedia.org/wiki/Quality_of_service)**

![[barra.gif]]

**Quality of Service**, o **Calidad de Servicio**, es un conjunto de técnicas y mecanismos utilizados en redes de computadoras para priorizar el tráfico y garantizar que ciertos tipos de datos reciban un mejor tratamiento en términos de rendimiento y confiabilidad.

El objetivo principal de QoS es asegurar que aplicaciones críticas o sensibles a la latencia (como voz sobre IP, videoconferencias o transmisiones de datos en tiempo real) funcionen correctamente, incluso en redes congestionadas.

-  **Funcionamiento básico de QoS**

	QoS se implementa mediante la clasificación, marcación y gestión del tráfico de red. Los pasos típicos son:

	1. **Clasificación del tráfico:**

		-  Identificar diferentes tipos de tráfico (voz, video, datos, etc.) según criterios como direcciones IP, puertos, protocolos o aplicaciones específicas.
	2. **Marcación del tráfico:**

		-  Asignar una etiqueta o prioridad al tráfico clasificado. Esto puede hacerse utilizando campos en las cabeceras de los paquetes, como:

			-  **DSCP (Differentiated Services Code Point):** En IPv4 e IPv6.
			-  **802.1p:** En redes Ethernet.
	3. **Gestión del tráfico:**

		-  Aplicar políticas para controlar cómo se maneja cada tipo de tráfico:

			-  **Priorización:** Dar preferencia a ciertos tipos de tráfico sobre otros.
			-  **Limitación de ancho de banda:** Restringir el uso de recursos para ciertos flujos.
			-  **Colas de prioridad:** Organizar el tráfico en colas con diferentes niveles de importancia.
	4. **Control de congestión:**

		-  Implementar mecanismos para manejar situaciones de alta carga en la red, como descartar paquetes no prioritarios o reducir la velocidad de transmisión.

-  **Componentes clave de QoS**

	-  **Clasificadores:** Herramientas que identifican y categorizan el tráfico.
	-  **Marcadores:** Mecanismos que asignan prioridades o etiquetas a los paquetes.
	-  **Colas:** Estructuras donde se organizan los paquetes antes de ser enviados.
	-  **Shapers:** Controladores que regulan la velocidad de transmisión del tráfico.
	-  **Drop Policies:** Estrategias para decidir qué paquetes se descartan cuando hay congestión.

-  **Tipos de servicios QoS**

	-  **Best Effort:**

		-  No hay ninguna garantía de calidad. Todos los paquetes se tratan por igual.
		-  Es el comportamiento predeterminado en la mayoría de las redes.
	-  **IntServ (Integrated Services):**

		-  Proporciona un control detallado sobre el tráfico mediante reservas de recursos explícitas.
		-  Requiere soporte en todos los dispositivos de la red, lo que lo hace menos escalable.
	-  **DiffServ (Differentiated Services):**

		-  Clasifica y marca el tráfico para ofrecer diferentes niveles de servicio.
		-  Más escalable que IntServ y ampliamente utilizado en redes modernas.
	-  **MPLS (Multiprotocol Label Switching):**

		-  Combina DiffServ con etiquetas MPLS para mejorar el rendimiento y la gestión del tráfico.

-  **Aplicaciones comunes de QoS**

	-  **``Voz sobre IP`` (VoIP):** Garantiza baja latencia y jitter para llamadas telefónicas de alta calidad.
	-  **``Videoconferencias``:** Asegura un flujo de video y audio sin interrupciones.
	-  **``Transmisiones en tiempo real``:** Prioriza el tráfico de streaming de video o música.
	-  **``Redes empresariales``:** Optimiza el uso del ancho de banda para aplicaciones críticas, como ERP o bases de datos.
	-  **``Juegos en línea``:** Reduce la latencia para mejorar la experiencia del usuario.

-  **¿Cómo aplica QoS a diferentes protocolos?**

	-  **Tráfico UDP:**

		-  En aplicaciones como VoIP o streaming, QoS prioriza el tráfico UDP para minimizar la latencia y el jitter.
		-  Ejemplo: Marcar paquetes UDP con alta prioridad usando **DSCP** o **802.1p** para asegurar que lleguen rápidamente a su destino.
	-  **Tráfico TCP:**

		-  En aplicaciones como transferencia de archivos o navegación web, QoS puede limitar el ancho de banda utilizado por TCP para evitar que consuma demasiados recursos.
		-  Ejemplo: Configurar límites de velocidad para conexiones TCP en redes empresariales.
	-  **Otros protocolos:**

		-  QoS también puede gestionar tráfico basado en otros protocolos, como ICMP, ARP o incluso protocolos propietarios.

![[barra.gif]]
