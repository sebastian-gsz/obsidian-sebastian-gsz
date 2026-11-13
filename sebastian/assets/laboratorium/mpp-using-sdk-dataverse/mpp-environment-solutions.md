---
status: queued
date: 2026-07-14
solution_id: 0b65dc6b-cf7b-f111-ab0e-000d3a31a869
---
**manufacturing-master-data-mpp**
**│**
**├── appSolution**
**│   └── Provisioning Dataverse**
**│**
**├── dataModels**
**│   └── Definiciones de tablas**
**│**
**├── plugins.AppSolution**
**│   └── Plugins**
**│**   **└── Power Apps**
**│**	       **│**
**│**	       **├─ App Almacén**
**│**	       **├─ App Compras**
**│**	       **├─ App Producción**
**│**	       **├─ App Oficina Técnica**
**│**	       **├─ App Presupuestos**
**│**	       **│**
**│**	       **Dataverse "Manufacturing Master Data"** 
**│**         **│**
**│**         **├─ Catálogo Técnico**
**│**	       **├─ Inventario**
**│**	       **├─ Compras**
**│**	       **├─ Producción**
**│**	       **├─ Presupuestador**
**│**	       **├─ Clientes**
**│**	       **│**
**│**	       **Power Automate**
**│**	       **│**
**│**	       **├─ Flujos de compra**
**│**	       **├─ Reservas stock**
**│**	       **├─ Recepciones**
**│**	       **├─ Fabricación**
**│**	       **│**
**│**	       **Power BI**
**│**	       **│**
**│**         **├─ Costes**
**│**	       **├─ Producción**
**│**	       **├─ Compras**
**│**      	  **├─ Inventario**
**│**         **│**
**│**         **Copilot Studio**
**│**	       **│**
**│**	       **└─ Asistente técnico comercial**
**└── solution**
    **└── Dataverse Solution**

![[barra.gif]]

El objetivo de este proyecto es emplear las capacidades programáticas de C# para orquestar la autenticación, la lógica de negocio y las operaciones de lectura (CRUD) sobre entidades en Microsoft Dataverse, utilizando tipado fuerte mediante *Early Binding*.

- [ ] Qué herramientas necesito: librerías, CLI, gestor de paquetes (NuGet/Dotnet).
- [ ] Definición de arquitectura de software, jerarquía de carpetas y mejores prácticas para el desacoplamiento de lógica.

| **Directorio**        | **Tipo de Proyecto** | **Rol Arquitectónico**                            |
| --------------------- | -------------------- | ------------------------------------------------- |
| `dataModels`          | Class Library        | **El contrato de datos (Single Source of Truth)** |
| `appSolution`         | Console App          | **Orquestador y sandbox local**                   |
| `plugins.AppSolution` | Class Library        | **Lógica de negocio en el servidor**              |
| `solutionMetadata`    | `.cdsproj`           | **Empaquetador de despliegue (Metadata)**         |

**Análisis detallado de cada pieza**

-  `dataModels` (El Corazón de datos)

	-  **Función:** Alberga las clases generadas automáticamente (`Early Binding`) que representan tus tablas de Dataverse.
	-  **Por qué existe:** Es el **idioma común** de toda tu solución. Tanto tu consola (`appSolution`) como tus plugins (`plugins.AppSolution`) necesitan hablar el mismo lenguaje. Si cambias un tipo de dato en Dataverse y regeneras este proyecto, toda tu solución sabrá qué cambió inmediatamente gracias a la tipificación fuerte.
-  `appSolution` (El Orquestador local)

	-  **Función:** Es un ejecutable (`.exe`). Aquí escribes código para probar lógica, hacer migraciones masivas, o simplemente "jugar" con la API de Dataverse de forma local.
	-  **Por qué existe:** Los Plugins corren en el servidor y son difíciles de depurar en tiempo real. `appSolution` te permite **simular** lo que quieres hacer en tu máquina local antes de moverlo a un Plugin. Es tu "laboratorio de pruebas".
