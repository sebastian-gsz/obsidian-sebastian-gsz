El entrevistador no solo quiere ver "qué" sabes hacer, sino "cómo" entiendes el negocio. Debemos cambiar el enfoque: deja de hablar como un ejecutor técnico (alguien que implementa) y empieza a hablar como un arquitecto de soluciones (alguien que resuelve problemas de negocio).

Hola, soy [Tu Nombre]. Me defino como un **Arquitecto de Soluciones Cloud** en transformar infraestructura en ecosistemas escalables, seguros y eficientes.

A lo largo de mi trayectoria, me he enfocado en migraciones, modernización de entornos legacy hacia la nube. **No me limito a desplegar infraestructura; diseño marcos de gobernanza, automatización y observabilidad que permitan a los equipos de desarrollo innovar con seguridad.**

> Como arquitecto, entiendo que la seguridad y el flujo de tráfico se basan en principios universales, centralizando la gobernanza. El objetivo es siempre el mismo: aislamiento, inspección centralizada y escalabilidad".

![[barra.gif]]

- **Analista de Planificación**

  - **Evolución: De Intranet a Extranet (Ecosistema B2B)**
    - <strong style="color: #ff0000;">Argumento de valor</strong>: "El objetivo era descentralizar la carga administrativa de Cortizo. Antes, todo pasaba por nuestras oficinas. Al pasar a un modelo de extranet, permitimos que los partners (distribuidores, arquitectos) tuvieran autosuficiencia para presupuestar, consultar stock y gestionar sus proyectos, liberando al equipo interno de tareas repetitivas."
    - <strong style="color: #00FF7F;">El detalle técnico/estratégico</strong>: "Implementamos una capa de API segura que permitía a los partners conectar sus propios sistemas de gestión con el nuestro. Esto no solo mejoró la experiencia de usuario, sino que nos dio una visibilidad inaudita sobre la demanda real y futura (predictibilidad de ventas)."

  - **Integración BIM (Digital Twin y Trazabilidad)**
    - **<strong style="color: #ff0000;">Argumento de valor</strong>:** "El reto era la interoperabilidad. En obras grandes con actores como Ferrovial o Ejuca, los cambios en los planos ocurren a diario. La brecha entre el modelo digital (BIM) y la ejecución real siempre generaba sobrecostes."
    - **<strong style="color: #00FF7F;">El detalle técnico/estratégico</strong>:** "Desarrollamos una capa de integración que permitía auditar el estado del proyecto en tiempo real. Cuando un arquitecto modificaba un elemento estructural en el software BIM, nuestra solución APEX validaba automáticamente la disponibilidad de materiales y el impacto presupuestario. Esto garantizó una **trazabilidad total (Audit Trail)**, cumpliendo con las normativas de grandes corporaciones que exigen auditorías de cambios sin margen de error."

  - **Aplicaciones Low-Code y Optimización de Departamentos**

    | **Recursos Humanos** | Portal de Onboarding y Desempeño | Digitalización de evaluaciones 360 y flujo de nuevas contrataciones.
    | **Almacén / Logística** | Gestión de Inventario en Tiempo Real | Reducción de stock obsoleto mediante alertas automáticas de reposición.
    | **Compras** | Portal de Proveedores / Licitaciones | Estandarización de ofertas y comparación automática de costes.
    | **Comercial** | CRM de Oportunidades | Visibilidad del ciclo de vida del cliente desde el lead hasta la post-venta.

    **La clave Senior:** "Cada departamento trabajaba en silos, usando Excels que no se hablaban entre sí. Mi enfoque fue implementar una **fuente única de verdad** (Single Source of Truth). Las aplicaciones Low-code no solo digitalizaron procesos; permitieron que la gerencia viera KPIs en tiempo real sin tener que pedir reportes manuales a cada jefe de departamento."

  - **Automatización de Procesos (Lo que puedes decir que automatizaste)**
    1. **Workflows de Aprobación Jerárquica:** "Automatizamos la cadena de aprobaciones para compras de alto valor. Antes requería correos y firmas físicas; ahora, según el monto, el sistema escala automáticamente al decisor correspondiente vía notificaciones Push/Email."
    2. **Conciliación Automática:** "Automatizamos la conciliación de albaranes de almacén contra pedidos de compra. Si los datos coinciden, la entrada se da por buena; si hay discrepancia, se genera una alerta inmediata al gestor."
    3. **Alertas de Proactividad:** "Implementamos disparadores (triggers) que notifican a los comerciales cuando un proyecto estancado en BIM está a punto de perder su fecha de cierre. Pasamos de una gestión reactiva a una proactiva."

  - **Gobernanza de APEX (La parte de "Seniority" técnica)**

	Cuando te pregunten por esto, no hables de botones, habla de **Ciclo de Vida del Dato y Seguridad**.

     -  **Tu respuesta:** "Gobernar APEX para mí significa asegurar el cumplimiento normativo (Compliance) y la integridad del dato. Implementé un modelo de control de acceso basado en roles (RBAC) granular. Nadie tiene acceso a lo que no necesita.
       
     - **Gestión de Ciclo de Vida:** Controlé qué entornos (Desarrollo, QA, Producción) estaban disponibles y quién podía realizar despliegues (CI/CD).
     - **Seguridad:** Implementé auditorías de acceso: sabía exactamente quién consultó, modificó o exportó información sensible de clientes o proveedores.
     - **Gobernanza de APIs:** Controlé qué servicios externos podían 'hablar' con nuestras bases de datos de Oracle, asegurando que cualquier entrada de datos fuera validada y desinfectada."

        **Un consejo final de oro:**

        Si te preguntan por un momento difícil, di esto: _"Lo más complejo no fue la tecnología, sino gestionar la **resistencia al cambio**. Al principio, los jefes de departamento no querían que sus procesos fueran 'visibles' para la dirección. Tuve que realizar sesiones de evangelización mostrando cómo la automatización les ahorraba 10 horas de trabajo manual a la semana. Una vez que vieron el beneficio directo en su día a día, ellos mismos pidieron más automatizaciones."_

    ![[barra.gif]]

  - **APEX como Middleware: El "API Gateway" Corporativo**

    "En entornos corporativos, tratamos a Oracle APEX no solo como una plataforma de desarrollo visual, sino como nuestro **API Gateway y orquestador de lógica**.

    Lo configuramos usando **ORDS (Oracle REST Data Services)** para exponer servicios RESTful. Básicamente, separé la capa de visualización de la capa de datos. Cuando una aplicación (ya sea móvil, web o de un tercero) necesitaba información, no atacaba la base de datos directamente (eso es un riesgo de seguridad); atacaba un _endpoint_ que yo definí en APEX.

    APEX actuaba como el 'Middleware' porque:
    - **Validaba la integridad:** Antes de tocar un solo dato en la tabla, la lógica de negocio (procedimientos PL/SQL) validaba las reglas transaccionales.
    - **Abstraía la complejidad:** El cliente final (la app) no necesitaba saber si los datos venían de una tabla, de una vista o de una API externa. Para el cliente, todo era un JSON estructurado que yo le entregaba."

    **Tu ventaja competitiva:** **Independencia tecnológica**. Si mañana quieren cambiar el frontend a React o Angular, no tienes que reescribir la lógica de negocio, porque el middleware (APEX/ORDS) ya está hecho.

  - **Omnicanalidad en el Proyecto BIM: "Single Source of Truth"**

    "Para lograr una calidad omnicanal, adopté un enfoque de **arquitectura orientada a servicios (SOA)**. No creé aplicaciones separadas con bases de datos separadas; creé una **'Fuente Única de Verdad' (Single Source of Truth)**.

    La clave fue el diseño de la API:
    - **Data Stateless:** Diseñé los servicios de modo que no guardaran estado. Si el arquitecto desde el software BIM actualizaba una viga estructural, la API de APEX procesaba el cambio, actualizaba la base de datos y disparaba un evento.
    - **Sincronización mediante Webhooks/Event-Driven:** Para que fuera 'tiempo real', implementamos un sistema de eventos. En cuanto el presupuesto de la obra cambiaba en el modelo BIM, la API enviaba un _webhook_ que actualizaba automáticamente los KPIs en los dashboards de los directores y las alertas en los dispositivos de los jefes de almacén.
    - **Consistencia Visual:** Aunque cada usuario veía una interfaz distinta (el arquitecto veía el plano 3D, el administrativo veía una tabla presupuestaria), ambos consultaban el mismo endpoint. Eso garantiza que, si yo muevo una pared en el plano, el coste en el sistema de compras cambia en milisegundos."

  - **El Discurso Senior sobre CI/CD**

        "Para mí, el CI/CD en entornos corporativos, especialmente trabajando con Oracle y APEX, no se trata de velocidad, sino de **garantizar que la estabilidad del sistema nunca se vea comprometida**. Lo gestioné basándome en tres pilares fundamentales:"

        -  Gestión estricta del Ciclo de Vida (Life Cycle Management)

        	"Implementé una segregación clara de entornos: **Desarrollo, QA y Producción**. Nunca permití que un cambio pasara directamente a producción. El código o los cambios en la arquitectura pasaban primero por un proceso de validación en QA, donde realizábamos pruebas de regresión para asegurar que la nueva funcionalidad no rompiera los flujos existentes".
        -  Versionado estricto de APIs (La clave para no romper nada)

        	"Como te comentaba anteriormente, nuestro sistema funcionaba mediante una arquitectura de endpoints. Por tanto, la pieza clave de mi estrategia de CI/CD fue el **versionado estricto (v1, v2)**. Si necesitábamos desplegar una mejora en un endpoint (por ejemplo, en el servicio de `/logistics/realtime-stock`), nunca sobrescribíamos la versión actual. Desplegábamos la v2 en paralelo, permitiendo que las aplicaciones antiguas siguieran funcionando sin interrupción mientras migrábamos los clientes gradualmente".
        -  Gobernanza y Despliegue Controlado

        	"El CI/CD incluía una capa de gobernanza donde yo controlaba **quién podía realizar despliegues**. No era un proceso abierto; el despliegue a producción requería una validación técnica previa, asegurando que la lógica PL/SQL y la seguridad (RBAC) estuvieran correctamente auditadas antes de ser liberadas".

    ![[barra.gif]]

  - **Consejos para "vender" la madurez técnica**
    - **Si te preguntan por qué no usaste herramientas "más modernas" como Node.js o microservicios en la nube:**
      - **Respuesta:** "En Cortizo, priorizamos la **estabilidad y la integridad transaccional**. Oracle tiene una gestión de transacciones (ACID) que es imbatible para entornos industriales de alta criticidad. Mantener la lógica dentro de la base de datos (PL/SQL) y exponerla mediante APEX/ORDS reduce la latencia y los puntos de fallo que tendrías al mover datos entre una base de datos y un servidor de aplicaciones externo."

    - **Si te piden un reto:**
      - **Respuesta:** "El mayor desafío fue el _versionado de la API_. Al ser una arquitectura omnicanal, si cambias un endpoint, rompes todas las aplicaciones. Aprendí a implementar **versionado estricto (v1, v2)**, asegurando que las aplicaciones antiguas siguieran funcionando mientras desplegaba nuevas funcionalidades en la versión v2."

    - **¿Qué herramientas usaste para automatizar esto?**

      "Utilizamos una combinación de scripts de automatización sobre **ORDS (Oracle REST Data Services)** para gestionar los despliegues de los endpoints y procesos de integración dentro del ecosistema Oracle que nos permitían sincronizar los cambios de esquema y lógica de forma controlada, garantizando siempre la integridad transaccional que exige un entorno industrial"

