
-  **Enlaces**

	-  **External**
	
		-  **Blog**
		
			-  **[YouTube Oracle APEX ](https://www.youtube.com/@OracleAPEX/videos)**
		-  **Learning**
		  
			* **[Oracle APEX en GitHub ](https://github.com/oracle/apex)**
			* **[Empezando con Oracle APEX ](https://www.oracle.com/apex/getting-started/#1-added-tab-2)**
			* **[Desarrollador de bases de datos en Oracle Cloud (APEX) ](https://mylearn.oracle.com/ou/learning-path/database-developer-on-oracle-cloud-apex-sls/148972)**
			* **[Conviértase en un desarrollador profesional de Oracle APEX ](https://mylearn.oracle.com/ou/learning-path/become-an-oracle-apex-developer-professional/146080)**
		-  **Documentación**
	
			 - **[Documentación de Oracle APEX ](https://docs.oracle.com/en/database/oracle/apex/index.html)**

![[barra.gif]]

**APEX es el sucesor natural de Oracle Forms** es el núcleo de la migración estratégica. La diferencia radica en la **democratización y la abstracción**:

**El legado (Forms):** Requería un entorno de ejecución específico, compilación y una arquitectura cliente-servidor más rígida.
  
-  **La evolución (APEX + GenDev):**
    -  **Modularidad nativa:** Con los nuevos _Workflow Templates_ y la capacidad de consumir fuentes **JSON Duality Views**, la lógica de negocio ya no está "atrapada" en capas de abstracción pesadas.
    -  **Inteligencia integrada:** Al tener **AI Vector Search** dentro de la base de datos, la capacidad de aplicar RAG (Generación Aumentada por Recuperación) sobre tus datos transaccionales sin moverlos a un vector store externo es una ventaja competitiva masiva en términos de latencia y gobernanza.
-  **Por qué el paraguas de "Autonomous Cloud Services" es clave para el arquitecto**

	Para alguien de tu perfil, la unificación bajo **Autonomous Database + ORDS + APEX** simplifica la **matriz de responsabilidad**:
	
	1. **Seguridad (IAM):** La integración nativa con **Oracle Fusion** y la propagación de identidad eliminan la necesidad de gestionar tokens complejos de forma manual. La seguridad se gestiona por directivas de acceso a nivel de esquema y usuario dentro de la base de datos.
	2. **Eficiencia operativa:** Al ser servicios totalmente gestionados ("Costo $0" por licencias de usuario, pagando solo por consumo de recursos), eliminas la carga administrativa de parcheo y escalabilidad.
	3. **GenDev:** No es solo "escribir código con IA". Es que el modelo de datos, la seguridad (SSO) y la lógica de búsqueda (AI Vector) se despliegan como una unidad cohesiva.
-  **Síntesis técnica para tu hoja de ruta**

	Si estás consolidando este conocimiento para tu arquitectura de sistemas, puedes visualizarlo así:
	
	-  **Capa de IA (Asistentes/Generación):** El cerebro que diseña la estructura.
	-  **Capa de almacenamiento/Datos (Autonomous DB):** Donde la IA busca, vectoriza y almacena.
	-  **Capa de integración (ORDS/JSON Duality):** El adaptador universal que habla JSON y REST.
	-  **Capa de presentación (APEX):** La interfaz GenDev que consume todo lo anterior de forma nativa.

![[barra.gif]]
###### **Desarrollador Oracle APEX**

Oracle APEX es una plataforma de desarrollo **integrada nativamente** en Oracle Database. No es un software externo, sino una característica que viene "de serie" con cualquier edición de la base de datos, sin costos adicionales por usuarios o desarrolladores.

1. **Navegador (Frontend):** Interfaz del usuario.
2. **ORDS (Middleware):** Servidor web que actúa como puente entre el navegador y la base de datos.
3. **Oracle Database (Motor):** APEX interpreta metadatos almacenados en tablas para generar páginas "al vuelo". No hay compilación ni servidores intermedios de aplicación.
	
Al utilizar **Oracle Autonomous Database**, trasladas la gestión (backups, parches, seguridad) a la inteligencia artificial de Oracle. Dado que APEX es metadata (y no binarios compilados), tus aplicaciones son totalmente portátiles entre entornos:

-  **Entornos soportados:** Desde servidores locales (_on-premises_) hasta Oracle Cloud, nubes privadas o entornos de desarrollo en Windows.
-  **Flexibilidad:** Puedes mover aplicaciones sin cambios entre una base de datos local y una instancia en la nube, garantizando coherencia en cualquier lugar donde resida tu base de datos Oracle.

---

**Aprovisionamiento de un espacio de trabajo**
			
![[entorno-de-trabajo-apex.mp4]]

![[creacion-pagina.mp4]]

![[modos-pagina-normal-modal-no-modal.mp4]]

![[crear-aplicación-a-partir-archivo.mp4]]

![[create-app-builder.mp4]]

![[activas-sql-developer-web.mp4]]

![[utilidad-generacion-datos.mp4]]

![[creation-table-workshop.mp4]]






















































































