-  `plugins.AppSolution` (El motor del servidor)

	-  **Función:** Aquí escribes la lógica que vivirá **dentro** de Dataverse (Plugins, actividades personalizadas de Workflow).
	-  **Por qué existe:** A diferencia de `appSolution` (que tú ejecutas), este código lo ejecuta el motor de Dataverse cuando ocurre un evento (ej. "cuando se crea un cliente, calcular X"). Al estar separado, puedes compilarlo, empaquetarlo y desplegarlo independientemente de tus herramientas de consola.
-  `solutionMetadata` (El empaquetador)

	-  **Función:** No es código compilable, es un contenedor de configuración. Contiene los XMLs de tus soluciones (tablas, formularios, seguridad, apps de Power Apps).
	-  **Por qué existe:** Es la representación física de tu **Entorno**. Cuando llega el momento de mover todo a Producción, esta carpeta es la que le dice a Power Platform: "Instala estas tablas, configura estos roles y despliega este código". Es el puente final hacia el mundo de Power Platform.
    
**¿Por qué esta estructura es profesional?**

Si mañana un cliente te pide: _"Quiero que la lógica del plugin también se pueda ejecutar desde un script externo"_, tú simplemente llamas a la misma lógica desde `plugins.AppSolution` y desde `appSolution`. **No duplicas código.**

Estás listo para desarrollar. Tu estructura es robusta, aislada y cumple con los estándares de ingeniería de software para Power Platform.

-  **Auditoría inicial del entorno "Limpieza NuGet"**

	**``dotnet nuget locals all --list``**
	**``dotnet nuget locals all --clear``**
	**``dotnet nuget locals all --list``**
	
	Resultado: Esos mensajes indican que el comando ha eliminado correctamente todas las cachés locales que utiliza NuGet y que actualmente están vacías.
	
	-  **Cache HTTP limpia**
	
		-  Guarda copias locales de los metadatos y respuestas descargadas desde los feeds NuGet (`https://api.nuget.org`, Azure Artifacts, etc.).
		-  Sirve para acelerar consultas repetidas a repositorios de paquetes.
		-  Al limpiarla, la próxima restauración (`dotnet restore`) volverá a consultar el servidor.
		-  Ubicación típica: `%LOCALAPPDATA%\NuGet\v3-cache`
	-  **Global Packages limpia**
	  
		-  Es la caché más importante.
		-  Contiene los paquetes `.nupkg` ya descargados y extraídos.
		-  Cuando haces un `dotnet restore`, NuGet primero busca aquí antes de descargar nuevamente.
		-  Ubicación típica: `%USERPROFILE%\.nuget\packages`
		
		**Al limpiarla**:
		
		-  Se eliminan todos los paquetes descargados localmente.
		-  El siguiente `restore` descargará nuevamente todo lo necesario.
	-  **Temp cache limpia**
	
		-  Directorio temporal usado durante instalaciones, restauraciones y operaciones de NuGet.
		-  Contiene archivos intermedios que normalmente pueden borrarse sin riesgo.
		-  Ubicación típica: `%TEMP%\NuGetScratch`
	-  **Plugins cache limpia**
	
		-  Utilizada por plugins de autenticación.
		-  Muy común en entornos Azure DevOps, Azure Artifacts o repositorios privados.
		-  Guarda información temporal relacionada con credenciales y comunicación con plugins.
		-  Ubicación típica: `%LOCALAPPDATA%\NuGet\plugins-cache`
-  **Auditoría SDK .NET**

	- ``dotnet --info``
	- ``dotnet --list-sdks``
	- ``dotnet --list-runtimes``
	- ``dotnet tool list --global``
	- ``dotnet tool list --local``
	- ``dotnet tool update --global microsoft.powerapps.cli.tool``
	- ``dotnet tool update --global nuget.mcp.server``
	- ``dotnet tool update --global dotnet-ef``
	- ``dotnet tool list --local``
	- ``dotnet tool list --global``
	- `dotnet list package --outdated --include-transitive`
	
	**Actualizaciones ejecutadas:**
	
	-  ``dotnet tool update --global microsoft.powerapps.cli.tool``
	-  ``dotnet tool update --global nuget.mcp.server``
	-  ``dotnet tool update --global dotnet-ef``
