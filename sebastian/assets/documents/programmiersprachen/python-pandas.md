![[barra.gif]]
##### Biblioteca Pandas
- **``import pandas as pd``**: El comando importa de la biblioteca pandas a Python.

Pandas no se limita a CSV; admite múltiples formatos. Algunos ejemplos comunes incluyen:

![[Pasted image 20250112183529.png]]

- **``NombreVariable = pd.read_csv()``**: Una vez importada la biblioteca, se puede utilizar la siguiente sintaxis para leer un archivo csv. Este comando carga el contenido del archivo CSV `archivo.csv` en un objeto DataFrame de pandas. Un DataFrame es una estructura de datos tabular que se utiliza para almacenar y analizar datos tabulares.

-  **``to_json``**: Guardar el DataFrame como un nuevo archivo CSV. 

	``# Leer un archivo JSON``
	``df_json = pd.read_json("archivo.json")``
	
	``# Guardar como JSON``
	``df_json.to_json("archivo_modificado.json")``

-  **`columns`**: Se utiliza para obtener una lista con los nombres de las columnas de un DataFrame específico o si tienes una lista de nombres de columnas (por ejemplo, en otro archivo), puedes asignarla manualmente al DataFrame.

	`# Obtener una columna específica del DataFrame`
	``print(datos["columna1"])``
	
	`# Obtener un subconjunto del DataFrame basado en una condición`
	``print(datos[datos["columna2"] > 10])``

	``# Lista de encabezados``
	``encabezados = [``
	    ``"Simbolización", "Pérdidas Normalizadas", "Fabricante", "Combustible",``
	    ``"Puertas", "Carrocería", "Tracción", "Ubicación del motor", "Distancia entre ejes",``
	    ``"Longitud", "Ancho", "Altura", "Peso", "Tipo de motor", "Cilindros", "Tamaño del motor",``
	    ``"Sistema de combustible", "Diámetro", "Carrera", "Relación de compresión", "Caballos de fuerza",``
	    ``"Revoluciones máximas", "Consumo en ciudad", "Consumo en carretera", "Precio"``
	``]``
	
	``# Asignar encabezados al DataFrame``
	``df.columns = encabezados``
	
	``# Verificar los cambios``
	``print(df.head())  # Ahora las columnas tendrán nombres significativos.``

-  **``replece()``**: Remplaza caracteres. 

	``df1 = df.replace('?',np.nan)``

	- Este método se aplica a todo el DataFrame '``df``'.
	- **``'?'``:** Busca todas las celdas que contienen el valor '?' (un signo de interrogación).
	- **``np.nan``:** Reemplaza los valores encontrados ``'?'`` por '``NaN``' (Not a Number), que es un valor especial en NumPy (y por extensión en Pandas) que indica un valor faltante o no válido.

-  **`str.startswith`**: Esta función se utiliza para verificar si cada elemento de una serie de texto comienza con una determinada cadena. Por ejemplo:

	``import pandas as pd``
	``data = {'frutas': ['manzana', 'banana', 'kiwi', 'pera']}``
	``df = pd.DataFrame(data)``
	
	``filtro = df['frutas'].str.startswith('man') # Filtrar las filas donde el nombre de la fruta comienza con 'man'``
	``resultado = df[filtro]``
	``print(resultado)``
	
    En este caso, solo se imprimiría la fila con 'manzana'.
	
	1. Importación de Pandas: Asegúrate de haber importado Pandas antes de usarlo.
	2. Definición del Diccionario: `data = {'frutas': ['manzana', 'banana', 'kiwi', 'pera']}`
	3. Creación del DataFrame: El comando `df = pd.DataFrame(data)` convierte el diccionario `data` en un DataFrame de Pandas.
	4. Resultado del DataFrame:
	
		  ``frutas``
		``0  manzana``
		``1  banana``
		``2    kiwi``
		``3    pera``

