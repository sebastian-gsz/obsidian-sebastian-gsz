![[barra.gif]]

> Pero veamos otras razones de por qué, como arquitectos, líderes técnicos o desarrolladores sénior, vamos a recomendar Amazon RDS. Entonces, por un lado, los beneficios es que me voy a ahorrar tiempo en tareas que en on-premise suelen consumir tiempo que, solemos decirlo eso, que es tiempo que no genera valor de negocio. O sea, ser un experto haciendo los respaldos, llevando las cintas, moviendo esa cinta a más de 5 km... Ser experto en eso no es un diferenciador de negocio. En los negocios que tienen la misma línea, pensemos en dos bancos, el que hagas muy buenos respaldos no te hace mejor banco que el otro. Entonces, uno de los beneficios de Amazon RDS es que nos reducimos esas tareas que no tienen diferenciador. Lo vamos a ver más adelante con las características, como esta parte, decíamos, de los respaldos o las recuperaciones.

"Cómo arquitectos, líderes técnicos o desarrolladores, ahorrar tiempo en tareas que en on-premise suelen consumir tiempo que, solemos decirlo eso, que es tiempo que no genera valor de negocio. Entonces, uno de los beneficios es que nos reducimos esas tareas que no tienen diferenciador." Busco tener una mentalidad de consultor para expresarme en una idea o concepto de rol de como mi presencia conduce al cliente a tomar  medida a ese diferenciador de negocio. 

> Muy bien, entonces, aquí les comparto esta historia de uno de nuestros clientes, que está a nivel mundial. Es una plataforma de hospedaje o alojamiento. Ellos tienen, por un lado, millones de clientes que son dueños de sus propias casas o departamentos o villas, incluso, que ofrecen a otros usuarios para que puedan tener un hospedaje en otra ciudad. Y entonces, ¿aquí qué pasa? Bueno, la necesidad de la base de datos es para escrituras. Ok, pues ya tuvimos un millón de escrituras para tener dados de alta todos estos sitios para hospedarse. Pero la mayor demanda viene de los otros millones de clientes que están buscando y dicen: "yo quiero ir a tal ciudad de vacaciones", y entonces empiezan a hacer una búsqueda de opciones más económicas que cumplan con sus necesidades, 2, 3 habitaciones, tales amenidades... Entonces, ahí está la mayor demanda. 
>
  >Entonces, ¿Qué pasaba con ese cliente? Bueno, ellos no estaban todavía en AWS, estaban en on-premise y, como ya vimos, ya compraron sus servidores y no los pueden hacer crecer de un minuto a otro. Entonces, si viene una temporada alta de vacaciones, que ya saben qué fechas son, lo que se requiere aquí es escalar para la parte de consultas. Entonces, eso en on-premise no se puede hacer. A menos que compre esos servidores, pero decíamos, en temporada donde no se ocupan tantas consultas, pues tú estás pagando por esos servidores, aunque los estés ocupando al 10, 20%. Entonces, en la Nube tenemos esta gran ventaja. Se puede, por ese período, escalar la base de datos. Particularmente, la parte, decíamos, de lecturas, va a ser muy sencillo, lo vamos a ver más adelante, por ahí, en las demostraciones. 
>
>Y entonces, ese fue el desafío que quería cubrir este cliente. ¿Y entonces qué hicimos? Bueno, lo que hicimos fue migrar su base de datos, que ellos ya ocupaban, inteligentemente, MySQL, para no pagar licencias y se migró hacia el servicio de Amazon RDS para MySQL. Otra opción pudo haber sido migrar a instancias de EC2 que adentro tuviera instalado el MySQL. Pero entonces, hay muchas tareas administrativas que implicarían tiempo. Las cuales en Amazon RDS se reducen. Porque yo al servicio le doy las características, me crea la base de datos y todo lo demás, a través de la Consola, va siendo muy fácil llevar esta administración.

