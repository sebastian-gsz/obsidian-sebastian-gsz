
![[barra.gif]]

AWS RDS es un servicio web que facilita la configuración, el funcionamiento y el escalado de una base de datos relacional en la nube. Proporciona capacidad de tamaño variable y rentable, al mismo tiempo que automatiza tareas de administración que consumen mucho tiempo.

- **[Documentación ](https://docs.aws.amazon.com/rds/)**
- **[Relational Database Service Aurora](amazon-web-service-relational-database-service-aurora.md)**

![[barra.gif]]

-  **Consideraciones de diseño**

	La elección del motor depende de la naturaleza del ciclo de vida del sistema. Para sistemas nuevos, la recomendación arquitectónica es optar por motores nativos de nube como Amazon Aurora, diseñados para optimizar el rendimiento y la resiliencia.
	
	Para migraciones de sistemas existentes (estrategia de rehost), la prioridad es la compatibilidad. Se debe mantener el mismo motor que en el entorno on-premise para facilitar la migración, aunque se recomienda evaluar a mediano plazo la migración a motores de código abierto o Aurora para eliminar costos de licencia innecesarios. En casos de motores comerciales como Oracle o SQL Server, es posible utilizar el modelo bring your own license (BYOL) si la licencia existente es transferible.
	
	-  **Dimensionamiento y tipos de instancia**
	
		La selección de la clase de instancia determina la capacidad de procesamiento y memoria. Al no existir una fórmula matemática estática, el dimensionamiento debe basarse en métricas de rendimiento actuales, aprovechando la elasticidad de la nube para escalar verticalmente u horizontalmente según la demanda real.
		
		Las clases de instancia se categorizan según el perfil de carga de trabajo:
		
		-  **Instancias de uso general (familias M, C):** Ofrecen un equilibrio entre CPU y memoria. Son ideales para cargas de trabajo estándar donde no hay una demanda extrema de un solo recurso.
		-  **Instancias optimizadas para memoria (familias R, X):** Diseñadas para aplicaciones con uso intensivo de memoria RAM, como bases de datos que requieren caché frecuente o conjuntos de datos grandes en memoria.
		-  **Instancias ampliables (familias T):** Proporcionan un rendimiento básico con capacidad de ráfaga. Son adecuadas para entornos de desarrollo, pruebas o cargas de trabajo con baja utilización constante.
	-  **Estrategias de almacenamiento elástico**
	
		El almacenamiento en RDS no es un disco físico estático, sino un volumen EBS elástico. La configuración debe ajustarse según los requisitos de entrada y salida (IOPS) y latencia:
		
		- **SSD de uso general (gp2/gp3):** Recomendado para la mayoría de las cargas de trabajo. Proporciona latencia en milisegundos y escala su rendimiento en función del tamaño del volumen.
		- **IOPS aprovisionadas (io1/io2):** Necesarias para aplicaciones OLTP de alto rendimiento que demandan latencia baja y uniforme, superando los límites de IOPS de los volúmenes de uso general.
	-  **Gestión de cambios y escalabilidad**
	
		La arquitectura permite modificar la clase de instancia o el tipo de almacenamiento sin necesidad de una migración compleja. Las modificaciones pueden aplicarse inmediatamente o durante una ventana de mantenimiento. Para escalar en entornos críticos, se recomienda utilizar una arquitectura que permita realizar el cambio sin tiempo de inactividad, probando siempre la configuración en un entorno de staging antes de la implementación en producción.
	-  **Estrategias de supervisión y observabilidad**

		La supervisión de RDS debe abordarse bajo un modelo de capas, diferenciando entre la salud de la infraestructura y el rendimiento del motor de base de datos.
		
		-  **Baselines de infraestructura (CloudWatch Metrics):** Proporcionan telemetría de "caja negra" (CPU, latencia, IOPS) sin costo adicional. Son el punto de partida obligatorio para establecer alarmas de disponibilidad mediante SNS.
		-  **Visibilidad a nivel de SO (Supervisión Mejorada):** Esencial para entornos donde se requiere depurar la interacción entre procesos del sistema operativo y la base de datos. A diferencia de las métricas básicas, esta opción (bajo modelo de pago por ingesta de logs) permite granularidad en tiempo real, vital para identificar cuellos de botella en hilos (threads) o uso de memoria del kernel.
		-  **Análisis de rendimiento profundo (Performance Insights):** Performance Insights no es una metodología de diseño ni un servicio independiente; es una **funcionalidad avanzada y nativa de Amazon RDS**. Actúa como una **capa de diagnóstico especializada** que vive dentro de la consola de RDS, diseñada específicamente para el análisis profundo del comportamiento interno del motor de base de datos, permitiendo pasar de la reactividad a la proactividad.
		  
			**Análisis de rendimiento profundo (Performance Insights)**
			
			Mientras que CloudWatch Metrics nos da las "constantes vitales" de la instancia, Performance Insights nos da la "historia clínica" de lo que ocurre dentro del motor. Es la herramienta estándar para el _troubleshooting_ avanzado y la optimización de consultas.
			
			**El problema:** La "**Caja Negra**". CloudWatch te dirá que la CPU está al 99% o que la latencia es alta, pero no te dice _por qué_. ¿Es una consulta específica mal optimizada? ¿Es un bloqueo de tabla? ¿Es un usuario haciendo una consulta masiva? Intentar diagnosticar esto sin la herramienta requiere conectarse manualmente a la base de datos, lo cual es invasivo y complejo.
			
			**La solución (Performance Insights):** Monitoriza la "Carga de Base de Datos" (_DB Load_) basándose en eventos de espera (_Wait Events_).
			
			-  **Visualización de Carga:** Identifica cuánto trabajo está realizando la base de datos y cuánto tiempo está "esperando".
			-  **Análisis de Wait Events:** Clasifica la espera por tipo (Bloqueos, IO, red, CPU). Esto nos dice exactamente dónde se está deteniendo el procesamiento.
			-  **Granularidad SQL:** Permite filtrar y ordenar las consultas SQL más costosas, identificando los "vecinos ruidosos" o las sentencias que están impactando el rendimiento global.
			
			**Valor arquitectónico:**
			
			-  **Optimización continua:** Facilita el _tuning_ de bases de datos al señalar qué índices o cambios en el SQL tienen mayor impacto en el rendimiento.
			-  **Diagnóstico no invasivo:** Permite identificar cuellos de botella sin necesidad de ejecutar comandos administrativos (como `SHOW PROCESSLIST` o `EXPLAIN PLAN` manuales) que podrían degradar aún más el rendimiento en un momento crítico.
			-  **Reducción del MTTR (Mean Time To Recovery):** Al señalar la consulta o el usuario específico que causa la degradación, el tiempo para resolver un incidente se reduce drásticamente.
		-  **Gestión de conexiones:** El uso de **RDS Proxy** es altamente recomendable en arquitecturas modernas (serverless o microservicios) no solo para escalabilidad, sino como herramienta de observación, permitiendo gestionar de manera eficiente miles de conexiones concurrentes y mejorando la resiliencia durante eventos de _failover_.
		
			En aplicaciones modernas (especialmente las que usan arquitectura Serverless como AWS Lambda o contenedores), la gestión de conexiones es un cuello de botella crítico. Cada vez que una Lambda se ejecuta, intenta abrir una nueva conexión a la base de datos. Abrir una conexión es una operación "costosa" en términos de tiempo y recursos para el motor (requiere autenticación, asignación de memoria, handshake TCP).
			
			-  **El problema:** La "Fatiga de Conexiones". Si tienes miles de microservicios abriendo y cerrando conexiones simultáneamente, la base de datos llegará a su límite de conexiones permitidas y empezará a rechazar nuevas peticiones, provocando errores en cascada.
			-  **La solución (RDS Proxy):** Actúa como una capa intermedia (un _pooling_ de conexiones).
			
			    -  **Pooling:** Mantiene un grupo de conexiones abiertas y "calientes" hacia la base de datos. Cuando una aplicación solicita conexión, el Proxy le asigna una de las que ya están abiertas, eliminando el costo de creación de la conexión.
				-  **Resiliencia ante Failover:** En un despliegue Multi-AZ, si la base de datos principal falla y ocurre un _failover_, las aplicaciones pierden su conexión. RDS Proxy detecta el cambio de forma inteligente, mantiene la petición de la aplicación en espera y la redirige a la nueva instancia principal automáticamente. La aplicación no se entera de que hubo un cambio de infraestructura.
			      
					**Valor arquitectónico:**
					
					-  **Decoplamiento:** Permite que la capa de aplicación escale horizontalmente sin preocuparse por los límites de conexión de la base de datos.
					-  **Seguridad:** Mejora la seguridad al centralizar la autenticación, pudiendo forzar el uso de IAM para conectarse al Proxy, incluso si la base de datos no lo soporta de forma nativa.
			
			**Nota para tu documentación:** Cuando presentes esto en una propuesta técnica o entrevista, enfatiza que:
			
			- **Performance Insights** es para **optimizar eficiencia y resolver problemas de rendimiento (troubleshooting)**.
			- **RDS Proxy** es para **garantizar la resiliencia y la escalabilidad (arquitectura)** en sistemas de alta concurrencia.
	-  **Gobernanza de acceso e identidad**
	  
		El control de acceso debe alinearse estrictamente con el principio de menor privilegio, separando la **conectividad de red** (la infraestructura que permite llegar a la base de datos) de la **identidad y autenticación** (las credenciales que permiten el acceso).
		
		-  **Autenticación Cloud-Native (IAM Database Authentication)**: Para motores compatibles (MySQL, PostgreSQL), la arquitectura recomendada prioriza el uso de tokens temporales de IAM emitidos por AWS Security Token Service (STS). Esto elimina la gestión de credenciales persistentes y centraliza el control en políticas de IAM, garantizando que el acceso expire automáticamente sin intervención humana y facilitando una auditoría granular.
		-  **Gestión de secretos (AWS Secrets Manager)**: Para motores comerciales o aplicaciones que requieren credenciales estáticas, es obligatorio el uso de Secrets Manager para inyectar contraseñas. Esta estrategia permite la rotación automática de credenciales sin intervención humana y minimiza el riesgo de exposición en repositorios de código.
		  
			-  **La paradoja de la "credencial estática"**
			
				En muchas arquitecturas, la aplicación (o herramientas de BI como Power BI/Tableau) requieren una credencial fija (`usuario:contraseña`) porque sus drivers de conexión no fueron diseñados para solicitar tokens temporales a AWS.
				
				- **El diseño:** Secrets Manager permite que la aplicación perciba la credencial como "estática" (la aplicación nunca cambia su configuración), pero **el secreto real rota automáticamente en la base de datos**.
				- **El beneficio:** Minimizamos el riesgo de una credencial filtrada. Si un desarrollador o un atacante obtiene la contraseña, esta será inválida en un plazo determinado (ej. cada 30 días) debido a la rotación automática, sin que el código de la aplicación haya tenido que ser modificado o reiniciado.
			-  **Mecanismo técnico de rotación (¿Cómo ocurre?)**
			
				La duda recurrente es: _¿Cómo cambia Secrets Manager la contraseña dentro de la base de datos?_
				
				-  **El orquestador:** Secrets Manager no interactúa directamente con RDS; utiliza **AWS Lambda**.
				-  **El flujo de ejecución:** Lambda debe tener conectividad de red (dentro de tu VPC) hacia la instancia de RDS para poder ejecutar el comando SQL. Secrets Manager simplemente orquesta este proceso.
				
				    1. **Trigger:** Secrets Manager tiene una configuración de rotación programada (ej. cada 30 días).
				    2. **Conexión (VPC):** AWS Secrets Manager invoca una función Lambda. Esta función debe estar desplegada **dentro de la misma VPC** (o tener rutas de red) donde reside la instancia de RDS. Esto permite que la Lambda llegue a la base de datos a través de la red privada.
				    3. **Ejecución SQL:** La Lambda utiliza credenciales de administrador (almacenadas previamente y protegidas) para ejecutar comandos SQL tipo `ALTER USER...` en la base de datos.
				    4. **Actualización:** Una vez que la base de datos confirma el cambio, la Lambda actualiza el valor del secreto en Secrets Manager. A partir de ese segundo, cualquier nueva petición de la aplicación obtendrá la _nueva_ contraseña.
			-  **Arquitectura: "El camino" (Red) vs. "El pasaporte" (Autenticación)**
			
				Para evitar ambigüedades en auditorías o diseños de red, siempre separa estos dos conceptos:
				
				-  **El camino (Conectividad):** Es la capa física/lógica. ¿Cómo llegan los paquetes de datos a RDS?
				
				    -  _Si es un microservicio (EC2/Lambda/Fargate):_ El camino es la VPC interna.
				    -  _Si es una herramienta externa (BI/On-premise):_ El camino es una VPN, AWS Direct Connect, o un **Data Gateway**. Sin este "camino" de red configurado, ninguna autenticación (por más segura que sea) funcionará.
				-  **El pasaporte (Autenticación):** Es la capa de identidad. ¿Quién eres y qué permiso tienes?
				
					1. _Si es Cloud-Native:_ Tu pasaporte es un token temporal de IAM (vía STS).
					2. _Si es una herramienta de terceros (Tableau, Power BI, Legacy):_ Tu pasaporte es la credencial estática gestionada por Secrets Manager.
				      
					-   **Integración corporativa (Kerberos/Active Directory)**: En organizaciones que requieren identidad unificada, la autenticación mediante Kerberos permite Single Sign-On (SSO). Es la opción preferida para entornos híbridos o migraciones donde la gestión de usuarios reside en un Directorio Activo centralizado, asegurando que el ciclo de vida del empleado se refleje automáticamente en el acceso a los datos.
					-   **Perímetros de red (Seguridad de capa de red)**: La base de datos debe residir siempre en subredes privadas, protegidas por Security Groups (firewall a nivel de instancia) y, opcionalmente, Network ACLs (firewall a nivel de subred). El diseño de red debe asegurar que solo los servicios autorizados (backends, aplicaciones, instancias de computo específicas) tengan rutas de comunicación habilitadas hacia la base de datos, aislando el servicio de la red pública.
						
						El despliegue de RDS debe realizarse obligatoriamente dentro de una **Amazon VPC** para garantizar el aislamiento lógico de la infraestructura. El diseño de red debe seguir el principio de "defensa en profundidad" mediante la segmentación de subredes y capas de firewall.
						
						-  **Aislamiento de red:** RDS debe residir en **subredes privadas**. La base de datos nunca debe tener una IP pública ni ser accesible desde el exterior. El acceso desde aplicaciones on-premise se gestiona exclusivamente mediante túneles seguros (VPN/Direct Connect) o Gateways de datos.
						-  **Capas de Firewall (Defensa en Profundidad):**
							
							-  **Network ACLs (NACL):** Firewall a nivel de **subred**. Es "stateless" (sin estado), lo que significa que debemos permitir explícitamente tanto el tráfico de entrada como el de salida. Se utiliza como un filtro de red grueso.
							-  **Security Groups:** Firewall a nivel de **instancia**. Es "stateful" (con estado); si permites la entrada, la respuesta de salida se permite automáticamente. Es tu herramienta principal para controlar qué recursos (ej. una instancia EC2 específica o un grupo de seguridad de aplicaciones) pueden hablar con tu base de datos.
	-  **Diseño para una alta disponibilidad**
		
		-  **A. Despliegue Multi-AZ (Resiliencia y disponibilidad)**
		
			El **Multi-AZ** es una estrategia de "cero intervención" orientada exclusivamente a la continuidad del negocio ante desastres.
			
			-  **Funcionamiento:** RDS aprovisiona una instancia en una **Zona de Disponibilidad (AZ)** diferente a la primaria.
			-  **Sincronización:** La replicación es **síncrona** a nivel de motor de base de datos. La transacción no se confirma en la primaria hasta que la instancia "Standby" ha persistido los datos, garantizando una pérdida de datos nula (**RPO=0**).
			-  **Rol de la instancia Standby (Pasiva):** Es fundamental entender que esta instancia no sirve tráfico de lectura. Está en estado "pasivo" exclusivamente para asegurar la redundancia.
			-  **Failover (Conmutación):** Ante una falla del nodo principal o mantenimiento planificado, AWS redirige automáticamente el tráfico DNS hacia la Standby, que se promueve a "Primaria". Este proceso es automático y toma solo unos segundos.
		-  **B. Réplicas de lectura (Escalabilidad de lectura)**
		
			A diferencia del Multi-AZ, las réplicas de lectura son una estrategia de "optimización de carga" y escalabilidad horizontal.
			
			-  **Funcionamiento:** Permiten crear múltiples copias (réplicas) de la base de datos primaria.
			-  **Sincronización:** La replicación es **asíncrona**. Existe un retardo de milisegundos entre la escritura en la primaria y la actualización en la réplica.
			-  **Rol de la instancia (Activa):** Estas réplicas sí aceptan consultas (`SELECT`). Son ideales para mover tráfico de reportería, análisis o consultas pesadas fuera de la base de datos principal, liberando recursos para `INSERT/UPDATE/DELETE`.
			-  **Distribución Geográfica:** Pueden ubicarse en regiones distintas para reducir la latencia de lectura en aplicaciones globales.
		
		**Ubicación y topología de las réplicas de lectura**
	
		La flexibilidad de las réplicas es total. No estás atado a una configuración fija; puedes desplegarlas donde mejor sirvan a tu modelo de negocio.
		
		-  **¿Dónde se despliegan? (Flexibilidad Geográfica)**
		
			Las réplicas pueden residir en tres "niveles" de proximidad:
			
			-  **Misma AZ (Zona de Disponibilidad):** técnicamente posible, pero arquitectónicamente desaconsejado. Si la zona falla, pierdes la principal y la réplica al mismo tiempo. Solo útil para pruebas.
			-  **Diferente AZ (dentro de la misma Región):** Es el estándar para balancear cargas de lectura manteniendo alta disponibilidad. Si la AZ de la principal cae, tienes la réplica viva en otra zona.
			-  **Diferente Región (Cross-Region):** Aquí es donde despliegas réplicas a miles de kilómetros. Si tienes usuarios en España y también en Japón, mantienes una principal en Madrid y una réplica de lectura en Tokio. Esto reduce drásticamente la latencia de lectura para tus usuarios locales en Japón.
		-  **¿Cómo se distribuyen? (El "mix and match")**
		
			Tu intuición es correcta: puedes mezclarlas como quieras. No hay una regla que te obligue a poner todas en un sitio. Es un diseño modular:
			
			-  Puedes tener **2 réplicas en la Región A (AZs distintas)** para escalar las aplicaciones locales.
			-  Puedes tener **1 réplica en la Región B** para recuperación ante desastres.
			-  Puedes tener **1 réplica en la Región C** para dar servicio a un equipo de analítica que está físicamente allí.
			
			**En resumen:** Tú diseñas la topología según dónde esté tu tráfico. El máximo de 15 es acumulativo entre todas las regiones.
		-  **El nivel "Senior": ¿Se pueden combinar?**
		
			Aquí hay un concepto que separa a un arquitecto de un administrador: **Multi-AZ en Réplicas de Lectura.**
			
			Las réplicas de lectura, por sí solas, **no tienen failover automático**. Si una réplica de lectura cae, se desconecta y punto. Pero, ¿Qué pasa si esa réplica es vital para tu aplicación?
			
			-  Puedes configurar **Multi-AZ para tu réplica de lectura**.
			-  Esto significa que tu réplica de lectura tendrá su propia "standby" (su propio Multi-AZ). Si la réplica falla, el failover ocurre internamente dentro de esa réplica.

	**Nota para tu diseño:** No te obsesiones con el número máximo. El límite de 15 es raramente alcanzado. En arquitecturas reales, más allá de 3 o 4 réplicas, empiezas a tener problemas de **lag de replicación** (demasiada carga intentando copiar datos desde la principal). Si necesitas más, el diseño suele cambiar hacia **Amazon Aurora**, que maneja esto de forma mucho más eficiente porque separa el cómputo del almacenamiento.

	-  **Diseño para la recuperación ante desastres (DRP)**
	
		Un error común de nivel junior es tratar el "Disaster Recovery" y la "Alta Disponibilidad" como lo mismo. Como arquitecto, debes separarlos mediante dos métricas clave:
		
		-  **RPO (Recovery Point Objective):** ¿Cuántos datos estamos dispuestos a perder? (¿Minutos? ¿Horas?)
		-  **RTO (Recovery Time Objective):** ¿Cuánto tiempo podemos estar fuera de servicio? (¿Segundos? ¿Horas?)
		
		El diseño de DR no busca evitar fallos, sino garantizar que la empresa pueda operar después de un desastre regional. Amazon RDS ofrece dos caminos arquitectónicos diferenciados por costo y velocidad de recuperación.
		
		-  **A. Estrategia activa: Réplicas de lectura entre regiones**
		
			Es la opción de **bajo RTO (recuperación en segundos/minutos)**. Ideal para sistemas críticos donde el tiempo de inactividad tiene un impacto financiero directo.
			
			-  **Funcionamiento:** Mantienes una instancia de base de datos secundaria en una región distinta.
			-  **Capacidad:** A diferencia de la instancia _Standby_ (Multi-AZ), esta instancia está **activa**. Atiende tráfico de consulta (`SELECT`) en la región secundaria, lo cual aprovechas para mejorar el rendimiento local.
			-  **Failover:** Si la región primaria falla, promocionas manualmente la réplica de lectura a base de datos principal.
			-  **Nota técnica:** No es compatible con SQL Server.
		-  **B. Estrategia pasiva: Respaldos replicados (Cross-Region Backups)**
		
			Es la opción de **bajo costo (optimización de presupuesto)**. Ideal para sistemas con RTO flexible o cuando el presupuesto es limitado.
			
			-  **Funcionamiento:** Amazon RDS automatiza la copia de instantáneas (_snapshots_) y registros de transacciones (_logs_) hacia otra región.
			-  **Recuperación:** En caso de desastre, utilizas los respaldos almacenados en la región secundaria para aprovisionar una **nueva instancia** desde cero.
			-  **Trade-off:** El RTO es alto, ya que debes esperar a que la nueva infraestructura se despliegue y los datos se restauren. El RPO depende de la frecuencia de tus respaldos (puedes restaurar a un punto en el tiempo, típicamente con una granularidad de 5 minutos).
	-  **Gestión de costos y ciclo de vida**
	
		El diseño de una base de datos no termina en su despliegue, sino en su optimización financiera. Para entornos profesionales, aplica estos principios:
		
		1. **Instancias reservadas (RIs):** Para las bases de datos de producción que tienen una carga base constante y predecible, el uso de RIs es obligatorio. El compromiso de 1 a 3 años puede reducir el TCO (Total Cost of Ownership) hasta en un 70%.
		2. **Automatización de "Stop/Start":** En entornos de `Dev` o `Test`, no existe ninguna justificación técnica para mantener la instancia encendida 24/7. Debes implementar scripts automatizados que detengan las instancias fuera de horario laboral.
		3. **Instantáneas manuales vs. Automáticas:**
		
		    -  **Automáticas:** RDS las gestiona; tienen periodo de retención. Úsalas para la operativa diaria.
		    -  **Manuales:** Las disparas tú para hitos específicos (ej. antes de un despliegue mayor o migración). **No expiran**. Debes tener cuidado porque incrementan tus costos de almacenamiento si no las limpias periódicamente.
-  **Amazon RDS Custom: Punto medio arquitectónico**

	Amazon RDS Custom es una solución de base de datos gestionada diseñada para aplicaciones que requieren acceso al sistema operativo o configuraciones de software personalizadas que RDS estándar no permite. **Es el puente entre la automatización de RDS y el control total de EC2.**
	
	**El problema que resuelve**
	
	En un RDS estándar, AWS gestiona el sistema operativo, los parches y el software de la base de datos por ti. Tú no tienes acceso a la consola del servidor (SSH/RDP). Esto es ideal para el 90% de las aplicaciones, pero genera un conflicto si tienes:
	
	-  **Software heredado (Legacy):** Aplicaciones que requieren drivers específicos, agentes de monitoreo o antivirus instalados en el SO.
	-  **Requisitos de parcheo específicos:** Necesitas instalar un parche de Oracle o SQL Server que AWS aún no ha certificado o liberado.
    
	**Cómo funciona: La "Flexibilidad con redes de seguridad"**
	
	RDS Custom te da los privilegios administrativos (derechos de `root` o `sysadmin`) sobre el sistema operativo, pero mantiene la automatización de la infraestructura.
	
	1. **Bring Your Own Media (BYOM):** Tú descargas los medios de instalación oficiales del proveedor (Oracle o SQL Server) y los subes a un bucket de S3. RDS Custom utiliza esos medios exactos para instalar la base de datos.
	2. **Acceso al SO:** Tienes acceso total mediante SSH o RDP al servidor (una instancia EC2 bajo el capó). Esto te permite instalar cualquier software necesario.
	3. **Automatización pausable:** RDS Custom se encarga de las tareas pesadas (backups, recuperación ante desastres), pero te permite "pausar" la automatización. Esto es vital cuando necesitas realizar una intervención manual profunda en el SO sin que AWS intente "arreglar" o interferir con tus cambios.
	
	**Nota del arquitecto: ¿Cuándo usar qué?**
	
	1. **Usa siempre RDS Estándar** si es posible. La automatización es el valor real de la nube; cualquier intervención manual (incluso en RDS Custom) aumenta la probabilidad de error humano y el riesgo de seguridad.
	2. **Usa RDS Custom solo cuando sea estrictamente obligatorio.** Es decir, si la aplicación que vas a migrar requiere un agente de terceros en el SO o una versión específica de la base de datos que RDS no soporta.
	3. **Usa EC2 solo si RDS Custom no cumple los requisitos.** Esto ocurre en escenarios extremadamente raros o cuando necesitas configuraciones de red o almacenamiento no soportadas ni siquiera por la capa de automatización de RDS Custom.
	    












