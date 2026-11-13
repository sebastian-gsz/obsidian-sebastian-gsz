
-  **Exercice**
  
	- [[MatplotlibExercice.ipynb]]
-  **Documentación**
  
	- **[Matplotlib ](https://matplotlib.org/stable/)**

![[Barra.gif]]

Es una interfaz basada en estado para matplotlib. Proporciona una forma implícita, similar a **``MATLAB``**, de trazar. También abre cifras en su pantalla, y actúa como el administrador de la GUI de la figura.

-  **Aprendizaje**

	-  **Personalizar apariencia**
	
		La clave está en la **estructura de los nombres** de los parámetros. Matplotlib utiliza una convención de nomenclatura muy lógica que nos da pistas sobre a qué parte del gráfico afecta el parámetro.
		
		Observa que la mayoría de los parámetros siguen un patrón: **`[componente_principal].[componente_secundario].[propiedad]`** o a veces simplemente: **`[componente_principal].[propiedad]`**
		
		-  **`plt.xlabel("Temperatura (°C)")` y `plt.ylabel("Hora del Día (horas)")`**: Asignar nombre a las etiquetas ejes.
		-  **`plt.rcParams['axes.labelsize'] = 16`**: Controla el tamaño de la fuente de las etiquetas de los ejes
		
		    - `axes`: Se refiere a los ejes del gráfico (las líneas donde se muestran los valores, como el eje X o el eje Y).
		    - `labelsize`: Se refiere al tamaño de la etiqueta (el texto que describe el eje, por ejemplo, "Tiempo" o "Temperatura").
		-  **``plt.rcParams['figure.figsize']=9,4``**: El `figure.figsize`parámetro especifica el ancho y alto de la figura en pulgadas. En este caso, el ancho se establece en 9 pulgadas y la altura en 4 pulgadas.
		-  **``plt.rcParams['axes.facecolor'] = 'lightgray'``**: Establece el color de fondo predeterminado.
		-  **`lines.linewidth`**:
		
		    - `lines`: Se refiere a las líneas que dibujas en el gráfico (por ejemplo, en un gráfico de líneas).
		    - `linewidth`: Se refiere al ancho de esa línea.
		    - **Así, `lines.linewidth` controla el ancho de las líneas en tus gráficos.**
		-  **`figure.figsize`**:
		
		    - `figure`: Se refiere a la figura completa del gráfico (el "lienzo" sobre el que dibujas).
		    - `figsize`: Se refiere al tamaño de esa figura (generalmente en pulgadas, como ancho x alto).
		    - **Por lo tanto, `figure.figsize` define las dimensiones generales de tu gráfico.**
	-  **Visualización de datos [import matplotlib.pyplot as plt ](https://matplotlib.org/stable/api/pyplot_summary.html)**
	
		-  **``import matplotlib.pyplot as plt``**: Es una biblioteca popular para crear visualizaciones de datos en Python. Proporciona una variedad de funciones para trazar diferentes tipos de datos, incluidos gráficos de líneas, gráficos de barras, diagramas de dispersión e histogramas. También proporciona funciones para personalizar la apariencia de los gráficos, como configurar el título, las etiquetas y los colores.
		-  **``%matplotlib inline``:** Es un comando mágico específico de IPython (y, por lo tanto, también funciona en Jupyter Notebooks). Su propósito es mostrar los gráficos de Matplotlib directamente dentro del notebook, justo debajo de la celda de código que los genera. Sin este comando, en algunos entornos, los gráficos podrían aparecer en una ventana separada o no mostrarse en absoluto.
		
		**Tipos de gráficos**
		
		- **`plt.plot`** se utiliza para crear gráficos de líneas. Toma datos en forma de coordenadas x e y y los conecta con líneas. Es útil para visualizar tendencias y relaciones entre variables continuas.
		- **`plt.bar`** se utiliza para crear gráficos de barras. Toma datos en forma de categorías (x) y sus respectivos valores (y) y los representa como barras rectangulares. Es útil para comparar cantidades entre diferentes categorías.




*``plt.xticks(list(range()), matriz, rotation='vertical')``*: En el marco Y crea una etiqueta con los datos de la matriz proporcionada en este caso ``temporadas``, en posición vertical.

*``plt.legend(loc='arriba izquierda', bbox_to_anchor=(1,1))``*: Se utiliza para colocar la leyenda del gráfico en la esquina superior izquierda del gráfico.