- **Identity and Access Management**

  **"El arquitecto que asumió la responsabilidad de la continuidad, estabilizó el entorno y lo modernizó"**.

  "Me integré en la organización para asumir la responsabilidad de las plataformas de Identidad y Acceso (IAM) en un momento transición, donde era crítico **garantizar la continuidad del servicio** sin interrupciones para el negocio. El entorno ya estaba operativo, pero asegurar la estabilidad, la gobernanza y preparar la infraestructura para los nuevos retos de nube híbrida que venían"
  - **Tus tres pilares de gestión**

        Como Senior, no solo "mantuve" el sistema, lo gestionaste bajo tres pilares:

        - **Estabilización y Control (Continuidad):** "Lo primero fue auditar el estado del entorno (IBM Security Directory Server y WebSEAL). Mi prioridad fue asegurar la alta disponibilidad de los directorios y la robustez de los proxies inversos, garantizando que el servicio de autenticación fuera 100% resiliente para los usuarios finales".
        - **Gobernanza y Orden (La mejora):** "Al tomar el rol, identifiqué que el ciclo de vida de las identidades y los flujos de acceso necesitaban una estructura más clara. Implementé políticas de control de acceso (RBAC) más granulares y aseguré que cada acceso fuera auditable, transformando una gestión que era reactiva en un proceso de gobernanza proactivo".
        - **Evolución Estratégica (Modernización):** "Una vez garantizada la estabilidad, aproveché mi rol para evolucionar la arquitectura hacia un modelo híbrido. Continúe con la federación de identidades (SAML/OIDC), ya sea integrando servicios locales o stack externo como Microsoft Entra ID (Azure)"

    ![[barra.gif]]

  - **Alta Disponibilidad (HA): Eliminación de Puntos Únicos de Fallo**

    Cuando hables de disponibilidad, tu narrativa debe girar en torno a la **redundancia activa y la conmutación automática**.
    - **Arquitectura de Cluster y Replicación:** "Para garantizar que el servicio nunca cayera, mi enfoque fue la redundancia a nivel de nodo. En el caso de los directorios (LDAP), implementamos esquemas de replicación de alta disponibilidad, donde no solo tenemos un 'maestro', sino nodos en modo activo-activo o activo-pasivo con conmutación automática".
    - **Balanceo de Carga (Load Balancing):** "Para la parte de acceso (WebSEAL), utilizamos balanceadores de carga inteligentes. Estos no solo reparten el tráfico, sino que realizan _health checks_ constantes; si un nodo de seguridad deja de responder, el balanceador lo saca de la rotación instantáneamente para que el usuario no perciba ningún error".
    - **Zona de Desastre (Disaster Recovery):** "Más allá de la disponibilidad local, hablamos de resiliencia geográfica. Diseñamos la arquitectura para que, ante una caída total de un centro de datos, el tráfico pueda ser redirigido a un entorno secundario (warm or hot standby), asegurando la continuidad del negocio".

  - **Escalabilidad: Crecer sin romper**

    Aquí debes diferenciar entre escalar verticalmente (poner más potencia) y escalar horizontalmente (poner más nodos), siendo la segunda la que un senior prefiere.
    - **Arquitectura "Stateless" (Sin estado):** "La clave de la escalabilidad es hacer que los componentes sean _stateless_. Diseñé los flujos de autenticación de modo que el servidor no necesite guardar la sesión en su memoria local, sino que use tokens (como JWT o sesiones distribuidas en una caché compartida como Redis). Esto me permite añadir 10 o 100 servidores de seguridad más detrás del balanceador sin cambiar ni una línea de código".
    - **Desacoplamiento (Separación de roles):** "Escalamos separando los planos de control: los _Policy Decision Points_ (donde se decide si alguien entra) y los _Policy Enforcement Points_ (donde se aplica el acceso, como WebSEAL) deben estar desacoplados. Así, si tengo un pico de tráfico, puedo escalar solo los proxies de entrada sin necesidad de replicar toda la lógica de validación pesada".

  - **El toque "Senior": Observabilidad y Gobernanza**

    Un arquitecto sabe que no se puede escalar lo que no se mide. Si te preguntan por escalabilidad, añade este punto, ya que demuestra que piensas en la operación a largo plazo:
    - **Observabilidad (El "Cómo saber si escalamos"):** "Para mí, la escalabilidad va de la mano de la observabilidad. Implementamos dashboards en tiempo real que monitorean la latencia de autenticación y la tasa de error por endpoint. Si la latencia sube por encima de un umbral, el sistema de escalado automático (auto-scaling) puede levantar nuevos contenedores o instancias de WebSEAL de forma proactiva"

  **Resumen para tu entrevista:**

  "Mi estrategia de escalabilidad y disponibilidad se basa en tres principios: **redundancia** para no tener puntos únicos de fallo, **desacoplamiento** para que los componentes puedan crecer de forma independiente, y **observabilidad** para tomar decisiones basadas en datos. En entornos de IAM como el que gestioné, la prioridad siempre fue garantizar la continuidad del servicio sin que el usuario final note que estamos actualizando o escalando la infraestructura".

  **Consejo de cierre:** Si el entrevistador insiste en "**cómo lo hiciste en la práctica**", menciona siempre que el **"criterio de diseño fue la simplicidad"**. Un sistema más complejo de lo necesario es más difícil de hacer escalable.

