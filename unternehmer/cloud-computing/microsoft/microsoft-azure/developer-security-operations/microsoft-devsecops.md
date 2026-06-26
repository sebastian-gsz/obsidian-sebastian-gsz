
![[barra.gif]]

-  **Servicios**

	-  **[[azure-advisor]]**
	-  **[[azure-cloud-adoption-framework]]**
	-  **[[azure-well-architected-framework]]**

	-  **[Resource Manager ](https://learn.microsoft.com/en-us/azure/azure-resource-manager/)**
	-  **[Documentación Plantillas de ARM ](https://learn.microsoft.com/es-es/azure/azure-resource-manager/templates/overview)**
	-  **[Define recursos con Bicep, plantillas ARM y proveedor Terraform AzAPI ](https://learn.microsoft.com/en-us/azure/templates/)**

![[developer-security-operations#^uhm1|Developer Security Operations]]

![[barra.gif]]

###### **Azure Resource Manager: Fases de verificación Pre-Despliegue (Shift-Left)**

Antes de ejecutar cualquier despliegue real, Azure ofrece herramientas para asegurar que tu código sea válido y para predecir qué cambios ocurrirán. Estos comandos son el "control de calidad" de tu infraestructura.

-  **A. `az deployment group validate`**

	-  **Función:** Realiza un análisis estático y lógico de la plantilla y los parámetros. Verifica que la sintaxis sea correcta, que los parámetros requeridos estén presentes y que la configuración sea lógicamente válida para la API de Azure.
	-  **Analogía:** Es como el "compilador" de tu código. No cambia nada en la nube, solo verifica si tu "plano" es arquitectónicamente posible.
	-  **Cuándo usarlo:** Inmediatamente después de escribir o modificar código, antes de subirlo a cualquier pipeline de CI/CD.
-  **B. `az deployment group what-if`**

	-  **Función:** Es un análisis de impacto. Predice qué recursos serán creados, cuáles serán modificados (y cómo) y cuáles serán eliminados si ejecutas el despliegue actual.
	-  **Analogía:** Es un "simulacro" o un `git diff` para tu infraestructura. Te da la tranquilidad de ver el "estado futuro" sin riesgo de destrucción accidental.
	-  **Cuándo usarlo:** Indispensable antes de ejecutar cualquier despliegue en entornos de Pre-producción o Producción, especialmente cuando trabajas con `Microsoft.Network` donde un error puede causar desconexiones.

**Comparativa: ¿Cuál usar y cuándo?**

|**Herramienta**|**Objetivo Principal**|**¿Modifica el estado?**|**Resultado**|
|---|---|---|---|
|**`validate`**|**Validez sintáctica**|No|Error/Éxito (Plantilla válida)|
|**`what-if`**|**Impacto del cambio**|No|Lista de cambios (Create/Update/Delete)|
**Anatomía de una plantilla (JSON)**

|**Sección**|**Descripción**|
|---|---|
|**`parameters`**|Variables de entrada; definen lo que el usuario puede configurar.|
|**`variables`**|Lógica interna y cálculos reutilizables.|
|**`resources`**|El corazón de la plantilla; lista de recursos de Azure a desplegar.|
|**`outputs`**|Valores retornados tras el despliegue (ej. IDs de recursos).|
|**`$schema`**|Define la estructura. Se recomienda usar `2019-04-01`.|
-  **Mecanismos críticos de Azure Resource Manager**

	-  **Dependencias (`dependsOn`):** Establece el orden de creación. Evita errores de "recurso no encontrado" al desplegar en paralelo.
	-  **Identificadores dinámicos (`resourceId`):** Genera la ruta completa (ID único). Los recursos se conectan por IDs, no por nombres.
	-  **El agente de VM (`provisionVmAgent`):** Servicio vital en el SO de la VM. Siempre en `true` para gestión programática.
	-  **Versiones de API (`apiVersion`):** Define el "contrato" con Azure. Si VS Code da error, a menudo es un esquema local desactualizado; confía en la documentación oficial.
-  **Estrategia de orquestación y gobernanza**

	-  **Desacoplamiento (Decoupling):** Separa el código de despliegue de los parámetros y el cómputo del almacenamiento.
	-  **Gobernanza mediante SKUs:** Utiliza "T-Shirt Sizing" (XS, S, M, L) para estandarizar despliegues y evitar el sobredimensionamiento.
	-  **Ciclo de vida (Día 2):** Implementa siempre el dimensionamiento correcto (Right-sizing) y utiliza políticas para limitar el despliegue de SKUs no autorizados.
-  **Resolución de problemas (Tooling)**

	- **Warnings de esquemas:** Si el JSON marca error pero el despliegue funciona, es ruido visual. Ignóralo.
	- **Best practice:** Prioriza el uso de **Bicep** para desarrollo. Usa los comandos `validate` y `what-if` integrados en tu terminal o pipeline de CI/CD para cerrar el ciclo de confianza.

Ahora que tienes estas herramientas de validación, ¿tienes pensado integrar estos comandos `validate` y `what-if` dentro de un pipeline de CI/CD (como GitHub Actions o Azure DevOps) para automatizar estas comprobaciones antes de cada despliegue?