-  **`isnull`**: Esta función se utiliza para detectar valores nulos en un DataFrame o una serie. Devuelve un booleano que indica si cada elemento es nulo o no. Por ejemplo:

	``import pandas as pd``
	``data = {'frutas': ['manzana', None, 'kiwi', 'pera']}``
	``df = pd.DataFrame(data)``
	
	``filtro = df['frutas'].isnull() # Filtrar las filas donde la fruta es nula``
	``resultado = df[filtro]``
	``print(resultado)``
	
    En este caso, solo se imprimiría el número de fila con el valor nulo.

-  **`isin`**: Esta función se utiliza para filtrar datos según si se encuentran en una lista de valores especificada. Por ejemplo:

	``import pandas as pd``
	``data = {'frutas': ['manzana', 'banana', 'kiwi', 'pera']}``
	``df = pd.DataFrame(data)``
	
	``filtro = df['frutas'].isin(['manzana', 'kiwi']) # Filtrar las filas donde la fruta está en la lista ['manzana', 'kiwi']``
	``resultado = df[filtro]``
	``print(resultado)``
	
    En este caso, se imprimirían las filas con 'manzana' y 'kiwi'.

-  **`iloc`**: Esta función se utiliza para seleccionar datos por posición entera. Permite seleccionar filas y columnas por sus índices enteros. Por ejemplo:

	``import pandas as pd``
	``data = {'frutas': ['manzana', 'banana', 'kiwi', 'pera']}``
	``df = pd.DataFrame(data)``
	
	``resultado = df.iloc[0] # Seleccionar la primera fila``
	``print(resultado)``
	
    Esto imprimirá la primera fila del DataFrame.

-  **`loc`**: Similar a `iloc`, pero se utiliza para seleccionar datos por etiquetas en lugar de por posición entera. Por ejemplo:

	``import pandas as pd``
	``data = {'frutas': ['manzana', 'banana', 'kiwi', 'pera']}``
	``df = pd.DataFrame(data, index=['a', 'b', 'c', 'd'])``
	
	``resultado = df.loc['b'] # Seleccionar la fila con etiqueta 'b'``
	``print(resultado)``
	
    Esto imprimirá la fila con etiqueta 'b' del DataFrame.

-  **`iat`**: Se utiliza para acceder a un único valor en un DataFrame utilizando índices basados en enteros. Es más eficiente que `loc` y `iloc` cuando solo necesitas acceder a un único valor.

	- `i`: Índice de fila (basado en cero).
	- `j`: Índice de columna (basado en cero).
	
	``import pandas as pd``
	
	``# Crear un DataFrame de ejemplo``
	``df = pd.DataFrame({``
	    ``'A': [1, 2, 3],``
	    ``'B': [4, 5, 6],``
	    ``'C': [7, 8, 9]``
	``})``
	
	``# Acceder al elemento en la fila 0 y columna 1``
	``value = df.iat[0, 1]``
	
	``print(value)  # Salida: 4``

-  **`at`**: Se utiliza para acceder a un único valor en un DataFrame utilizando etiquetas (nombres de filas y columnas). Es más eficiente que `loc` cuando solo necesitas acceder a un único valor.

	- `label_i`: Etiqueta de la fila.
	- `label_j`: Etiqueta de la columna.
	
	``import pandas as pd``
	
	``# Crear un DataFrame de ejemplo con etiquetas de filas y columnas``
	``df = pd.DataFrame({``
	    ``'A': [1, 2, 3],``
	    ``'B': [4, 5, 6],``
	    ``'C': [7, 8, 9]``
	``}, index=['X', 'Y', 'Z'])``
	
	``# Acceder al elemento en la fila 'Y' y columna 'B'``
	``value = df.at['Y', 'B']``
	
	``print(value)  # Salida: 5``