- **Cloud Engineer**

  "Para este cliente de media, el reto era la **latencia y la integridad**. Tenían una infraestructura on-premise pesada que debíamos migrar a un modelo híbrido para aprovechar la elasticidad de la nube sin sacrificar la calidad de la emisión ni la seguridad de sus activos digitales. El objetivo era habilitar una red que soportara flujos de vídeo de alta tasa de transferencia (bitrate) sin cuellos de botella".
  - **REDES: Arquitectura Hub-and-Spoke (Centro y Radios):**

    "Diseñé una topología **Hub-and-Spoke**. Utilizamos una VPC central (el Hub) que actuaba como el punto de inspección y control, conectado a múltiples VPCs de servicio (los Spoke) donde residían las aplicaciones de procesamiento de media. Esto nos permitió aislar el tráfico y aplicar políticas de firewall centralizadas"
    - **Conectividad Dedicada:** "No confiamos en VPNs públicas para la carga de contenido crítico. Implementamos conexiones dedicadas (Direct Connect/ExpressRoute) para asegurar que la latencia fuera predecible y constante, esencial para la ingesta de media en tiempo real".
    - **Segmentación y Microsegmentación:** "Como parte de la **auditoría**, implementamos una microsegmentación estricta. Separamos el tráfico de gestión del tráfico de datos (media streaming) mediante VLANs y tablas de ruteo específicas en cada zona, asegurando que, ante una vulnerabilidad, el movimiento lateral estuviera bloqueado".

  - **Migración Estratégica (El "Core" de tu experiencia)**

    "En el sector Media, la latencia es crítica. No siempre es eficiente mover toda la carga de trabajo a una región pública de AWS. Implementamos **AWS Outposts** (o zonas de borde) en los DataCenters del cliente. Esto permitió extender la infraestructura de nube hacia el entorno local. **La analogía es correcta**: no somos 'nativos' del datacenter, pero extendemos nuestra gobernanza y servicios de nube ahí donde el cliente nos necesita, eliminando la latencia de red innecesaria".
    - **De VMware a EC2:** "El grueso de la carga de trabajo fue una migración directa de entornos VMware a **Amazon EC2**. No fue un simple 'lift-and-shift'; optimizamos las instancias para las necesidades específicas de cómputo intensivo que requiere la transcodificación de vídeo."
    - **Modernización de Datos:** "El salto cualitativo fue la reestructuración de nuestras bases de datos. Migramos de un SQL Server monolítico _on-premise_ a **Amazon Aurora PostgreSQL**. Esto nos dio la escalabilidad y disponibilidad necesarias para gestionar los metadatos de los activos de _media_, que es información crítica para la auditoría de contenidos."

    **La Planificación por Fases (Metodología de Migración)**

    Nunca digas "hicimos la migración". Di que "Ejecutamos un plan de migración basado en **olas de valor**".
    - **Fase 1: Assessment y Discovery (La foto actual):** "Usamos herramientas de inventario para mapear dependencias. No puedes migrar lo que no conoces".
    - **Fase 2: Landing Zone (La fundación):** "Antes de mover una sola VM, construimos la **Enterprise Landing Zone**. Sin esto, la gobernanza es imposible".
    - **Fase 3: Piloto (Prueba de estrés):** "Migramos una carga de trabajo no crítica para validar la conectividad híbrida y la latencia".
    - **Fase 4: Migración por Olas (Wave Migration):** "Agrupamos aplicaciones por afinidad (ej. todas las apps que se hablan entre sí). Esto minimiza el riesgo de degradación del servicio".
    - **Fase 5: Optimización y Modernización (Post-migración):** "Una vez en la nube, optimizamos costos y rendimiento (ej. el paso a Aurora PostgreSQL)".

    **Metodología de Migración: SQL Server a PostgreSQL**
    - **Evaluación (Assessment):** "Usamos herramientas como el _Database Migration Assessment_ para identificar incompatibilidades de código (SPs, Triggers)".
    - **Conversión de Esquema:** "Utilizamos herramientas de conversión para adaptar el SQL a la sintaxis de PostgreSQL".
    - **Migración de Datos:** "Usamos _Data Migration Service (DMS)_ para una migración online (con replicación continua) para minimizar el tiempo de inactividad (Downtime)".
    - **Validación y Cutover:** "Validación de integridad (suma de filas, tipos de datos) y cambio de DNS en la ventana de mantenimiento".

  - **Gobernanza: El papel de las "Landing Zones"**

    "Para garantizar el gobierno operativo, implementamos **Enterprise Landing Zones** mediante AWS Control Tower y Service Control Policies (SCPs) (Management Groups / Azure Policy). Esto aseguraba que, desde el día uno, cualquier recurso desplegado en AWS cumpliera con nuestras políticas de seguridad, etiquetado y cumplimiento normativo. No podíamos permitirnos 'Shadow IT' en un entorno auditado."

  "La nube es una cuestión de patrones arquitectónicos, no de marcas. El patrón de _Hub-and-Spoke_, la importancia de una _Landing Zone_ y la necesidad de una gobernanza centralizada son universales. He operado en AWS porque el sector Media lo demandaba por su ecosistema de vídeo, pero **los principios de diseño (seguridad, escalabilidad, automatización) son los mismos que aplico en Azure**. De hecho, mi capacidad de traducir estas arquitecturas entre nubes es lo que me permite diseñar soluciones más resilientes."

  ![[barra.gif]]
  - **Alta Disponibilidad: ¿Cómo aseguraste que la red de media no cayera?**

    "La redundancia fue el diseño base. Diseñamos la conectividad híbrida con **multi-homing**: teníamos dos circuitos independientes de proveedores de red diferentes entrando por puntos físicos distintos en el datacenter. Además, implementamos **ruteo dinámico (BGP)** con detección de fallo rápido (BFD), lo que nos permitía que si un enlace fallaba, el tráfico conmutara de forma transparente en milisegundos, sin que el flujo de media se interrumpiera".

  - **AWS-Native, Rendimiento y Gobernanza: ¿Por qué elegiste esta ruta?**

    "En este proyecto, optamos por una estrategia **AWS-Native** no por simplificación, sino por **rendimiento y consistencia**. En el sector de _media_, la fragmentación de la infraestructura penaliza la latencia de extremo a extremo. Al consolidar todo el _stack_ en AWS, se lograba una integración nativa entre nuestros servicios de cómputo y el ecosistema de procesamiento de vídeo, garantizando la calidad de emisión que el cliente exigía."

  - **¿Qué cargas críticas migraron? (El enfoque de infraestructura)**

    Si definimos una carga critica: Se define por tres factores: **consumo de cómputo**, **latencia de almacenamiento** y **disponibilidad de base de datos**.
    - **El Engine de Transcodificación (Ingest & Transcoding):**

      "Migramos el motor de procesamiento de ingesta. No es solo software, es una carga de trabajo de **cómputo intensivo** que toma los feeds de video en crudo y los convierte a múltiples formatos (ABR - Adaptive Bitrate Streaming). En AWS, esto requería instancias de cómputo optimizado (tipo C5/C6i) con auto-scaling agresivo, porque la carga de trabajo es altamente volátil dependiendo de la cantidad de eventos en vivo que se emitieran".

    - **La Base de Datos de Gestión de Activos (MAM - Media Asset Management):**

      "Esta era la carga más crítica a nivel de integridad. Es el 'cerebro' donde residen los metadatos de todos los archivos de video (dónde están, qué licencias tienen, duración, etc.). Migramos esto de SQL Server local a **Amazon Aurora PostgreSQL**. La criticidad aquí era garantizar que la consistencia del dato fuera absoluta; si el MAM cae, los sistemas de emisión no saben qué reproducir".

    - **El Origen de CDN (Content Origin):**

      "Migramos los servidores que actúan como _Origin_ para nuestras redes de distribución de contenido. Estas máquinas deben tener una latencia de E/S (I/O) muy baja y estar conectadas a un almacenamiento altamente eficiente (como Amazon S3 (Azure Private DNS / Azure DNS) o EBS de alto rendimiento) para servir los segmentos de video a la CDN sin que el usuario final experimente búfer"

