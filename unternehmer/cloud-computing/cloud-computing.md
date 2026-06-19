
![[barra.gif]]

-  **Enlaces**

	-  **[[microsoft]]**
	-  **[[alphabet]]**
	-  **[[amazon-web-service]]**
	-  

![[barra.gif]]

###### Arquitect Solutions

La broma clásica en el sector es que la respuesta favorita de un arquitecto de soluciones ante cualquier pregunta es: **"Depende"**. Y esa respuesta no es evasiva; se basa precisamente en cómo logras equilibrar los pilares fundamentales del diseño (costo, rendimiento, seguridad, escalabilidad y excelencia operativa) según el contexto particular.
	
-  **La realidad del rol**

	Ser arquitecto no consiste solo en dibujar diagramas elegantes; es un ejercicio constante de toma de decisiones técnicas que tienen un impacto directo en el negocio y en la cuenta de resultados de la empresa. Cada línea en un diagrama es una decisión financiera y operativa.
-  **Tareas principales**

	- **Traducción de necesidades:** El arquitecto toma un problema de negocio (ej. "necesitamos que la aplicación no colapse durante picos de tráfico") y lo traduce a una arquitectura técnica resiliente (diseño de redes, estrategias de auto-escalado y balanceo de carga).
	- **Gestión de compromisos (Trade-offs):** Es imposible optimizarlo todo simultáneamente. Si buscas máxima seguridad, podrías impactar la velocidad de despliegue. Si buscas costo cero, podrías estar comprometiendo la alta disponibilidad. El arquitecto gestiona el balance.
	- **Vigilancia y gobernanza:** Implementar mecanismos de detección de deriva (drift detection) es vital. El arquitecto no solo construye el sistema, sino que diseña las "barandillas" y alertas para que, si un recurso se modifica fuera de lo establecido, el sistema lo notifique o lo restaure a su estado deseado.
	
**El arte de los compromisos**

Un arquitecto de soluciones pasa gran parte de su día evaluando situaciones críticas. Aquí algunos ejemplos de cómo se gestiona el equilibrio:

- **Costo vs. Control:** ¿Usamos una plataforma de orquestación de contenedores (Kubernetes) que ofrece máximo control pero mayor complejidad y costo operativo, o una solución _serverless_ que escala a cero automáticamente y reduce costos de gestión?
- **Aislamiento vs. Simplicidad:** ¿Mantenemos múltiples cuentas o entornos separados para aprovechar una micro-segmentación estricta, o consolidamos recursos sabiendo que la administración será más sencilla pero el radio de explosión ante un error es mayor?
- **Seguridad vs. Accesibilidad:** ¿Cerramos el tráfico por defecto bajo un modelo _Zero Trust_, o permitimos un mayor grado de apertura para mejorar la observabilidad, utilizando las métricas de error (como los 401) para detectar intrusos antes de que alcancen los datos sensibles?

Un buen arquitecto no es el que conoce todos los servicios de memoria, sino el que sabe identificar la solución técnica mínima viable para resolver un problema de negocio sin que la factura o la complejidad operativa se disparen al final del mes.

-  **Modelo de abstracción**

	-  **Modelos base**
	  
		-  **IaaS** (Infraestructura): El proveedor te vende los ladrillos (Computo, almacenamiento, redes). Tú tienes que levantarlo todo desde cero.
		-  **PaaS** (Plataforma): Tú compras la casa ya construida. El entorno de ejecución (Runtime) ya está ahí; tú solo traes tus muebles (tu Código).
		-  **SaaS** (Software): Tú alquilas la habitación de hotel. No te preocupas por ladrillos, muebles ni limpieza. Solo entras y usas el servicio (Gmail, Salesforce).
	-  **Modelos especializados**
	  
		A medida que la tecnología avanza, han surgido "capas" intermedias para que no tengas que construir partes específicas de la casa:
		
		-  **IDaaS** (Identity as a Service): No construyes tu propio sistema de llaves (login/passwords). Delegas la seguridad y la identidad a un experto que ya tiene el control de acceso montado.
		-  **FaaS** (Function as a Service / Serverless): No necesitas que la casa entera esté encendida. Solo pagas por la electricidad el tiempo exacto que el interruptor está pulsado para ejecutar una tarea.
		-  **DBaaS** (Database as a Service): No cavas un pozo (instalar y configurar bases de datos). Simplemente abres el grifo y la base de datos fluye según la necesites.
		-  **BaaS** (Backend as a Service): Es el apartamento amueblado con servicios incluidos. Te da la base de datos, los usuarios y el almacenamiento en un solo paquete para que tú solo te enfoques en la decoración (el Frontend).
-  **Comparativa de escalado vertical y horizontal**

	Como arquitecto de soluciones, distinguir entre ampliar un recurso o distribuir la carga entre varios nodos es una decisión básica de diseño. Esa elección impacta la fiabilidad, el rendimiento y el costo operativo.
	
	-  **Características**
	
		-  **Concepto básico**
		
			- **Escalado horizontal (Scale out/in)** Aumentar o disminuir el número de instancias para distribuir la carga de trabajo.
			- **Escalado vertical (Scale up/down)** Aumentar o disminuir la potencia de un recurso único (CPU, RAM, disco).
		-  **Acción de crecimiento**
		
			**Escalado horizontal (Scale out/in)**: Scale out: Añadir más nodos o instancias para trabajar en paralelo.
			**Escalado vertical (Scale up/down)**: Scale up: Asignar más CPU, memoria o almacenamiento a una instancia existente.
		-  **Acción de reducción**
		
			- **Escalado horizontal (Scale out/in)** **Scale in**: Eliminar servidores sobrantes cuando la demanda baja.
			- **Escalado vertical (Scale up/down)** **Scale down**: Reducir el tamaño de la instancia cuando la carga disminuye para ahorrar recursos.
		-  **Ventajas principales**
		
			- **Escalado horizontal (Scale out/in)** **Alta disponibilidad**: Si un nodo falla, los demás siguen operando. Ofrece elasticidad superior.
			- **Escalado vertical (Scale up/down)** **Simplicidad**: No requiere cambios en la arquitectura ni reconfigurar balanceadores.
		-  **Desventajas**
		
			- **Escalado horizontal (Scale out/in)** Mayor complejidad de configuración: requiere balanceadores y gestión de estado distribuido.
			- **Escalado vertical (Scale up/down)** Límites físicos de hardware y punto único de falla (si la máquina cae, todo cae).
		-  **Ejemplo típico**
		
			- **Escalado horizontal (Scale out/in)** Usar un grupo de autoescalado detrás de un balanceador para absorber picos de tráfico.
			- **Escalado vertical (Scale up/down)** Redimensionar una máquina virtual o ampliar el volumen de almacenamiento asociado.
	
	En la práctica, pocas arquitecturas dependen de una sola estrategia. Lo habitual es combinar ambos enfoques según el componente, la criticidad del servicio y el patrón de demanda.