-  **``drop()``**: El método `drop()` de pandas es una herramienta versátil para la manipulación de datos en DataFrames y Series. `drop()` es un método en pandas que se utiliza para eliminar filas o columnas de un DataFrame, o para eliminar elementos específicos de una Serie. La función permite eliminar datos de manera eficiente según las etiquetas o los índices especificados.
  
	- `labels`: Especifica la etiqueta o las etiquetas de las filas o columnas a eliminar.
	- `axis`: Indica si se deben eliminar filas (`0`) o columnas (`1`). El valor predeterminado es `0`.
	- `index`: Se usa para eliminar filas de un DataFrame.
	- `columns`: Se usa para eliminar columnas de un DataFrame.
	- `level`: Se usa para eliminar niveles específicos en un índice multi-nivel.
	- `inplace`: Si se establece en `True`, realiza la operación en el DataFrame o Serie original y no devuelve una copia. Si es `False` (predeterminado), devuelve una nueva copia con las filas o columnas eliminadas.
	- `errors`: Controla el comportamiento cuando se intenta eliminar etiquetas que no existen. Puede ser `'raise'` (por defecto) para lanzar un error o `'ignore'` para no hacer nada si las etiquetas no están presentes.
	
	1.  **Eliminar Filas en un DataFrame**: Para eliminar filas, puedes usar el parámetro `axis` con el valor `0` (por defecto) y proporcionar los índices de las filas que deseas eliminar.
	
		`import pandas as pd`
		``data = { `` 
		``'A': [1, 2, 3],`` 
		``'B': [4, 5, 6], ``
		``'C': [7, 8, 9] } # Crear un DataFrame`` 
		``df = pd.DataFrame(data, index=['row1', 'row2', 'row3'])``
		
		`df_dropped = df.drop('row2') # Eliminar la fila con índice 'row2' `
		`print(df_dropped)`
	
	2. **Eliminar Columnas en un DataFrame**: Para eliminar columnas, puedes usar el parámetro `axis` con el valor `1` y proporcionar las etiquetas de las columnas que deseas eliminar.
	
		`df_dropped = df.drop('B', axis=1) # Eliminar la columna 'B'`
		`print(df_dropped)`
	
	3. **Eliminar Elementos en una Serie**: Para eliminar elementos de una Serie, simplemente proporciona los índices que deseas eliminar.
	   
		`s = pd.Series([10, 20, 30], index=['a', 'b', 'c']) # Crear una Serie`
		`s_dropped = s.drop('b') # Eliminar el elemento con índice 'b'`
		`print(s_dropped)`
	
	4. **Realizar o no copia de las filas eliminadas**: 
	
		`df.drop('C', axis=1, inplace=True) # Eliminar la columna 'C' en el DataFrame original`
		`print(df)`
	
	5. **Eliminación por etiqueta**: El parámetro `index` se usa para eliminar filas de un DataFrame. Este parámetro acepta una etiqueta o una lista de etiquetas que corresponden a los índices de las filas que deseas eliminar.
	
		`df = pd.DataFrame(data, index=['row1', 'row2', 'row3'])`
		`df_dropped = df.drop(index=['row1', 'row2']) # Eliminar las filas con índices 'row1' y 'row2'`
		`print(df_dropped)`
	
	6. **Eliminación por etiquetas**: El parámetro `columns` se utiliza para eliminar columnas de un DataFrame. Similar a `index`, acepta una etiqueta o una lista de etiquetas correspondientes a los nombres de las columnas que deseas eliminar.
	
		`df_dropped = df.drop(columns=['A', 'C']) # Eliminar las columnas 'A' y 'C'`
		`print(df_dropped)`
	
	7. **Eliminación multiíndice**:  El parámetro `level` se aplica en el contexto de DataFrames o Series con un índice jerárquico (multiíndice). Permite eliminar niveles específicos del índice. Este parámetro es especialmente útil cuando se trabaja con datos que tienen un índice multi-nivel y se desea eliminar un nivel entero del índice.
	
		``import pandas as pd``
		
		``# Crear un DataFrame con índice multi-nivel``
		``arrays = [['A', 'A', 'B', 'B'], [1, 2, 1, 2]]``
		``index = pd.MultiIndex.from_arrays(arrays, names=('letters', 'numbers'))``
		``df = pd.DataFrame({'values': [10, 20, 30, 40]}, index=index)``
		
		``# Mostrar el DataFrame original``
		``print("Original DataFrame:")``
		``print(df)``
		
		``# Eliminar el nivel 'letters'``
		``df_dropped = df.drop(level='letters', axis=0)``
		``print("\nDataFrame después de eliminar el nivel 'letters':")``
		``print(df_dropped)``