![[barra.gif]]

- **Cómo defender la Observabilidad**

  "La observabilidad no es un conjunto de herramientas aisladas, es una estrategia unificada bajo el paraguas de **Azure Monitor**. Para que una infraestructura sea realmente profesional, la divido en tres capas:"
  - **Capa de Control y Auditoría (El CloudTrail de Azure):** "Utilizo **Azure Monitor Activity Logs** para auditar todo lo que sucede en el _Control Plane_. Cada llamada a la API, cada creación de recurso o cambio de configuración queda registrado. Esto es crítico para la seguridad y la auditoría; puedo rastrear exactamente quién hizo qué y cuándo."
  - **Capa de Configuración y Compliance (El AWS Config de Azure):** "Para el control de configuración y cumplimiento, uso una combinación de **Azure Policy** y **Azure Resource Graph**. Mientras que _Azure Policy_ actúa como la guardia de seguridad que impide que algo no deseado se despliegue (GoB), _Resource Graph_ me permite realizar consultas complejas sobre el inventario y el historial de cambios de mis recursos en toda la organización."
  - **Capa de Telemetría (Métricas y Logs):** "Para la salud de las aplicaciones, centralizo todo en **Log Analytics Workspaces**. La clave aquí no es recolectar datos por recolectar, sino diseñar _Workbooks_ y alertas proactivas. Si un componente de la arquitectura (como una base de datos o un balanceador) supera un umbral de latencia, el sistema dispara una alerta que ya está clasificada por severidad."