-  **Soluciones de computación y migración física**

	La arquitectura de nube moderna no termina en los centros de datos del proveedor; se extiende hacia donde residen los datos y los usuarios. Para entender esto de forma agnóstica, debemos dejar de pensar en marcas comerciales y centrarnos en los dos modelos fundamentales de extensión de infraestructura: el procesamiento físico en el borde (**Edge Computing**) y la conectividad privada dedicada (**Interconnect**).
	
	-  **Edge computing y transporte físico de datos**
	
		Cuando las leyes de la física (latencia) o el volumen de datos hacen que la nube pública sea inaccesible, se utiliza infraestructura física dedicada. Estos dispositivos actúan como un brazo extendido del centro de datos principal.
		
		Podemos clasificar este hardware en dos variantes arquitectónicas:
		
		- **Nodos de transporte y transferencia (Data Shuttle):** Son dispositivos de alta densidad de almacenamiento. Se envían físicamente al sitio donde se generan los datos (un centro de datos on-premise, una plataforma petrolífera o un buque). Una vez cargados, se transportan al centro de datos del proveedor para su ingesta masiva. Son la solución ante el ancho de banda insuficiente.
		- **Nodos de cómputo robustos (Rugged Edge Nodes):** Son unidades de procesamiento con capacidad de ejecución (CPU/GPU/RAM) y almacenamiento local. Están diseñados para resistir entornos hostiles. A diferencia del transporte, estos nodos permanecen in situ procesando datos en tiempo real (inferencia de IA, control industrial, baja latencia extrema) y solo envían resultados agregados o metadatos al entorno centralizado.
	-  **Modelos de conectividad privada**
	
		El acceso a la nube a través de la red pública es suficiente para aplicaciones web estándar, pero cuando se requiere previsibilidad, seguridad y ancho de banda garantizado, se implementan circuitos privados. La diferencia fundamental radica en si el cable es exclusivo para ti o si compartes el tránsito.
		
		Existen dos enfoques principales para esto:
		
		**A. Interconexión dedicada (Circuito Físico)**
		
		Es el modelo de mayor pureza. Se establece una conexión física directa (fibra óptica) entre tu infraestructura (o tu centro de datos de colocation) y el punto de presencia (PoP) del proveedor.
		
		- **Arquitectura:** Punto a punto.
		- **Ventaja:** Seguridad máxima, rendimiento constante y predecible.
		- **Uso:** Escenarios donde la confidencialidad es crítica o el volumen de tráfico requiere una carretera de un solo carril exclusiva.
		
		**B. Interconexión virtualizada (Circuito Alojado o de Partner)**
		
		Este es el modelo de "transbordo" que mencionabas. Tú contratas a un proveedor de red intermedio (un carrier o proveedor de servicios de colocation) que ya tiene una interconexión masiva con el proveedor de nube.
		
		- **Arquitectura:** Tú te conectas al partner, y el partner utiliza su infraestructura para "transportar" tu tráfico hasta la red del proveedor de nube mediante circuitos virtuales.
		- **Ventaja:** Despliegue mucho más rápido, menor coste de entrada y alta escalabilidad.
		- **Uso:** Entornos corporativos donde se necesita consistencia superior a la red pública sin el coste y la complejidad de instalar fibra dedicada.
	
	Esta separación lógica te permite diseñar infraestructuras robustas sin atarte a las herramientas específicas de un proveedor. En cualquier arquitectura multicloud, el principio es el mismo: si el dato no puede ir a la nube, la nube debe ir al dato (Edge), y si el tráfico no puede ir por Internet, debe ir por un carril privado (Interconnect).


###### Well-Architected Framework

- **Excelencia operativa:** Capacidad para correr sistemas, monitorear, automatizar y generar mecanismos de mejora continua.
- **Fiabilidad:** Continuidad del servicio ante fallos.
- **Eficacia del rendimiento:** Asignación de recursos adecuados según la demanda.
- **Optimización de costos:** Seguimiento y visibilidad del consumo para aumentar el valor.
- **Sustentabilidad:** Reducción de la huella de carbono en la infraestructura.
- **Seguridad:** En el momento en que nosotros diseñamos una solución de base de datos, lo haremos pensando en la seguridad. Esto lo podremos conseguir: primero, mediante el modelo de responsabilidad compartida. Esto significa que el proveedor va a tomar algunas de las responsabilidades de seguridad de la solución, principalmente la capa de infraestructura y de virtualización, y los clientes serán responsables de proteger cada una de las capas adicionales de la solución.


###### Planning and Designing Databases

No existe una base de datos universal, por lo que el objetivo principal es elegir la opción correcta basándose en las necesidades específicas de cada carga de trabajo. Se subraya la importancia de realizar un análisis previo que considere el origen de los datos, los requerimientos de latencia, escalabilidad, disponibilidad, estructura de datos y el tipo de operación (transaccional o analítica).

-  **Exámenes**

	-  **Un arquitecto quiere priorizar el escalado de lectura y la alta disponibilidad por sobre la consistencia de lectura después de escritura. ¿Qué preferencia de lectura debería especificarse?**
	
		- [ ] PrimaryPreferred:
		
			Con **PrimaryPreferred**, el controlador envía todas las lecturas al nodo primario siempre que este esté disponible. Esto significa que el nodo primario sigue siendo el único encargado de procesar la mayor parte del tráfico. Como el primario es el cuello de botella natural del sistema para las escrituras, al enviarle también todas las lecturas, no estás escalando la capacidad de lectura del clúster. Solo se utilizarían los secundarios si el primario cae, lo cual es una estrategia de alta disponibilidad, pero no de escalado de carga.
		- [x] SecondaryPreferred:
		
			- **Escalado de lectura:** Al especificar esta preferencia, el controlador envía las operaciones de lectura a los nodos secundarios o replicación asíncrona. Esto descarga al nodo primario de la carga de trabajo de lectura, permitiendo distribuir las consultas entre varios nodos secundarios.
			- **Alta disponibilidad:** Si por alguna razón no hay nodos secundarios disponibles (por mantenimiento o fallo en la red), el controlador fallará hacia el nodo primario. Esto garantiza que la lectura se realice, cumpliendo con el requisito de alta disponibilidad.
			- **Consistencia:** Como bien identificaste en el enunciado, el arquitecto está dispuesto a sacrificar la consistencia de lectura después de escritura ("read-after-write"). En los sistemas distribuidos, esto es necesario cuando se leen datos de los secundarios, ya que pueden sufrir un ligero retraso (repliction lag) respecto al primario.
	
		Cuando un texto técnico dice "priorizar X **por sobre** Y", significa que **sacrificas Y para obtener X**.
		
		- **Consistencia fuerte (o lectura después de escritura):** Obliga al sistema a leer siempre la última versión escrita. Para lograr esto, el sistema debe bloquear o sincronizar todas las réplicas antes de confirmar la lectura, lo cual añade latencia y reduce la capacidad de escalar horizontalmente.
	    - **Consistencia eventual:** Permite que las lecturas se realicen en réplicas que quizás aún no tengan la última actualización. Esto elimina el cuello de botella de la sincronización, permitiendo una alta disponibilidad y que puedas escalar el sistema añadiendo más réplicas de lectura sin impactar el rendimiento.
