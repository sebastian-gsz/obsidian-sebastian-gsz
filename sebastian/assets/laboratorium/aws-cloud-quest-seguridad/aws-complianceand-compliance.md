---
def-type: atomic
version: 1.0
id: def-aws-automation-compliance-lab
status: estandar
category: infraestructura-en-la-nube
date: 2026-09-21
tags:
  - aws
  - aws-config
  - systems-manager
  - lambda
  - ec2
  - automation
  - compliance
  - finops
---

-  **[Recursos ](aws-compliance-and-compliance.tar)**
  
	- [[automation.yaml]]
	- [[automation-diy.yaml]]
-  **Meeting with the client**

	-  **Jane Roe** te plantea dos retos principales que su empresa necesita resolver:
	
		- **1. Control y desglose de costes (Gestión financiera / FinOps):** Sus facturas en la nube no paran de subir y el nuevo director financiero (_CFO_) exige un desglose detallado de los costes por departamentos y proyectos. Actualmente no tienen forma de saber qué recursos pertenecen a qué equipos.
		- **2. Auditoría de cumplimiento y monitoreo (_Compliance_):** Están en medio de una auditoría y el oficial de cumplimiento necesita confirmar que existe un monitoreo adecuado para cada aplicación, ya que les cuesta mantener la visibilidad sobre cómo están configurados los recursos y si cumplen con las normas.
		
		Para solucionar esto en este tipo de simulaciones, normalmente se suele recurrir a herramientas de etiquetado (**Tags** / _Cost Allocation Tags_), servicios de control presupuestario y herramientas de auditoría o inventario de recursos en AWS (como **AWS Config** para el seguimiento de configuraciones y cumplimiento).
		
		**¿Por qué?** AWS Config es el servicio totalmente administrado diseñado específicamente para evaluar, auditar y examinar las configuraciones de los recursos de AWS. Proporciona inventario, historial de cambios y notificaciones de modificaciones, lo cual encaja exactamente con lo que pedía Jane Roe para las auditorías de cumplimiento y la visibilidad de la infraestructura.
	-  **Jane Roe** te está planteando dos necesidades clave adicionales:
	
		-  **Centralizar datos operacionales:** Necesitan reunir toda la información y datos dispersos de diferentes servicios en un único lugar para tener una visión global y completa.
		-  **Automatizar la remediación:** Cuando **AWS Config** detecta recursos que no cumplen con las normas (_noncompliant_), necesitan un proceso automatizado o _playbook_ para solucionarlo rápidamente de forma masiva, ya que hacerlo manualmente consume mucho tiempo y es propenso a errores.
		
		El servicio principal de AWS que agrupa todo eso es **AWS Systems Manager** (específicamente sus funciones de _OpsCenter_ y _Automation_, que además se integran directamente con los _Remediation Playbooks_ de AWS Config).
	-  En este nuevo mensaje, **Jane Roe** te está planteando los siguientes requerimientos:
	
		- **Desplegar máquinas virtuales que escalen:** Necesitan implementar instancias virtuales en la nube que puedan ajustarse y escalar automáticamente según la demanda del servicio.
		- **Etiquetado y control de costes:** Requieren etiquetar correctamente esas máquinas virtuales para poder realizar un seguimiento de los costes y generar informes financieros precisos para el departamento de finanzas.
		
		El enfoque ideal para resolver esto combina el servicio de cómputo elástico (**Amazon EC2**) junto con el uso de **Auto Scaling** y políticas de etiquetado (_Tags_).
	-  De nuevo, **Jane Roe** te pide: Necesitan una capa de cómputo sin servidor (_serverless_) para construir **playbooks de automatización personalizados** que se integren directamente con su herramienta de auditoría.
	
		El servicio _serverless_ por excelencia en AWS diseñado para ejecutar código en respuesta a eventos (como los hallazgos de auditoría de AWS Config) es **AWS Lambda**.

![[compliance-and-compliance.png]]
![[amazon-compliance-and-compliance.webp]]![[barra.gif]]
Para eliminar la ambigüedad de las instrucciones del laboratorio de automatización y etiquetado con AWS Lambda, Systems Manager y AWS Config, aquí tienes los pasos directos, ordenados y con su respectiva validación para asegurarte de que cada fase se ejecute correctamente.