- **¿Cómo aseguras que los desarrolladores no deshabiliten estos logs?**

  "Eso se soluciona con **Gobernanza como Código**. Implemento **Azure Policies** a nivel de _Management Group_ que fuerzan la habilitación de logs y el diagnóstico en cada suscripción que se crea. El desarrollador no tiene permiso para borrar esa política; es parte del _guardrail_ base de la organización"

![[barra.gif]]

###### **Propuesta**

Eddy, Head of Recruitment en Tessera

Buscamos un/a Arquitecto/a Cloud (Azure) para incorporarse a una compañía líder en beneficios sociales, retribución flexible y soluciones de salario emocional, con más de 35 años de trayectoria en España y parte de un grupo internacional de referencia en Europa. La posición es en Madrid, en modalidad híbrida (3 días en oficina y 2 de teletrabajo).

Como Arquitecto/a Cloud, te encargarás de:

- Definir la arquitectura cloud objetivo de la compañía (landing zones, networking, seguridad y gobierno) y diseñar soluciones escalables, resilientes y alineadas con las necesidades del negocio.
- Liderar procesos de migración a Azure (rehost, replatform, refactor) e impulsar la modernización de aplicaciones legacy hacia entornos cloud.
- Diseñar estrategias de alta disponibilidad, disaster recovery y continuidad de negocio, supervisando la seguridad cloud en coordinación con el CISO (IAM, Zero Trust, gestión de claves).
- Definir e implantar buenas prácticas DevOps (CI/CD, GitOps, Infraestructura como Código), modelos de observabilidad end-to-end y optimización de costes (FinOps).
- Coordinar con equipos multidisciplinares de desarrollo, sistemas y proveedores, actuando como referente técnico en la toma de decisiones y en la evolución del equipo.