-  **Evolución hacia arquitecturas modernas**
  
	-  **Características de las aplicaciones tradicionales**
	
		Este modelo se centra en la estabilidad y el control dentro de un perímetro definido, usualmente limitando el alcance a un área local o un centro de datos específico.
		
		- **Alcance de usuarios:** Cientos a miles.
		- **Volumen de datos:** Desde gigabytes (GB) hasta terabytes (TB).
		- **Rendimiento:** Latencia medida en segundos.
		- **Escalabilidad:** Enfocada en escalamiento vertical, aumentando los recursos (RAM, CPU, disco) del servidor existente.
		- **Modelo de acceso:** Servidores internos o estaciones de trabajo dedicadas.
		- **Economía:** Basada en gastos de capital (CAPEX) con inversión inicial significativa antes del despliegue.
		- **Ciclo de desarrollo:** Acceso y configuración que pueden tomar desde días hasta meses.
	-  **Aplicaciones a escala de internet**
	
		Diseñadas para soportar la naturaleza dinámica y global de la web moderna, estas aplicaciones priorizan la disponibilidad, la elasticidad y la rapidez de respuesta.
		
		- **Alcance de usuarios:** Millones de usuarios concurrentes.
		- **Volumen de datos:** Desde terabytes (TB) hasta petabytes (PB) e incluso exabytes (EB).
		- **Rendimiento:** Latencias críticas medidas en milisegundos y microsegundos ($1 \mu s = 10^{-6} s$).
		- **Escalabilidad:** Híbrida, combinando escalamiento vertical con escalamiento horizontal (añadir más nodos o instancias).
		- **Modelo de acceso:** Distribuido globalmente mediante dispositivos móviles, sensores de IoT y endpoints globales.
		- **Economía:** Basada en gastos operativos (OPEX) con modelo de pago por uso (pay-as-you-go).
		- **Ciclo de desarrollo:** Despliegue y acceso instantáneo mediante APIs.
	
	En las arquitecturas de microservicios vamos a tener una situación similar. Tradicionalmente teníamos una base de datos dedicada a atender a distintos servicios de la aplicación. Ahora no, ahora vamos a tener distintas bases de datos atendiendo a microservicios. Es más, la base de datos por sí misma puede tratarse como un microservicio. Y quiero que veamos esta arquitectura.
	
	Vamos a tener acceso a través de nuestra red de entrega de contenido con el servicio de CloudFront, y estas solicitudes se van a mandar hacia un API Gateway. Aquí es donde vamos a delimitar cuál es el servicio que vamos a atender. Puede ser un servicio de catálogo, de ventas, de órdenes con su debido procesamiento. Detrás de la capa de procesamiento, vamos a tener distintas bases de datos para cada uno de los servicios. En este caso, noten cómo nuestro servicio de catálogo tiene a Elastic Cache como base de datos de apoyo. En el caso de ventas, puedo tener una base de datos de Amazon Aurora. Incluso, en el servicio de órdenes, yo puedo utilizar bases de datos como DynamoDB. Noten cómo yo puedo implementar múltiples bases de datos para la misma arquitectura.
	
	**Ejemplo de un diagrama de arquitectura, el cual implementa una arquitectura de microservicios:** Los microservicios se implementan como funciones de AWS Lambda y son accesibles por medio de una API de Amazon API Gateway. Las políticas de IAM garantizan que los datos se mantengan privados y no se compartan entre los microservicios. Cada microservicio utiliza un tipo de base de datos que cumple sus requisitos individuales.
	
	![[arquitected-microservice-for-dbs.svg]]
	
	- **Acceso y entrega:** Los usuarios interactúan a través de Amazon CloudFront y Amazon S3, que sirven como interfaz de usuario y capa de entrega de contenido.
	- **Gestión de peticiones:** El tráfico es dirigido hacia Amazon API Gateway, el cual actúa como el punto de entrada que delimita qué servicio se debe atender.
	- **Implementación de cómputo:** El API Gateway enruta las solicitudes hacia funciones específicas de AWS Lambda (tales como /catalog, /sales o /orders).
	- **Persistencia de datos personalizada:** Detrás de cada capa de procesamiento, existe una base de datos diseñada específicamente para el tipo de carga de trabajo de ese servicio.
	
	    - El servicio de catálogo utiliza Amazon ElastiCache para obtener respuestas rápidas.
	    - El servicio de ventas emplea Amazon Aurora, una base de datos relacional robusta.
	    - El servicio de órdenes utiliza Amazon DynamoDB, optimizada para escalabilidad y baja latencia.
	![[barra.gif]]
	-  **¿Por qué utilizar diferentes tipos de bases de datos?**
	
		La elección de una base de datos no se basa únicamente en si es "de propósito general" o no, sino en los **patrones de acceso a los datos** (data access patterns) y las necesidades de latencia/escalabilidad del servicio específico.
		
		**El ajuste al propósito:** Aunque bases de datos como Amazon Aurora son versátiles, existen casos donde el modelo relacional tradicional genera fricción.
		
		- **Amazon ElastiCache:** Se utiliza para el catálogo porque el usuario necesita consultar productos constantemente. Al estar **en memoria**, ofrece latencia de microsegundos, mucho más rápido que leer de un disco.
		- **Amazon DynamoDB:** Es una base de datos NoSQL de valor-clave. Está optimizada para escalar horizontalmente de forma masiva y predecible, ideal para un servicio de órdenes donde el volumen de transacciones puede dispararse súbitamente.
		- **Amazon Aurora:** Es relacional. Ideal para ventas donde necesitas integridad referencial fuerte (ACID) y consultas complejas (JOINs) que las bases de datos NoSQL no gestionan de forma nativa.
		
		Cada motor está diseñado para resolver un problema de computación específico. Forzar a una base de datos relacional a comportarse como una caché es ineficiente, y tratar de gestionar transacciones complejas en una caché es un error arquitectónico.
	-  **Microservicios y base de datos como microservicio**
	
		Un **microservicio** es una unidad funcional autónoma que realiza una tarea de negocio específica (por ejemplo, "gestionar pedidos"). Su principio fundamental es el **acoplamiento débil** y la **alta cohesión**.
		
		- **¿Por qué la DB es un microservicio?** No es que la base de datos "sea" un microservicio en sí misma, sino que en la arquitectura de microservicios, **la base de datos queda encapsulada dentro del microservicio**.
		- **Encapsulamiento:** Esto significa que el servicio de "Ventas" es el _único_ componente que tiene permiso para hablar con la base de datos de "Ventas" (Amazon Aurora). Ningún otro microservicio puede tocar esa base de datos directamente. Si otro servicio necesita datos, debe pedírselos al microservicio de "Ventas" a través de una API.
		- **Independencia:** Al tratar la base de datos como parte integral del microservicio, puedes cambiar la base de datos, escalarla o actualizarla sin afectar a los demás microservicios del sistema.
	-  **Aclaración del flujo arquitectónico**
	
		Tienes razón al identificar los componentes, pero hay una confusión común en la interpretación del diagrama. Vamos a separarlos:
		
		1. **Capa estática (Amazon CloudFront + Amazon S3):** Aquí es donde vive la interfaz de usuario (el sitio web, archivos HTML, JavaScript, CSS). Cuando un usuario entra a la web, el navegador descarga el código desde S3 (a través del CDN).
		2. **Capa Dinámica (Backend):**
		
		    - Una vez que el usuario ya tiene la interfaz (en su navegador), esta realiza peticiones (p. ej., "dame los productos") hacia el **Amazon API Gateway**.
		    - El API Gateway recibe la petición y, dependiendo de la ruta (`/catalog`, `/sales`, `/orders`), invoca a la **Función de Lambda** correspondiente.
		    - La **Función de Lambda** contiene el código (la lógica) que consulta la base de datos específica para ese servicio y devuelve el resultado al usuario.
	-  **ElastiCache como base de datos de apoyo**
	
		Cuando el texto dice: _"el servicio de catálogo tiene a ElastiCache como base de datos de apoyo"_, se refiere a que la lógica (Lambda) del servicio de catálogo está programada para ir a buscar los datos a **ElastiCache**.