-  **Creación de la solución**

	-  **Solución: `dotnet new sln -n appsolution`**
	-  **Configuración predefinida fijado**: `dotnet new globaljson --sdk-version 10.0.301`
	
	**Creación de proyectos**
	
	-  **dataModels: `dotnet new classlib -n dataModels`**
	-  **appSolution: `dotnet new console -n appSolution`**
	-  **plugins.AppSolution: `dotnet new classlib -n plugins.AppSolution`**
	
	**Inclusión de ruta en solución**
	
	-  **``dotnet sln add .\dataModels\dataModels.csproj``**
	-  **``dotnet sln add .\appSolution\appSolution.csproj``**
	-  **``dotnet sln add .\plugins.AppSolution\plugins.AppSolution.csproj``**

	**Referencias entre proyectos: ``cd ..\plugins.AppSolution``**
	
	-  plugins.AppSolution: ``dotnet add reference ..\dataModels\dataModels.csproj``

	**Referencias entre proyectos: ``cd ..\dataModels``**

	-  `dotnet add package Microsoft.PowerPlatform.Dataverse.Client`

	**Referencias entre proyectos: ``cd ..\appSolution``**

	-  ``dotnet add package Microsoft.Extensions.Hosting``
	-  ``dotnet add package Microsoft.Extensions.Configuration.Json``
	-  ``dotnet add package Microsoft.Extensions.DependencyInjection``
	-  ``dotnet add package Serilog.Extensions.Hosting``
	-  ``dotnet add package Serilog.Sinks.Console``
-  **Vulnerabilidad detectada**

	**Ejecutar desde la raíz:**
	
	-  ``dotnet restore``
	-  ``dotnet sln list``
	-  ``dotnet list package --include-transitive``
	-  ``dotnet list package --vulnerable``
	-  ``dotnet list package --outdated --include-transitive``
	
	**Y para exportar los resultados:**

	-  ``dotnet list package --vulnerable > vulnerable.txt``
	-  ``dotnet list package --outdated --include-transitive > outdated.txt``
	-  ``dotnet list package --include-transitive > inventory.txt``

-  **Aplicación empresarial**

	-  ``az ad app create --display-name "appEnterpriseConnect"``
	-  ``az ad app show --id appEnterpriseConnect-ID --query "publicClient.redirectUris"``
	-  ``az ad app show --id appEnterpriseConnect-ID --query "spa.redirectUris"``
	-  ``az ad app create --display-name "appEnterpriseConnect" --reply-urls "http://localhost" --output json``
	-  ``az ad app update --id appEnterpriseConnect-ID --public-client-redirect-uris "http://localhost"``
-  **Gestionar secretos**
  
	-  ``dotnet user-secrets init``
	-  ``dotnet user-secrets set "ConnectionString" "AuthType=OAuth;Url=https://org950ec639.crm.dynamics.com;AppId=appEnterpriseConnect-ID;RedirectUri=http://localhost;LoginPrompt=Auto"``

![[barra.gif]]

-  **Configuración y workflow de desarrollo**

	-  En lugar de tenerlo todo en una sola carpeta, crea una solución de .NET para gestionar ambos proyectos: **`dotnet new sln -n appsolution`**
	
		-  **Capa de datos - Class library: ``dotnet new classlib -n dataModels && dotnet sln add dataModels``**
		-  **`dotnet new classlib -n plugins.AppSolution && dotnet sln add plugins.AppSolution`**
		  
			-  **`cd plugins.AppSolution && dotnet add reference ../dataModels/dataModels.csproj`**
			-  **`cd ..`**
		-  **Capa de lógica - Console app: `dotnet new console -n appSolution && dotnet sln add appSolution `**
		
			-  **Conectar los puntos: `cd appSolution && dotnet add reference ../dataModels/dataModels.csproj`**
			-  **`cd ..`**
		-  **`mkdir SolutionMetadata && cd SolutionMetadata`**
		-  **`pac solution init --publisher-name Sebastian --publisher-prefix uhm`**
		-  **`pac solution add-reference --path ..\plugins.AppSolution\plugins.AppSolution.csproj`**
		-  **`cd ..`**
		-  **`dotnet sln add SolutionMetadata\SolutionMetadata.cdsproj` o agrega manualmente al orquestador de soluciones en la raíz `<Project Path="solutionMetadata/solutionMetadata.cdsproj" />`**
		-  **`pac modelbuilder build --outdirectory .\dataModels\Entities --namespace dataModels.Entities --serviceContextName dataModelsContext`**
		-  **`cd dataModels`**
		-  **`dotnet add package Microsoft.PowerPlatform.Dataverse.Client`**
		-  **Opcional: `dotnet add package Microsoft.Crm.Sdk.CoreAssemblies`**
	
	**Other**
	
	-  Inicialización de solución: **``pac solution init --publisher-name juansebastian --publisher-prefix jsgz && dotnet build && pac solution import --path .\bin\Debug\appgimnasio.zip --async``**
	-  Generación de entidades (Early Binding "extraer metadatos y generar el tipado fuerte"): **`pac modelbuilder build --outdirectory .\models --namespace appgimnasio.models --serviceContextName appgimnasiocontext`**
