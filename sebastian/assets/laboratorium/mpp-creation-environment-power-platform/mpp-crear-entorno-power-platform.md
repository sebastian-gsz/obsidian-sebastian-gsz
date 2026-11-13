---
def-type: def-lab
version: 1
status: succeeded
category: implementación
date: 2026-07-05
id: lab-power-platform-environment-dataverse-setup
contexto: microsoft-power-platform
aliases:
  - creación de entornos power platform
  - configuración de base de datos dataverse
tags:
  - power-platform
  - dataverse
  - power-apps
  - canvas-apps
  - low-code
---
![[creation-environment-mpp.webp]]


-  **Settings**

	- Ve al **Centro de administración de Power Platform** (`admin.powerplatform.microsoft.com`).
	- Navegas a la sección "**Entornos**" y eliges crear uno nuevo.
	- Se sugiere crear un entorno de tipo **"Sandbox"**, que es ideal para desarrollo y pruebas por su flexibilidad.
	- Es importante notar, como se explicó en la clase anterior, que en este paso inicial **puedes elegir no añadir soporte para Dataverse** (lo cual se hace para demostrar el siguiente paso). Le das un nombre (como "**``EntornoDemo``**") y configuras algunas opciones básicas como la región y el tipo.
-  **Añadir soporte para dataverse al entorno:**

	- Una vez creado el entorno (inicialmente sin Dataverse), vuelves al Centro de administración de Power Platform.
	- Seleccionas el entorno recién creado.
	- Habrá una opción para **"Añadir Dataverse"**. Al hacer clic aquí, se inicia el proceso para aprovisionar una base de datos Dataverse en ese entorno.
	- La transcripción resalta de nuevo que este es un paso **irreversible**; una vez que añades Dataverse, no puedes quitarlo. Durante este proceso, debes elegir el idioma y la moneda base para la base de datos Dataverse.
-  **Añadir una tabla de dataverse:**

	- Con el entorno ya teniendo una base de datos Dataverse, el siguiente paso es crear una tabla.
	- Para ello, vas al **Portal del creador de Power Apps** (`make.powerapps.com`).
	- Es **crucial asegurarte de que estás trabajando en el entorno correcto** (el que acabas de crear, "**``EntornoDemo``**"). Lo seleccionas en la parte superior derecha.
	- Dentro de ese entorno, navegas a la sección "**Tablas**". Verás tablas estándar que ya existen en Dataverse por defecto.
	- Creas una **nueva tabla** (por ejemplo, llamada "Producto del curso"). Le das un nombre para mostrar y un nombre plural, y la guardas. La transcripción menciona que no se tocan las opciones avanzadas en este punto. Se crea una tabla básica y se añade un par de filas de ejemplo para tener datos.
-  **Añadir una aplicación básica:**

	- Mientras sigues en el mismo entorno ("**``EntornoDemo``**") en el portal del creador de Power Apps, vas a la sección "**Aplicaciones**".
	- Creas una **nueva aplicación**, en este caso, una aplicación de lienzo (canvas app). Le das un nombre (como "Mi Aplicación de Ejemplo").
	- Se abre el editor de aplicaciones. La transcripción sugiere añadir un control simple (como una etiqueta de texto con "Hola Mundo") y luego **guardar y publicar la aplicación**. Publicar es importante para que los cambios estén disponibles para su exportación posterior.
-  **Añadir una solución al entorno:**

	- De vuelta en el entorno ("**``EntornoDemo``**") en el portal del creador, vas a la sección "Soluciones".
	- Creas una **nueva solución**. Le das un nombre (como "Solución Demo").
	- Un paso importante aquí es **configurar el "Editor" (Publisher) de la solución**. Se sugiere crear un nuevo editor personalizado (dándole un nombre como "Ali Reza Publisher") y, crucialmente, definir un **prefijo de personalización** único (como "ATP"). Este prefijo se usará para identificar los componentes personalizados que crees dentro de esta solución y ayuda a evitar conflictos con personalizaciones de otros editores.
	- La transcripción señala que, al crearla desde aquí, la solución es por defecto **no gestionada**, lo que te permite añadir y quitar componentes libremente.
-  **Añadir componentes (Tabla y Aplicación) a la solución:**

	- Una vez creada la solución ("Solución Demo"), entras en ella desde la lista de soluciones.
	- Dentro de la solución, utilizas la opción para **"Añadir existente"**. Aquí puedes seleccionar los componentes que ya creaste en este entorno y que quieres incluir en tu paquete de solución.
	- Siguiendo el ejercicio, añadirías la **tabla "Producto del curso"** y la **aplicación "Mi Aplicación de Ejemplo"** a la solución.