
![[barra.gif]]

- [x] **Manipulación de Datos**: Crear conjuntos de datos y tablas dentro de BigQuery.
- [x] **Análisis de Sentimiento**: Explorar y filtrar datos utilizando funciones de agregación.
- [x] **Enriquecimiento de Datos**: Combinar múltiples fuentes de datos mediante `JOIN` para obtener estadísticas operativas.
- [x] **Gestión de Datos Históricos**: Implementar `UNION` y comodines de tabla (`*`) para consolidar reportes diarios.

![[barra.gif]]

-  Tarea 1: **Crear un nuevo conjunto de datos**

	1. **Accede a BigQuery:**
	
	    -  En la consola de Google Cloud, haz clic en el **menú de navegación** (las tres líneas horizontales en la esquina superior izquierda).
	    -  Busca y selecciona **BigQuery**.
	2. **Ubica tu proyecto:**
	
	    -  En el panel de la izquierda (llamado "Explorador"), verás el nombre de tu proyecto (que comienza con `qwiklabs-gcp-xxxx...`). Haz clic sobre él para seleccionarlo.
	3. **Inicia la creación:**
	
	    -  Al hacer clic en el nombre de tu proyecto, aparecerán tres puntos verticales (⋮) a la derecha del nombre. Haz clic en ellos.
	    -  Selecciona la opción **Crear conjunto de datos**.
	4. **Configura el conjunto de datos:**
	
	    -  En la pantalla de configuración que se abrió, completa los campos así:
	     
	        -  **ID del conjunto de datos**: Escribe `ecommerce` (asegúrate de escribirlo tal cual, todo en minúsculas).
	        -  **Ubicación de los datos**: Selecciona `US (múltiples regiones en Estados Unidos)`.
	        -  Deja todas las demás opciones en sus valores predeterminados (por defecto).
	5. **Finaliza:**
	
	    -  Haz clic en el botón **Crear conjunto de datos**.
	
	**Verificación**
	
	- Una vez creado, verás que el nuevo conjunto de datos `ecommerce` aparece listado debajo de tu proyecto en el panel izquierdo.
	- Ahora, regresa a la ventana o pestaña donde tienes abiertas las instrucciones del laboratorio y haz clic en el botón **"Revisar mi progreso"** para confirmar que la tarea se completó correctamente.
-  Tarea 2: **Explora el conjunto de datos de sentimientos sobre productos**

	1. En el **Editor de consultas** de BigQuery, pega y ejecuta el siguiente comando:
	
		**CREATE OR REPLACE TABLE ecommerce.products AS** 
		**SELECT * FROM `data-to-insights.ecommerce.products`**
	2. Una vez ejecutado, verás la tabla `products` dentro de tu conjunto de datos `ecommerce` en el panel de la izquierda. Haz clic en ella para seleccionarla.
	
		-  **Vista previa**: Haz clic en la pestaña **Vista previa** para ver los datos cargados. Esto te permitirá familiarizarte con las columnas `name`, `sentimentScore` y `sentimentMagnitude`.
		-  **Esquema**: Haz clic en la pestaña **Esquema**. Aquí podrás verificar los tipos de datos (por ejemplo, notarás que `sentimentScore` y `sentimentMagnitude` son de tipo `FLOAT`).
		
		Ahora realizaremos dos consultas clave para identificar los productos con mejores y peores sentimientos.
		
			SELECT SKU, name, sentimentScore, sentimentMagnitude 
			FROM `data-to-insights.ecommerce.products` 
			ORDER BY sentimentScore DESC 
			LIMIT 5
		
		Para evitar errores con valores vacíos, utilizaremos un filtro `IS NOT NULL`:
		
			SELECT SKU, name, sentimentScore, sentimentMagnitude 
			FROM `data-to-insights.ecommerce.products` 
			WHERE sentimentScore IS NOT NULL 
			ORDER BY sentimentScore ASC 
			LIMIT 5
	
	**Nota técnica:** Si al ejecutar la consulta de los productos con sentimiento más negativo obtienes resultados inesperados, asegúrate de que el filtro `WHERE sentimentScore IS NOT NULL` esté correctamente aplicado antes del `ORDER BY`.
