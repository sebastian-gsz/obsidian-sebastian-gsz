
En este tramo de mi carrera, debo segmentar en dos roles muy específicos "Desarrollador Power Platform  & Consultor Power Platform"

Comenzare definiendo la parte de consultoría y mis funciones en ella. Ya que si bien ambos roles comparten la parte de desarrollo en Power Platform. Como consultor me centro en **transformar la manera en que la empresa opera**, entender las necesidades de negocio de la organización y traducir su necesidades en el desarrollado.

Como sabrás Power Platform se vende como una herramienta para simplificar el despliegue, arquitectura y desarrollo de aplicaciones empresariales. Una de mis principales funciones es "Estrategia y Gobernanza". Básicamente "**evitar un IT en las sombras**" evitando la deuda técnica. Esto se traducen en:

-  Controlar el despliegue de aplicaciones no autorizadas
-  Control en la dispersión de datos
-  Definición de políticas (DLP)
-  Diseño de modelo de datos (Dataverse)
-  Gestión del siclo de vida en entornos de desarrollo, pruebas y producción.
-  Despliegue de soluciones de Pipelines en Azure DevOps. Garantizando que cualquier cambio futuro sea estandarizando, auditado y reproducible.
-  Integración con Microsoft 365

    -  SharePoint
    -  Teams
    -  Azure AD
-  Ser el puente entre integraciones externas, ya sea Azure, SAP, APIs o cualquier otro proveedor, federando identidades y administrando la gobernanza entre servicios sin comprometer la seguridad.

Y como desarrollados, 

-  Aplicaciones para RR.HH, Gestión de incidentes laborales
-  Aplicaciones para cadena de suministro
-  Aplicaciones para monitorizar el ciclo de vida de inventario de activos.
-  Automatización:
  
    -  No conformidades
    -  Acciones correctivas
    -  Auditorías

![[barra.gif]]

Mi perfil combina la visión estratégica de un arquitecto con la ejecución técnica, permitiéndome cerrar la brecha entre las necesidades de negocio y la infraestructura de datos. No veo la consultoría y el desarrollo como roles aislados, sino como un continuo.

En el área de consultoría y estrategia, me enfoco en garantizar que Power Platform sea un acelerador y no un riesgo. Mi prioridad es evitar la deuda técnica, mediante:

- **Gobernanza y seguridad:** Implementación estricta de políticas DLP, federación de identidades y control de dispersión de datos.

Así mismo el ciclo de vida de la aplicación dentro del centro de administración Power Platform: Control de entornos de desarrollo, pruebas (QA), despliegue, monitoreo y mantenimiento.

- **Ciclo de vida (ALM):** Estandarización de despliegues mediante pipelines en Azure DevOps, garantizando que cada solución sea auditable, reproducible y escalable.
- **Arquitectura:** Diseño de modelos de datos complejos en Dataverse que sirven como base sólida para integraciones con SAP, Azure o servicios de Microsoft 365.

En la parte de ejecución técnica, traduzco esa estrategia en herramientas de alto impacto, enfocadas en:

- **Automatización de procesos:** Optimización de flujos de trabajo críticos como auditorías, acciones correctivas y gestión de no conformidades.
- **Desarrollo de aplicaciones:** Creación de soluciones robustas para cadena de suministro, recursos humanos y gestión de activos que no solo funcionan, sino que están arquitecturalmente bien diseñadas.

En resumen, aporto el control y la estructura e integración para que el desarrollo de bajo código genere valor real a largo plazo, manteniendo siempre la seguridad y la gobernanza como pilares fundamentales.

![[barra.gif]]

Implementación de  **agentes conversacionales** implementados en **Copilot Studio** que entiendan preguntas como "¿Cuáles son los proveedores de alto riesgo?" o "¿Dónde está mi pedido?".

Se conecta automáticamente a 7 APIs diferentes (ERP SAP/Oracle, almacén, órdenes, etc.). Procesa la información y responde de forma natural. Las empresas ya usan Copilot Studio, así que el usuario final no necesita otra aplicación. Simplemente habla con el copiloto que ya tiene.

