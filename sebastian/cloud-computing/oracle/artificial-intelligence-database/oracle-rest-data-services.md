
ORDS es la capa que permite exponer una base de datos Oracle a través de servicios web modernos. Convierte operaciones SQL y PL/SQL en servicios REST accesibles vía HTTPS, haciendo posible que aplicaciones desarrolladas en cualquier lenguaje interactúen con Oracle sin drivers ni conexiones complejas.
![[barra.gif]]
-  **Como funciona**

	Opera como una **capa intermedia** que escucha peticiones HTTP estándar (GET, POST, PUT, DELETE), las interpreta y ejecuta la lógica correspondiente dentro de la base de datos. La respuesta vuelve al cliente en formatos comunes, principalmente JSON.
	
	*  **Publicación de APIs REST:** Permite exponer tablas, consultas y procedimientos como endpoints JSON, ya sea de forma automática o definiendo rutas personalizadas.
	*  **Motor para herramientas web de Oracle:** Es el reemplazo moderno del antiguo _`mod_plsql`_ y habilita la ejecución de aplicaciones como SQL Developer Web y otros servicios basados en PL/SQL.
	*  **Seguridad moderna:** Integra mecanismos como OAuth2 para controlar accesos y proteger endpoints, facilitando arquitecturas seguras sin configuraciones manuales complejas.
	*  **Carga y manipulación de datos vía HTTP:** Permite subir archivos (CSV, JSON u otros) y procesarlos directamente en la base de datos mediante servicios REST.
	
	**Por qué ORDS es importante**
	
	1. **Independencia del lenguaje:** Cualquier tecnología capaz de hacer peticiones HTTP puede consumir datos de Oracle sin conocimientos de SQL o drivers propietarios.
	2. **Facilita arquitecturas en la nube:** Es un componente clave en microservicios y despliegues cloud, ya que abstrae la base de datos y la expone de manera estándar.
	3. **Sin costo adicional:** ORDS es gratuito para cualquier instalación con Oracle Database, incluidas las ediciones Express/Free.
	
	-  **Ejemplo práctico**
	
		Para obtener el empleado con ID 100, bastaría una llamada: `GET https://tu-servidor.com/ords/hr/employees/100` . La base de datos respondería con un objeto JSON estructurado, sin necesidad de conectores JDBC, ODP.NET o similares.