-  **Paso 1: <strong style ="color:5d6d7e;">Obtener el ID de la instancia HR-AppServer</strong> Amazon EC2.**
   
	Dirígete a la consola de **EC2**, haz clic en **Instancias** y selecciona la casilla de `HR-AppServer`. Copia el ID de la instancia (por ejemplo, `i-0123456789abcdef0`) y guárdalo temporalmente en un bloc de notas. *Verificación:** El portapapeles debe contener el ID completo que empieza con `i-`.
-  **Paso 2: <strong style ="color:5d6d7e;">Crear el documento de automatización (Runbook)</strong> AWS Systems Manager**

	Ve a **Systems Manager > Documentos**, haz clic en **Crear documento** y selecciona **Automatización**.
	
	*  Cambia el título haciendo clic en el icono de edición y asígnale exactamente el nombre: `Lab-TagProdInstances`.
	*  Ve a la pestaña **Código**, borra cualquier contenido predeterminado y pega el código del archivo `automation.yaml` que descargaste al inicio del laboratorio.
	*  En la **línea 28** del código, busca la etiqueta `<account-id>` y reemplázala por tu ID de cuenta real de AWS (puedes copiarlo haciendo clic en el nombre de tu cuenta en la esquina superior derecha).
	*  Haz clic en **Crear runbook**.
	*  **Verificación:** El documento aparece listado en la pestaña **De mi propiedad** (*Owned by me*).
-  **Paso 3: <strong style ="color:5d6d7e;">Configurar AWS Config</strong> AWS Config**
  
	Navega a la consola de **AWS Config** y haz clic en **Comenzar**.
	
	* En configuración, selecciona el rol existente `lab-config-role-xxxxxxx`.
	* En el canal de entrega, selecciona tu bucket de S3 (el que comienza con `config-bucket-`) y escribe la palabra `Config` en el campo de prefijo.
	* Avanza y confirma la configuración.
	* **Verificación:** El panel principal de AWS Config se muestra activo y operativo.
-  **Paso 4: <strong style ="color:5d6d7e;">Añadir la regla de etiquetas obligatorias</strong> AWS Config Rules.**

	En el menú izquierdo de AWS Config, haz clic en **Rules** y luego en **Add rule**.
	
	* Selecciona **Add AWS managed rule** y busca la regla llamada `required-tags`. Selecciónala.
	* En el alcance (*Scope*), elige **Recursos de AWS** y en tipo de recurso selecciona **EC2 Instance**.
	* En la sección de **Parámetros**, configura:
	* `Tag1key` = `Environment`
	* `Tag1Value` = `Prod`
	
		* Haz clic en **Guardar** (*Save*).
		* **Verificación:** La regla `required-tags` aparece en la lista de reglas activas.
-  **Paso 5: <strong style ="color:5d6d7e;">Configurar la acción de remediación</strong> Remediation**

	Haz clic sobre la regla `required-tags` que acabas de crear.
	
	* En la esquina superior, haz clic en **Acciones** y selecciona **Administrar corrección** (*Manage remediation*).
	* Elige el método **Corrección manual**.
	* En acción correctiva, busca y selecciona `Lab-TagProdInstances` (el runbook que creaste en el Paso 2).
	* En los parámetros de la remediación, asigna el parámetro de recurso `InstanceID`.
	* Haz clic en **Guardar cambios**.
	* **Verificación:** La alerta de éxito confirma que la regla se actualizó con su acción de corrección.
-  **Paso 6: <strong style ="color:5d6d7e;">Ejecutar la remediación y verificar el resultado</strong> Validación final** 

	En la sección inferior de la regla de remediación (recursos en el ámbito), selecciona el ID de la instancia `HR-AppServer` que guardaste en el Paso 1.
	
	* Haz clic en el botón **Remediar** (*Remediate*).
	* Espera unos minutos y haz clic en actualizar. Si el estado tarda, puedes ir arriba, hacer clic en **Acciones** y elegir **Volver a evaluar** (*Re-evaluate*).
	* Por último, regresa a la consola de **Amazon EC2 > Instancias**, selecciona `HR-AppServer` y revisa la pestaña **Etiquetas**.
	* **Verificación:** El estado de cumplimiento en AWS Config cambia a *Cumplimiento* (*Compliant*) y en EC2 visualizas que se ha aplicado la etiqueta correspondiente de manera automatizada.






