-  Aquí lo que quiero es comprender ¿Cómo migrar de un EC2 MySQL a RDS? 

	Para un arquitecto o líder técnico, la capacidad de articular una estrategia de migración no es solo saber qué herramientas usar, sino **explicar el valor de negocio** detrás de cada fase.
	
	Cuando estés en una entrevista, evita describir la migración como un simple "mover datos de A a B". En su lugar, usa un lenguaje enfocado en **reducción de deuda técnica, optimización de costos (TCO) y agilidad operativa.**
	
	Aquí tienes cómo estructurar y expresar estas dos fases de manera profesional.
	
	### Fase 1: Rehost (o Lift-and-Shift optimizado)
	
	**Concepto:** El objetivo aquí es el _Time-to-Market_. Quieres salir de tu centro de datos (on-premises) lo antes posible con el menor riesgo de cambios en el código de la aplicación.
	
	- **Tu discurso en una entrevista:**
	    
    > 	"Para aplicaciones con limitaciones de tiempo o complejidad alta, optamos por una estrategia de _Lift-and-Shift_ hacia RDS. Esto nos permite eliminar el _undifferentiated heavy lifting_ (el trabajo pesado no diferenciado) de gestionar el hardware y la infraestructura física de la base de datos, obteniendo beneficios inmediatos como backups automatizados y alta disponibilidad (Multi-AZ), sin requerir una refactorización mayor del código de la aplicación."
	    
	- **Puntos clave que debes mencionar:**
	    
	    - **Continuidad:** Mantenemos la lógica de negocio intacta.
	        
	    - **Velocidad:** Migración en horas o días, no meses.
	        
	    - **Quick Wins:** Ganamos resiliencia y escalabilidad sin cambiar el motor.
	        
	
	### Fase 2: Modernización (Replatforming / Re-architecting)
	
	**Concepto:** Una vez que ya estás en la nube (la presión del tiempo ha bajado), buscas eficiencia. Aquí eliminas costos de licencias comerciales (como Oracle o SQL Server) y te mueves hacia motores nativos de nube o _open-source_.
	
	- **Tu discurso en una entrevista:**
	    
    > 	"Una vez estabilizada la carga de trabajo en la nube, la fase de modernización es clave para la salud financiera del proyecto. Aquí es donde atacamos la deuda técnica y los costos de licenciamiento, migrando hacia motores de código abierto como PostgreSQL o MySQL, o adoptando Amazon Aurora si el caso de uso requiere una arquitectura nativa de nube de alto rendimiento. Para minimizar el riesgo en esta conversión, utilizamos herramientas como AWS DMS y el _Schema Conversion Tool (SCT)_, que automatizan la conversión de procesos almacenados y tipos de datos exclusivos, permitiéndonos realizar una transición segura y predecible."
	    
	- **Puntos clave que debes mencionar:**
	    
	    - **Optimización de costos:** Eliminación de _vendor lock-in_ y costos de licencias (BYOL es solo un puente temporal).
	        
	    - **Eficiencia:** Aprovechamiento de motores optimizados para la nube (Aurora).
	        
	    - **Automatización:** Uso de herramientas (DMS/SCT) para convertir esquemas heterogéneos.
	        
	
	### El "puente" profesional: BYOL (Bring Your Own License)
	
	Es importante saber explicar el **BYOL** no como un "fin", sino como una herramienta de transición.
	
	- **Cómo expresarlo:**
	    
    > 	"Entendemos que las licencias son inversiones a largo plazo. El modelo _Bring Your Own License_ (BYOL) es nuestra estrategia de transición para proteger la inversión actual de la empresa, permitiéndonos migrar a la nube ahora y planificar la modernización hacia open-source en una fase posterior, cuando los contratos de licencia actuales expiren o necesiten renovación."
	    
	
	### Resumen de vocabulario técnico para tu búsqueda de empleo:
	
	|**En lugar de decir...**|**Di esto...**|
	|---|---|
	|"Mover el servidor a la nube"|"Migrar hacia un servicio gestionado para reducir la carga operativa."|
	|"Ahorrar dinero en licencias"|"Optimizar el Costo Total de Propiedad (TCO) y reducir el vendor lock-in."|
	|"Cambiar el motor"|"Modernizar el stack tecnológico hacia soluciones nativas de nube."|
	|"Arreglar los tipos de datos"|"Automatizar la conversión de esquemas mediante SCT."|
	
	**Consejo de aprendizaje:**
	
	En tu documentación, mantén siempre esta distinción:
	
	1. **Fase 1 (RDS):** Te enfocas en **Operaciones** (hacer que la DB sea gestionada, segura y resiliente).
	2. **Fase 2 (Modernización):** Te enfocas en **Estrategia** (hacer que la DB sea económica, ágil y flexible).

> Cuál es el manejador

En bases de datos cloud como RDS hablamos de cuales pueden llegar a ser los manejadores de nuestros requerimientos. 

> La selección de la clase de instancia determina la capacidad de procesamiento y memoria. Al no existir una fórmula matemática estática, el dimensionamiento debe basarse en métricas de rendimiento actuales, aprovechando la elasticidad de la nube para escalar verticalmente u horizontalmente según la demanda real.

> Es técnicamente posible hospedar múltiples bases de datos (esquemas) en una sola instancia de RDS (ej. una instancia MySQL con 10 esquemas distintos). Sin embargo, la decisión de hacerlo no debe basarse solo en costos, sino en la **estrategia de gestión de riesgos**.