**Requisitos**

- Al menos 4 años de experiencia en arquitectura cloud, principalmente en Azure y en proyectos de migración y modernización.
- Experiencia diseñando soluciones en Azure (AKS, App Services, API Management, Service Bus, Redis) y arquitecturas multi-entorno y landing zones.
- Conocimiento sólido de patrones arquitectónicos (microservicios, event-driven) y de estrategias de migración on-premise a cloud (rehost, replatform, refactor).
- Experiencia con pipelines CI/CD e Infraestructura como Código (Terraform, ARM, Bicep o similares).
- Conocimiento en observabilidad (Azure Monitor, Log Analytics, Application Insights, Prometheus, Grafana) y en seguridad cloud (IAM, Key Vault, WAF, marcos NIST o Zero Trust).
- Manejo de bases de datos relacionales (MySQL, PostgreSQL) y sistemas de mensajería (Kafka, Service Bus).

**Será un plus si**

- Cuentas con certificaciones oficiales de Azure (AZ-305, AZ-400 o equivalentes).
- Tienes experiencia en modelos FinOps y optimización de costes cloud a gran escala.
- Has definido SLAs, SLOs y métricas de rendimiento en entornos productivos críticos.
- Has actuado como referente técnico o liderado equipos en proyectos de transformación cloud.

**Qué se ofrece**

- 30 días de vacaciones
- Contrato indefinido directamente con la compañía.
- Modalidad híbrida: 2 días de teletrabajo y 3 días en oficina, coordinados con el manager.
- Jornada de 37,5 horas semanales, con jornada intensiva los viernes.
- Horario flexible de entrada entre las 8:00 y las 9:15, con salida ajustada.
- Seguro médico para la persona titular y su pareja o un hijo/a al cumplir el primer año en la compañía.
- Ayuda a guardería de 85 euros mensuales.
- Ayuda a la comida de 11 euros diarios por día trabajado.

###### Up Spain

"Me parece su modelo de negocio es un caso de éxito muy sólido con más de 60 años historia. No sois solo una empresa de beneficios sociales; sois el partner integral de bienestar corporativo, incentivos y experiencias para empresas. Me resulta muy interesante cómo operáis en un modelo B2B2C: ofrecéis soluciones digitales robustas a las empresas, pero al final, la experiencia real la viven empleados y establecimientos afiliados, lo cual es un reto operativo y digital de gran escala."

"He estado analizando la propuesta de valor de vuestra plataforma _UpONE_, y desde mi rol como Arquitecto de Soluciones, me parece un desafío técnico fascinante. Analizando _UpONE_, no veo solo una aplicación móvil, veo un **sistema de gestión de activos financieros y beneficios (Ledger System)**. La arquitectura detrás de esto debe ser altamente transaccional y consistente. Estamos hablando de una plataforma de _multibolsillo_ donde cada empleado tiene un estado contable (saldo) por cada beneficio (comida, transporte, educación).

Mi visión técnica para un producto así se basa en tres pilares de arquitectura:

1. **Consistencia Transaccional (ACID):** Cuando un empleado paga un café, el saldo debe descontarse atómicamente del bolsillo correcto. No puede haber discrepancias entre el front (app) y el back (ledger).
2. **Desacoplamiento de Servicios:** La lógica de "qué beneficio tiene cada empleado" (procedente de RRHH/Nómina) debe estar desacoplada del "motor de pagos" (integración con la pasarela Mastercard). 3. **Seguridad y Cumplimiento (PCI-DSS & RGPD):** Al manejar datos de tarjetas y fondos, la arquitectura debe asegurar que los datos sensibles estén tokenizados desde el primer momento."