-  **Comandos de entorno y seguridad**

	Principales comandos para la configuración del proyecto y la gestión de credenciales:
	
	-  **Estructura del proyecto:**

		- Entra al directorio: **``cd appSolution``**
		
			// Instalación de paquetes necesarios
			**``dotnet add package Microsoft.PowerPlatform.Dataverse.Client``**
			**``dotnet add package Microsoft.Extensions.Configuration``**
			**``dotnet add package Microsoft.Extensions.Configuration.UserSecrets``**
			**``dotnet add package Microsoft.Extensions.Configuration.Binder``**
			**``dotnet add package Microsoft.Extensions.Configuration.Json``**
			**``dotnet add package System.Security.Cryptography.Xml --version 10.0.6``**
		-  Entra al directorio: **``cd ..\dataModels``**
		
			// Paquetes base requeridos para que las entidades generadas funcionen
			**``dotnet add package Microsoft.CrmSdk.CoreAssemblies``**
		-  Entra al directorio: **``cd ..\plugins.AppSolution``**
		
			// Paquetes base requeridos para que las entidades generadas funcionen
			**``dotnet add package Microsoft.CrmSdk.CoreAssemblies``**
	-  **Seguridad y autenticación:**
	
	    -  `dotnet user-secrets init`
	    -  `az ad app create --display-name "GymApp-Conector"`
	    -  `az ad app list`
	    -  `dotnet user-secrets set "ConnectionString" "..."`
	    -  `az ad app update --id <TU-APP-ID> --public-client-redirect-uris "http://localhost"`

-  **Implementación (Program.cs)**

	El código actual utiliza `Microsoft.Extensions.Configuration` para cargar las credenciales de forma segura desde los secretos de usuario, desacoplando la configuración del ejecutable.
-  **Notas de seguridad**

	Se ha implementado el uso de `dotnet user-secrets` para evitar el _hardcoding_ de credenciales en el repositorio. Se recomienda encarecidamente mantener el paquete `System.Security.Cryptography.Xml` en versiones parcheadas (ej. 10.0.6) para evitar vulnerabilidades de denegación de servicio (CVE-2026-33116).

![[barra.gif]]

-  **El proyecto**

	El comandos para crear un proyecto: **``pac solution init --publisher-name juansebastian --publisher-prefix jsgz && dotnet build && pac solution import --path .\bin\Debug\appgimnasio.zip --async``**
-  **Early Binding**

	Extraer entidades y realizar un tipado fuerte Early Binding: **``pac modelbuilder build --outdirectory .\models --namespace appgimnasio.models --serviceContextName appgimnasiocontext``**

- dotnet add package Microsoft.Extensions.Configuration
- dotnet add package Microsoft.Extensions.Configuration.UserSecrets
- dotnet add package Microsoft.Extensions.Configuration.Binder
- dotnet add package Microsoft.Crm.Sdk.CoreAssemblies
- dotnet add package System.Security.Cryptography.Xml --version 10.0.6

Cambia tu `Program.cs` por este código: 