-  **``head()``**: Se utiliza para mostrar las primeras filas de un DataFrame. Por defecto, muestra las primeras 5 filas. Sin embargo, puede especificar el número de filas que desea mostrar pasando un número entero como argumento a la función.

	`# Obtener la primera fila del DataFrame`
	``print(datos.head(1))``

-  **``tail()``**: Se utiliza para mostrar las últimas filas de un DataFrame. Por defecto, muestra las últimas 5 filas.

	`# Obtener la última fila del DataFrame`
	``print(datos.tail(1))``

-  **`shape`**: Se utiliza para obtener las dimensiones del DataFrame. Este método devuelve una tupla que contiene dos valores:

	1. El número de filas.
	2. El número de columnas.

	``print("\nDimensiones del DataFrame:")``
	``print(df.shape)``

- **``info()``**: Proporciona una descripción general del DataFrame, incluyendo el número de filas y columnas, el tipo de datos de cada columna, y la memoria utilizada.

-  **`describe()`**: Calcula estadísticas descriptivas para cada columna numérica del DataFrame. Estas estadísticas incluyen la media, la mediana, la desviación estándar, el mínimo y el máximo. <strong style ="color: red;">Indispensable</strong>

	`# Obtener estadísticas descriptivas del DataFrame`
	``print(datos.describe())``

	`# Seleciona solo unas columnas y aplíca estadisticas`
	``df[['length', 'compression-ratio']].describe()``

-  **`describe().transpose()`**: Transpone la salida de la función `describe()`. Esto significa que las estadísticas descriptivas se muestran como una matriz con las columnas como filas y las estadísticas como columnas. <strong style ="color: red;">Indispensable</strong>

	``import pandas as pd``
	
	``# Supongamos que tienes un DataFrame 'filme' con datos``
	``# Crear un DataFrame de ejemplo``
	``data = {``
	    ``'Pelicula': ['A', 'B', 'C', 'D', 'E'],``
	    ``'Genero': ['Accion', 'Comedia', 'Drama', 'Accion', 'Comedia'],``
	    ``'Ratings de Rotten Tomatoes %': [85, 78, 92, 88, 75],``
	    ``'Ratings de la Audience %': [87, 82, 91, 89, 80],``
	    ``'Presupuesto (millones USD)': [50, 20, 35, 40, 30],``
	    ``'Lanzamiento': [2010, 2011, 2012, 2013, 2014]``
	``}``
	``filme = pd.DataFrame(data)``
	
	``# Utilizar describe() y transpose() juntos``
	``resumen_transpuesto = filme.describe().transpose()``
	
	``# Imprimir el resumen transpuesto``
	``print(resumen_transpuesto)``

-  **``unique()``**: Es un método que se utiliza para obtener los valores únicos de una serie o columna en un DataFrame. Proporciona una forma rápida de identificar los diferentes valores presentes en una columna específica.

	``import pandas as pd``
	
	``# Crear un DataFrame de ejemplo``
	``data = pd.DataFrame({``
	    ``'A': [1, 2, 3, 2, 1, 3, 4, 5, 4]``
	``})``
	
	``# Obtener los valores únicos en la columna 'A'``
	``unique_values = data['A'].unique()``
	``print(unique_values)  # Salida: [1 2 3 4 5]``