Asumo que mi prioridad será proteger la integridad de los saldos, cumplir con la seguridad (PCI-DSS) y asegurar que su arquitectura sea moderna, escalable y, sobre todo, fácil de auditar.

![[barra.gif]]

- **Redes**

  "Entiendo que el flujo de tráfico se basa en principios universales de aislamiento e inspección. En Azure, uso **AVNM** para el _hub-and-spoke_, pero si estuviéramos en AWS, la implementación equivalente sería mediante **Transit Gateway**, asegurando la misma capacidad de inspección centralizada y escalabilidad"

- **¿Qué cargas críticas migraron?**
  - **El Engine de Transacciones (Ledger de Beneficios):** "Migramos el motor de balance contable de los beneficios. Es la carga más crítica: debe ser 100% consistente. Si el saldo no se actualiza en milisegundos tras una transacción, la experiencia de usuario se rompe. En la nube, esto requiere un diseño _event-driven_ para asegurar que cada movimiento de fondos sea inmutable y auditable".
  - **El Portal de Integración de RRHH (Nómina/HRIS):** "Migramos el sistema de ingesta de datos de empleados (HRIS). Es crítico porque es la fuente de verdad. Si la integración con el sistema de nómina de nuestros clientes falla, el empleado no recibe sus beneficios. Aquí implementamos arquitecturas de integración resilientes con _caching_ para asegurar disponibilidad total".
  - **La Capa de API Gateway (Exposición de servicios):** "Migramos la capa de exposición de APIs que conecta la App móvil con el Core financiero. Esta capa es el punto de entrada principal y requiere alta disponibilidad (Multi-AZ) y seguridad perimetral (WAF) para evitar ataques de inyección o denegación de servicio (DDoS)"

- **Observabilidad**

  "Veo la observabilidad como el sistema nervioso de la arquitectura. No es solo poner alertas, es diseñar para la operabilidad.
  1.  **Control Plane (Auditoría):** Uso **Azure Monitor Activity Logs** para auditar quién hace qué. Es mi rastro de auditoría para seguridad.
  2.  **Configuración (Compliance):** Uso **Azure Policy y Resource Graph** para que el sistema se auto-audite. Si un recurso sale de cumplimiento, Azure Policy lo detecta o lo corrige automáticamente.
  3.  **Telemetría (Salud):** Centralizo en **Log Analytics**. Mi objetivo es pasar de la monitorización reactiva (¿está esto caído?) a la proactiva (¿cuál es la tendencia de latencia de esta API?) mediante _Workbooks_ y alertas clasificadas por severidad"

![[barra.gif]]

- **La integración de ACID, Middleware y Omnicanalidad en UpONE**

  Cuando hables del ejemplo de "**pagar el café**", úsalo así para sonar brillante: "Cuando digo que el saldo debe ser atómico y consistente, **esto me suena totalmente a un reto de Middleware y Omnicanalidad**.
  - **¿Por qué Middleware?** Porque para que el front (App, Web, TPV) y el back (Ledger financiero) estén sincronizados, necesitamos una capa intermedia que gestione la complejidad de la transacción, validando reglas de negocio antes de tocar la base de datos. Si no hay middleware, los servicios se acoplan y la consistencia se pierde.
  - **¿Por qué Omnicanalidad?** Porque el usuario paga con la tarjeta física, pero consulta en la App móvil. La omnicanalidad aquí es el **Single Source of Truth**: no importa desde dónde venga la petición, el middleware centraliza el flujo transaccional y asegura que el saldo mostrado coincida exactamente con el saldo disponible en tiempo real."

  **Ejemplo rápido de cómo orquestamos esto con APEX (Tu "Middleware"):**
  1.  **Request:** La App envía un payload JSON (`UserID`, `Amount`, `VendorID`).
  2.  **Middleware (APEX/ORDS):** Recibe la llamada. Valida el token JWT y verifica que el `UserID` tenga saldo suficiente en el "bolsillo" (comida).
  3.  **Orquestación:** APEX llama a un procedimiento almacenado (`pkg_ledger.debit`) que garantiza la transacción ACID en la DB.
  4.  **Confirmación:** Si la DB confirma, APEX dispara un evento asíncrono para notificar la App (Push) y retorna el OK al TPV/Mastercard.

- **Respuestas para los puntos clave del Job Description**

  Cuando te pregunten sobre estas áreas, usa el esquema: **Contexto -> Tu Estrategia -> Valor al Negocio**.
  - **Coordinar equipos multidisciplinares:**

    "Mi enfoque es actuar como el **traductor técnico**. Me siento con Desarrollo para entender sus bloqueos, con Sistemas para asegurar la estabilidad, y con Negocio para priorizar qué funcionalidades generan más ingresos. Mi éxito no es solo técnico, es lograr que todos estemos alineados en una misma _roadmap_."

  - **DevOps (CI/CD, GitOps, FinOps):**

    "Veo DevOps como el método para **eliminar el error humano**. No es solo desplegar rápido, es tener _infraestructura inmutable_. Implemento GitOps para que el estado de la infraestructura esté siempre definido en código (Terraform/Bicep), y FinOps no es algo opcional, es una capa de gobernanza donde monitoreamos los costes por cada servicio desplegado."

  - **Alta Disponibilidad, DR y CISO (Seguridad):**

    "La seguridad no es una capa externa, es el ADN de la arquitectura (**Zero Trust**). En coordinación con el CISO, diseño arquitecturas donde el acceso es mínimo y está cifrado por defecto. La Alta Disponibilidad y DR los diseño basándome en el **RTO (Recovery Time Objective)** del negocio: no todo necesita ser activo-activo, pero todo debe ser recuperable según el impacto financiero."

  - **Arquitectura Objetivo (Landing Zones, Networking, Gobierno):**

    "Una _Landing Zone_ es la base de todo. Si no tienes una red bien segmentada (_Hub-and-Spoke_) y una política de gobernanza clara desde el inicio, la escalabilidad es imposible. Mi enfoque es crear un entorno 'pre-aprobado' donde los desarrolladores pueden innovar bajo _guardrails_ de seguridad ya definidos."

  - **Migración (Rehost, Replatform, Refactor):**

    "No todo se moderniza igual. Mi metodología es por **olas de valor**. Primero un _rehost_ para salir rápido de un centro de datos costoso, luego un _replatform_ para usar servicios gestionados (como bases de datos), y finalmente un _refactor_ a microservicios solo donde el negocio realmente requiere agilidad y escalabilidad."