-  Transformación de datos (mapeo de campos)
-  Orquestación múltiple (llamar 2-3 APIs para una pregunta)
-  Control de estado y caché

Para este proyecto Power Automate se vería así: 100+ acciones por flujo = deuda técnica. Mala decisión. **Solución**: MCP Server en Node.js que orquestara la toma de decisiones con lógica clara. Todo este proyecto fue desplegado sobre Azure y Power Platform. 

![[barra.gif]]

**Analogía**: Si Power Automate es "cuando algo pasa, haz esto después", un plugin es "intercepta la acción ANTES de que ocurra, valida, modifica, y LUEGO permite o rechaza".

- "Como arquitecto, mi enfoque no es solo escribir el código, sino decidir cuándo es la herramienta adecuada. Sé diferenciar cuándo un proceso debe ir en Power Automate y cuándo requiere un plugin por temas de integridad transaccional o rendimiento."

![[barra.gif]]

El puesto me resulta muy interesante, ISO 27001. Tiempo, versus coste, Cloud Centre of Excellence (CCoE), 

Buscamos profesionales que dominen los servicios clave de **AWS** y aporten visión estratégica para liderar la definición de arquitecturas que sean resilientes, seguras y alineadas con la estrategia del negocio.

Trabajarás en proyectos donde el diseño de soluciones cloud-native, el uso de patrones de arquitectura moderna, y la integración de servicios marcarán el rumbo tecnológico de grandes compañías. Si entiendes la nube como una herramienta de transformación y tienes experiencia en arquitecturas complejas en AWS, ¡te queremos en el equipo!

**✨Qué esperamos de ti✨**

- Experiencia mínima de 10 años en el ámbito de la ciberseguridad, de los cuales, al menos 5 años como Arquitecto de seguridad.
- Tener conocimientos de entornos basados en arquitectura web y móvil. Servidores web, APIs y Servicios REST session-less. Protocolos TCP/IP, HTTP(S), GRPC, WebSocket, TLS/SSL, SSH, SFTP. Conocimiento de Nubes Públicas, especialmente, conocimiento de seguridad en AWS y Google Cloud. Protocolos de autenticación y autorización: SAML, OpenID Connect (OIDC), OAuth 2.0, Multi-factor Authentication (MFA). Conocimientos de criptografía, PKI, certificados digitales, firma digital, etc. Sistemas de seguridad y redes: Firewall, Proxy inverso, WAF, Repositorios de autenticación (LDAP), Sistemas de Gestión de Identidades, DLPs, RDPs, etc.
- Valoraríamos que tuvieras un Máster en Ciberseguridad ó Certificaciones de seguridad (CISSP o similares). También que conozcas los sistemas BBVA y la plataforma Ether.

**✨Funciones✨**

- Entender los procesos de negocio y las arquitecturas en las que se soportan. Destacar la importancia de los análisis de seguridad de productos de terceros basados en software como servicio (SaaS) para validar sus capacidades de seguridad.
- Cumplimentar y validar los Modelos de Seguridad, estableciendo y diseñando controles y procesos de seguridad a bajo nivel, que completen los Modelos de Solución de Arquitectura de los proyectos.
- Gestionar el trade-off para cumplir con las necesidades de Negocio y los riesgos de seguridad asociados a la tecnología.
- Apoyar a las áreas de riesgos no financieros en la gestión del riesgo tecnológico, cumplimentando los Modelos Marco de Control.
- Deberás permanecer actualizado/a en las nuevas tecnologías, nuevas amenazas y nuevas capacidades de seguridad. Ayudarás a buscar soluciones tecnológicas ante hallazgos de nuevas vulnerabilidades.

---

Como Arquitecto de Soluciones, tu transición de "seleccionar una VM" a "orquestar infraestructura" es el paso definitivo hacia la madurez profesional. Ya no estás eligiendo un tamaño, estás definiendo una **estrategia de capacidad**.

Para orquestar infraestructura de forma profesional, debes dejar de pensar en "qué máquina necesito" y empezar a pensar en **cómo gestionar el ciclo de vida de esos SKUs**.