```C#
using Microsoft.PowerPlatform.Dataverse.Client;
using appgimnasio.models;
using System.Linq;
using Microsoft.Extensions.Configuration;
// Cargamos la configuración desde los secretos de usuario
var config = new ConfigurationBuilder()
    .AddUserSecrets<Program>()
    .Build();
string connectionString = config["ConnectionString"];
try
{
    using (var service = new ServiceClient(connectionString))
    {
        if (!service.IsReady)
        {
            throw new Exception($"Error al conectar: {service.LastError}");
        }
        var context = new appgimnasiocontext(service);
        // Lógica de consulta (procesamiento en memoria tras descarga)
        var primerosUsuarios = from u in context.CreateQuery<aaduser>()
                               select u;
        var lista = primerosUsuarios.Take(10).ToList().OrderBy(u => u.GivenName).ToList();
        foreach (var user in lista)
        {
            Console.WriteLine($"Usuario encontrado: {user.GivenName} {user.surname} ({user.Mail})");
        }
    }
}
catch (Exception ex)
{
    Console.WriteLine($"Ocurrió un error inesperado: {ex.Message}");
}
Console.WriteLine("\nPresiona cualquier tecla para cerrar...");
Console.ReadKey();
```

- Enterprise Scaffold
- LIQUID

![[barra.gif]]

```powershell
$pkgs = @(
    @{N="Newtonsoft.Json"; V="13.0.4"},
    @{N="Serilog"; V="4.4.0"},
    @{N="System.Configuration.ConfigurationManager"; V="10.0.10"},
    @{N="System.Drawing.Common"; V="10.0.10"},
    @{N="System.Runtime.Caching"; V="10.0.10"},
    @{N="System.Security.Cryptography.Pkcs"; V="10.0.10"},
    @{N="System.Security.Cryptography.ProtectedData"; V="10.0.10"},
    @{N="System.Security.Cryptography.Xml"; V="10.0.10"},
    @{N="System.Security.Permissions"; V="10.0.10"},
    @{N="System.ServiceModel.Http"; V="10.0.652802"},
    @{N="System.ServiceModel.Primitives"; V="10.0.652802"},
    @{N="System.Windows.Extensions"; V="10.0.10"}
)
foreach ($p in $pkgs) { dotnet add "appSolution/appSolution.csproj" package $p.N --version $p.V }
```

![[barra.gif]]

-  **Bitácora "Antigravity**

	 1. **¿Qué hemos hecho hasta ahora? (El contenedor)**
	
		Ya tenemos la infraestructura preparada para trabajar de forma profesional.
		
		-  **Creación del entorno de trabajo:** A través de Power Platform CLI, creamos una **solución** específica llamada `appgimnasio` con el prefijo `jsgz` y el editor `juansebastian`.
		-  **Despliegue:** Ya importamos esta solución vacía a tu entorno de Dataverse (`Unternehmer Deimos`), lo que significa que cualquier tabla, aplicación o flujo que creemos ahora quedará empaquetado correctamente bajo tu control.
	 2. **El plan estratégico (La lógica de datos)**
	
		El objetivo final es pasar de un archivo plano (Excel/Sheets) a una **base de datos relacional**. Esto es vital para que, en el futuro, puedas generar gráficos de progreso, ver tendencias de fuerza y manejar la variedad de ejercicios sin ensuciar la información.
		
		El plan consiste en dos tablas principales que debemos crear:
		
		-  **Tabla de catálogo (Catálogo de Ejercicios):** Será tu biblioteca. Contendrá el nombre, grupo muscular y una relación (lookup) a sí misma para permitir variaciones (ej. "Press banca" como padre, "Press banca con mancuernas" como hijo).
		-  **Tabla de transacciones (Sesión de Entrenamiento):** Aquí es donde ocurrirá la "magia" diaria. Registrará cada ejercicio con su fecha, peso, repeticiones y número de series.
	 3. **Razonamiento de nuestras decisiones**
	
		Hemos tomado decisiones críticas para evitar que la aplicación se vuelva un estorbo:
		
		-  **Evitar la "Micro-gestión" de tiempos en la BD:** Decidimos _no_ registrar el segundo exacto de inicio/fin de cada serie en la base de datos (lo cual sería un dolor de cabeza técnico y de usabilidad). En su lugar, el plan es usar un **temporizador visual en la interfaz (UI)**. Esto te da la funcionalidad de descanso sin la fricción de guardar datos innecesarios cada 30 segundos.
		-  **Estructura relacional:** Separamos los datos (series, repeticiones, peso) en columnas distintas. ¿Por qué? Porque si intentas guardar "12*15" en un solo campo de texto, la computadora no puede hacer matemáticas con eso. Al separarlos, Power Apps podrá calcular tu "Volumen Total" (Series × Reps × Peso) automáticamente.
		-  **Enfoque en la monotonía:** Al crear la tabla de catálogo con capacidad de "Variaciones", estamos preparando la app para que no te aburras. Podrás añadir nuevos ejercicios fácilmente sin romper el historial de lo que ya has entrenado.
	
	 **¿Cuál es el siguiente paso?**
	
	Ahora que tenemos el contenedor (la solución `appgimnasio`) y la estrategia clara, **el siguiente paso técnico es crear físicamente las tablas** dentro de esa solución en el portal de Power Apps.
