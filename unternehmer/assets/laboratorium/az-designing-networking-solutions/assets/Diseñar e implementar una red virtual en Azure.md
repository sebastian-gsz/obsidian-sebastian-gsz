
-  **[Enlaces ](https://microsoftlearning.github.io/AZ-700-Designing-and-Implementing-Microsoft-Azure-Networking-Solutions/Instructions/Exercises/M01-Unit%204%20Design%20and%20implement%20a%20Virtual%20Network%20in%20Azure.html)**

![[barra.gif]]

| **Name**              |    **Región**     | **Adress IP**  | **Enfoque de Diseño**                                                                                                          |
| --------------------- | :---------------: | -------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| **CoreServicesVnet**  |  Este de EE. UU.  | `10.20.0.0/16` | Soporta alta carga, servicios compartidos (DNS/DC), bases de datos, web y conectividad VPN local. Requiere alta escalabilidad. |
| **ManufacturingVnet** | Europa Occidental | `10.30.0.0/16` | La red está cerca de la organización para gestionar sistemas de fabricación y sensores IoT. Necesita espacio de expansión.     |
| **ResearchVnet**      | Sudeste Asiático  | `10.40.0.0/16` | La red está cerca de la organización (equipo de I+D). Diseño pequeño y estable, sin previsiones de crecimiento masivo.         |
Esta estructura de direccionamiento no solo cubre los recursos actuales, sino que establece una base sólida que permite el crecimiento proyectado en las zonas de mayor demanda (Core y Manufacturing), manteniendo un entorno controlado para I+D.

![[barra.gif]]

###### Tarea 1: **Crear el grupo de recursos Contoso**

Para configurar el entorno inicial en el Portal de Azure, sigue estos pasos:

-  **Acceso:** Inicia sesión en el **Portal de Azure** y navega a la sección de **Grupos de recursos** (Resource groups).
-  **Inicio de creación:** Haz clic en el botón **+ Crear** (+ Create).
-  **Configuración:** Completa la pestaña de aspectos **Básicos** (Basics) con los siguientes datos:

    -  **Grupo de recursos:** `ContosoResourceGroup`
    -  **Región:** (US) East US
    -  **Etiquetas (Tags):** No requiere cambios.
-  **Despliegue:** Selecciona **Revisar y crear** (Review + create), valida la configuración y haz clic en **Crear**.
-  **Verificación:** Confirma que el grupo `ContosoResourceGroup` aparezca en la lista de grupos de recursos disponibles.
###### Tarea 2: **Configuración de las red virtuales CoreServicesVnet**

La creación de `CoreServicesVnet` en la región (US) East US establece la base de red para el despliegue de servicios críticos.

| **Opción**                      | **Valor**              |
| ------------------------------- | ---------------------- |
| **Grupo de recursos**           | `ContosoResourceGroup` |
| **Nombre**                      | `CoreServicesVnet`     |
| **Región**                      | (US) East US           |
| **Espacio de direcciones IPv4** | `10.20.0.0/16`         |
**Configuración de subredes**

Para implementar la segmentación, configura las siguientes subredes dentro de la red virtual. **Pasos de ejecución**:

- Busca **Redes virtuales** en la barra de búsqueda global del portal de Azure y selecciona **Crear**.
- Ingresa los valores de configuración principal detallados en la tabla de arriba.
- Selecciona **+ Añadir subred** para configurar cada una de las subredes. Si existe una subred predeterminada, edítala o elimínala según sea necesario.
- Al finalizar la configuración, selecciona **Revisar + crear**.
- Valida que el proceso termine correctamente y selecciona **Crear**.

| **Nombre de la subred**  | **Rango de direcciones** | **Subnet Privada** | **Propósito**           |
| ------------------------ | ------------------------ | ------------------ | ----------------------- |
| `GatewaySubnet`          | `10.20.0.0/27`           | ♥️                 | Pasarela de red virtual |
| `SharedServicesSubnet`   | `10.20.10.0/24`          | 💚                 | Servicios compartidos   |
| `DatabaseSubnet`         | `10.20.20.0/24`          | 💚                 | Bases de datos          |
| `PublicWebServiceSubnet` | `10.20.30.0/24`          | ♥️                 | Servicios web públicos  |

Recuerda aplicar esta misma lógica de despliegue para las redes `ManufacturingVnet` y `ResearchVnet` utilizando los parámetros específicos correspondientes a cada una, siguiendo el mismo flujo de trabajo.

| **Virtual Network** | **Region**     | **Virtual network address space** | **Subnet Privada** | **Subnet**                | **Subnet**    |
| ------------------- | -------------- | --------------------------------- | ------------------ | ------------------------- | ------------- |
| CoreServicesVnet    | East US        | 10.20.0.0/16                      |                    |                           |               |
|                     |                |                                   | ♥️                 | GatewaySubnet             | 10.20.0.0/27  |
|                     |                |                                   | 💚                 | SharedServicesSubnet      | 10.20.10.0/24 |
|                     |                |                                   | 💚                 | DatabaseSubnet            | 10.20.20.0/24 |
|                     |                |                                   | ♥️                 | PublicWebServiceSubnet    | 10.20.30.0/24 |
| ManufacturingVnet   | West Europe    | 10.30.0.0/16                      |                    |                           |               |
|                     |                |                                   | 💚                 | ManufacturingSystemSubnet | 10.30.10.0/24 |
|                     |                |                                   | 💚                 | SensorSubnet1             | 10.30.20.0/24 |
|                     |                |                                   | 💚                 | SensorSubnet2             | 10.30.21.0/24 |
|                     |                |                                   | 💚                 | SensorSubnet3             | 10.30.22.0/24 |
| ResearchVnet        | Southeast Asia | 10.40.0.0/16                      |                    |                           |               |
|                     |                |                                   | 💚                 | ResearchSystemSubnet      | 10.40.0.0/24  |
###### ARM

Esta plantilla de bíceps crea tres redes virtuales (VNets) y sus subredes asociadas.

1. Cree un grupo de recursos:

```PowerShell
new-azresourceGroup -Name "rg-tajamar-uhm" -Location 'eastus'
```

2. Implemente la plantilla de bíceps junto con el archivo de parámetros mediante el siguiente comando:

```PowerShell
$date = Get-Date -Format "MM-dd-yyyy"
$deploymentName = "AzInsiderDeployment"+"$date"

New-AzResourceGroupDeployment -Name $deploymentName -ResourceGroupName rg-tajamar-uhm -TemplateFile .\main.bicep -TemplateParameterFile .\azuredeploy.parameters.json -c
```

![[Mo1/azuredeploy.parameters.json]]

![[unternehmer/assets/laboratorium/az-designing-networking-solutions/assets/M01/Unit01/main.bicep]]












