-  **Elegir el recurso adecuado para resolver un problema**

	Al considerar las opciones para migrar una carga de trabajo existente a la nube, se debe comenzar por el caso práctico. ¿Cómo trabajarán la empresa o los clientes con la aplicación? ¿Qué información tendrán que recuperar de la aplicación? Al conocer el caso práctico, se impulsa el diseño del modelo de datos. Luego de identificar el modelo de datos, puede identificar una base de datos apropiada.
	
	Para poder ayudar con el proceso de selección de la base de datos personalizada correcta, se define un conjunto de pasos para la orientación en el análisis de los requisitos empresariales para establecer el modelo de datos adecuado y la base de datos personalizada correcta.
	
	-  **Paso 1**: Analizar los requisitos de las cargas de trabajo
	  
		-  **Características de la aplicación**
		
			Se refiere a la naturaleza operativa de la carga de trabajo. Debes definir qué va a hacer la aplicación con los datos: ¿Es intensiva en escritura (logs, sensores) o en lectura (catálogo)? ¿Requiere integridad transaccional (ACID) o flexibilidad de esquema (NoSQL)?
			
			-  **Factores adicionales a considerar**
			
				Define cómo se utilizan los datos, incluyendo si son para uso directo de la aplicación, procesos de análisis de datos para **_machine learning_** (ML) o consultas directas.
			
			    - Identifica desde dónde acceden los usuarios (red física, país, ubicación remota) y con qué frecuencia lo hacen (diaria, horaria, semanal).
			    - Determina la interacción: ¿Los usuarios escribirán datos o estos permanecerán inmutables durante el proceso?.
			-  **Patrones de acceso a los datos**
			
				Define cómo accederán los usuarios y aplicaciones para determinar si el patrón se ajusta a SQL o NoSQL.
			
			    -  Identifica el patrón de acceso más relevante y si las consultas son predefinidas o únicas.
			    -  Determina el alcance de la consulta (acceso a un elemento, varios o a todos) y si se requieren atributos de clave para clasificar resultados.
			-  **Volumen, velocidad y variedad**
			
			    - **Volumen:** Define el tamaño de los elementos individuales, el tamaño total y el crecimiento esperado en el tiempo.
			    - **Velocidad:** Evalúa qué tan rápido se producen lecturas y escrituras; identifica si requieres respuestas en segundos, milisegundos o microsegundos para evitar cuellos de botella.
			    - **Variedad:** Analiza la naturaleza de los datos: estructurados (relacionales), semiestructurados (JSON) o no estructurados (imágenes, video, texto plano).
			-  **Integridad referencial y transacciones**
			
			    - **ACID (Atomicidad, Consistencia, Aislamiento, Durabilidad):** Método para mantener la coherencia en bases de datos estructuradas, priorizando devolver la versión más actualizada y cumplir reglas estrictas.
			    - **BASE (Basically Available, Soft state, Eventually consistent):** Método común en bases de datos NoSQL que prioriza la disponibilidad y la escalabilidad, aceptando que la consistencia completa puede tardar en replicarse a través de la flota.
			-  **Tipos de consistencia:**
			
			    -  **Alta consistencia:** Se requieren los datos más actualizados reflejando todas las operaciones de escritura previas.
			    -  **Consistencia eventual:** Se mejora el rendimiento de lectura y escritura a alta velocidad a cambio de sacrificar la consistencia inmediata; los datos podrían no mostrar la operación más reciente.
			
			**Preguntas para el arquitecto:**
			
		    - ¿Mi flujo principal es transaccional (OLTP) o analítico (OLAP)?
		    - ¿El esquema de datos es fijo y estructurado, o evoluciona dinámicamente?
		    - ¿Necesito integridad referencial estricta o puedo relajarla para ganar escalabilidad?
		-  **Disponibilidad y durabilidad**
		
			Define el nivel de servicio necesario. Aquí analizas el tiempo de inactividad aceptable (RTO) y la tolerancia a la pérdida de datos (RPO). También se evalúa la inmutabilidad: ¿Los datos deben guardarse sin cambios por motivos legales o de auditoría?
			
			**Definiciones técnicas:**
			
			- **Disponibilidad (Availability):** Es una métrica de tiempo. Define el _uptime_ de una aplicación y garantiza que los datos sean accesibles en el momento exacto en que se necesiten.
			- **Durabilidad (Durability):** Es una métrica de persistencia. Se enfoca en asegurar que los datos permanezcan inalterables, no sean borrados y no se vean afectados de ninguna manera a lo largo del tiempo.
			
			**Casos prácticos de diseño:**
			
			- **Base de datos de análisis en memoria:** Los datos residen tanto en memoria (para acceso rápido) como en disco (para durabilidad). Aquí, la **disponibilidad** es la preocupación principal del arquitecto.
			- **Base de datos de libro mayor bancario:** Los datos se almacenan en disco y son inmutables. Aquí, la **durabilidad** es la preocupación principal.
			
			**Toma de decisiones del arquitecto:**
			
			- **Sin restricciones de costo:** Si el presupuesto no es una limitante, es posible diseñar sistemas para garantizar niveles máximos tanto de disponibilidad como de durabilidad.
			- **Con restricciones de costo:** Esta es la situación estándar. El arquitecto debe tomar decisiones calculadas para garantizar la máxima prioridad (ya sea disponibilidad o durabilidad según el caso de uso) y equilibrar la segunda prioridad para lograr la mayor rentabilidad.
			
			**Preguntas para el arquitecto:**
		    
		    - ¿Cuál es el SLA de tiempo de actividad requerido? ¿Necesito despliegues multi-región?
		    - ¿Qué mecanismos de _failover_ son necesarios para garantizar que la base de datos se recupere sola?
		    - ¿Tengo requisitos regulatorios que exigen que los datos sean inmutables o retención por un tiempo específico?
		-  **Rendimiento**
		
			El rendimiento es la capacidad de la base de datos para entregar información a los usuarios dentro de los niveles esperados. Las opciones de aprovisionamiento son un factor esencial para alcanzar el rendimiento deseado.
			
			**Métricas clave de evaluación:**
			
			-  **Latencia del sistema:** Es la medida principal del rendimiento. Define la rapidez con la que se requiere una respuesta, clasificándose en niveles como milisegundos, microsegundos o tiempo real.
			-  **Concurrencia (Simultaneidad):** Determina cuántos usuarios estarán activos al mismo tiempo, lo que puede implicar desde decenas hasta miles de accesos por segundo a la base de datos. El sistema debe ser capaz de atender a toda la base de usuarios en el momento que se requiera.
			-  **Uniformidad a gran escala:** Evalúa cómo se presenta la respuesta ante múltiples solicitudes distribuidas. En arquitecturas con réplicas regionales, es crucial definir:
			
			    - La consistencia de los datos entre diferentes nodos o regiones.
			    - La expectativa del usuario final respecto a qué tan uniforme o consistente debe ser la respuesta recibida.
			
			**Preguntas para el arquitecto:**
			
		    - ¿Cuál es el tiempo de latencia máximo aceptable para las consultas críticas?
		    - ¿Existe una estacionalidad marcada (picos de concurrencia) o el tráfico es lineal y predecible?
		    - ¿La aplicación es de lectura intensiva, escritura intensiva o equilibrada?
		-  **Capacidad y escalado**
		
			El análisis de la capacidad y escalabilidad es fundamental para planificar el crecimiento futuro de la base de datos basándose en el comportamiento histórico y las nuevas proyecciones de negocio.
			
			**Estrategias de escalado:**
			
			- **Escalado vertical (Scale-up):** Consiste en aumentar los recursos del sistema que aloja la base de datos (instancia). En el ecosistema de AWS, esto implica redimensionar la instancia para obtener mayor capacidad de CPU, memoria o almacenamiento.
			- **Escalado horizontal (Scale-out):** Consiste en agregar más sistemas o instancias para distribuir la carga de datos.
			
			**Consideraciones para el arquitecto:**
			
			- **Planificación basada en datos:** La mejor información para predecir el futuro proviene de analizar el rendimiento del sistema durante el último año, considerando tanto los requisitos empresariales nuevos como el crecimiento estimado.
			- **Automatización:** Muchos servicios de bases de datos de AWS facilitan este proceso ajustando automáticamente uno o más factores de capacidad.
			- **Desafíos del escalado horizontal:** Al distribuir los datos en múltiples sistemas, pueden surgir complicaciones técnicas relacionadas con la consistencia, disponibilidad, eficiencia, flexibilidad de consultas o los patrones de acceso.
			
			**Preguntas para el arquitecto:**
			
		    - ¿Cuál es el volumen de datos esperado a corto, mediano y largo plazo?
		    - ¿La arquitectura soporta escalado horizontal (sharding/particionamiento) de forma nativa?
		    - ¿Qué disparadores activarán la necesidad de más recursos (procesamiento o almacenamiento)?
	-  **Paso 2**: Seleccionar el modelo de datos
	
		Una vez que comprendemos la carga de trabajo, debemos decidir qué estructura de almacenamiento permitirá que nuestra aplicación sea eficiente y escalable. El modelo de datos no es una decisión única; a menudo, una arquitectura compleja puede utilizar múltiples categorías para cumplir con funciones específicas.
		
		**Categorías de modelos de datos**
		
		-  **Relacional**
		
			- Características principales: Integridad referencial, transacciones ACID, esquema en escritura.
			- Caso de uso ideal: Aplicaciones transaccionales donde la estructura es fija y crítica.
		-  **Almacén clave-valor**
		
			- Características principales: Alto rendimiento, latencia muy baja, escalabilidad masiva.
			- Caso de uso ideal: Aplicaciones que requieren lecturas y escrituras ultrarrápidas.
		-  **Document store**
		
			- Características principales: Almacenamiento rápido y consulta flexible por atributos.
			- Caso de uso ideal: Datos semiestructurados donde se necesita agilidad en consultas.
		-  **En memoria**
		
			- Características principales: Latencia en microsegundos, acceso por clave.
			- Caso de uso ideal: Sistemas que requieren desempeño extremo para datos frecuentes.
		-  **Base de datos de grafos**
		
			- Características principales: Navegación ágil entre relaciones complejas de datos.
			- Caso de uso ideal: Redes sociales, motores de recomendación o detección de fraude.
		-  **Serie temporal**
		
			- Características principales: Recopilación y procesamiento de datos secuenciados en el tiempo.
			- Caso de uso ideal: Logs, telemetría de sensores, monitoreo de métricas.
		-  **Libro mayor**
		
			- Características principales: Historial inmutable y verificable de cambios.
			- Caso de uso ideal: Auditorías, sistemas financieros o cumplimiento legal.
		-  **Columna ancha**
		
			- Características principales: Servicio escalable, alta disponibilidad, compatible con Apache Cassandra.
			- Caso de uso ideal: Aplicaciones que requieren escalabilidad masiva con estructura de columnas.
	-  **Paso 3**: Caso práctico
	
		Es la fase de ejecución donde traduces los requisitos analizados y el modelo de datos seleccionado en una solución tecnológica específica dentro de AWS. 
		
		**Caso práctico: Aplicación de librería moderna**
		
		![[caso-práctico-aplicación-de-librería-moderna.svg]]
		
		La arquitectura de microservicios propuesta para la librería demuestra que un diseño robusto no depende de una única base de datos, sino de seleccionar el motor adecuado para cada caso de uso específico. 
		
		-  **El catálogo de productos**: El pilar de consistencia y escala
		
			Este componente es el corazón de la librería. Requiere una base de datos que no solo almacene libros, sino que gestione un esquema semiestructurado y flexible, ya que no todos los productos comparten los mismos atributos.
			
			-  **El desafío técnico**: Debemos soportar 50,000 usuarios concurrentes en momentos de pico, manteniendo una latencia constante por debajo de los 10 milisegundos.
			-  **La solución**: Se implementa **Amazon DynamoDB**. Al ser una base de datos NoSQL, elimina la fricción de un esquema rígido y permite un escalado horizontal prácticamente infinito para absorber el crecimiento proyectado de un millón de productos nuevos al año. La arquitectura asegura escrituras duraderas y tiempos de respuesta uniformes, eliminando los cuellos de botella que encontraríamos en una base de datos relacional tradicional bajo esta carga.
			
				- El servicio crea automáticamente **nuevas particiones** (más fragmentos) en más servidores físicos.
				- Esto es **escalado horizontal**. Si necesitas más capacidad, DynamoDB simplemente distribuye los datos en más nodos físicos en segundo plano, sin que tú tengas que cambiar el tamaño de una instancia.
			![[caso-práctico-catálogo-productos-1.png]]
			![[caso-práctico-catálogo-productos-2.png]]
		-  **La lista de superventas**: Velocidad pura en memoria
		
			Aquí la latencia es el único factor que determina el éxito del negocio. El requisito es mostrar los 20 productos más comprados casi en tiempo real en la página de inicio, lo que exige tiempos de respuesta inferiores a un milisegundo.
			
			- **El desafío técnico**: Procesar 50,000 lecturas y 5,000 escrituras por segundo para actualizar los recuentos de pedidos sin penalizar la experiencia del usuario.
			- **La solución**: Se utiliza **Amazon ElastiCache para Redis**. La gran ventaja técnica aquí es que Redis no es solo una caché, sino un motor de datos que posee estructuras de clasificación automática (Sorted Sets) integradas. Esto permite que el sistema ordene y entregue la lista de superventas de forma instantánea, aprovechando la velocidad de la memoria RAM para alcanzar el rendimiento exigido.
			![[caso-práctico-lista-superventas-1.png]]
			![[caso-práctico-lista-superventas-2.png]]
		-  **Recomendaciones sociales**: El motor de grafos
		
			El tercer microservicio transforma la experiencia del usuario de una búsqueda estática a una exploración conectada. El negocio exige que las recomendaciones se basen en el contexto social y en afinidades de productos, lo que implica navegar relaciones altamente conectadas.
			
			- **El desafío técnico**: Recorrer conjuntos de datos complejos (quién compró qué y quiénes son sus amigos) en tiempo real, manteniendo una latencia de 10 milisegundos ante 20,000 solicitudes concurrentes por segundo.
			- **La solución**: Se despliega **Amazon Neptune**. A diferencia de una base de datos tradicional, Neptune está diseñada específicamente para atravesar relaciones (grafos) con una agilidad inalcanzable para otros modelos. Permite conectar puntos de datos —usuario, producto, afinidad social— para generar recomendaciones de alta calidad instantáneamente.
			
			![[caso-práctico-recomendaciones-sociales-1.png]]
			![[caso-práctico-recomendaciones-sociales-2.png]]
		-  **La victoria de la arquitectura de microservicios**
		
			Lo que hace brillante a este caso práctico es la **descomposición de la carga de trabajo**. Al adoptar una arquitectura de microservicios, cada uno de estos componentes opera con su propio almacenamiento personalizado:
			
			- **DynamoDB** se encarga de la persistencia masiva y flexible del catálogo.
			- **Redis** se encarga de la velocidad crítica para los superventas.
			- **Neptune** se encarga de la inteligencia relacional de las recomendaciones.
	    
		Este enfoque no solo cumple con los requisitos técnicos de latencia y concurrencia, sino que maximiza la rentabilidad al utilizar el servicio administrado exacto para cada problema, liberando al arquitecto de la carga operativa y permitiéndole enfocarse puramente en la optimización de las aplicaciones.
	
	Cuando identifiques que una aplicación es **write-intensive**, la pregunta clave que debes hacerte como arquitecto es: **¿Necesito consistencia fuerte (ACID) o puedo sacrificarla por disponibilidad (BASE)?**
	
	- Si necesitas **ACID** (como en una transferencia bancaria), tu cuello de botella será la latencia de escritura en disco.
	- Si puedes vivir con **consistencia eventual** (como en los "likes" de una red social), puedes usar técnicas de **buffer** o **colas de mensajes** (como Amazon SQS o Kafka) frente a la base de datos para absorber los picos de escritura y escribirlos de forma asíncrona, evitando que la base de datos se bloquee.
	
	---
	
	-  **Tipos de cargas de trabajo intensivas en escritura**
	
		Las cargas de trabajo intensivas en escritura (**write-intensive**) son aquellas donde el volumen de nuevos datos entrantes o las actualizaciones frecuentes superan significativamente a las consultas de lectura.
	
		**¿Por qué ACID no siempre es "intensivo" en escritura?**
		
		Es un error común confundir ambos.
		
		**ACID** se refiere a la **garantía** de que los datos no se corrompan (Atomicidad, Consistencia, Aislamiento, Durabilidad). Un sistema ACID puede estar inactivo el 90% del tiempo. Aunque el modelo **ACID** (banca) implica muchas escrituras, su naturaleza no es necesariamente "intensiva" por volumen, sino por **integridad y consistencia**.
		
		-  **Cargas de trabajo de telemetría y sensores (IoT)**
		
			- **Por qué**: Millones de dispositivos reportando estado, temperatura, ubicación o velocidad cada pocos milisegundos.
			- **Dinámica**: Se escriben millones de registros pequeños por segundo. Raramente se consulta el registro individual histórico, más bien se analizan tendencias agregadas.
			- **Base de datos ideal**: Bases de datos de **Serie temporal** (ej. Amazon Timestream) o de **Columna ancha** (ej. Cassandra/DynamoDB).
		-  **Sistemas de registro y auditoría (Logs y Event Streams)**
		
			- **Por qué**: Cada acción en un sistema (acceso de usuario, cambios en configuración, errores de sistema) debe quedar grabada para fines forenses o cumplimiento legal.
			- **Dinámica**: Es una escritura continua y secuencial. El sistema nunca "actualiza" un log anterior; simplemente añade uno nuevo (_append-only_).
			- **Base de datos ideal**: Logs centralizados (ej. Elasticsearch, OpenSearch) o colas de eventos (ej. Amazon Kinesis/Kafka).
		-  **Aplicaciones de trading y finanzas de alta frecuencia**
		
			- **Por qué**: Miles de transacciones por segundo donde el estado del mercado cambia instantáneamente.
			- **Dinámica**: Cada operación debe confirmarse como "escrita" en el disco antes de continuar para garantizar que el dinero no se pierda. Es intensivo en escritura **y** exige latencia ultrabaja.
			- **Base de datos ideal**: Relacionales altamente optimizadas (ej. Aurora) o bases de datos de **Libro mayor (Ledger)** (ej. Amazon QLDB) para garantizar la inmutabilidad y trazabilidad.
		-  **Sistemas de seguimiento de anuncios y clics (AdTech)**
		
			- **Por qué**: Cada vez que un usuario ve un anuncio o hace clic, esa información debe registrarse inmediatamente para facturar al anunciante.
			- **Dinámica**: Cientos de miles de clics por segundo. Es la columna vertebral del modelo de negocio de internet.
		-  **Plataformas de redes sociales (feeds y notificaciones)**
		
			Cuando publicas un estado, una foto o das "like", tu acción debe replicarse instantáneamente en las bases de datos de tus seguidores.
			
			- **El desafío**: Un usuario famoso puede tener millones de seguidores; un solo "post" puede generar millones de escrituras simultáneas en las bases de datos de esos seguidores (lo que se conoce técnicamente como _fan-out_).
			- **Dinámica**: Es una explosión masiva de escrituras basadas en una sola acción del usuario.
		-  **Sistemas de monitorización de infraestructura (observabilidad)**
		
			Herramientas como Prometheus, Datadog o CloudWatch.
			
			- **El desafío**: Miles de servidores enviando métricas (CPU, memoria, tráfico de red) cada 10 o 30 segundos.
			- **Dinámica**: El sistema recibe un flujo constante, infinito y predecible de puntos de datos. Aquí, la base de datos pasa el 90% de su tiempo recibiendo paquetes de escritura y solo una pequeña parte atendiendo consultas de grafos en los paneles de control.
		-  **Sistemas de mensajería instantánea y chats**
		
			Aplicaciones como WhatsApp, Telegram o Slack.
			
			- **El desafío**: Cada mensaje enviado por un usuario es una operación de escritura que debe persistirse, indexarse y entregarse.
			- **Dinámica**: A diferencia de una base de datos de "catálogo" donde los datos cambian poco, aquí los datos son efímeros y en constante crecimiento. Se prioriza la baja latencia al escribir para que el chat se sienta "instantáneo".
		-  **Sistemas de votación en tiempo real (televisión o eventos masivos)**
		
			- **El desafío**: Durante eventos en vivo, millones de personas envían un voto en un lapso de pocos minutos.
			- **Dinámica**: Un pico extremo de escrituras donde la integridad de cada voto es vital, pero la velocidad de ingesta debe ser lo suficientemente alta para no colapsar bajo el pico de tráfico.
		-  **Registros de Blockchain y criptomonedas**
		
			- **El desafío**: Cada transacción debe ser validada y escrita en un bloque que se encadena de forma inmutable.
			- **Dinámica**: La arquitectura de blockchain es, por definición, intensiva en escritura. Una vez que un bloque se escribe, no se puede modificar (inmutabilidad), lo que exige una estructura de almacenamiento diseñada para crecer constantemente mediante procesos de _append-only_.
	-  **Tipos de cargas de trabajo intensivas en lectura**

		Para identificar las aplicaciones **read-intensive** (intensivas en lectura), debemos buscar escenarios donde el usuario final consume información constantemente, pero los datos cambian con poca frecuencia. En estos casos, la **consistencia eventual** es aceptable y la **baja latencia** es el objetivo supremo.
		
		Si tu aplicación es **read-intensive**, no intentes escalarla aumentando la potencia de una sola base de datos (escalado vertical). La estrategia ganadora es **multiplicar las copias**.
		
		-  **Portales de contenidos (CMS, Blogs, Noticias)**
		
			- **La dinámica**: Un solo periodista o editor publica o actualiza un artículo una vez, pero miles (o millones) de lectores consultan ese mismo artículo a lo largo del tiempo.
			- **Por qué es read-intensive**: La proporción de lecturas frente a escrituras puede ser de 1,000 a 1.
			- **Estrategia**: Se utilizan **CDNs (Content Delivery Networks)** y cachés en memoria para servir el contenido desde servidores cercanos al usuario, evitando tocar la base de datos central.
		-  **E-commerce: Catálogos de productos**
		
			- **La dinámica**: La ficha de un producto (nombre, descripción, fotos, especificaciones) se consulta constantemente por cada usuario que navega. Las actualizaciones de precio o inventario ocurren mucho menos a menudo que las consultas de visualización.
			- **Por qué es read-intensive**: El "viaje" del usuario es de exploración. La base de datos está diseñada para responder rápidamente consultas de búsqueda (`SELECT * FROM productos WHERE categoría = 'electrónica'`).
			- **Estrategia**: Se usan **réplicas de lectura** para distribuir el tráfico de búsqueda entre varios nodos y evitar que el nodo maestro se bloquee.
		-  **Paneles de visualización (Dashboards Analíticos)**
		
			- **La dinámica**: Gerentes o analistas consultan gráficos de tendencias, ventas mensuales o KPIs.
			- **Por qué es read-intensive**: Los datos base (ventas diarias) ya fueron escritos en el pasado. El dashboard realiza consultas de agregación (sumas, promedios) sobre volúmenes grandes de datos existentes.
			- **Estrategia**: Se utilizan **bases de datos OLAP (On-Line Analytical Processing)** o almacenes de datos (_Data Warehouses_) diseñados específicamente para leer grandes bloques de datos en segundos.
		-  **Sistemas de consulta de referencia (Lookups)**
		
			- **La dinámica**: Aplicaciones que necesitan validar códigos postales, prefijos telefónicos, tipos de cambio de moneda o configuraciones globales del sistema.
			- **Por qué es read-intensive**: Son datos casi estáticos que cada microservicio necesita consultar miles de veces por segundo.
			- **Estrategia**: Estos datos suelen cargarse completamente en **caché (Redis)** al iniciar la aplicación para que la lectura sea en microsegundos.
		-  **Aplicaciones de Streaming de Video (Netflix, YouTube)**
		
			- **La dinámica**: El usuario es un espectador pasivo. La plataforma sirve un archivo de video (lectura de datos binarios) miles de veces por segundo.
			- **El desafío**: Los datos del video no cambian (son inmutables), pero la demanda de acceso es masiva.
			- **Solución**: No se lee de una base de datos tradicional, sino de **Object Storage** (como Amazon S3) respaldado por una **CDN** global que cachea el video en servidores cercanos al usuario.
		-  **Motores de Búsqueda (Google, Bing)**
		
			- **La dinámica**: Miles de millones de usuarios hacen consultas (lecturas) sobre un índice de información gigante.
			- **El desafío**: El índice de búsqueda se actualiza periódicamente (crawling), pero la proporción de lecturas (búsquedas) frente a actualizaciones de índices es astronómica.
			- **Solución**: **Índices invertidos** y sistemas de búsqueda distribuida (como Elasticsearch) diseñados específicamente para responder consultas complejas en milisegundos.
		-  **Sistemas de Autorización y Perfiles de Usuario**
		
			- **La dinámica**: Cada vez que un usuario hace clic en una página, el sistema debe leer quién es, qué permisos tiene y si su sesión es válida.
			- **El desafío**: Estas consultas ocurren miles de veces por segundo por usuario.
			- **Solución**: **Almacenamiento en memoria (Redis/Memcached)**. Es vital que esta lectura sea casi instantánea, por lo que nunca se consulta la base de datos persistente; se consulta una copia volátil en RAM.
		-  **Sistemas de Geolocalización y Mapas (Google Maps, Waze)**
		
			- **La dinámica**: Millones de personas consultando el mapa, buscando una ruta o un restaurante.
			- **El desafío**: Los datos del mapa (calles, negocios) cambian muy poco, pero la consulta de lectura de "dónde estoy" y "cómo llego a X" es constante.
			- **Solución**: **Bases de datos espaciales** con capas de caché geográfico.
		
	Si te preguntan en una entrevista o evaluación: "¿Cómo escalo una aplicación intensiva en lectura?", la respuesta ganadora siempre sigue este orden de implementación:
	
	- **Índices**: ¿Estás leyendo rápido porque tu base de datos sabe dónde buscar? (Optimización de base de datos).
	- **Réplicas de lectura**: ¿Estás repartiendo el trabajo entre varios servidores? (Escalabilidad de base de datos).
	- **Caché (Memoria)**: ¿Estás evitando tocar el disco duro por completo? (Escalabilidad en RAM).
	- **CDN**: ¿Estás sirviendo los datos desde el servidor más cercano al usuario? (Escalabilidad geográfica).
	
	¿Ves cómo, mientras que en **write-intensive** nos preocupamos por _cómo meter los datos_ (sharding/colas), en **read-intensive** nos preocupamos por _cómo entregar los datos_ (caché/replicación)?