-  Tarea 3: **Une conjuntos de datos para buscar estadísticas**

	SELECT DISTINCT
	  website.productSKU,
	  website.total_ordered,
	  inventory.name,
	  inventory.stockLevel,
	  inventory.restockingLeadTime,
	  inventory.sentimentScore,
	  inventory.sentimentMagnitude
	FROM `ecommerce.sales_by_sku_20170801` AS website
	LEFT JOIN `data-to-insights.ecommerce.products` AS inventory
	  ON website.productSKU = inventory.SKU
	ORDER BY total_ordered DESC

	SELECT DISTINCT
	  website.productSKU,
	  website.total_ordered,
	  inventory.name,
	  inventory.stockLevel,
	  inventory.restockingLeadTime,
	  inventory.sentimentScore,
	  inventory.sentimentMagnitude,
	  SAFE_DIVIDE(website.total_ordered, inventory.stockLevel) AS ratio
	FROM `ecommerce.sales_by_sku_20170801` AS website
	LEFT JOIN `data-to-insights.ecommerce.products` AS inventory
	  ON website.productSKU = inventory.SKU
	ORDER BY total_ordered DESC

	SELECT DISTINCT
	  website.productSKU,
	  website.total_ordered,
	  inventory.name,
	  inventory.stockLevel,
	  inventory.restockingLeadTime,
	  inventory.sentimentScore,
	  inventory.sentimentMagnitude,
	  SAFE_DIVIDE(website.total_ordered, inventory.stockLevel) AS ratio
	FROM `ecommerce.sales_by_sku_20170801` AS website
	LEFT JOIN `data-to-insights.ecommerce.products` AS inventory
	  ON website.productSKU = inventory.SKU
	WHERE SAFE_DIVIDE(website.total_ordered, inventory.stockLevel) >= 0.50
	ORDER BY total_ordered DESC

![[barra.gif]]

-  **JOIN (Left Join)**: Fundamental para enriquecer datos de ventas con metadatos de productos (nombre, inventario, sentimiento) sin perder los registros de ventas principales.
-  **SAFE_DIVIDE**: Función de seguridad esencial en SQL para evitar que una consulta falle debido a valores `0` en el denominador (división por cero) durante cálculos de ratio de inventario.
-  **UNION vs UNION ALL**:
  
    -  `UNION`: Elimina registros duplicados (costo computacional mayor).
    -  `UNION ALL`: Mantiene todos los registros, más eficiente para volúmenes grandes de datos donde la integridad se gestiona a nivel de aplicación o tabla.
-  **Wildcards (`_TABLE_SUFFIX`)**: Permite consultar dinámicamente múltiples tablas que comparten un prefijo, evitando la escritura manual de múltiples `UNIONs`.

![[barra.gif]]

-  **¿Por qué es recomendable utilizar `SAFE_DIVIDE` en lugar de una división estándar `/` al trabajar con niveles de inventario?**

    Respuesta esperada: Porque los niveles de inventario pueden ser `0` en ciertos registros. Una división estándar causaría un error de "division by zero" que detendría la ejecución de la consulta, mientras que `SAFE_DIVIDE` devuelve `NULL`, permitiendo que el resto del conjunto de datos se procese correctamente.
-  **¿Cuál es la ventaja de usar `_TABLE_SUFFIX` frente a realizar múltiples `UNION ALL`?**

    Respuesta esperada: `_TABLE_SUFFIX` permite escribir consultas más cortas, legibles y escalables. Si el número de tablas diarias aumenta, la consulta con comodines no necesita modificaciones, mientras que los `UNION` requerirían actualizar manualmente la sentencia SQL.