-  **Recomendación Arquitectónica:**

	- **¿La consolidación ahorra costos?** Sí, en entornos de desarrollo/pruebas donde el uso es bajo. Compartes los recursos (CPU/RAM) y el costo de la licencia/infraestructura.
	    
	- **¿La consolidación es segura para producción?** Generalmente, **no**.
	    
	    - **El problema del "Vecino Ruidoso" (Noisy Neighbor):** Si la Aplicación A tiene un pico de consultas masivo, degradará el rendimiento de la Aplicación B, aunque sean procesos independientes.
	        
	    - **Radio de explosión:** Si el motor de la base de datos falla, o si cometes un error administrativo al ejecutar una consulta destructiva en la instancia, **todas las aplicaciones se caen**.
	        
	    - **Multi-AZ no resuelve esto:** Multi-AZ es una solución de **alta disponibilidad** (recuperación ante desastres a nivel de zona). Si tu instancia se corrompe o requiere un reinicio por configuración, Multi-AZ no aísla una base de datos de otra; toda la instancia se ve afectada.
	        
	
	
	
	- **Entornos de producción:** Utiliza el principio de **desacoplamiento total**. Cada microservicio o aplicación debe tener su propia instancia de base de datos. Esto permite que el equipo de la Aplicación A pueda actualizar, parchear o escalar su base de datos sin coordinar con el equipo de la Aplicación B.
	    
	- **Entornos de desarrollo:** La consolidación es aceptable para optimizar costos.

> AWS Step Functions es un servicio de orquestación **serverless** para flujos de trabajo basados en estados (_state machines_). No es solo "código", es el "director de orquesta" que gestiona el orden, el tiempo y los errores de una serie de pasos.
>
> A diferencia de ejecutar una función Lambda aislada, Step Functions mantiene el **estado** del proceso. Si un paso falla, el orquestador sabe exactamente dónde detenerse, puede intentar 
> reintentar automáticamente o ejecutar un flujo de compensación (rollback).

-  Los dos mundos de uso:

	**A. Flujos de Negocio (Business Workflows):** Aquí el proceso es de larga duración y a menudo requiere una decisión humana o una espera externa.
	
	- _Ejemplo:_ Proceso de aprobación de créditos.
	    
	    - Paso 1: Recibir solicitud.
	        
	    - Paso 2: Invocar Lambda para validar crédito.
	        
	    - Paso 3: **Esperar** (puede durar días) a que un humano apruebe.
	        
	    - Paso 4: Si se aprueba, enviar correo. Si se rechaza, notificar.
	        
	    - Step Functions "recuerda" que la solicitud está en pausa sin consumir cómputo.
	        
	
	**B. Flujos de Infraestructura/DevOps (Infrastructure as Code - IaC):** Es el uso que mencionaba el instructor en la lección. Se utiliza para automatizar la gestión del ciclo de vida de los recursos.
	
	- _Ejemplo:_ Automatización de despliegue efímero (testing).
	    
	    1. **Paso 1:** Invocar `CreateDBInstance` en RDS.
	        
	    2. **Paso 2:** Esperar un "Wait state" (polling) hasta que la base de datos pase a estado `Available`.
	        
	    3. **Paso 3:** Si falla, notificar a Slack (gestión de errores).
	        
	    4. **Paso 4:** Si tiene éxito, ejecutar el script de migración/población de datos.
	        
	    5. **Paso 5:** Tras 4 horas, ejecutar `DeleteDBInstance` para evitar costos (limpieza).
	        
	
	#### ¿Por qué usar Step Functions y no solo un script en un servidor?
	
	- **Gestión de errores nativa:** No tienes que programar los `try/catch` de cada paso; el orquestador gestiona los reintentos.
	    
	- **Visibilidad:** Tienes una consola visual que te muestra exactamente en qué paso del proceso está fallando tu despliegue o tu negocio.
	    
	- **Escalabilidad:** Al ser serverless, puede orquestar miles de ejecuciones simultáneas sin que tú gestiones la capacidad del orquestador.
	    
	
	En resumen: Step Functions es el servicio que elimina la "fragilidad" de los scripts de automatización manuales, convirtiéndolos en procesos resilientes y auditables.
-  **Conceptos "Trampa" (Clave para entrevistas)**

	A. Multi-AZ (Alta Disponibilidad) vs. Réplicas de Lectura (Escalabilidad)
	
	Es muy común confundirlos. Ten claro esto:
	
	- **Multi-AZ:** Es para **redundancia**. Si la instancia principal falla, el sistema hace _failover_ automáticamente. No puedes usar la instancia de standby para consultas; está ahí solo por "seguridad".
	- **Réplicas de lectura:** Son para **rendimiento**. Descargan la carga de lectura de la instancia principal. Además, pueden usarse para acercar los datos a usuarios en otras regiones.
	    
	
	B. El dilema de las conexiones (RDS Proxy)
	
	Cuando los microservicios escalan, el mayor problema no es la CPU, sino el **agotamiento de conexiones**.
	
	- **El problema:** Cada instancia tiene un límite máximo de conexiones. Si tienes 1,000 Lambdas tratando de conectarse, la DB colapsa.
	- **La solución:** RDS Proxy actúa como un "intermediario inteligente". Agrupa las conexiones, permitiendo que miles de clientes compartan un número pequeño de conexiones reales hacia la base de datos. Además, hace el _failover_ más rápido al conectarse directamente a la nueva instancia sin esperar a que el DNS se propague.