-  **Proceso de dimensionamiento**

	A diferencia de cuando gestionas servidores _on-premise_, no compras hardware físico, sino que seleccionas una **instancia (vCPU/RAM)** y un **almacenamiento (EBS)**. Como no puedes "ver" el hardware físico, debes medirlo mediante **métricas de telemetría** y **pruebas de carga**.
	
	No existe una fórmula mágica (como "100 usuarios = 1 vCPU"), pero sí un proceso estándar:
	
	-  **Baseline (Línea base)**
	
		Si ya tienes la base de datos _on-premise_, usa herramientas como **AWS Database Migration Service (DMS)** o **Performance Insights** para medir el consumo actual de CPU, RAM e IOPS (operaciones de entrada/salida por segundo).
	-  **Servicios de monitorización**
	
		Una vez en RDS, CloudWatch es tu mejor amigo. Debes monitorear:
	
	    - `CPUUtilization`: Si está constantemente > 70-80%, necesitas escalar verticalmente (subir de SKU).
	    - `DatabaseConnections`: Si llegas al límite, la app rechazará usuarios.
	    - `FreeableMemory`: Si es muy baja, tu base de datos empezará a usar _swap_ en disco, lo que destruye el rendimiento.
	-  **Dimensionamiento del almacenamiento (Volúmenes)**
	
		En RDS, el almacenamiento no es solo "espacio en disco", es **rendimiento**.
		
		- **IOPS (Input/Output Operations Per Second)**: Es la métrica más crítica. Si tu ERP hace miles de pequeñas consultas de lectura/escritura, necesitas un volumen **io2 (Provisioned IOPS)**. Si es una carga de trabajo ligera, **gp3 (General Purpose)** es suficiente.
		- **Throughput**: Es el caudal de datos (MB/s). Vital si haces reportes pesados que leen tablas gigantes.
		- **Auto-scaling**: Una característica clave de RDS es que puedes activar el **Storage Autoscaling**. Le dices: "Empieza con 100GB, pero si te llenas, aumenta hasta 1TB". Esto te salva de caídas por falta de espacio sin tener que pre-aprovisionar demasiado.
	-  **Elección del SKU (Instancia)**
	
		Los SKUs de RDS se dividen por "familias" según la carga:
		
		- **Familia T (Burstable)**: `db.t4g`. Ideales para desarrollo o tiendas con tráfico bajo que tiene picos esporádicos. Tienen "créditos de CPU".
		- **Familia M (General Purpose)**: `db.m7g`. El equilibrio estándar para ERPs y CRMs de tamaño medio.
		- **Familia R (Memory Optimized)**: `db.r7g`. **Aquí es donde terminan la mayoría de las bases de datos de producción**. Como la mayoría de las bases de datos relacionales cargan los índices en RAM para ser rápidas, **la memoria (RAM) suele ser más importante que la CPU**.
	    
	**¿Cómo medir si te falta capacidad?**
	
	Usa estas técnicas de arquitectura:
	
	1. **Performance Insights**: Es una herramienta nativa de RDS que te dice **qué sentencia SQL está consumiendo tu CPU**. A veces no necesitas un SKU más grande, solo optimizar una consulta mal escrita.
	2. **Stress Testing (Pruebas de carga)**: Usa herramientas como `sysbench` o `HammerDB` antes de lanzar tu aplicación. Simula el tráfico esperado de tu ERP/Tienda y observa cómo escala la latencia.
	3. **Costo vs. Rendimiento**:
	    
	    - **RDS Instance**: Pagas por hora (CPU/RAM).
	    - **RDS Storage**: Pagas por GB y por IOPS provisionados.

	**Resumen de estrategia**
	
	1. **Empieza pequeño**: Con una instancia `db.m7g` (General Purpose) y almacenamiento `gp3`.
	2. **Observa**: Deja que la carga corra 24-48 horas y revisa los reportes de CloudWatch.
	3. **Escala**: Si la latencia es alta o la memoria está saturada, escala verticalmente (ej. de `m7g.large` a `m7g.xlarge`).
	    
	**¿Te hace sentido que en la nube la estrategia no es "comprar el mejor hardware posible", sino "empezar con lo razonable y escalar según la telemetría"?** ¿Quieres que veamos cómo leer un reporte de **Performance Insights** para identificar si un ERP está sufriendo por falta de RAM o por una consulta ineficiente?