-  **Bitácora "Copilot"**

	**13072026** - Se decidió extraer todas las tablas del sistema actual de modo que pudiéramos definir que tablas existen "866" y cuales sirven al propósito de la solución: **``pac modelbuilder build --outdirectory .\models --namespace appgimnasio.models --serviceContextName appgimnasiocontext``**
	**14072026** - 

-  **Integración en tu proyecto**

	1. **Añadir al proyecto:** Si estás usando Visual Studio, asegúrate de incluir la carpeta `Models` y todos sus archivos en tu proyecto (.csproj).
	2. **Dependencias (NuGet):** Para que las clases generadas funcionen, tu proyecto necesita referencias a los ensamblados de Dataverse. Asegúrate de instalar el siguiente paquete NuGet en tu proyecto:
	    
	    - `Microsoft.PowerPlatform.Dataverse.Client` (Este es el cliente recomendado actualmente para conectar y ejecutar los modelos).
	    - `Microsoft.CrmSdk.CoreAssemblies` (Para los tipos de datos básicos como `Entity`, `OptionSetValue`, etc.).
-  **Cómo usar tu nuevo contexto**

Ahora, en lugar de usar cadenas de texto para acceder a los campos, puedes usar `GymContext` para realizar consultas LINQ y manipular datos con IntelliSense.

Aquí tienes un ejemplo de cómo conectar y operar con tus nuevas clases:

```
using Microsoft.PowerPlatform.Dataverse.Client;
using GymNexus.Models; // El namespace que definiste en el build
using System.Linq;

// 1. Conexión al entorno
string connectionString = "AuthType=OAuth;Url=https://orgXXXXX.crm.dynamics.com;AppId=...;RedirectUri=...;";
using (ServiceClient serviceClient = new ServiceClient(connectionString))
{
    // 2. Instanciar tu contexto generado
    using (GymContext context = new GymContext(serviceClient))
    {
        // 3. Ejemplo: Consulta LINQ (Early-Bound)
        // Imagina que tienes una tabla personalizada 'gym_miembro'
        var miembros = from m in context.Gym_MiembroSet
                       where m.Gym_Nombre == "Sebastian"
                       select m;

        foreach (var miembro in miembros)
        {
            Console.WriteLine($"ID: {miembro.Gym_MiembroId}, Email: {miembro.Gym_Email}");
            
            // 4. Ejemplo: Actualización (Early-Bound)
            miembro.Gym_UltimaVisita = DateTime.Now;
            context.UpdateObject(miembro);
        }

        // Guardar cambios
        context.SaveChanges();
    }
}
```

### 3. Consideraciones arquitectónicas para tu lab

- **Enfoque en tus tablas:** Aunque se han generado 860 tablas (la mayoría son del sistema de Dataverse), tu enfoque debe estar en las que tú o tu equipo definan. No te preocupes por la cantidad de archivos; el compilador de C# solo incluirá en tu ejecutable lo que realmente utilices.
    
- **Actualizaciones:** Cada vez que realices cambios estructurales en Dataverse (añadir una columna, cambiar un tipo de dato, crear una tabla nueva), **debes volver a ejecutar el comando `pac modelbuilder build`**. De lo contrario, tus clases de C# quedarán desactualizadas respecto a la base de datos real.
    
