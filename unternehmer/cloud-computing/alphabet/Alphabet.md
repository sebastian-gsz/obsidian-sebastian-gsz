---
---

![[Barra.gif]]

-  **Enlaces**

	-  **Internal**

		-  **[[google-cloud-platform-devsecops]]**
		-  **[[google-cloud-platform-networking]]**
	-  **Learning**
	  
		-  **[Workspace ](https://admin.google.com/u/2/ac/home?hl=es)**
		-  **[Google labs blog ](https://blog.google/technology/google-labs/)**
-  **[Servicios ](https://docs.cloud.google.com/?hl=es-419)**

	-  **[Tools ](https://docs.cloud.google.com/docs/application-development?hl=es)**

		-  
		-  **[Cloud Code for VS Code ](https://cloud.google.com/code/docs/vscode/overview?hl=es)**
	-  **[Security ](https://cloud.google.com/docs/security?hl=es)**

		- **[[google-identity-aware-proxy]]**
		- **[[google-cloud-asset-inventory]]**
		- **[[google-security-command-center]]**
	-  **Multicloud**

		-  **[[google-cloud-directory-sync]]**
	-  **Machine Learning**
	
		-  **[[gemini-for-google-cloud]]**
	-  **[[google-marketing-platform|Google Marketing Platform]]**
-  **Comandos**

	-  **General**
	  
		-  **Gestionar el inventario de activos**
		
			-  **[gcloud asset search-all-resources ](https://docs.cloud.google.com/sdk/gcloud/reference/asset/search-all-resources)**
			
				Busca en todos los recursos en la nube dentro del alcance accesible especificado, como un proyecto, carpeta u organización.
				
				-  ``gcloud asset search-all-resources --project=art-int-000000-a1 --format="table(assetType, name)" > inventario.txt``
				-  `gcloud asset search-all-resources --scope='organizations/123456' --query='name:xyz*'`
	-  **Identity and access manager**
	
		-  **Roles**
		  
			-  **``iam.serviceAccountUser``**
			
				**Es uno de los más críticos en todo Google Cloud**, especialmente cuando trabajas con **service accounts** y automatización.
				
				- **`iam.serviceAccounts.actAs`: Permite impersonar una service account. Es el permiso crítico para que una identidad pueda “actuar como” esa cuenta. Se usa cuando quieres que un usuario o cuenta de servicio pueda asignar esa SA a un recurso, o autenticarse como ella.**
				- **`iam.serviceAccounts.get`: Permite ver los metadatos de una service account. Incluye nombre, descripción, email, etc. Necesario para que el sistema valide que la SA existe y es accesible.**
				- **`iam.serviceAccounts.list`: Permite listar todas las service accounts del proyecto. Útil para interfaces que muestran SA disponibles, como la consola o scripts que recorren cuentas.**
				- **`resourcemanager.projects.get`: Permite ver los metadatos del proyecto. Incluye nombre, ID, número de proyecto. Necesario para que el sistema valide el contexto donde vive la SA.**
				- **`resourcemanager.projects.list`: Permite listar proyectos visibles para la identidad. No da acceso a recursos, solo visibilidad. Usado por interfaces que permiten seleccionar proyectos.**
			-  **``iam.serviceAccountTokenCreator``**
			
				-  **`iam.serviceAccounts.get` Ver detalles de una service account (metadatos: nombre, descripción, etc.).**
				-  **`iam.serviceAccounts.getAccessToken` Crear tokens de acceso OAuth2 en nombre de la service account (para llamar APIs como ella).**
				-  **`iam.serviceAccounts.getOpenIdToken` Emitir tokens OpenID Connect (OIDC) en nombre de la service account (para federación / identidades externas).**
				
					Mientras que un Access Token sirve para **llamar a una API** (ej. "tengo permiso para leer este bucket"), un token **OIDC** sirve para **demostrar quién eres**.
					
					- **Para qué sirve:** Se usa principalmente para autenticarse en servicios que requieren identidad, como **Cloud Run**, **Cloud Functions** o **Identity-Aware Proxy (IAP)**.
					- **Ejemplo:** Si tu `SA1` quiere invocar una Cloud Function privada, necesita este permiso para generar un token que diga: "Soy la SA1 y Google lo certifica".
				-  **`iam.serviceAccounts.implicitDelegation` Permite delegación implícita de credenciales entre service accounts en ciertos flujos avanzados (por ejemplo, cadenas de delegación).**
				
					Este es el permiso más "misterioso" y avanzado. Se refiere a situaciones donde una Service Account no es el destino final, sino un **intermediario**.
					
					- **Cómo funciona:** Permite que una identidad (A) obtenga un token para una identidad (B), indicando que ese token será usado para actuar sobre una identidad (C).
					- **Escenario:** Se usa en arquitecturas multicloud o servicios muy complejos donde hay más de dos saltos de identidad ("A" actúa como "B" quien a su vez tiene permisos sobre "C"). En el 99% de los casos de DevOps estándar, este permiso está ahí para asegurar que la cadena de confianza no se rompa si Google decide que el flujo requiere delegación explícita.
					  
					**El escenario de `implicitDelegation` (VM A -> B -> Function C)**
					
					Tu ejemplo es muy cercano a la realidad, pero hay un matiz:
					
					- Este permiso se activa cuando la identidad (A) quiere que la identidad (B) obtenga un token para hablar con (C), pero **sin que (A) tenga acceso directo a (C)**.
					- Sirve para **limitar el alcance**. Permite que la delegación ocurra de manera "silenciosa" en el backend de Google cuando las identidades están configuradas para confiar una en la otra en cadena. Es vital en arquitecturas de microservicios donde el "salto" de identidad debe ser rastreable pero automático.
				-  **`iam.serviceAccounts.list` Listar las service accounts de un proyecto.**
				-  **`iam.serviceAccounts.signBlob` Firmar datos arbitrarios (BLOBs) con la clave de la service account (útil para pruebas de firma, autenticación a sistemas externos, etc.).**
				
					**(Binary Large Object):** Permite firmar cualquier dato binario. El uso más común es crear **Signed URLs** de Cloud Storage. Con esto, puedes generar un enlace temporal para que alguien descargue un archivo sin ser usuario de GCP.
				-  **`iam.serviceAccounts.signJwt` Firmar JWTs con la clave de la service account (típico en flujos de autenticación y federación).**
				  
					**(JSON Web Token):** Permite crear y firmar un token JWT personalizado. Es fundamental para conectarse con APIs externas (fuera de Google) que confían en las llaves de tu Service Account para validar la identidad.
				-  **`resourcemanager.projects.get` Leer metadatos del proyecto (por ejemplo, número de proyecto, nombre, etc.), necesario para algunos flujos de token.**
				-  **`resourcemanager.projects.list` Listar proyectos a los que la identidad tiene visibilidad, de nuevo útil en herramientas que necesitan descubrir contexto de proyecto.**
		-  **Procesos**
		
			-  **Autenticación local sobre service account**
			
				-  **Primero te logueas tú: `gcloud auth application-default login`**
				-  **Luego configuras ADC para que use la SA mediante suplantación: `gcloud auth application-default set-impersonate-service-account $SA`**
			-  **Ruta (``Impersonation``)**
			
				-  **Crear Identidad (SA):**
				
					**`gcloud iam service-accounts create sa-compute-provisioner --display-name="Compute Engine Provisioner" --description="Cuenta encargada de la creacion y gestion del ciclo de vida de instancias de VM. Se utiliza para procesos de automatizacion y despliegue."`**
				-  **Definir capacidades (Rol):**
				
					**`gcloud iam roles create devops --project $PR --permissions "compute.instances.create,compute.instances.delete,compute.instances.start,compute.instances.stop,compute.instances.update,compute.disks.create,compute.subnetworks.use,compute.subnetworks.useExternalIp,compute.instances.setMetadata,compute.instances.setServiceAccount"`**
					
					-  **Asigna el rol:** 
					
						**`gcloud projects add-iam-policy-binding $PR --member="serviceAccount:$SA" --role="projects/$PR/roles/devops"`**
				-  **Vincular permisos y suplantación:** 
				
					-  **`gcloud iam service-accounts add-iam-policy-binding $SA --member=user:$USER --role=roles/iam.serviceAccountUser`**
					-  **`gcloud iam service-accounts add-iam-policy-binding $SA --member="user:$USER" --role="roles/iam.serviceAccountTokenCreator"`**
					
					**Despliegue con identidad delegada**
					
					-  **Crear una nueva SA**
					-  **Permitir suplantación 1a1**
					
						- **Opcional: `gcloud iam service-accounts add-iam-policy-binding $SA1 --member="serviceAccount:$SA" --role="roles/iam.serviceAccountTokenCreator"`**
						- **`gcloud iam service-accounts add-iam-policy-binding $SA1 --member="serviceAccount:$SA" --role="roles/iam.serviceAccountUser"`**
						- **`gcloud iam service-accounts add-iam-policy-binding $SA --member="serviceAccount:$SA1" --role="roles/iam.serviceAccountTokenCreator"`**
						- **`gcloud iam service-accounts add-iam-policy-binding $SA --member="serviceAccount:$SA1" --role="roles/iam.serviceAccountUser"`**
					-  **Crear VM**
					
						La VM solo "conoce" a su SA asignada. Para entrar, usarás **IAP** o **SSH Keys**, pero la VM operará con la identidad SA asignada.
						
						**``gcloud compute instances create vm-final-test --zone us-central1-a --machine-type=e2-micro --provisioning-model=SPOT --service-account=$SA1 --scopes "https://www.googleapis.com/auth/cloud-platform" --impersonate-service-account=$SA``**
		-  **[gcloud iam service-accounts ](https://docs.cloud.google.com/sdk/gcloud/reference/iam/service-accounts)**
		
			Crea y manipula cuentas de servicios IAM. Una cuenta de servicio es una cuenta especial que pertenece a tu aplicación o a una máquina virtual, en lugar de a una usuario final individual. Tu aplicación utiliza la cuenta de servicio para llamar a la Google API de un servicio, para que los usuarios no estén directamente involucrados.
			
			**``Nota``**: Las cuentas de servicio utilizan cuotas de clientes para el seguimiento del uso.
			
			-  **`gcloud iam service-accounts list`**: Muestra una lista de todas las cuentas de servicio asociadas al proyecto actual. Es el punto de partida para saber qué "identidades" existen.
			
			    - `--filter="name:BOT"`: Filtra la lista para mostrar solo las que contengan una palabra específica.
			    - `--limit=5`: Limita el número de resultados mostrados.
			    - `--format=table/json/yaml`: Cambia cómo se visualiza la información (útil para scripts).
			-  **`gcloud iam service-accounts create [NOMBRE]`**: Crea una nueva cuenta de servicio en el proyecto.
			
			    - `--display-name="Mi Bot de Backup"`: Asigna un nombre amigable o descriptivo (diferente al ID técnico).
			    - `--description="Para tareas automáticas"`: Añade una nota sobre el propósito de la cuenta.
			-  **`gcloud iam service-accounts delete [EMAIL]`**: Elimina permanentemente una cuenta de servicio. ¡Cuidado! Una vez borrada, las aplicaciones que la usen dejarán de funcionar.
			
			    - `--quiet`: Ejecuta el borrado sin pedir confirmación (peligroso pero útil en automatización).
			-  **`gcloud iam service-accounts describe [EMAIL]`**: Muestra toda la información técnica detallada de una cuenta específica (ID único, nombre, si está activa, etc.).
			
			    - `--format="value(uniqueId)"`: Extrae solo un dato específico, como el ID único.
			-  **`gcloud iam service-accounts keys list --iam-account=[EMAIL]`**: Muestra las llaves (keys) activas de una cuenta de servicio. Las llaves permiten que el software se autentique.
			
			    - `--managed-by=` ``user``,``system``,``any``: Filtra si la llave la creaste tú o la gestiona Google automáticamente.
			-  **`gcloud iam service-accounts keys create [ARCHIVO_SALIDA]`**: Genera una nueva llave privada y la descarga a tu ordenador (normalmente en un archivo `.json`). Es el "archivo de identidad" que le das a tus programas.
			
			    - `--iam-account=[EMAIL]`: Especifica para qué cuenta es la llave.
			    - `--key-file-type=json`: Define el formato del archivo (JSON es el estándar).
			-  **`gcloud iam service-accounts disable/enable [EMAIL]`** Pausa o activa una cuenta sin borrarla. Muy útil para seguridad si crees que alguien robó una llave.
			
			    - No suelen requerir flags adicionales, solo el email de la cuenta.
			-  **`gcloud iam service-accounts add-iam-policy-binding [EMAIL]`**: Define **quién** puede gestionar esa cuenta de servicio (no qué puede hacer la cuenta, sino quién la controla).
			
			    - `--member="user:pepe@gmail.com"`: Especifica qué usuario tendrá acceso.
			    - `--role="roles/iam.serviceAccountUser"`: Define el nivel de permiso que tendrá ese usuario.
		-  **[gcloud iam service-accounts add-iam-policy-binding ](https://cloud.google.com/sdk/gcloud/reference/iam/service-accounts/add-iam-policy-binding)**
		
		    Añade una política vinculante a una cuenta de servicio. Es crucial entender que aquí la **cuenta de servicio es el recurso** que quieres proteger. Al ejecutar este comando, estás otorgando permiso a alguien (miembro) para que pueda "usar" o "gestionar" esa cuenta específica.
		    
		    **`Nota técnica`**: Una unión (binding) consta de tres elementos: un **Miembro** (quién), un **Rol** (qué puede hacer) y una **Condición** opcional (cuándo).
		    
		    -  **`gcloud iam service-accounts add-iam-policy-binding [EMAIL_SA]`**: Comando base para otorgar permisos sobre la cuenta de servicio.
		     
		        - `--member="user:nombre@gmail.com"`: Especifica el principio al que otorgas el acceso. Puede ser `user:`, `group:`, `serviceAccount:`, o incluso `domain:`.
		        - `--role="roles/iam.serviceAccountUser"`: Define el rol. El más común es `serviceAccountUser`, que permite a un usuario "suplantar" o adjuntar la cuenta a una instancia.
		        - `--condition="expression=...,title=...,description=..."`: (Opcional) Añade lógica condicional basada en tiempo, recursos o etiquetas (utiliza sintaxis CEL).
		        - `--condition-from-file=[RUTA_ARCHIVO]`: Permite cargar condiciones complejas desde un archivo JSON o YAML local en lugar de escribirlas en la terminal.
		    -  **Ejemplos prácticos de uso:**
			
		        - **Dar permiso de Editor a un usuario específico:** `gcloud iam service-accounts add-iam-policy-binding mi-cuenta@proyecto.iam.gserviceaccount.com --member='user:admin@empresa.com' --role='roles/editor'`
		        - **Permitir que una SA sea usada por otra SA (Encadenamiento):** `gcloud iam service-accounts add-iam-policy-binding sa-destino@proyecto.iam.gserviceaccount.com --member='serviceAccount:sa-origen@proyecto.iam.gserviceaccount.com' --role='roles/iam.serviceAccountUser'`
		        - **Acceso temporal (Condición de expiración):** `gcloud iam service-accounts add-iam-policy-binding mi-cuenta@proyecto.iam.gserviceaccount.com --member='user:externo@gmail.com' --role='roles/iam.serviceAccountAdmin' --condition='expression=request.time < timestamp("2025-01-01T00:00:00Z"),title=expira_2024,description=Acceso solo hasta fin de año'`
		-  **[gcloud iam service-accounts create ](https://docs.cloud.google.com/sdk/gcloud/reference/iam/service-accounts/create)**
		
		    Este comando crea una nueva cuenta de servicio en el proyecto. Es el paso fundamental para dotar de identidad a tus cargas de trabajo (VMs, funciones, contenedores) sin usar cuentas de usuario reales.
		    
		    **`Nota de experto`**: El `NAME` que elijas se usará para generar el correo electrónico de la cuenta (ej. `NAME@proyecto.iam.gserviceaccount.com`). Este correo será el identificador que usarás en todos los comandos posteriores.
		    
		    -  **`gcloud iam service-accounts create [NAME]`**: Crea la identidad básica en el proyecto activo.
		     
		        - `--display-name="Nombre Amigable"`: Define el nombre que verás en la consola web de Google Cloud. Es puramente visual pero vital para organizar proyectos grandes.
		        - `--description="Propósito de la cuenta"`: Añade contexto sobre qué hace esta cuenta (ej. "Cuenta para que Terraform cree redes"). Es una excelente práctica de auditoría.
		        - `--project=[PROJECT_ID]`: (Opcional) Si quieres crear la cuenta en un proyecto distinto al que tienes configurado por defecto en tu terminal.
		    -  **Ejemplos prácticos de uso:**
		     
		        - **Creación estándar para un bot:** `gcloud iam service-accounts create my-automation-bot --display-name="Bot de Automatización"`
		        - **Creación con descripción técnica para auditoría:** `gcloud iam service-accounts create sa-terraform-prod --description="Cuenta con permisos de Owner para despliegues de infraestructura en Producción" --display-name="Terraform PROD"`
			
			**Análisis de experto para tu laboratorio:**
			
			Un error común que veo en profesionales de TI es intentar usar el `NAME` para dar permisos en otros comandos. Recuerda: **El `NAME` solo sirve para crearla.** Para todo lo demás (darle roles, crearle llaves o borrarla), debes usar el **Email completo** que Google te devuelve tras la creación.
			
			**Tip PRO:** Si necesitas usar el email de la cuenta inmediatamente en un script de bash, puedes capturarlo así: `EMAIL=$(gcloud iam service-accounts create my-sa --format='value(email)')`.
		-  **[gcloud iam service-accounts delete ](https://docs.cloud.google.com/sdk/gcloud/reference/iam/service-accounts/delete)**
		
		    Elimina de forma permanente una cuenta de servicio de un proyecto. Al ejecutarlo, todas las llaves asociadas quedan invalidadas y cualquier aplicación, VM o pipeline que dependa de esta identidad perderá el acceso a los recursos de Google Cloud de inmediato.
		    
		    **`Advertencia técnica`**: A diferencia de otros recursos que van a una "papelera", las cuentas de servicio eliminadas son difíciles de recuperar y pueden causar fallos en cascada en sistemas de producción.
		    
		    - **`gcloud iam service-accounts delete [EMAIL_SA]`**: Comando para iniciar el proceso de borrado  utilizando el identificador completo de la cuenta.
		     
		        - `SERVICE_ACCOUNT`: Puedes usar tanto el email completo (`cuenta@proyecto.iam.gserviceaccount.com`) como el ID numérico único de la cuenta.
		        - `--quiet`: (Flag de gcloud) Salta la pregunta de confirmación "Are you sure?". Es vital para scripts de automatización, pero peligroso en uso manual.
		        - `--project=[PROJECT_ID]`: Para especificar el proyecto si no estás en el contexto correcto.
		    -  **Ejemplos prácticos de uso:**
		     
		        - **Borrado estándar con confirmación:** `gcloud iam service-accounts delete mi-vieja-sa@mi-proyecto.iam.gserviceaccount.com`
		        - **Borrado masivo en scripts (sin interacción):** `gcloud iam service-accounts delete temp-sa@mi-proyecto.iam.gserviceaccount.com --quiet`
			
			**Análisis de experto para tu laboratorio:**
			
			Como Isabella, te doy un consejo de seguridad de nivel Senior: **Nunca borres una cuenta de servicio de la que no estés 100% seguro.** **La mejor práctica antes de borrar:** En lugar de `delete`, utiliza primero el comando `gcloud iam service-accounts disable [EMAIL]`.
			
			- Si después de desactivarla (deshabilitarla) nada se rompe en 24-48 horas, entonces procede al `delete`.
			- Si algo falla, puedes usar `enable` y restaurar el servicio en segundos, algo que no podrías hacer si ya la hubieras borrado.
		-  **[gcloud iam service-accounts describe ](https://docs.cloud.google.com/sdk/gcloud/reference/iam/service-accounts/describe)**
		  
			Muestra los metadatos detallados de una cuenta de servicio específica. Es la herramienta de diagnóstico principal para verificar el `uniqueId`, el estado de la cuenta y su nombre visible.
		    
		    - **`gcloud iam service-accounts describe [EMAIL_SA]`**: Extrae la ficha técnica completa de la identidad.
		    - **Uso experto:** Si el comando falla con `PERMISSION_DENIED`, o la cuenta no existe o tu usuario actual no tiene el rol `resourcemanager.projects.get` o permisos de lectura en IAM.
		-  **[gcloud iam service-accounts disable ](https://docs.cloud.google.com/sdk/gcloud/reference/iam/service-accounts/disable)**
		  
			Deshabilita una cuenta de servicio de forma inmediata. A partir de este momento, cualquier solicitud de API o generación de credenciales con esta cuenta fallará.
		    
		    - **`gcloud iam service-accounts disable [EMAIL_SA]`**: Es el "interruptor de emergencia" de seguridad.
		    - **Consejo técnico:** Úsalo como paso previo al borrado (`delete`) o para mitigar una brecha de seguridad si sospechas que una llave ha sido comprometida sin necesidad de borrar la identidad.
		-  **[gcloud iam service-accounts enable ](https://docs.cloud.google.com/sdk/gcloud/reference/iam/service-accounts/enable)**
		  
			Reactiva una cuenta de servicio previamente deshabilitada.
		    
		    - **`gcloud iam service-accounts enable [EMAIL_SA]`**: Restaura instantáneamente la capacidad de la cuenta para realizar llamadas a la API y autenticar servicios.
		    - **Escenario:** Útil para reactivar procesos automáticos tras una auditoría o mantenimiento de seguridad.
		-  **[gcloud iam service-accounts get-iam-policy ](https://docs.cloud.google.com/sdk/gcloud/reference/iam/service-accounts/get-iam-policy)**
		  
			Muestra la política de seguridad (quién tiene acceso) de la cuenta de servicio tratada como **recurso**.
		    
		    - **`gcloud iam service-accounts get-iam-policy [EMAIL_SA]`**: Devuelve el JSON/YAML con los _bindings_ (uniones) de miembros y roles.
		    - **Nota de experto:** Incluye un campo llamado `etag`, que es un identificador de versión. Si vas a usar `set-iam-policy` para actualizar permisos de forma masiva, necesitarás este `etag` para evitar conflictos de escritura concurrente.
		-  **[gcloud iam service-accounts list ](https://docs.cloud.google.com/sdk/gcloud/reference/iam/service-accounts/list)**
		  
			Muestra todas las cuentas de servicio del proyecto actual. Es el punto de partida para cualquier auditoría de identidad.
		    
		    - **`gcloud iam service-accounts list`**: Genera la tabla con los emails y nombres de todas las SAs.
		    - **Filtros avanzados:** - `--filter="disabled:true"`: Para encontrar rápidamente cuentas que no están operativas.
		      
		        - `--format="table(name, email, disabled)"`: Para crear un reporte limpio de cumplimiento.
		-  **[gcloud iam service-accounts remove-iam-policy-binding ](https://cloud.google.com/sdk/gcloud/reference/iam/service-accounts/remove-iam-policy-binding)**
		
		    Este comando revoca un permiso específico sobre una cuenta de servicio. Es el proceso quirúrgico para quitar el acceso a un miembro sin afectar al resto de la política de seguridad.
		    
		    **`Nota de experto`**: Si intentas eliminar un miembro que ya fue borrado de Cloud Identity, verás que el identificador tiene el prefijo `deleted:`. Es una buena práctica limpiar estos residuos para mantener el mapa de control ordenado.
		    
		    -  **`gcloud iam service-accounts remove-iam-policy-binding [EMAIL_SA]`**: Comando para retirar un rol a un miembro.
		     
		        - `--member="user:nombre@gmail.com"`: El principio al que le quitas el acceso.
		        - `--role="roles/iam.serviceAccountUser"`: El rol exacto que deseas eliminar.
		        - `--all`: (Flag potente) Elimina todas las uniones del miembro y rol especificado, ignorando si tienen condiciones diferentes.
		        - `--condition=None`: Asegura que estás eliminando la unión que **no** tiene condiciones aplicadas.
		-  **[gcloud iam service-accounts set-iam-policy ](https://docs.cloud.google.com/sdk/gcloud/reference/iam/service-accounts/set-iam-policy)**
		
		    A diferencia del comando anterior, este **reemplaza por completo** la política actual por una nueva definida en un archivo. Es extremadamente útil para restaurar configuraciones o aplicar políticas complejas de una sola vez.
		    
		    **`Advertencia de seguridad`**: Este comando es "todo o nada". Si tu archivo `policy.json` olvida a un usuario que antes tenía acceso, ese usuario perderá el acceso inmediatamente al ejecutar el comando.
		    
		    -  **`gcloud iam service-accounts set-iam-policy [EMAIL_SA] [ARCHIVO_POLITICA]`**: Sobrescribe la política de la cuenta con el contenido del archivo JSON o YAML.
		     
		        - `POLICY_FILE`: Ruta al archivo local que contiene la nueva definición de la política.
		        - **Gestión de Etag**: Si el archivo incluye un `etag`, Google validará que nadie haya cambiado la política desde que descargaste el archivo (evita colisiones). Si el archivo no tiene `etag`, forzará el cambio ignorando otras actualizaciones.
		    -  **Ejemplos prácticos de flujo de trabajo:**
			
		        1. **Descargar la política actual:** `gcloud iam service-accounts get-iam-policy mi-sa@proyecto.iam.gserviceaccount.com --format=json > policy.json`
		        2. **Editar el archivo `policy.json` localmente** (añadir/quitar miembros).
		        3. **Aplicar la nueva versión:** `gcloud iam service-accounts set-iam-policy mi-sa@proyecto.iam.gserviceaccount.com policy.json`
			
			**Análisis de experto para tu laboratorio:**
			
			Para una gestión profesional, te recomiendo usar siempre el flujo **Get -> Edit -> Set**. Usar `remove-iam-policy-binding` es genial para cambios rápidos, pero cuando tienes que gestionar 20 desarrolladores con diferentes condiciones de tiempo, es mucho más seguro y auditable tener la política en un archivo JSON bajo control de versiones (como Git) y aplicarla con `set-iam-policy`.
		-  **[gcloud iam service-accounts sign-blob ](https://www.google.com/search?q=https://cloud.google.com/sdk/gcloud/reference/iam/service-accounts/sign-blob)**
		
			Permite firmar datos binarios arbitrarios (un archivo) usando una llave  gestionada por Google. Esto es vital para verificar la integridad de archivos sin que tú tengas que manejar o ver la llave privada.
			
		    - **`gcloud iam service-accounts sign-blob [INPUT] [OUTPUT] --iam-account=[EMAIL]`**: Toma un archivo de entrada, lo firma criptográficamente y genera un archivo de salida con la firma.
		    - **Uso experto:** Se utiliza para generar URLs firmadas manualmente o para procesos de validación de archivos descargados en sistemas externos.
		-  **[gcloud iam service-accounts sign-jwt ](https://cloud.google.com/sdk/gcloud/reference/iam/service-accounts/sign-jwt)**
		
			Firma un JSON Web Token (JWT) utilizando la cuenta de servicio. Es el estándar para la comunicación segura entre microservicios (Server-to-Server).
			
		    - **`gcloud iam service-accounts sign-jwt [INPUT_JSON] [OUTPUT_JWT] --iam-account=[EMAIL]`**: Convierte un conjunto de claims en un archivo JSON en un token JWT firmado y listo para ser usado en cabeceras de autorización.
		    - **Contexto:** Es la base de lo que explicamos antes sobre el intercambio de tokens; este comando permite crear manualmente lo que las librerías hacen de forma automática.
		      
			En cuanto a **`sign-blob/jwt`**, recuerda que estos comandos requieren que tu usuario tenga el rol `roles/iam.serviceAccountTokenCreator` sobre la cuenta de servicio que vas a usar para firmar.
		-  **[gcloud iam service-accounts undelete ](https://cloud.google.com/sdk/gcloud/reference/iam/service-accounts/undelete)**
		
			El "botón de pánico". Permite recuperar una cuenta de servicio que fue eliminada por error, siempre que se haga dentro del periodo de gracia (normalmente 30 días).
			
		    - **`gcloud iam service-accounts undelete [ACCOUNT_ID]`**: **OJO**, aquí no usas el email, sino el **ID numérico de 21 dígitos** que obtienes de los logs de auditoría o de un `describe` previo.
		    - **Limitación:** Recupera la identidad, pero es posible que debas volver a asignar manualmente algunos roles de IAM si la estructura del proyecto cambió.
		      
			Para el comando **undelete**, ten siempre a mano un reporte de **Cloud Asset Inventory** (como vimos en la sección de auditoría). Si alguien borra una cuenta de servicio, el email desaparece, y sin el **ID numérico**, no podrás usar el comando undelete. Es un "seguro de vida" para tu infraestructura.
		-  **[gcloud iam service-accounts update ](https://www.google.com/search?q=https://cloud.google.com/sdk/gcloud/reference/iam/service-accounts/update)**
		
			Permite modificar la información descriptiva de la cuenta sin alterar su identidad técnica (email/ID) ni sus llaves.
			
		    - **`gcloud iam service-accounts update [EMAIL] --display-name="..." --description="..."`**: Cambia el nombre visual y la nota de propósito.
		    - **Importancia:** Mantener descripciones actualizadas es la diferencia entre una auditoría exitosa y una pesadilla de "no sé qué hace esta cuenta".
		-  **[gcloud iam service-accounts keys create ](https://www.google.com/search?q=https://cloud.google.com/sdk/gcloud/reference/iam/service-accounts/keys/create)**
		  
			Genera una nueva llave privada para la cuenta de servicio y descarga el archivo a tu máquina. Este archivo es el "secreto" que usarás en tus aplicaciones para autenticarlas.
		    
		    - **`gcloud iam service-accounts keys create [ARCHIVO_SALIDA] --iam-account=[EMAIL]`**: Crea la llave y la guarda (usualmente como `key.json`).
		    - **Advertencia de experto:** Google solo te permite descargar la parte privada **una vez**. Si pierdes el archivo, no puedes volver a descargarlo; tendrás que borrar la llave y crear una nueva.
		-  **[gcloud iam service-accounts keys delete ](https://www.google.com/search?q=https://cloud.google.com/sdk/gcloud/reference/iam/service-accounts/keys/delete)**
		  
			Elimina de forma permanente una llave específica. Es fundamental para la rotación de seguridad o si sospechas que una llave ha sido filtrada.
		    
		    - **`gcloud iam service-accounts keys delete [KEY_ID] --iam-account=[EMAIL]`**: Invalida la llave inmediatamente en los servidores de Google.
		    - **Nota técnica:** Necesitas el `KEY_ID`, que es un código alfanumérico largo que puedes obtener con el comando `list`.
		-  **[gcloud iam service-accounts keys disable ](https://www.google.com/search?q=https://cloud.google.com/sdk/gcloud/reference/iam/service-accounts/keys/disable)**
		  
			Desactiva una llave temporalmente sin borrarla. El software que use esta llave recibirá errores de autenticación hasta que se vuelva a activar.
		    
		    - **`gcloud iam service-accounts keys disable [KEY_ID] --iam-account=[EMAIL]`**: Útil para "apagar" un acceso sospechoso mientras investigas, sin destruir la llave definitivamente.
		-  **[gcloud iam service-accounts keys enable ](https://www.google.com/search?q=https://cloud.google.com/sdk/gcloud/reference/iam/service-accounts/keys/enable)**
		  
			Reactiva una llave que habías deshabilitado previamente.
		    
		    - **`gcloud iam service-accounts keys enable [KEY_ID] --iam-account=[EMAIL]`**: Restaura el acceso instantáneamente para las aplicaciones que posean ese archivo de llave.
		-  **[gcloud iam service-accounts keys list ](https://cloud.google.com/sdk/gcloud/reference/iam/service-accounts/keys/list)**
		  
			Muestra todas las llaves asociadas a una cuenta de servicio, indicando su ID y cuándo fueron creadas.
		    
		    - **`gcloud iam service-accounts keys list --iam-account=[EMAIL]`**: Muestra tanto las llaves gestionadas por el usuario (creadas por ti) como las gestionadas por Google (usadas internamente por servicios como App Engine).
		    - **Flag de rotación:** `--created-before=TIMESTAMP` es ideal para identificar llaves viejas que necesitan ser rotadas.
		-  **[gcloud iam service-accounts keys upload ](https://www.google.com/search?q=https://cloud.google.com/sdk/gcloud/reference/iam/service-accounts/keys/upload)**
		  
			Permite que tú generes tu propio par de llaves (pública/privada) en tu servidor y solo subas la parte **pública** a Google Cloud.
		    
		    - **`gcloud iam service-accounts keys upload [PUBLIC_KEY_FILE] --iam-account=[EMAIL]`**: De esta forma, Google nunca llega a conocer tu llave privada, aumentando el nivel de seguridad y soberanía sobre tus credenciales.
-  **Laboratorio**

	-  **Data Bases**
	
		-  **[[crea-almacén-datos-través-uniones-y-fusiones]]**
		-  
-  **Herramientas**

	- **Antigravity CLI**
	-  **[Antigravity SDK ](https://github.com/google-antigravity/antigravity-sdk-python)**

![[Barra.gif]]