-  **``reset_index()``**: Se utiliza para restablecer el índice de un DataFrame. Esto puede ser útil si tienes un índice personalizado o si has realizado operaciones que modificaron el índice y deseas restaurar un índice predeterminado (un índice numérico secuencial).
	- ``inplace()``: Se establece en True, realizará la operación directamente sobre el DataFrame original y no devolverá una copia del mismo.

- **`read_html()`**: Permite leer y analizar contenido HTML de una página web, y puede ser una alternativa a BeautifulSoup si solo necesitas extraer tablas de HTML y no quieres hacer un análisis exhaustivo del contenido.

##### Biblioteca Seaborn
*`Import seaborn as sns`*: Importar módulo Seaborn

-  *`sns.distplot()`*: la función `sns.distplot()` en Seaborn se utiliza principalmente para visualizar la [[Distribución Univariada]] de datos y es una de las funciones más versátiles y utilizadas de la biblioteca. Se utiliza para trazar un histograma combinado con una estimación de la densidad de kernel (KDE) de una variable numérica. <strong style ="color: red;">Obsoleta</strong>: Para adaptar tu código, deberías usar las funciones alternativas recomendadas por Seaborn, como `displot` o `histplot`.

	1. **Histograma:**
	    - El histograma es una representación gráfica de la distribución de datos, dividiendo los datos en intervalos (bins) y mostrando cuántas observaciones caen en cada intervalo.
	2. **Estimación de Densidad de Kernel (KDE):**
	    - El KDE es una forma de estimar la función de densidad de probabilidad de una variable continua. Se utiliza para suavizar el histograma y obtener una representación más suave de la distribución de datos.
	
	Parámetros Principales:
	
	- **`a` (array-like):** La entrada de datos, generalmente una serie de pandas, matriz NumPy u otra estructura de datos compatible.
	- **`bins` (int or sequence, optional):** Especifica el número de contenedores del histograma. Puede ser un entero para especificar el número total de bins o una secuencia para definir los límites de cada bin.
	- **`hist` (bool, optional):** Controla si se muestra el histograma (True por defecto).
	- **`kde` (bool, optional):** Controla si se muestra la estimación de densidad de kernel (True por defecto).
	- **`rug` (bool, optional):** Si es True, añade un gráfico de "rug" en el eje X, que muestra las posiciones de cada observación individual.

-  *`sns.displot()`*: La función `displot` es una función de nivel de figura que proporciona una manera más moderna de crear gráficos de distribución en Seaborn. Esta función puede crear tanto histogramas como KDE plots de manera integrada.

	- **`data`**: El conjunto de datos que se va a visualizar.
	- **`x`, `y`**: Variables en el DataFrame `data` que se utilizarán para trazar.
	- **`hue`**: Variable en `data` que se utilizará para diferenciar las observaciones en diferentes colores.
	- **`row`, `col`**: Variables en `data` que se utilizarán para trazar múltiples gráficos de distribución en filas o columnas.
	- **`kind`**: Tipo de gráfico a dibujar, como `"hist"`, `"kde"`, `"ecdf"` o una combinación de estos (`"hist"`, `"kde"` por defecto).
	- **`rug`**: Si se deben trazar marcas de "rug" a lo largo del eje (por defecto `False`).
	- **`rug_kws`**: Argumentos adicionales para personalizar las marcas de "rug".
	- **`bins`**: Especifica el número de bins en el histograma.
	- **`stat`**: Estadística descriptiva que se calcula para cada bin.
	- **`kde`**: Si se debe trazar una estimación de densidad de kernel (por defecto `True`).
	- **`common_norm`**: Normaliza el histograma para que la suma de la densidad sea 1 (por defecto `False`).
	- **`element`**: Elemento de la trama a dibujar, `bars`, `step` o `poly`.
	- **`fill`**: Controla si se rellena el histograma (por defecto `True`).
	- **`line_kws`**: Argumentos adicionales para personalizar las líneas.
	- **`thresh`**: Múltiple entre las y los gráficos separados dos de los valores que el usuario

	``import seaborn as sns``
	``import matplotlib.pyplot as plt``
	``import numpy as np``
	
	``# Generar datos aleatorios``
	``np.random.seed(0)``
	``datos = np.random.normal(size=100)``
	
	``# Crear el gráfico de distribución usando displot``
	``sns.displot(datos, bins=10, kde=True, rug=False)``
	
	``# Personalizar el gráfico (opcional)``
	``plt.title('Distribución de Datos Aleatorios')``
	``plt.xlabel('Valores')``
	``plt.ylabel('Densidad')``
	
	``# Mostrar el gráfico``
	``plt.show()``