Aquí tienes el marco mental que utilizamos los arquitectos para orquestar infraestructuras a gran escala:

### 1. La regla de oro: Abstracción total

Nunca, bajo ninguna circunstancia, definas un SKU directamente en tu código principal (tu `azuredeploy.bicep` o tu template JSON).

- **Por qué:** Si el día de mañana debes cambiar el tamaño de una flota de 50 VMs, no quieres abrir 50 archivos.
    
- **Orquestación:** Utiliza tus archivos de parámetros (`azuredeploy.parameters.bicepparam` o `azuredeploy.parameters.json`) como la **capa de configuración**.
    
- **La práctica:** Define variables en tus archivos de infraestructura que apunten a parámetros. Esto desacopla la **lógica de despliegue** (cómo se construye la infraestructura) de la **especificación del entorno** (qué tamaño tiene en producción vs. desarrollo).
    

### 2. El modelo de "T-Shirt Sizing"

No le des a cada equipo de desarrollo la libertad de elegir "cualquier SKU". Eso destruye la orquestación y dispara los costes.

- Define una **política interna de tamaños**:
    
    - **XS (Small/Web):** Para microservicios o APIs ligeras (ej. Serie B).
        
    - **S (Standard):** Para aplicaciones de negocio estándar (ej. Serie D).
        
    - **M (Compute):** Para procesamiento intenso (ej. Serie F).
        
- Al orquestar, asignas "Tallas de camiseta" a tus entornos. Esto hace que tu infraestructura sea predecible, gobernable y fácil de automatizar.
    

### 3. La Gobernanza como parte de la Orquestación

Cuando orquestas, no solo despliegas; pones límites.

- **Azure Policy:** Como Arquitecto, tu trabajo es usar Azure Policy para **restringir** qué SKUs pueden desplegarse. Si un desarrollador intenta desplegar una máquina gigantesca (ej. una serie M de memoria masiva) en un entorno de desarrollo, la política debe bloquearlo automáticamente.
    
- La orquestación moderna no se trata solo de construir, sino de evitar que el sistema se desvíe del diseño (el llamado "drift").
    

### 4. Decoupling: Compute vs. Data

El error más común al orquestar es pensar en la VM como una unidad monolítica.

- **Estrategia:** Siempre que sea posible, desacopla la capacidad de cómputo del almacenamiento.
    
- Al orquestar, orquesta la VM (el SKU) y el disco (el rendimiento) como entidades separadas. Esto te permite escalar el disco (más IOPS) sin necesidad de escalar la VM (más CPU/RAM) y viceversa. Es la clave de una arquitectura eficiente.
    

### 5. El "Día 2" de la Orquestación

Orquestar no termina cuando das al botón de "Deploy". La orquestación profesional considera el **ciclo de vida**.

- **Derecho de dimensionamiento (Right-sizing):** Si despliegas una `Standard_D2s_v3` y la telemetría (Azure Monitor) te dice que la CPU nunca pasa del 5%, tu arquitectura orquestada debe tener la capacidad de cambiar ese SKU automáticamente o alertar para un cambio.
    
- **Automatización:** Si tu arquitectura es compleja, piensa en **VM Scale Sets** en lugar de VMs individuales. Esto te permite orquestar _grupos_ de recursos con una sola política de escalado, en lugar de gestionar máquinas "mascota" una por una.
    

### Resumen para tu mentalidad de Arquitecto

Cuando te enfrentes a un nuevo despliegue en tu `CoreServicesVnet`, hazte estas tres preguntas antes de escribir una sola línea de código:

1. **¿Está el SKU externalizado?** (¿Está en el archivo de parámetros y no en el código?)
    
2. **¿Está gobernado?** (¿Existe una política que evite el uso excesivo de recursos?)
    
3. **¿Es escalable?** (¿Puedo cambiar este tamaño mañana sin romper la lógica del despliegue?)
    

Al moverte a este nivel, dejas de ser un ingeniero que "configura servidores" para convertirte en un arquitecto que **gestiona capacidades**. ¿Qué te parece este enfoque de "tallas" y gobernanza para tu entorno actual?