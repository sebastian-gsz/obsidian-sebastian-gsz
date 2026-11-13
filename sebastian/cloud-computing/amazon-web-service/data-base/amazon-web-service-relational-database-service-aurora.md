
![[barra.gif]]

Amazon Aurora es una base de datos relacional de alto rendimiento diseñada específicamente para la nube, combinando la disponibilidad y la sencillez de las bases de datos comerciales tradicionales con la rentabilidad y flexibilidad del código abierto (compatible con MySQL y PostgreSQL).

**Arquitectura y ventajas operativas**

-  **Almacenamiento auto-gestionado:** A diferencia de las bases de datos tradicionales, Aurora desacopla el cómputo del almacenamiento. El almacenamiento crece automáticamente hasta 128 TiB sin necesidad de aprovisionar capacidad por adelantado.
-  **Resiliencia distribuida:** Replica los datos seis veces en tres zonas de disponibilidad (AZs) distintas, lo que permite tolerar la pérdida de dos copias sin impacto en la disponibilidad de escritura y de tres copias sin impacto en la lectura.
-  **Rendimiento optimizado:** Ofrece hasta cinco veces el rendimiento de MySQL estándar y tres veces el de PostgreSQL, gracias a su motor de almacenamiento distribuido diseñado para trabajar con logs, eliminando el overhead de escritura de las bases de datos tradicionales.
-  **Réplicas de lectura de baja latencia:** Utiliza un endpoint común para réplicas que permite el escalado horizontal de lectura. La replicación ocurre en milisegundos, garantizando una consistencia de lectura extremadamente rápida en todo el clúster.
-  **Serverless:** Ofrece la opción _Aurora Serverless_, que escala la capacidad de cómputo automáticamente hacia arriba o hacia abajo en función de la demanda real de la aplicación, optimizando costos para cargas de trabajo impredecibles.