- **GymContext como Singleton o Scoped:** Dependiendo de si tu aplicación es una consola o un servicio web (ASP.NET), ten cuidado con el ciclo de vida del `GymContext`. Normalmente, se recomienda que viva lo mismo que la conexión (`ServiceClient`).
    

¿Tienes planeado crear una aplicación de consola para probar esta conexión o estás integrándolo en un servicio web o plugin?

### ¿Por qué tantas tablas si yo no he creado 860?

Lo que estás viendo es el **"esqueleto" completo de la plataforma**. Dataverse es una plataforma empresarial que gestiona internamente miles de procesos; cada uno de ellos tiene sus propias tablas de metadatos. Al ejecutar el generador, este escanea todo el entorno y expone:

- **Tablas de negocio:** Las que tú creas (como `Gym_Miembro`).
    
- **Tablas del sistema:** Las que utiliza Dataverse para gestionar `Workflows` (flujos), `Plugins`, `Audit` (auditoría), `Solution` (la gestión de soluciones), `Power Pages` (tu web), `AsyncOperation` (tareas en segundo plano), y mucho más.
    
- **Tablas de configuración:** Ajustes de usuario, configuraciones de búsqueda global, etc.
    

El comando `pac modelbuilder` no filtra, sino que "mapea" todo lo que existe en el entorno hacia código C# para que tengas acceso tipado a cualquier parte de la plataforma.

### Sobre las carpetas que ves:

- **Carpeta `Entities`**: Aquí tienes las clases fuertemente tipadas de cada tabla. Cada archivo `.cs` (como `account.cs` o `systemuser.cs`) define los campos y relaciones de esa tabla.
    
- **Carpeta `OptionSets`**: Como bien dedujiste, aquí es donde se generan las enumeraciones (`enums`) de las listas desplegables. Cuando definiste una columna de tipo "Opción" (o "Choice") en Dataverse, la herramienta generó un archivo `.cs` en esta carpeta que contiene los valores válidos y sus números asociados.
    
- **`GymContext.cs`**: Este es el archivo más importante para tu desarrollo. Es el "contenedor" que agrupa todas las tablas y te permite realizar consultas LINQ sobre ellas. Verás que tiene propiedades como `public System.Linq.IQueryable<...> AccountSet` que actúan como puntos de acceso para cada una de esas 860 tablas.
    

### ¿Es normal tanto código?

Sí, es perfectamente normal. En un entorno de desarrollo profesional, no sueles abrir estos archivos manualmente, pero es vital que existan ahí.

**Tu flujo de trabajo ahora debería ser:**

1. **Ignora el ruido**: La mayoría de esas 860 tablas son internas. Cuando necesites programar algo (un plugin o una aplicación de consola), solo buscarás la clase que corresponda a tu entidad (ej. `Gym_Miembro.cs`).
2. **Usa LINQ**: Ya no tienes que preocuparte por escribir `FetchXML` manualmente para leer datos; usas `GymContext` y LINQ para filtrar los datos con el autocompletado de Visual Studio.
3. **Mantenimiento**: Si cambias algo en el diseño de una tabla (ej. añades un campo), simplemente vuelves a ejecutar el comando `pac modelbuilder build`, y el archivo correspondiente en `Entities` se actualizará automáticamente.
    
### Sobre las carpetas que ves:

- **Carpeta `Entities`**: Aquí tienes las clases fuertemente tipadas de cada tabla. Cada archivo `.cs` (como `account.cs` o `systemuser.cs`) define los campos y relaciones de esa tabla.
    
- **Carpeta `OptionSets`**: Como bien dedujiste, aquí es donde se generan las enumeraciones (`enums`) de las listas desplegables. Cuando definiste una columna de tipo "Opción" (o "Choice") en Dataverse, la herramienta generó un archivo `.cs` en esta carpeta que contiene los valores válidos y sus números asociados.
    
- **`GymContext.cs`**: Este es el archivo más importante para tu desarrollo. Es el "contenedor" que agrupa todas las tablas y te permite realizar consultas LINQ sobre ellas. Verás que tiene propiedades como `public System.Linq.IQueryable<...> AccountSet` que actúan como puntos de acceso para cada una de esas 860 tablas.