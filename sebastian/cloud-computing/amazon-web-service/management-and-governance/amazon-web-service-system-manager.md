
1. **Gestión automatizada de parches** (Patch Manager)

	*  **Automatización de actualizaciones:** Programa ventanas de mantenimiento para aplicar parches de seguridad críticos de forma automática en sistemas operativos Windows y Linux.
	*  **Líneas base (Patch Baselines):** Define reglas estrictas sobre qué actualizaciones se deben aprobar e instalar automáticamente y cuáles deben ser excluidas.
2. **Visibilidad e inventario de recursos**

	*  **Inventory:** Recopila de forma automática metadatos detallados de tus servidores, como el software instalado, configuraciones de red, variables de entorno y agentes activos. Puedes consultar esta información o exportarla a Amazon S3 para auditorías.
	*  **Fleet Manager:** Una consola unificada para administrar visualmente tus servidores. Te permite ver el rendimiento del sistema, administrar el sistema de archivos, ver registros (*logs*), gestionar usuarios locales y reiniciar servicios sin necesidad de abrir una terminal remota.
3. **Control de la configuración deseada** (State Manager)

	Garantiza que tus servidores mantengan una configuración coherente a lo largo del tiempo. Puedes definir políticas (por ejemplo, asegurarte de que el agente antivirus siempre esté ejecutándose) y State Manager comprobará y corregirá automáticamente cualquier desviación de esa configuración.
4. **Automatización de flujos de trabajo complejos** (Automation)

	*  Te permite crear **Runbooks** (documentos en formato JSON o YAML) para automatizar tareas repetitivas o complejas. Por ejemplo:
	*  Crear una imagen de servidor (AMI) de respaldo, probarla y limpiar las versiones antiguas.
	*  Rotar claves de acceso o certificados de forma automatizada.
	*  Orquestar la parada y arranque de entornos de desarrollo enteros fuera del horario laboral para ahorrar costos.
5. **Gestión centralizada de configuración y secretos** (Parameter Store)

	Proporciona almacenamiento seguro y jerárquico para datos de configuración (cadenas de conexión, direcciones IP) y secretos (contraseñas, tokens de API). Se integra con AWS KMS para garantizar que los datos sensibles estén cifrados y permite controlar quién tiene acceso a ellos mediante políticas de IAM.
6. **Operaciones e incidentes** (OpsCenter y Explorer)

	*  **OpsCenter:** Agrupa y prioriza problemas operativos (*OpsItems*) provenientes de diferentes recursos y servicios de AWS en un solo panel de control, facilitando su resolución.
	*  **Explorer:** Te ofrece una vista agregada del estado operativo de tus recursos en toda tu cuenta y regiones, ideal para identificar riesgos o tendencias a nivel de infraestructura.

-  **[Documentación de AWS Systems Manager ](https://docs.aws.amazon.com/es_es/systems-manager/?icmpid=docs_homepage_mgmtgov)**
![[barra.gif]]