-  **[Documentación ](https://docs.aws.amazon.com/rds/)**

![[barra.gif]]

 -  **Arquitectura de Clúster en Aurora**

	La arquitectura de Aurora rompe con el modelo tradicional de bases de datos al desacoplar el procesamiento (cómputo) del almacenamiento. Un **clúster de base de datos** en Aurora se compone de dos capas independientes que trabajan en conjunto para garantizar disponibilidad, rendimiento y escalabilidad.
	
	-  **A. Capa de Cómputo (Instancias)**
	
		El clúster maneja el tráfico mediante roles específicos de instancias:
		
		-  **Instancia primaria (Escritura):** Existe una única instancia primaria responsable de procesar todas las operaciones de lectura y escritura. Es el "corazón" del clúster; aplica los cambios y los sincroniza con la capa de almacenamiento subyacente.
		-  **Réplicas de lectura:** El clúster soporta hasta 15 réplicas de lectura. Estas instancias son de solo lectura y reciben actualizaciones en tiempo real desde la primaria. Sirven para dos propósitos críticos:
		
		    -  **Balanceo de carga:** Permiten escalar horizontalmente las consultas de lectura sin sobrecargar la instancia primaria.
		    -  **Alta Disponibilidad (Failover):** Si la primaria falla, Aurora promueve automáticamente una de estas réplicas para que asuma el rol de primaria.
	-  **B. Capa de Almacenamiento (Volumen de Clúster)**
	
		El volumen del clúster es un sistema de almacenamiento distribuido, compartido por todas las instancias del clúster (tanto la primaria como las réplicas):
		
		-  **Replicación y resiliencia:** Los datos se replican automáticamente en 6 copias, distribuidas a través de 3 Zonas de Disponibilidad (AZ). Esto garantiza que el clúster sobreviva a la pérdida de una AZ completa sin pérdida de datos.
		-  **Escalabilidad automática:** El volumen crece de manera dinámica y automática desde 10 GB hasta 128 TB a medida que se ingieren datos, eliminando la necesidad de pre aprovisionar almacenamiento.
	
	-  **Rendimiento y diferenciadores técnicos**
	
		Aurora está diseñada para ofrecer rendimiento de motor comercial con la rentabilidad de motores de código abierto (es compatible nativamente con MySQL y PostgreSQL).
		
		-  **Rendimiento E/S:** Al utilizar un almacenamiento distribuido y optimizado, Aurora es hasta 5 veces más rápida que MySQL estándar y 3 veces más rápida que PostgreSQL. Se reduce drásticamente la latencia de Entrada/Salida (E/S).
		-  **Gestión de  consistencia y bloqueos:**
		    
		    -  Aurora mantiene **consistencia estricta** en las escrituras mediante bloqueos a nivel de transacción en la instancia primaria.
		    -  Para las réplicas de lectura, emplea un modelo de **consistencia eventual**. El retraso de replicación (lag) suele ser de unos pocos milisegundos, ofreciendo un equilibrio óptimo entre alto rendimiento y frescura de los datos.
		-  **Recuperación rápida (Failover):** A diferencia de RDS tradicional, donde un failover y recuperación de un fallo puede tardar minutos, la promoción de una réplica a primaria en Aurora se realiza típicamente en menos de 30 a 60 segundos gracias a que el almacenamiento ya está sincronizado a nivel de clúster.
		    
		**Seguridad**
		
		Aurora garantiza la protección de los datos cumpliendo con los estándares empresariales:
		
		-  **Cifrado integral:** Soporta cifrado en reposo y en tránsito gestionado a través de AWS Key Management Service (KMS).
		-  **Control de Acceso:** Integración nativa con AWS Identity and Access Management (IAM) para autenticación de bases de datos, permitiendo políticas de acceso granulares sin gestionar credenciales dentro del propio motor.
	-  **Dimensionamiento y tipos de instancia**
	
		A diferencia de RDS estándar, donde el dimensionamiento está estrechamente acoplado a la capacidad del disco y la potencia de la instancia, Aurora divide el cómputo en dos modalidades de aprovisionamiento estratégicas:
		
		-  **Instancias aprovisionadas (familias M, C, R, X):** Operan de forma similar a las clases de instancia tradicionales. Al estar el almacenamiento desacoplado, la elección de la instancia se basa exclusivamente en las necesidades de procesamiento en memoria y CPU de la carga de trabajo actual. Las familias optimizadas para memoria (R y X) son el estándar para producción debido al comportamiento del búfer de caché compartido de Aurora.
		-  **Aurora Serverless v2:** Elimina la necesidad de dimensionar instancias por anticipado. El cómputo escala de forma dinámica e instantánea en pasos de **ACU (Aurora Capacity Units)**. Cada ACU equivale a aproximadamente 2 GiB de memoria RAM con su respectivo cómputo y capacidad de red proporcionales. Es la opción recomendada para cargas de trabajo impredecibles, picos estacionales marcados o entornos de desarrollo de alta fluctuación, optimizando el costo operativo al pagar exclusivamente por la capacidad consumida por segundo.
	-  **Estrategias de almacenamiento distribuido**
	
		En Amazon Aurora desaparecen los conceptos de aprovisionamiento de discos gp2, gp3, io1 o io2. El almacenamiento se abstrae en un **volumen de clúster virtual y elástico** gestionado por AWS.
		
		-  **Arquitectura auto-gestionada y elástica:** El almacenamiento escala automáticamente desde un mínimo inicial hasta un límite de 128 TiB (dependiendo de la región) sin intervención humana, sin ventanas de mantenimiento y sin degradación de rendimiento. Solo se paga por los gigabytes consumidos.
		-  **Resiliencia distribuida (6 copias en 3 AZs):** Aurora replica cada bloque de datos de forma síncrona seis veces a lo largo de tres zonas de disponibilidad (AZ) distintas, dentro de un sistema de almacenamiento basado en SSD. El sistema está diseñado para tolerar la pérdida de hasta dos copias de datos sin afectar la disponibilidad de escritura, y hasta tres copias sin afectar la disponibilidad de lectura, ejecutando procesos de auto reparación continua en segundo plano.
		    
		**Criterio de costo (Standard vs. I/O-Optimized):**
		
		-  **Aurora Standard:** Recomendado para cargas de trabajo con un volumen de operaciones de lectura/escritura moderado o predecible. El costo se divide entre almacenamiento base e IOPS consumidas.
		-  **Aurora I/O-Optimized:** Elimina el costo por IOPS individuales, ofreciendo un precio fijo por almacenamiento y cómputo. Es la opción idónea para aplicaciones intensivas en datos (OLTP masivos) donde los costos de operaciones de entrada y salida superan el 25% del costo total de la base de datos, garantizando predictibilidad financiera.
	-  **Gestión de cambios y escalabilidad de clúster**
	
		El desacoplamiento de almacenamiento permite que la gestión de cambios y el escalado horizontal ocurran en fracciones de tiempo inalcanzables para RDS estándar.
		
		-  **Escalado de lectura sin impacto de disco:** Al añadir réplicas de lectura, estas no requieren escribir los datos en un disco local local secundario; leen directamente del volumen de clúster virtual compartido. El retraso de replicación (_replica lag_) se reduce a milisegundos, ya que solo se transmiten actualizaciones de metadatos para refrescar las páginas en la memoria caché de la réplica.
		-  **Modificaciones en caliente:** Los cambios de tamaño de instancias aprovisionadas se ejecutan minimizando el impacto gracias a la arquitectura de clúster. Si cuentas con réplicas, AWS modifica primero las réplicas y luego ejecuta un _failover_ controlado de segundos para actualizar la instancia primaria.
	-  **Estrategias de supervisión y observabilidad**
	
		La observabilidad en Aurora hereda las herramientas de RDS pero introduce métricas de nivel de clúster indispensables para el diagnóstico.
		
		-  **Baselines de infraestructura clúster:** Además de las métricas de CPU y memoria de CloudWatch, en Aurora es crítico monitorear métricas específicas del almacenamiento distribuido como `VolumeBytesUsed` (almacenamiento real del clúster) y `AuroraReplicaLag` (retraso de las réplicas respecto al escritor).
		-  **Supervisión mejorada y Performance Insights:** Se mantienen como los estándares para el análisis de hilos del sistema operativo y eventos de espera de consultas SQL. En Aurora, Performance Insights permite identificar si los cuellos de botella provienen de la capa de cómputo o de la latencia de red hacia el almacenamiento distribuido.
	-  **Gestión de conexiones y enrutamiento endpoints**
	
		Aurora no expone un único canal de comunicación; introduce una capa de abstracción de red mediante múltiples puntos de enlace (**endpoints**) que gestionan el tráfico de manera inteligente a nivel de arquitectura.
		
		- **Cluster Endpoint (Writer):** Apunta siempre a la instancia primaria del clúster (la única que permite `INSERT/UPDATE/DELETE`). Si ocurre un desastre y otra instancia toma el rol de escritora, este endpoint actualiza su puntero DNS automáticamente.
		- **Reader Endpoint:** Balancea las conexiones de carga de lectura (`SELECT`) de forma equitativa entre todas las réplicas de lectura activas en el clúster.
		- **Custom Endpoints:** Permite agrupar instancias específicas del clúster para propósitos determinados. Es la mejor práctica para aislar el tráfico (ej. un endpoint personalizado que agrupa dos instancias de alto rendimiento exclusivas para procesos analíticos pesados o herramientas de BI, evitando que afecten al Reader Endpoint de los usuarios web).
		- **RDS Proxy con Aurora:** Aunque Aurora gestiona mejor las conexiones que los motores tradicionales, RDS Proxy sigue siendo mandatorio en entornos serverless (Lambda). En Aurora, RDS Proxy reduce el tiempo de _failover_ a menos de 5 segundos, ya que mantiene las conexiones activas en la capa de red mientras conmuta el flujo hacia la nueva instancia escritora tras bambalinas.
	-  **Gobernanza de acceso e identidad**

		Mantiene paridad absoluta con los controles de seguridad establecidos para RDS estándar, operando bajo las mismas políticas de menor privilegio.
		
		-  **Autenticación e inyección de secretos:** Se prioriza el uso de tokens de IAM vía STS para conexiones nativas desde microservicios. Para escenarios de credenciales fijas obligatorias (herramientas de BI como Power BI o Tableau accesando vía gateways), se mantiene el uso de AWS Secrets Manager con rotación orquestada por funciones Lambda para invalidar contraseñas comprometidas.
		-  **Aislamiento perimetral:** Las instancias de Aurora y su volumen virtual residen estrictamente en subredes privadas dentro de la VPC, utilizando Security Groups específicos para restringir el acceso únicamente a los recursos autorizados del clúster de aplicaciones.
	-  **Diseño para alta disponibilidad y resiliencia**

		Aurora redefine por completo el concepto de Alta Disponibilidad (HA). **No existe el concepto de instancia pasiva Standby (Multi-AZ de RDS estándar)**; todos los nodos secundarios computan y generan valor.
		
		-  **Réplicas como objetivos de failover activos:** En Aurora, las réplicas de lectura (puedes desplegar hasta **15 instancias**) cumplen una doble función: escalan la lectura horizontalmente en múltiples AZs y actúan simultáneamente como nodos de respaldo ante fallos.
		-  **Mecanismo de conmutación automatizado:** Si la instancia primaria falla, Aurora promueve una de las réplicas de lectura existentes a estado primario en un proceso que toma entre 15 y 30 segundos. La selección se basa en prioridades definidas por el arquitecto (clases de nivel de promoción de 0 a 15). Si no existen réplicas en el clúster, Aurora intentará crear una nueva instancia primaria automáticamente, pero el RTO aumentará a minutos.
	-  **Diseño para la recuperación ante desastres con Aurora Global Databases**
	
		Para estrategias de continuidad de negocio globales que requieren resiliencia ante la pérdida total de una región de AWS, el uso de réplicas de lectura lógicas tradicionales es sustituido por **Aurora Global Databases**.
		
		- **Estrategia activa multirregión:** Permite conectar un clúster primario en una región con clústeres secundarios en hasta cinco regiones distintas.
		- **Replicación a nivel de almacenamiento:** A diferencia de RDS estándar, que lee los registros de transacciones (_binlogs_) a nivel de software para replicar (generando latencia y penalizando el rendimiento del escritor), Aurora Global Databases replica los datos **directamente desde las tarjetas del almacenamiento distribuido**.
		- **Métricas DR óptimas:** La replicación a nivel físico garantiza un **RPO de menos de 1 segundo** y un **RTO de minutos**, permitiendo promocionar el clúster de la región secundaria a estado de producción total ante un desastre regional sin impacto en el rendimiento del clúster origen.






































