- **Respuestas para los requisitos técnicos específicos**

  Cuando te pregunten por estos puntos, **sé conciso y demuestra dominio**:
  - **Azure (AKS, App Services, API Management, Service Bus, Redis):**

    "Tengo amplia experiencia diseñando soluciones en Azure. Uso **AKS** para orquestar microservicios, **App Services** para aplicaciones web rápidas, **API Management** como punto central de entrada (el Middleware), **Service Bus** para la comunicación desacoplada y **Redis** para el caché de sesiones y mejorar la latencia del usuario."

  - **Patrones arquitectónicos (Microservicios, Event-driven):**

    "Aplico patrones orientados a eventos para que los sistemas no dependan de una respuesta inmediata del otro, lo cual es vital para escalar. Los microservicios me permiten desplegar cambios en partes aisladas de la plataforma sin afectar a todo el ecosistema."

  - **CI/CD e Infraestructura como Código (Terraform, Bicep):**

    "Trabajo bajo el principio de **'Everything as Code'**. Uso Terraform/Bicep para que mi entorno sea reproducible en minutos. Mis pipelines de CI/CD incluyen pruebas automatizadas de seguridad; si no pasan el test, no se despliega."

  - **Observabilidad (Log Analytics, Prometheus, Grafana):**

    "No solo monitorizo, _observo_. Uso **Prometheus/Grafana** para métricas de tiempo real y **Log Analytics/App Insights** para el trazado de errores profundos. El objetivo es identificar cuellos de botella antes de que el usuario los sufra."

  - **Bases de datos (MySQL, PostgreSQL) y Mensajería (Kafka):**

    "Manejo bases de datos relacionales asegurando alta disponibilidad y copias de seguridad consistentes. Para sistemas de mensajería como **Kafka/Service Bus**, los utilizo para implementar arquitecturas resilientes donde la pérdida de un mensaje no es una opción."

**Último consejo:**

_"No he trabajado con esa herramienta específica, pero he trabajado con [equivalente] y el patrón arquitectónico es idéntico. Entiendo el concepto y podría adaptarme a la herramienta en días."_ **Esto es lo que define a un Arquitecto Senior.**

![[barra.gif]]

| **Concepto**           | **Azure (Tu especialidad)**          | **AWS (Traducción Equivalente)**                        |
| ---------------------- | ------------------------------------ | ------------------------------------------------------- |
| **Gobernanza**         | Management Groups & Azure Policy     | **AWS Organizations & SCPs** (Service Control Policies) |
| **Red Centralizada**   | Azure Virtual Network Manager (AVNM) | **AWS Transit Gateway** + Network Manager               |
| **Microsegmentación**  | NSGs & ASGs                          | **Security Groups & Network ACLs**                      |
| **Firewall (Capa 4)**  | Azure Firewall / Load Balancers      | **AWS Network Firewall** / Network Load Balancer        |
| **WAF / Web (Capa 7)** | Application Gateway / WAF            | **Application Load Balancer (ALB)** + AWS WAF           |
| **Edge / Global**      | Azure Front Door                     | **Amazon CloudFront** / AWS Global Accelerator          |

| **Concepto**          | **Servicio AWS**         | **Servicio Azure (Equivalente)**    |
| --------------------- | ------------------------ | ----------------------------------- |
| **Gobernanza**        | Control Tower / SCPs     | Management Groups / Azure Policy    |
| **Conectividad Hub**  | Transit Gateway          | Azure Virtual WAN / VNet Manager    |
| **Cómputo**           | EC2                      | Azure Virtual Machines              |
| **Base de Datos**     | Amazon Aurora PostgreSQL | Azure Database for PostgreSQL       |
| **Firewall**          | Network Firewall / WAF   | Azure Firewall / WAF                |
| **Red Privada**       | Direct Connect           | ExpressRoute                        |
| **DNS / DNS privado** | Route 53                 | Azure Private DNS / Azure DNS       |
| **Identity**          | IAM                      | Microsoft Entra ID (antes Azure AD) |

| **Concepto**                     | **AWS**        | **Azure (Tu especialidad)**             |
| -------------------------------- | -------------- | --------------------------------------- |
| **Auditoría de API / Eventos**   | AWS CloudTrail | **Azure Monitor (Activity Logs)**       |
| **Configuración y Cumplimiento** | AWS Config     | **Azure Policy & Azure Resource Graph** |