###### Matriz comparativa de arquitectura de red multicloud

| **Función técnica**              | **AWS**                   | **GCP**                 | **OCI**                | **IBM**                | **Azure**                           |
| -------------------------------- | ------------------------- | ----------------------- | ---------------------- | ---------------------- | ----------------------------------- |
| **Modelo nativo de aislamiento** | Explícito desde el origen | Desacoplado del cómputo | Explícito estructurado | Simplificado combinado | Híbrido (en transición a explícito) |

-  **NAT Gateway**

| **Función técnica**             | **AWS**     | **GCP**   | **OCI**     | **IBM **              | **Azure**          |
| ------------------------------- | ----------- | --------- | ----------- | --------------------- | ------------------ |
| **Traducción explícita (SNAT)** | NAT Gateway | Cloud NAT | NAT Gateway | Public Gateway (SNAT) | NAT Gateway (SNAT) |
-  **IP Public**

| **Función técnica**                   | **AWS**    | **GCP**             | **OCI**            | **IBM**     | **Azure** |
| ------------------------------------- | ---------- | ------------------- | ------------------ | ----------- | --------- |
| **Direccionamiento público estático** | Elastic IP | External IP address | Reserved Public IP | Floating IP | Public IP |
-  **Virtual Network Gateway**

| **Función técnica**                     | **AWS**                 | **GCP**   | **OCI**                 | **IBM**     | **Azure**               |
| --------------------------------------- | ----------------------- | --------- | ----------------------- | ----------- | ----------------------- |
| **Terminación de redes híbridas (VPN)** | Virtual Private Gateway | Cloud VPN | Dynamic Routing Gateway | VPN Gateway | Virtual Network Gateway |
-  **IP Address Manager**