-  *`sns.histplot()`*: La función `histplot` es una función de nivel de ejes que se enfoca específicamente en la creación de histogramas. Es útil cuando necesitas más control sobre los ejes y la personalización del gráfico.

	- **`data`**: El conjunto de datos que se va a visualizar.
	- **`x`, `y`**: Variables en el DataFrame `data` que se utilizarán para trazar.
	- **`hue`**: Variable en `data` que se utilizará para diferenciar las observaciones en diferentes colores.
	- **`weights`**: Peso aplicado a cada punto en el gráfico.
	- **`bins`**: Especifica el número de bins en el histograma.
	- **`stat`**: Estadística descriptiva que se calcula para cada bin.
	- **`kde`**: Si se debe trazar una estimación de densidad de kernel (por defecto `False`).
	- **`common_norm`**: Normaliza el histograma para que la suma de la densidad sea 1 (por defecto `False`).
	- **`multiple`**: Controla si se trazan múltiples columnas en un gráfico (por defecto `layer`).
	- **`element`**: Elemento de la trama a dibujar, `bars`, `step` o `poly`.
	- **`fill`**: Controla si se rellena el histograma (por defecto `True`).
	- **`line_kws`**: Argumentos adicionales para personalizar las líneas.
	- **`thresh`**: Múltiples entre las y gráficos separados dos de los valores que, usuarios directamente

	``import seaborn as sns``
	``import matplotlib.pyplot as plt``
	``import numpy as np``
	
	``# Generar datos aleatorios``
	``np.random.seed(0)``
	``datos = np.random.normal(size=100)``
	
	``# Crear el gráfico de distribución usando histplot``
	``sns.histplot(datos, bins=10, kde=True)``
	
	``# Personalizar el gráfico (opcional)``
	``plt.title('Distribución de Datos Aleatorios')``
	``plt.xlabel('Valores')``
	``plt.ylabel('Frecuencia')``
	
	``# Mostrar el gráfico``
	``plt.show()``

