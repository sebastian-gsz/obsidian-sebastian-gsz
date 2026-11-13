
Amazon S3 es un servicio de almacenamiento de objetos que ofrece escalabilidad, disponibilidad de datos, seguridad y rendimiento líderes en el sector. Es decir que los clientes de todos los tamaños y sectores pueden almacenar y proteger cualquier volumen de datos para un rango de casos prácticos, como **sitios web, aplicaciones móviles, procesos de copia de seguridad y restauración, operaciones de archivo, aplicaciones empresariales, dispositivos de Internet de las cosas (IoT) y análisis de datos**.

-  **[Documentación Amazon Simple Storage Service ](https://docs.aws.amazon.com/s3/)**
![[barra.gif]]
-  **Creación de bucket**

	1. **Uso general (General Purpose)**
	
		-  **¿Qué significa?:** Es el bucket clásico y tradicional. Tus datos se almacenan de forma altamente redundante y distribuida en **múltiples Zonas de Disponibilidad (AZs)** dentro de una región, garantizando una durabilidad extremadamente alta (99.999999999%).
		-  **¿Cuándo emplearlo?:** Es la opción recomendada para el **95% de los casos de uso estándar** en la nube: alojamiento web, respaldos, lagos de datos (_data lakes_), archivos multimedia, almacenamiento de aplicaciones generales y registros (_logs_).
		-  **Opciones de configuración que presenta:**
		
		    -  **Espacio de nombres del bucket:** Te permite elegir entre un _Espacio de nombres global_ (el nombre debe ser único en todo el mundo en AWS) o un _Espacio de nombres regional de la cuenta_ (recomendado si quieres nombres únicos solo dentro de tu cuenta en esa región).
		    -  **Clases de almacenamiento múltiples:** Puedes cambiar dinámicamente cómo se guardan los objetos mediante reglas de ciclo de vida (Standard, Intelligent-Tiering, Infrequent Access, Glacier, etc.).
		    -  Permite configurar replicación entre regiones, bloqueo de objetos (_Object Lock_), control de versiones y notificaciones avanzadas.
	2. **Directorio (Directory Buckets / S3 Express One Zone)**
	
		-  **¿Qué significa?:** Es un tipo de bucket de alto rendimiento y **baja latencia** (del orden de milisegundos o microsegundos). Utiliza exclusivamente la clase de almacenamiento **S3 Express One Zone** y los datos se guardan en una **única Zona de Disponibilidad (AZ)** elegida por ti.
		-  **¿Cuándo emplearlo?:** Se usa para cargas de trabajo ultrarrápidas y de alto rendimiento computacional (_High-Performance Computing - HPC_), análisis de datos en tiempo real, entrenamiento de modelos de Machine Learning o procesamiento masivo de datos (como con Apache Spark o AWS EMR) donde cada milisegundo de acceso cuenta.
		-  **Opciones de configuración que presenta:**
		
		    -  **Restricción de zona:** Al estar anclado a una sola AZ, su arquitectura prioriza la velocidad local sobre la redundancia multi-zona.
		    -  **Nomenclatura específica:** Los nombres de los buckets de directorio deben seguir un formato estricto que incluye el identificador de la zona (por ejemplo, terminando en un sufijo específico de disponibilidad).
		    -  Están diseñados con una estructura jerárquica de directorios optimizada para cargas de trabajo analíticas que realizan millones de operaciones por segundo de lectura/escritura.
	3. **Gestión de acceso: Políticas vs. ACLs**
	
		Las políticas (como las políticas de bucket o de IAM) son documentos centralizados en formato JSON que determinan quién tiene acceso a los recursos y qué acciones puede realizar.
		
		1.  **Centralización absoluta:** Controlas todo el bucket y sus objetos desde un único documento de permisos.
		2.  **Simplicidad y seguridad:** Facilitan la aplicación de principios de mínimo privilegio y evitan configuraciones dispersas.
		    
		-  **ACLs (Access Control Lists - El sistema heredado)**
		
			Las ACLs son un mecanismo antiguo de S3 que permitía otorgar permisos de lectura o escritura a objetos individuales o permitir que otras cuentas de AWS subieran archivos manteniendo la propiedad de estos.
			
			-  **Granularidad individual por objeto:** Requerían configurar permisos objeto por objeto, lo que volvía el control inmanejable a gran escala.
			-  **Riesgo de seguridad:** Eran una fuente común de brechas de seguridad por configuraciones erróneas que exponían archivos al público de forma inadvertida.
		-  **¿Por qué AWS recomienda "ACL deshabilitadas"?**
		
			Cuando seleccionas **ACL deshabilitadas** (también conocido como _Bucket Owner Enforced_), **todo objeto que se suba al bucket pasa a ser automáticamente propiedad de la cuenta dueña del bucket**, sin importar qué cuenta externa lo haya subido. Esto unifica el control bajo las políticas, elimina la fragmentación y previene exposiciones accidentales.
		-  **¿Cuándo emplear ACL legacy?**
		
			-  **Aplicaciones o software antiguo (_Legacy_):** Tienes programas, scripts o herramientas de terceros muy antiguos que están codificados explícitamente para enviar archivos utilizando comandos de ACL (como los antiguos _canned ACLs_ o permisos a nivel de objeto) y no saben interactuar con las políticas modernas de bucket.
			-  **Dependencias de flujos multicuenta obsoletos:** En arquitecturas muy antiguas entre diferentes cuentas de AWS, a veces se utilizaba la modalidad de ACLs (_ObjectWriter_ o _BucketOwnerPreferred_) para permitir que otra cuenta subiera archivos manteniendo o cediendo la propiedad de forma específica. Hoy en día esto se resuelve de forma mucho más limpia y segura utilizando **políticas de bucket** o roles de IAM.
			-  **Casos muy específicos de logs antiguos:** Algunas configuraciones de registros (_logs_) de servicios muy antiguos requerían permisos de escritura mediante listas de control de acceso, aunque la gran mayoría de servicios modernos ya utilizan políticas basadas en recursos.
	4. **Configuración de bloqueo de acceso público (_Block Public Access_)**
	
		Este bloque corresponde a la **Configuración de bloqueo de acceso público (_Block Public Access_)**, una de las capas de seguridad más importantes de S3. Su objetivo principal es actuar como un escudo de seguridad maestro para evitar que tus datos queden expuestos a Internet por error.
		
		Vamos a desglosarlo bloque por bloque:
		
		1. **El interruptor principal: Bloquear todo el acceso público**
		
			**Qué hace:** Al marcar la casilla superior ("Bloquear todo el acceso público"), AWS activa de golpe las cuatro subopciones que aparecen debajo. Es un mecanismo de seguridad drástico y muy recomendado por defecto para garantizar que **ningún objeto ni bucket sea accesible desde la web pública**, a menos que lo configures explícitamente y de forma consciente más adelante.
		2. **Las cuatro subopciones independientes**
		
			Aunque vienen agrupadas por defecto, cada una controla un vector de exposición diferente (dos enfocadas en ACLs y dos enfocadas en políticas):
			
			-  **Bloquear el acceso pub a buckets y objetos concedido a través de _nuevas_ listas de control de acceso (ACL):**
			
			    **Significado**: Impide que se creen nuevas ACLs en el futuro que otorguen permisos públicos a archivos o al bucket, bloqueando también los permisos públicos que se apliquen recientemente mediante este método. (No altera las ACLs públicas antiguas que ya existieran).
			-  **Bloquear el acceso pub a buckets y objetos concedido a través de _cualquier_ lista de control de acceso (ACL):**
			
			    **Significado**: Es más restrictivo. **Ignora por completo todas las ACLs** (tanto nuevas como antiguas) que concedan acceso público, anulándolas de forma tajante.
			-  **Bloquear el acceso pub a buckets y objetos concedido a través de políticas de bucket y puntos de acceso públicas _nuevas_:**
			
			    **Significado**: Bloquea la aplicación de _nuevas_ políticas de bucket o de puntos de acceso (_access points_) que intenten abrir el contenido al público general (por ejemplo, usando comodines como `"Principal": "*"`). Deja intactas las políticas públicas que ya estuvieran activas con anterioridad.
			-  **Bloquear el acceso pub y entre cuentas a buckets y objetos concedido a través de _cualquier_ política de bucket y puntos de acceso pública:**
			
			    **Significado**: Es el nivel máximo de bloqueo basado en políticas. **Ignora cualquier política de bucket o punto de acceso** que intente conceder acceso público, asegurando que nadie pueda saltarse esta regla mediante documentos JSON mal configurados.
			
			**Resumen práctico: ¿Por qué es crucial?**
			
			Históricamente, muchos incidentes de seguridad en la nube (filtraciones de datos empresariales, bases de datos expuestas, etc.) ocurrían porque un administrador creaba un bucket y, por error en una política o una ACL, dejaba los archivos accesibles para todo el mundo en Internet.
			
			Activar el **bloqueo de acceso público** actúa como un chaleco antibalas: aunque cometas un error al escribir una política o apliques una regla insegura, **S3 overrideará (anulará) esa configuración y mantendrá los datos protegidos dentro de los límites de tu cuenta de AWS**.
			
			A menos que estés creando un sitio web estático público (como una página web abierta a todo el mundo), **lo ideal es dejar esta opción siempre marcada (activada)**.
-  **Herramientas disponibles para optimizar el rendimiento**

	1. **Prefijos**
	
		En Simple Storage Service, un **prefijo** es la cadena de caracteres en el nombre de un objeto que actúa de forma similar a una ruta de directorio (por ejemplo, en el archivo `2026/06/datos.csv`, el prefijo es `2026/06/`).
		
		-  **¿Qué es un prefijo y para qué sirve?**
		
			Sus vehículos autónomos cargarán una cantidad significativa de datos a Amazon Simple Storage Service cada noche. Para evitar sorpresas, le aconsejó a su equipo que identifique los requisitos de rendimiento de este proyecto.
			
			Tras realizar algunas pruebas, su equipo concluye que necesita un rendimiento de carga de al menos 15 000 PUT por segundo para cumplir con los requisitos del proyecto. Usted decide investigar cómo ajustar los patrones de denominación de claves de objetos Simple Storage Service a fin de alcanzar el rendimiento deseado para la carga de datos de su automóvil.
			
			*  Un prefijo es un componente fijo que actúa como una ruta lógica para agrupar objetos similares dentro de un *bucket* (por ejemplo, organizar los datos de automóviles autónomos agrupándolos por su número de identificación).
			*  Distribuir los objetos en diferentes prefijos ayuda a optimizar el *bucket* para soportar tasas de solicitudes muy altas.
		-  **Funcionamiento de las particiones y límites de velocidad (TPS)**
		
			*  **Particiones internas:** Simple Storage Service utiliza entidades lógicas llamadas particiones para indexar las claves de los objetos. Inicialmente, todas las claves de un *bucket* residen en una sola partición.
			*  **Límites por prefijo:** Cada prefijo particionado soporta un máximo de **3,500 solicitudes PUT / POST / DELETE** y **5,500 solicitudes GET por segundo (TPS)**.
			*  **Escalado automático:** Cuando Simple Storage Service detecta que el tráfico supera la capacidad de una partición, crea automáticamente una nueva partición por prefijo. El número de prefijos admitidos no tiene límite.
		-  **Solución para lagos de datos (*Data Lakes*)**
		
			Motores de procesamiento como Hive, Spark o Presto suelen requerir convenciones de nombres basadas en fechas para sus tablas. Para escalar correctamente ante un mayor volumen de tráfico sin saturar las particiones, se recomienda complementar la estructura utilizando una **partición de clave natural** (como se gestiona en herramientas de consulta tipo Amazon Athena), adaptándose siempre a los requerimientos de la aplicación.
			
			Para diseñar un prefijo que esté optimizado **tanto para el rendimiento en Simple Storage Service** (evitando cuellos de botella y errores `HTTP 503`) como para los **lagos de datos** (permitiendo que motores como Spark, Presto o Athena consulten eficientemente), se debe resolver un pequeño conflicto arquitectónico inicial:
			
			-  **¿Cómo se ve un prefijo híbrido y optimizado?**
			
				-  **La necesidad del Data Lake:** Requiere estructuras jerárquicas ordenadas por fecha (como `year=YYYY/month=MM/day=DD/`) para hacer _partition pruning_ (filtrar y leer solo los datos necesarios sin escanear todo el almacenamiento).
				-  **La necesidad de Simple Storage Service (Rendimiento):** Requiere **entropía** o dispersión al inicio de la ruta (a la izquierda) para evitar que todas las peticiones caigan en una única partición física y provoquen saturación.
				
				La solución ideal es utilizar una **estructura híbrida**. Esta consiste en colocar una clave natural de distribución o un fragmento de dispersión en los niveles superiores del prefijo, seguido de la estructura estándar de particionado por fecha compatible con los motores analíticos: **`Simple Storage Service://mi-bucket/datos/region=norte/hash=a3f2/year=2026/month=06/day=16/archivo.parquet`**
			-  **Desglose de los componentes clave**
			
				-  **Clave natural de negocio o geografía (`region=norte/` o `cliente_id=XYZ/`):**
				
				    **_Para qué sirve:_** Si tu aplicación segmenta de forma natural las operaciones por región o ID de cliente, colocar esto al inicio distribuye automáticamente el tráfico en diferentes rutas lógicas y físicas de Simple Storage Service, reduciendo la presión en una sola zona.
				-  **Hash de entropía o dispersión (`hash=a3f2/`):**
				
				    **_Para qué sirve:_** Si tienes una ingesta masiva de escritura/lectura simultánea que supera los límites estándar por prefijo, puedes aplicar una función hash (como los primeros caracteres de un MD5) al nombre del archivo para dispersarlo de forma totalmente aleatoria entre las particiones internas de Simple Storage Service.
				-  **Estructura de metadatos tipo Hive (`year=2026/month=06/day=16/`):**
				
				    **_Para qué sirve:_** Es la estructura que exigen motores de consultas como Amazon Athena o Presto. Al encontrarse después de los prefijos de distribución, permite que el motor analítico ignore masivamente los datos que no coinciden con la fecha solicitada, manteniendo la eficiencia del análisis sin sacrificar el rendimiento operativo de Simple Storage Service.
		
		**¿Cómo funciona y por qué optimiza el rendimiento?**
		
		-  **Distribución en particiones:** Simple Storage Service almacena y organiza los datos automáticamente de forma interna mediante particiones. Antiguamente y a nivel arquitectónico, Simple Storage Service escala la capacidad de peticiones por segundo (TPS) basándose en los prefijos.
		-  **Evitar cuellos de botella:** Si todas tus solicitudes de lectura (GET) o escritura (PUT) apuntan exactamente al mismo nombre de ruta o prefijo, todas las peticiones caen en la misma partición física de Simple Storage Service, lo que genera un cuello de botella y limita el número de transacciones por segundo que puedes realizar.
		-  **Escalado horizontal de solicitudes:** Al utilizar múltiples prefijos distribuidos, Simple Storage Service distribuye la carga automáticamente en múltiples particiones internas. Esto te permite escalar de manera masiva para soportar miles de solicitudes por segundo sin degradar el rendimiento.
	2. **Paralelización**
		
		Amazon Simple Storage Service es un sistema distribuido a gran escala. Para aprovechar su escala, se pueden escalar horizontalmente las solicitudes paralelas (en lugar de una única solicitud) a los puntos de enlace de servicio de Amazon Simple Storage Service para obtener mayor velocidad y fiabilidad. Este enfoque ayuda a distribuir las solicitudes en varias rutas de acceso a través de la red, y Simple Storage Service no tiene límites en cuanto al número de conexiones que se realizan en un _bucket_. Para optimizar el rendimiento, se pueden utilizar aplicaciones que escriben y recuperan datos en paralelo mediante **cargas multiparte (_Multipart Upload_)**.
		
		**¿Cómo funciona y por qué optimiza el rendimiento?**
		
		- **Saturación del ancho de banda de red:** Una sola conexión de red TCP a menudo se ve limitada por la latencia de la red, el tamaño de la ventana de transmisión o restricciones de flujo, lo que impide aprovechar al máximo todo el ancho de banda disponible entre la aplicación y Simple Storage Service.
		- **Concurrencia horizontal:** Al abrir múltiples conexiones en paralelo, la aplicación envía o recibe varias partes de los datos al mismo tiempo.
		- **Aplicación práctica y cargas multiparte:** Permiten cargar un solo objeto como un conjunto de partes de forma independiente y en cualquier orden. Si la transmisión de cualquier parte falla, se puede retransmitir exclusivamente esa parte afectada sin reiniciar la carga desde el principio. Una vez cargadas todas las partes, Simple Storage Service las combina para crear el objeto final.
		
		**Herramientas de implementación**
		
		-  **Ventajas de implementar cargas multiparte**
		
			-  **Mayor rendimiento:** Al cargar partes de archivos en paralelo, se optimiza la velocidad de transferencia.
			-  **Resiliencia ante errores:** Los tamaños más pequeños de partes reducen el impacto de tener que reiniciar una carga fallida debido a un error de red, ya que solo se deben reintentar las partes interrumpidas.
			-  **Flexibilidad operativa:** Brinda la capacidad de hacer una pausa entre cargas y reanudarlas cuando los recursos lo permitan.
		-  **Cuándo utilizar las cargas multiparte**
		
			-  Es una práctica recomendada para objetos de **100 MB o más**.
			-  Al cargar objetos grandes a través de redes estables de gran ancho de banda, maximiza el flujo paralelizando varios objetos.
			-  Al operar en redes irregulares, minimiza el impacto de los fallos de red reintentando únicamente los fragmentos afectados.
		-  **Proceso de cargas multiparte**
		
			1. **Inicio:** La aplicación separa el objeto de origen (de forma lógica o física mediante comandos como `split` de Linux). Al enviar la solicitud para iniciar la carga, Simple Storage Service devuelve un **ID de carga** único, el cual debe incluirse obligatoriamente junto con los encabezados correspondientes (como `Content-Type` y `Cache-Control`) en cada solicitud posterior.
			2. **Carga:** Se sube cada parte contigua acompañada del ID de carga y un número de parte (entre 1 y 10 000) que define su posición. Si se usa un número de parte ya existente, se sobrescribirá. Como respuesta, Simple Storage Service devuelve un valor **ETag** por cada parte subida, el cual debe conservarse para la fase final.
			3. **Finalización:** Se envía una solicitud de carga multiparte completa que incluye el ID de carga, la lista de los números de parte y sus respectivos valores de ETag. Simple Storage Service ensambla el objeto concatenando las partes en orden ascendente y asocia los metadatos provistos. Después de completarse con éxito, las partes individuales dejan de existir.
			
			**Nota sobre costos y ciclo de vida:** Si una carga multiparte no se completa, se pueden evitar cargos de almacenamiento innecesarios configurando el ajuste **Anular carga multiparte incompleta** en las reglas del ciclo de vida de Amazon Simple Storage Service para descartarlas tras un número especificado de días.
			
			-  **SDK de AWS:** Soportado en lenguajes como Java, .NET, PHP, Ruby, Python (Boto3) y JavaScript. Ofrece dos niveles de API:
			
			    -  **_API de alto nivel:_** Proporciona abstracción para minimizar la complejidad y utiliza múltiples subprocesos de conexión simultáneos de forma automática (por ejemplo, mediante la clase `TransferManager` en Java).
			    -  **_API de bajo nivel:_** Corresponde a operaciones REST subyacentes, otorgando control y granularidad para pausar, reanudar o manejar tamaños de partes variables cuando no se conoce el tamaño total de antemano.
				     
					-  **Características principales**
					
						-  **Control y granularidad:** Te permite manipular directamente los parámetros de cada solicitud sin abstracciones intermedias.
						-  **Ejecución explícita:** Debes programar o ejecutar manualmente cada fase del proceso de forma independiente (por ejemplo, iniciar la carga para obtener el ID, enviar cada parte por separado con su número correspondiente, y mandar la señal de cierre o aborto).
					-  **¿Cuándo se debe utilizar el bajo nivel?**
					
						-  **Tamaños de datos desconocidos:** Cuando vas a transmitir datos en tiempo real o no sabes de antemano qué tan pesado será el archivo completo.
						-  **Pausar y reanudar cargas:** Si tu arquitectura necesita interrumpir una subida masiva a la mitad y retomarla horas o días después de manera manual.
						-  **Partes de tamaño variable:** Cuando requieres cambiar el tamaño de los fragmentos sobre la marcha según las condiciones cambiantes de la red.
					
					Si no necesitas este grado de personalización tan técnico y solo buscas transferir archivos grandes de forma rápida y automatizada, lo ideal es utilizar siempre la API de alto nivel.
			-  **AWS CLI:** Los comandos de alto nivel realizan cargas multiparte de manera automática según el tamaño del archivo, mientras que los comandos de bajo nivel permiten operaciones manuales como detener y reanudar.
			-  **API REST:** Permite integrar y realizar cargas multiparte directamente de forma nativa si la arquitectura de la aplicación lo requiere.
			
				1. **Inicio de la carga multiparte**
				
					-  Se envía una solicitud HTTP inicial al servicio para avisar que se comenzará a subir un archivo grande en fragmentos.
					-  Como respuesta, el servicio devuelve un **ID de carga** (_Upload ID_), que es un identificador único indispensable que deberás adjuntar en todas las operaciones siguientes de este archivo.
				2. **Carga de las partes**
				
					-  Se envían peticiones individuales (generalmente mediante el verbo HTTP `PUT`) para cada uno de los fragmentos en los que dividiste el archivo.
					-  Cada solicitud de parte debe incluir obligatoriamente:
					
					    El **ID de carga**: Un **número de parte** (del 1 al 10,000) que indica la posición exacta del fragmento.
					-  Por cada parte recibida con éxito, el servicio responde con un valor **ETag** (un código de validación), el cual debes recopilar y almacenar temporalmente.
				3. **Finalización de la carga**
				
					-  Una vez que se han subido todos los fragmentos, se envía una solicitud final para cerrar el proceso.
					-  Esta solicitud debe incluir el **ID de carga** y un listado estructurado con los **números de parte y sus respectivos valores ETag** obtenidos en el paso anterior.
					-  Al recibir esta información, el servicio ensambla automáticamente los fragmentos en orden ascendente para consolidarlos en el archivo final.
	3. **Tiempos de espera y reintentos**
	
		**¿Qué es?:** Una estrategia de programación para gestionar de forma resiliente interrupciones temporales de red, pérdida de paquetes o llamadas limitadas (_throttling_), donde errores temporales como la respuesta HTTP `503 Slow Down` son inevitables en sistemas distribuidos de gran escala.
	    
		-  **¿Cómo funciona y por qué optimiza el rendimiento?:**
		
		    -  **Tiempos de espera (_Timeouts_):** Evitan que el sistema aguarde durante un periodo ilimitado de tiempo. Esto permite liberar con rapidez los recursos utilizados (como memoria o conexiones) cuando una solicitud se demora más de lo habitual.
		    -  **Reintentos (_Retries_):** Permiten que los clientes se recuperen de errores de conexión enviando de nuevo la misma solicitud.
		    -  **Retroceso y fluctuación (_Backoff and Jitter_):** Para evitar que los reintentos agresivos aumenten la sobrecarga del sistema, se implementa el **retroceso exponencial** (aumentando progresivamente el tiempo de espera entre intentos). Además, la **fluctuación** añade un lapso aleatorio para prevenir colisiones masivas y picos de tráfico (_thundering herd_).
		
		**Implementación técnica:** Los SDKs (y las solicitudes mediante API REST) permiten configurar de forma personalizada parámetros como los límites máximos de reintentos, el tiempo de espera de conexión y el tiempo de espera de lectura/escritura ajustados a las tolerancias de la aplicación.
	        
		-  **Directrices y estrategias según el tipo de solicitud:**
		
		    -  **Solicitudes de tamaño fijo:** Se recomienda identificar el **1% más lento** de las solicitudes y reintentarlas (incluso un único reintento suele ser eficaz para reducir la latencia). En cada reintento, es aconsejable utilizar una nueva conexión y realizar una nueva búsqueda de DNS.
		    -  **Solicitudes grandes de tamaño variable (>128 MB):** Se recomienda realizar un seguimiento del rendimiento alcanzado y volver a intentar el **5% más lento** de las solicitudes.
		    -  **Solicitudes pequeñas de tamaño variable (<512 KB):** Al manejarse en rangos de decenas de milisegundos, la práctica recomendada es reintentar la operación GET o PUT tras **2 segundos**, y un segundo reintento tras **4 segundos adicionales** si fuese necesario.
	4. **Amazon Simple Storage Service Select**

		**¿Qué es?:** Una característica que permite filtrar y recuperar datos específicos del contenido de un objeto directamente en el servidor de almacenamiento utilizando expresiones SQL simples, en lugar de descargar el archivo completo a tu aplicación. Es compatible con objetos en formato CSV, JSON o Apache Parquet, así como con archivos comprimidos (GZIP o BZIP2 para CSV y JSON) y objetos cifrados del lado del servidor.
		    
		-  **¿Cómo funciona y por qué optimiza el rendimiento?:**
		
		    -  **Filtrado del contenido:** Si tienes un archivo gigantesco (como CSV o JSON de varios gigabytes) y solo necesitas consultar datos específicos (por ejemplo, registros de un código postal), el servicio procesa el archivo internamente y devuelve únicamente los datos solicitados. Esto reduce drásticamente el tráfico de red, los costos de transferencia y el uso de memoria en la aplicación.
		    -  **Integración con Big Data (Amazon EMR):** Es compatible con Spark, Hive y Presto en clústeres de Amazon EMR, lo que permite delegar el trabajo computacional de filtrado desde el clúster hacia el servidor de almacenamiento, mejorando el rendimiento y reduciendo la cantidad de datos transferidos.
		-  **Requisitos y límites operativos:**
		
		    -  **Permisos y cifrado:** Requiere el permiso `s3:GetObject`. Si el objeto está cifrado con claves proporcionadas por el cliente (SSE-C), se debe usar HTTPS y proporcionar la clave en la solicitud.
		    -  **Límites de tamaño:** La longitud máxima de una expresión SQL es de 256 KB y la longitud máxima de un registro en la entrada o el resultado es de 1 MB. Además, la consola limita la cantidad de datos devueltos a 40 MB (para recuperar más datos se deben usar la AWS CLI, la API de REST o los SDK de AWS).
		    -  **Limitaciones con archivos Parquet:** Solo admite compresión en columnas usando GZIP o Snappy (sin compresión de objetos integrales), no admite salida en formato Parquet (debe especificarse CSV o JSON), el tamaño máximo de grupo de filas sin comprimir es de 256 MB, requiere utilizar los tipos de datos del esquema del objeto, y al seleccionar campos repetidos solo devuelve el último valor.
		-  **Implementación y uso:**
		
		    -  Se ejecuta mediante el método `SelectObjectContent` utilizando los SDK de AWS, la API de REST, la AWS CLI o la consola.
		    -  En la solicitud se debe especificar obligatoriamente el _bucket_, la clave del objeto (`Key`), la expresión SQL (`Expression`), el formato de serialización de entrada (`InputSerialization`) y el formato de serialización de la respuesta (`OutputSerialization`).
	5. **Amazon CloudFront**
	
		*  **¿Qué es?:** La red de entrega de contenido (*CDN*) global de AWS que almacena en caché copias de tus archivos en servidores periféricos (*Edge Locations*) repartidos por todo el mundo.
		*  **Cómo optimiza:** En lugar de que cada usuario a nivel mundial descargue un archivo directamente desde tu *bucket* de Simple Storage Service, CloudFront sirve el contenido estático de acceso frecuente desde la ubicación geográfica más cercana al usuario, reduciendo el tiempo de respuesta y aliviando la carga sobre Simple Storage Service.
	6. **Amazon Simple Storage Service Transfer Acceleration**
	
		*  **¿Qué es?:** Una característica que acelera las transferencias de datos hacia y desde tus *buckets* de Simple Storage Service utilizando los servidores periféricos optimizados de CloudFront y la red troncal privada de AWS.
		*  **Cómo optimiza:** Cuando los usuarios necesitan subir archivos pesados desde ubicaciones geográficas muy distantes (por ejemplo, desde Sídney hacia un *bucket* en Virginia), la ruta pública de Internet estándar puede ser lenta e inestable. Simple Storage Service Transfer Acceleration enruta los datos por la infraestructura privada de AWS más cercana, maximizando la velocidad de subida.
	7. **Amazon CloudWatch**
	
		*  **¿Qué es?:** El servicio centralizado de monitoreo, métricas y registro (*logging*) de AWS.
		*  **Cómo optimiza:** Te permite supervisar de cerca el rendimiento de tus operaciones con Simple Storage Service mediante métricas en tiempo real (como tasas de solicitudes, códigos de error HTTP o latencias). Con esta visibilidad, puedes configurar alarmas automáticas, detectar cuellos de botella y diagnosticar problemas rápidamente antes de que afecten a los usuarios finales.
-  **Protección mediante el acceso basado en recursos**

	De forma predeterminada, todos los recursos de S3 son privados, y solo el propietario del recurso puede acceder a ellos. El propietario del recurso hace referencia a la cuenta de AWS que creó el recurso. Por ejemplo, la cuenta de AWS que use para crear buckets y objetos será el propietario de dichos recursos. 
	
	Amazon S3 admite la autenticación de usuario para controlar el acceso a los datos. Puede obtener acceso a los mecanismos de control de acceso, por ejemplo, las políticas y las listas de control de acceso (ACL) para conceder permisos de manera selectiva a los usuarios y grupos de usuarios. La consola de Amazon S3 resalta los buckets con acceso público, indica el origen de accesibilidad pública y también advierte si los cambios en las políticas o las ACL de buckets harían que su bucket sea de acceso público.

	-  **ACL de objetos:** Es el mecanismo exclusivo para administrar el acceso a aquellos elementos que no pertenecen al propietario del bucket. También resultan útiles cuando las políticas de bucket alcanzan su límite de tamaño de 20 KB o cuando los permisos varían drásticamente entre archivos individuales:
	  
		-  Otorgar permisos de acceso a objetos individuales.
	    -  Gestionar y permitir el acceso a objetos que son propiedad de otra cuenta de AWS.
	-  **ACL de bucket:** **El único caso de uso recomendado:** Hoy en día, la recomendación principal para utilizar una ACL de bucket es **conceder permisos de escritura al grupo de envío de registros**. Esto permite que el servicio escriba objetos de registro de acceso directamente dentro de tu bucket.
	  
		El **grupo de envío de registros** (o grupo de entrega de registros de S3) es un grupo especial gestionado por AWS que tiene como propósito escribir los objetos de registro (_logs_) de acceso directamente dentro de tu bucket. Su única función es permitir que el propio sistema de Amazon S3 tenga los permisos necesarios para escribir y depositar los archivos de registro (_logs_) de acceso dentro de tu bucket cuando tú activas esa auditoría.
		
		-  Si deseas que S3 te envíe registros de auditoría o de acceso al propio bucket, es obligatorio otorgarle los permisos de escritura correspondientes a dicho grupo mediante la ACL.
		-  Su finalidad principal en la práctica actual se reduce a otorgarle al grupo de entrega de registros permisos de escritura para el bucket.
	-  **Políticas de bucket:** Las políticas de bucket son documentos de permisos basados en recursos que se adjuntan directamente a un bucket de Amazon S3 para controlar quién puede acceder a él y qué acciones puede realizar.
	
		-  **Solución ideal para permisos entre cuentas:** Son la herramienta recomendada cuando necesitas administrar y compartir accesos hacia otras cuentas de AWS de forma centralizada.
		
			Aunque **AWS Organizations** es el escenario más común y ordenado para hacerlo. Cuando se habla de compartir accesos hacia "otras cuentas de AWS de forma centralizada", se refiere a **cualquier cuenta de AWS independiente**.
			
			Esto incluye:
			
			-  Cuentas de otros departamentos o unidades de negocio dentro de tu misma empresa.
			-  Cuentas completamente externas pertenecientes a **socios comerciales, proveedores o clientes** que necesitan interactuar con tus datos.
		-  **Mayor amplitud que las ACL:** A diferencia de las Listas de Control de Acceso, que solo admiten un conjunto finito y limitado de permisos, las políticas de bucket **incluyen y ofrecen una gama mucho más amplia de permisos** de Amazon S3.
		-  **Alternativa de administración:** Por lo general, para gestionar los permisos de acceso se puede optar por utilizar una política de usuario o una política de bucket según el caso de negocio.
		
			-  **Política de usuario (Basada en la identidad):** Se adjunta directamente al **usuario, grupo o rol**. Define _"qué puede hacer ese usuario"_ en diferentes recursos de la nube. (Ejemplo: _"El usuario Juan puede leer archivos en el bucket A y escribir en el bucket B"_).
			-  **Política de bucket (Basada en el recurso):** Se adjunta directamente al **bucket de S3**. Define _"quién puede acceder a este bucket en específico"_. Es ideal cuando quieres abrir la puerta a entidades externas sin necesidad de crearles un usuario dentro de tu propia cuenta. (Ejemplo: _"La cuenta externa de AWS X, Y, Z tiene permiso de lectura en este bucket"_).
			
			**Casos prácticos clave**:
			
			-  **Ampliar la granularidad:** Ofrecer una mayor cantidad de opciones y permisos detallados que las limitaciones que presentan las ACL de buckets.
			-  **Proporcionar acceso entre cuentas:** Si una empresa externa (como una consultora o un proveedor de analíticas) tiene su propia infraestructura en AWS y necesita recopilar archivos que tú guardas en tu bucket, utilizas una política de bucket para permitir el acceso directo y seguro a su cuenta de AWS, sin comprometer la seguridad general de tu entorno.
-  **Protección mediante cifrado**

	-  **Ubicación de las claves:** Define si se almacenarán en tu propio hardware o en el proporcionado por AWS.
	-  **Lugar de uso:** Especifica si las claves serán utilizadas por el software cliente o directamente dentro de AWS.
	-  **Administración:** Establece si prefieres permisos a nivel de usuario/aplicación o utilizar los permisos de gestión de AWS.
	
	Según sus requisitos de seguridad, puede utilizar el **cifrado del cliente o el cifrado del servidor** para cifrar sus datos en AWS. Cada enfoque tiene sus propias ventajas. Para un perfil de seguridad mejorado, puede emplear ambas técnicas.
	
	-  **Cifrado del cliente**
	
		![[cifrado-cliente-aws.png]]
		Con el cifrado del cliente, **puede crear y administrar sus propias claves de cifrado**. Las claves que cree no se exportan a AWS en texto sin cifrar. Sus aplicaciones cifran los datos antes de enviarlos a AWS y descifran los datos después de recibirlos de AWS. Los datos se almacenan en forma cifrada, con claves y algoritmos que solo usted conoce.
		
		-  **Funcionamiento:** El proceso de cifrado se realiza antes de enviar los datos hacia el proveedor, y el descifrado ocurre después de recibirlos.
		-  **Infraestructura propia:** Puede utilizar claves de una infraestructura de administración de claves local (KMI) conocida como CSE-C. Ni los datos sin cifrar ni la CSE-C se envían jamás.
		
			-  **Infraestructura de administración de claves local (KMI):** Significa que tu organización cuenta con sus propios sistemas, servidores o hardware especializados fuera de la nube de AWS para generar, almacenar y custodiar las llaves criptográficas.
			-  **CSE-C:** Es el mecanismo donde utilizas una clave maestra proporcionada por tu propia infraestructura local para cifrar los datos.
		-  **Herramientas:** Está disponible para servicios como S3, DynamoDB, EMR (EMRFS) y mediante el SDK de cifrado.
		-  **Advertencia:** Debes administrar las claves de forma rigurosa; si las pierdes, será imposible recuperar y descifrar la información.
	-  **Cifrado del servidor**
	
		![[cifrado-servidor-aws.png]]
		Con el cifrado del servidor (SSE), **los datos se cifran en su nombre “después” de que el servicio reciba la llamada API**. El SSE es transparente para el usuario final, y **AWS rota la clave maestra de forma regular**. Por ejemplo, si utiliza SSE con Amazon S3, puede solicitar a Amazon S3 que cifre el objeto antes de guardarlo en discos en los centros de datos y descifrarlo cuando descargue los objetos.
		
		-  **Cifrado del servidor con SSE-S3**
		
			-  **Proceso transparente:** Los datos se cifran de manera automática en tu nombre _después_ de que el servicio recibe la llamada API.
			-  **Seguridad:** Utiliza uno de los bloques de cifrado más potentes, el **Estándar de Cifrado Avanzado de 256 bits** (AES-256), y AWS rota la clave maestra de forma periódica.
			-  **Metadatos:** Los metadatos asociados al objeto **no se cifran**, por lo que se recomienda evitar incluir información confidencial en ellos.
			-  **Aislamiento:** Almacena los datos cifrados y las claves de cifrado en hosts separados para mayor seguridad.
		-  **Cifrado del servidor con SSE-KMS**
		
			-  **Cifrado de sobre (_Envelope Encryption_):** Utiliza un método optimizado de dos claves. Se crea una clave de datos para cifrar el objeto y dicha clave de datos se cifra a su vez mediante una **Clave Maestra del Cliente** (CMK) gestionada en AWS KMS.
			-  **Control y auditoría:** Proporciona un registro o pista de auditoría detallada sobre quién utilizó las claves y cuándo.
			-  **Ventaja frente a SSE-S3:** Aunque SSE-S3 usa KMS en segundo plano, SSE-KMS te permite **imponer políticas de uso de claves** e **importar tu propio material de claves** para crear la clave maestra, otorgando un control superior.
-  **Buenas prácticas de diseño y sintaxis en políticas**

	Al diseñar políticas de permisos para servicios específicos como Amazon S3, es fundamental comprender cómo interactúan las acciones con el ámbito del recurso (_Resource_), ya que una mala asignación provocará errores de validación o denegaciones de acceso.
	
	-  **Nivel de bucket vs. Nivel de objeto**
	  
		Las acciones de S3 se dividen estructuralmente en dos niveles que exigen rutas de recursos distintas:
		
	    -  **Acciones a nivel de bucket (`s3:ListBucket`):** Sirven para listar los elementos del contenedor. El recurso **no debe llevar la barra diagonal al final**, apuntando directamente al ARN del bucket (ej. `arn:aws:s3:::nombre-del-bucket`).
	    -  **Acciones a nivel de objeto (`s3:GetObject`, `s3:PutObject`, `s3:DeleteObject`):** Sirven para leer, subir o borrar archivos individuales. Exigen obligatoriamente el uso de un comodín al final del recurso (ej. `arn:aws:s3:::nombre-del-bucket/*`).
	-  **Consecuencias de mezclar niveles en un solo bloque:**
	
	    Si intentas agrupar acciones de bucket y de objeto bajo un mismo recurso con `/*` (o viceversa), AWS IAM evaluará la política y rechazará la acción porque el ámbito del recurso no coincide con los requisitos de la API del servicio.
	-  **La forma correcta de estructurarlo:**
	
	    Divide siempre la política en bloques separados: un bloque exclusivo para las acciones de objetos (con `/*`) y otro bloque independiente para las acciones de control del bucket (sin `/*`).













































































