| **Función técnica**                   | **AWS**  | **GCP** | **OCI**       | **IBM** | **Azure**                |
| ------------------------------------- | -------- | ------- | ------------- | ------- | ------------------------ |
| **Evitar colisión de redes privadas** | VPC IPAM | IPAM    | IP Management | IPAM    | Azure IP Address Manager |



###### Matriz comparativa de arquitectura de bases de datos multicloud

-  **Relacional**

| **Función técnica**                     | **AWS** | **GCP**   | **OCI**             | **IBM**      | **Azure**          |
| --------------------------------------- | ------- | --------- | ------------------- | ------------ | ------------------ |
| **Base de datos relacional gestionada** | Aurora  | Cloud SQL | Autonomous Database | Db2 on Cloud | Azure SQL Database |

-  **Caché / In-Memory**

| **Función técnica**                    | **AWS**     | **GCP**     | **OCI**   | **IBM**             | **Azure**       |
| -------------------------------------- | ----------- | ----------- | --------- | ------------------- | --------------- |
| **Almacenamiento en caché en memoria** | ElastiCache | Memorystore | OCI Cache | Databases for Redis | Cache for Redis |

-  **NoSQL / Key-Value**

|**Función técnica**|**AWS**|**GCP**|**OCI**|**IBM**|**Azure**|
|---|---|---|---|---|---|
|**Base de datos NoSQL / Key-Value**|DynamoDB|Cloud Bigtable|NoSQL Database|Cloudant|Cosmos DB|