-  *`boxplot()`*: La función `sns.boxplot()` se utiliza para trazar gráficos de caja y bigotes, que son ideales para visualizar la distribución de datos numéricos a través de sus [[Cuartiles]]. Este tipo de gráfico proporciona una representación visual de la mediana, los cuartiles, los valores mínimo y máximo, así como los valor atípico potenciales de los datos.

	-  Funcionalidades Adicionales
	
		- **Comparación de Grupos**: `sns.boxplot()` es útil para comparar la distribución de datos entre diferentes grupos o categorías en un conjunto de datos.
		- **Identificación de valores atípicos**: Los puntos individuales que quedan fuera de los bigotes del boxplot son considerados outliers, lo que facilita la identificación de valores atípicos en los datos.
		- **Personalización**: Como con otras funciones de Seaborn, puedes personalizar fácilmente el título, etiquetas de los ejes, colores y otros aspectos del gráfico utilizando las funciones estándar de Matplotlib después de crear el boxplot con `sns.boxplot()`.

	- **`x`, `y`**: Especifican las variables en el DataFrame que se usarán para trazar. `x` e `y` son mutuamente exclusivos, dependiendo de si quieres trazar el boxplot horizontal o verticalmente.
	- **`data`**: El DataFrame que contiene los datos.
	- **`hue`**: Variable en `data` que se utiliza para diferenciar los grupos y trazar múltiples boxplots para cada categoría.
	- **`order`, `hue_order`**: Controla el orden en que aparecen las categorías en el eje (`x` o `y`) y el orden en que se dibujan los subgrupos definidos por `hue`.
	- **`orient`**: Especifica la orientación del gráfico, `'v'` para vertical (por defecto) o `'h'` para horizontal.
	- **`width`**: Ancho de los boxplots. Puede ser un valor escalar o un array que especifique el ancho para cada categoría.
	- **`color`, `palette`**: Controlan el color de los boxplots. `color` puede ser un color único para todos los boxplots, mientras que `palette` especifica una paleta de colores si se usa `hue`.
	- **`linewidth`**: Ancho de las líneas que forman los boxplots.
	- **`showmeans`, `showmedians`**: Controlan si se muestran la media y la mediana como líneas en el boxplot.

	``import seaborn as sns``
	``import matplotlib.pyplot as plt``
	``import pandas as pd``
	
	``# Crear un DataFrame de ejemplo``
	``data = pd.DataFrame({``
	    ``'Grupo': ['A'] * 20 + ['B'] * 30,``
	    ``'Valores': np.random.normal(size=50)``
	``})``
	
	``# Crear el boxplot``
	``sns.boxplot(x='Grupo', y='Valores', data=data)``
	
	``# Personalizar el gráfico (opcional)``
	``plt.title('Boxplot de Ejemplo')``
	``plt.xlabel('Grupos')``
	``plt.ylabel('Valores')``
	
	``# Mostrar el gráfico``
	``plt.show()``

-  *`lmplot()`*: La función `sns.lmplot()` en Seaborn se utiliza para trazar gráficos de dispersión con una línea de regresión ajustada automáticamente. Es una herramienta poderosa para explorar relaciones entre dos variables y visualizar la tendencia general de los datos.

	- **`data`**: El DataFrame que contiene los datos.
	- **`x`, `y`**: Las variables en el DataFrame que se utilizarán para trazar el gráfico de dispersión.
	- **`hue`**: Variable en `data` que se utiliza para diferenciar los puntos de datos utilizando diferentes colores en función de categorías.
	- **`col`, `row`**: Variables en `data` que definen subconjuntos de datos que se trazarán en columnas o filas diferentes del mismo gráfico.
	- **`fit_reg`**: Controla si se ajusta automáticamente una línea de regresión (por defecto `True`). Puedes desactivarlo estableciéndolo en `False` si no deseas mostrar la línea de regresión.
	- **`scatter_kws`**: Argumentos adicionales para personalizar los puntos de dispersión, como el tamaño (`s`), color (`color`), etc.
	- **`line_kws`**: Argumentos adicionales para personalizar la línea de regresión, como el grosor (`linewidth`), estilo (`linestyle`), color (`color`), etc.
	- **`markers`**: Marcadores utilizados para los puntos de dispersión.
	- **`height`**: Altura de cada gráfico en pulgadas (útil solo cuando `col` o `row` se especifican).

	``import seaborn as sns``
	``import matplotlib.pyplot as plt``
	``import pandas as pd``
	
	``# Crear un DataFrame de ejemplo``
	``data = pd.DataFrame({``
	    ``'X': [1, 2, 3, 4, 5],``
	    ``'Y': [2, 3, 5, 7, 11]``
	``})``
	
	``# Crear el gráfico de dispersión con línea de regresión``
	``sns.lmplot(x='X', y='Y', data=data)``
	
	``# Personalizar el gráfico (opcional)``
	``plt.title('Gráfico de Dispersión con Línea de Regresión')``
	``plt.xlabel('Variable X')``
	``plt.ylabel('Variable Y')``
	
	``# Mostrar el gráfico``
	``plt.show()``
