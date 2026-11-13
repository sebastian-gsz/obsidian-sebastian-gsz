
**AWS RAM** es un servicio que permite **compartir recursos de AWS de forma segura** entre diferentes cuentas de AWS, ya pertenezcan a la misma empresa u organización, o sean cuentas externas. Su objetivo principal es evitar la duplicación innecesaria de infraestructura y simplificar la gestión operativa en entornos multi-cuenta.

| **Concepto arquitectónico**    | **Amazon Web Services (AWS)**                | **Google Cloud Platform (GCP)** | **Microsoft Azure**                      |
| ------------------------------ | -------------------------------------------- | ------------------------------- | ---------------------------------------- |
| **Contenedor Global**          | AWS Organizations                            | Organization                    | Management Group Raíz                    |
| **Gobernanza / Agrupación**    | Unidades Organizativas (OU)                  | Folders                         | Management Groups                        |
| **Aislamiento y Facturación**  | Cuenta de AWS                                | Project                         | Subscription                             |
| **Infraestructura Compartida** | **AWS RAM** (Subnets, Transit Gateway, etc.) | Shared VPC                      | VNet Peering / Subscriptions Compartidas |

> [!WARNING] **Nota de seguridad:** El uso de AWS RAM elimina la necesidad de crear arquitecturas complejas de _peering_ inter-cuenta para recursos básicos, centralizando el control y reduciendo la superficie de ataque o la duplicación de costes operativos.

-  **Reducción de la complejidad de red:** Al compartir subredes de VPC, los equipos de desarrollo pueden desplegar recursos directamente en una infraestructura de red previamente auditada y securizada por el equipo de redes central.
-  **Gobernanza centralizada:** Permite que herramientas como _AWS License Manager_ o _Route 53 Resolver_ mantengan una única fuente de verdad para toda la organización, evitando desviaciones de cumplimiento normativo (_compliance_).
![[barra.gif]]
###### **Caso práctico: Compartir una subred de VPC con AWS RAM**

Para ilustrar el funcionamiento de AWS RAM, veremos cómo una **cuenta central de red (Propietaria)** puede compartir una subred específica con una **cuenta de desarrollo o cargas de trabajo (Consumidora)** dentro de la misma organización de AWS.

-  **Cuenta propietaria (ID: 111111111111):** Contiene la VPC central y las subredes creadas por el equipo de redes corporativo.
-  **Cuenta consumidora (ID: 222222222222):** Pertenece a un equipo de desarrollo que necesita desplegar instancias EC2 en la red común sin gestionar la infraestructura de enrutamiento.

-  **Paso 1: Habilitar el uso compartido en AWS Organizations**

	Antes de compartir recursos, es necesario permitir el intercambio a nivel de organización:
	
	1. Inicia sesión en la **cuenta de administración (Management Account)** de AWS Organizations.
	2. Accede a la consola de **AWS RAM**.
	3. En la sección de configuración general, comprueba que está activa la opción de **Habilitar el uso compartido dentro de AWS Organizations** (_Enable sharing with AWS Organizations_).
-  **Paso 2: Crear la VPC en la cuenta propietaria**

	1. Desde la **Cuenta Propietaria (111111111111)**, entra en la consola de **Amazon VPC**.
	2. Crea una VPC (por ejemplo, con bloque CIDR `10.0.0.0/16`) y al menos una **Subred Privada** (por ejemplo, `10.0.1.0/24`).
-  **Paso 3: Configurar el recurso compartido en AWS RAM**

	1. Abre la consola de **AWS RAM** en la Cuenta Propietaria.
	2. Haz clic en **Create resource share** (Crear recurso compartido).
	3. Rellena los parámetros requeridos:
	
	    - **Name (Nombre):** `compartir-subred-desarrollo`
	    - **Resource type (Tipo de recurso):** Selecciona **Subnets**.
	    - **Select resources:** Busca y marca la subred privada creada previamente (`10.0.1.0/24`).
	    - **Associated permissions:** Mantén los permisos predeterminados para subredes (ej. `AWSRAMDefaultPermissionSubnet`).
	    - **Principals (Principales):** Define el alcance de destino. Puedes seleccionar una **Unidad Organizativa (OU)** completa o introducir de forma específica el ID de la **Cuenta Consumidora (`222222222222`)**.
	4. Haz clic en **Create resource share**.
-  **Paso 4: Verificación y uso en la cuenta consumidora**

	1. Inicia sesión en la **Cuenta Consumidora (222222222222)**.
	2. Dado que el intercambio se realiza dentro de la misma organización con la opción activada, la aceptación es automática. _(Nota: si se tratara de una cuenta externa o la opción estuviera deshabilitada, requeriría aceptar la invitación explícitamente desde AWS RAM > Shared with me)._
	3. Dirígete a la consola de **Amazon VPC** y haz clic en **Subnets**. Verás que la subred de la cuenta central aparece listada y marcada con el indicador de **Shared** (Compartida).
	4. Al desplegar recursos como instancias **Amazon EC2** o clústeres de **Amazon EKS**, podrás seleccionar esta subred compartida en el desplegable de red. La máquina virtual obtendrá una dirección IP del rango gestionado por el equipo central de redes.
    
**Consideraciones clave de seguridad y gobierno**

-  **Delimitación de responsabilidades:** La cuenta propietaria conserva la administración exclusiva de los componentes de red estructurales (tablas de rutas, pasarelas de internet, NAT Gateways y Network ACLs). La cuenta consumidora solo tiene permisos de uso operativo sobre la subred.
-  **Aislamiento mediante Grupos de Seguridad:** Cada cuenta consumidora gestiona de forma independiente sus propios grupos de seguridad (_Security Groups_) asociados a las interfaces de red (ENIs) de sus recursos, garantizando el aislamiento lógico entre cargas de trabajo de distintos equipos.