###### Matriz comparativa de arquitectura de almacenamiento multicloud

-  **Object Storage**

| **Función técnica**           | **AWS**             | **GCP**       | **OCI**        | **IBM**              | **Azure**    |
| ----------------------------- | ------------------- | ------------- | -------------- | -------------------- | ------------ |
| **Almacenamiento de objetos** | Storage simple (s3) | Cloud Storage | Object Storage | Cloud Object Storage | Blob Storage |



###### Matriz comparativa de arquitectura de servicios de borde y entrega multicloud

-  **Content Delivery Network**

| **Función técnica**                   | **AWS**    | **GCP**   | **OCI**              | **IBM**       | **Azure**                    |
| ------------------------------------- | ---------- | --------- | -------------------- | ------------- | ---------------------------- |
| **Red de entrega de contenido (CDN)** | CloudFront | Cloud CDN | OCI Content Delivery | IBM Cloud CDN | Azure Front Door o Azure CDN |
Mientras que **Azure Front Door** (que listamos anteriormente) es una solución de borde integrada (WAF + CDN + Balanceo Global), **Azure CDN** es el servicio más tradicional de caché y distribución de activos estáticos, comparable directamente a la configuración estándar de los otros proveedores.

-  **API Management**

| **Función técnica**              | **AWS**     | **GCP**              | **OCI**     | **IBM**     | **Azure**      |
| -------------------------------- | ----------- | -------------------- | ----------- | ----------- | -------------- |
| **Gestión y exposición de APIs** | API Gateway | API Gateway o Apigee | API Gateway | API Connect | API Management |
Apigee es, fundamentalmente, una plataforma de gestión de APIs (APIM - API Management) de nivel empresarial. Mientras que un "API Gateway" suele ser un componente más sencillo que actúa como proxy para enrutar tráfico y aplicar seguridad básica, Apigee es un ecosistema completo que abarca todo el ciclo de vida de una API.


