![[barra.gif]]
###### Ejercicios Python
[[Exersise.ipynb]]

-  **Implementación de un gestor de contexto personalizado**

	[[__enter__and__exit__.ipynb]]


#### Sintaxis de Python
-  <strong style ="color: SpringGreen;">List</strong>

	*``[index] = x``*: Reemplaza el elemento en el índice [n] con x.
	
	- *``append()``*: Se utiliza para añadir un elemento al final de la lista.
	
		``fruits = ['pineapple', 'banana',  'Apple,' 'Melon']``
		``fruits.append('kiwi')``
		``print(fruits)``
	
	- *``insert()``*: Se utiliza para insertar un elemento en una lista en una posición específica. Si el parámetro inicial es mayor al índice de la lista se añadirá al final de esta.
	
		``fruits = ['pineapple', 'banana',  'Apple,' 'Melon']``
		``fruits.insert(1, 'kiwi')``
		``print(fruits)``
		``# ['kiwi','pineapple','banana','Apple','Melon']``
		
		``fruits = ['pineapple', 'banana',  'Apple,' 'Melon']``
		``fruits.insert(10, 'kiwi')``
		``print(fruits)``
		``# ['pineapple','banana','Apple','Melon','kiwi']``
	
	- *``remove()``*: Se utiliza para eliminar un elemento de una lista.
	
		``fruits = ['pineapple', 'banana',  'Apple', 'Melon']``
		``fruits.remove("banana")``
		``print(fruits)``
	
	- *``pop()``*: Captura el elemento especificado de la lista y lo devuelve. Esto significa que puedes utilizarlo para manipular el elemento eliminado antes de que se elimine de la lista.
	
		``fruits = ['pineapple', 'banana',  'Apple', 'Melon']``
		``fruits.pop(2)  ``
		``print(fruits) # ['pineapple', 'banana', 'Melon']``
	
	-  *``enumerate()``*: Se utiliza para devolver una secuencia de tuplas de índices y elementos. Esta función es útil para iterar sobre una secuencia y obtener el índice y el elemento correspondiente en cada iteración.
	
		- index es el nombre de la variable que capturará el índice en cada iteración.
		- ítem (o cualquier otro nombre que elijas) es el nombre de la variable que capturará el elemento en cada iteración.
		- enumerate(iterable) es la función enumerate que toma la secuencia (iterable) que deseas recorrer.
	
		``	def enumerate_and_print(lst):  ``
			``for index, item in enumerate(lst):  ``
			``print("{} - {}".format(index+1, item))  ``
		  
		``winners = ["Ashley", "Dylan", "Reese"]  ``
		``enumerate_and_print(winners) # 1 - Ashley 2 - Dylan 3 - Reese``
	
	- *``list(range(0, 10, 2))``*: Se utiliza para crear una lista de números que comienza en 0, termina antes de llegar a 10 y avanza de 2 en 2.
	
	- *``reverse()``*: Invierte el orden de los elementos de la lista.
	
		``lista = [1, 2, 3, 4, 5] # Invierte el orden de los elementos de una lista``
		``lista.reverse()``
		``print(lista) # [5, 4, 3, 2, 1]``
	
	- *``clear()``*: Elimina todos los elementos de la lista.
	
		``lista = [1, 2, 3, 4, 5] # Elimina todos los elementos de una lista``
		``lista.clear()``
		``print(lista) # []``
	
	- *``extend(other_list)``*: Agrega todos los elementos de other_list al final de la lista
	
		``lista = [1, 2, 3] # Agrega todos los elementos de otra lista a la lista actual``
		``otra_lista = [4, 5, 6]``
		``lista.extend(otra_lista)``
		``print(lista) # [1, 2, 3, 4, 5, 6]``
	
	- *``zip()``*: La función `zip()` en Python se utiliza para combinar iterables en una secuencia de tuplas. Toma como argumentos uno o más iterables (listas, tuplas, etc.) y devuelve un iterador que genera una serie de tuplas donde cada tupla contiene elementos de los iterables pasados, tomados en paralelo.
	
		Además de usar `zip()` con la función `list()` para crear una lista de tuplas, puedes utilizarlo con otras funciones y estructuras de datos en Python. Aquí tienes algunas opciones:
		
		1. **tuple():** Convierte el resultado de `zip()` en una secuencia de tuplas.
		
			``nombres = ["Ana", "Benito", "Clara"]``
			``edades = [25, 30, 22]``
			``estatutos = ["Soltera", "Casado", "Soltera"]``
			
			``datos_personas = tuple(zip(nombres, edades, estatutos))``
			``print(datos_personas)``
		
		2. **set():** Convierte el resultado de `zip()` en un conjunto de tuplas únicas.
		
			``nombres = ["Ana", "Benito", "Clara"]``
			``edades = [25, 30, 22]``
			``estatutos = ["Soltera", "Casado", "Soltera"]``
			
			``datos_personas = set(zip(nombres, edades, estatutos))``
			``print(datos_personas)``
		
		3. **dict():** Convierte el resultado de `zip()` en un diccionario, donde el primer iterable proporciona las claves y el segundo iterable proporciona los valores.
		
			``nombres = ["Ana", "Benito", "Clara"]``
			``edades = [25, 30, 22]``
			``estatutos = ["Soltera", "Casado", "Soltera"]``
			
			``datos_personas = dict(zip(nombres, edades))``
			``print(datos_personas)``
		
		4. **Enumeración:** Puedes usar `zip()` con `enumerate()` para combinar dos iterables y obtener tanto el índice como el elemento de cada iterador.
		
			``nombres = ["Ana", "Benito", "Clara"]``
			``for indice, nombre in zip(range(len(nombres)), nombres):``
				``print(f"Persona {indice}: {nombre}")``
		
		5. **Iteración directa:** Puedes usar `zip()` directamente en un bucle `for` para iterar sobre varios iterables simultáneamente.
		
			``nombres = ["Ana", "Benito", "Clara"]``
			``edades = [25, 30, 22]``
			``estatutos = ["Soltera", "Casado", "Soltera"]``
			
			``for nombre, edad, estatus in zip(nombres, edades, estatutos):``
				``print(f"Nombre: {nombre}, Edad: {edad}, Estatus: {estatus}")``
	
	- *``map()``*: Es una función integrada en Python que toma dos argumentos: una función y uno o más iterables (como listas, tuplas, etc.). `map(str, iterable1, iterable2, ...)` Aplica la función pasada como primer argumento a cada elemento de los iterables, y devuelve un iterador que produce los resultados. Es compatible con cualquier función que tome un solo argumento, ya sea una función definida por el usuario o una función integrada. También es compatible con funciones lambda.
	
		- Convertir una lista de elementos a otro tipo de datos, como convertir una lista de cadenas en una lista de enteros.
		- Aplicar una función a todos los elementos de una lista o tupla.
		- Realizar operaciones de transformación en elementos de datos.
		
		``numeros_str = ["1", "2", "3", "4", "5"] # Convertir una lista de cadenas a una lista de enteros``
		``numeros_int = list(map(int, numeros_str))``
		``print(numeros_int)  # Salida: [1, 2, 3, 4, 5]``
		
		``def cuadrado(x): # Elevar al cuadrado cada número en una lista``
			``return x ** 2``
		
		``numeros = [1, 2, 3, 4, 5]``
		``numeros_cuadrado = list(map(cuadrado, numeros))``
		``print(numeros_cuadrado)  # Salida: [1, 4, 9, 16, 25]``
	
	-  *`copy()`*: Crea una copia superficial de la lista. Útil para duplicar listas sin alterar la original. 
	   
		``my_list = [1, 2, 3, 4, 5]``
		``new_list = my_list.copy()``
		``print(new_list)  # Output: [1, 2, 3, 4, 5]``
	
	-  *`count()`*: Cuenta cuántas veces un elemento aparece en la lista. Es ideal cuando quieres analizar la frecuencia de un elemento específico.  
	
		``my_list = [1, 2, 2, 3, 4, 2, 5, 2]``
		``count = my_list.count(2)``
		``print(count)  # Output: 4``
	
	-  **`del`**: Elimina un elemento de la lista en una posición específica usando su índice. Este método es irreversible, así que ten cuidado con qué eliminas. 
	   
		``my_list = [10, 20, 30, 40, 50]``
		``del my_list[2]  # Elimina el elemento en el índice 2``
		``print(my_list)  # Output: [10, 20, 40, 50]``
	
	-  *`extend()`*:  Añade múltiples elementos a la lista desde otra lista o iterable. A diferencia de `append()`, que añade un solo elemento, `extend()` expande la lista con múltiples elementos. 
	   
		``fruits = ["apple", "banana", "orange"]``
		``more_fruits = ["mango", "grape"]``
		``fruits.extend(more_fruits)``
		``print(fruits)  # Output: ["apple", "banana", "orange", "mango", "grape"]``
	
	-  **Indexing (Indexación)**:  El acceso a los elementos se realiza mediante su índice, que empieza en 0. También se puede usar índices negativos para acceder a los elementos desde el final de la lista.  
	  
		``my_list = [10, 20, 30, 40, 50]``
		``print(my_list[0])  # Output: 10``
		``print(my_list[-1])  # Output: 50``
	
	-  *`remove()`*: Elimina la primera aparición de un valor específico. Si el valor no está presente, lanza un error. 
	
		``my_list = [10, 20, 30, 40, 50]``
		``my_list.remove(30)``
		``print(my_list)  # Output: [10, 20, 40, 50]``
	
	-  **Slicing (Rebanado)**: Permite obtener una subsección de la lista utilizando índices. Muy útil para obtener partes específicas de la lista.  
	
	    ``my_list = [1, 2, 3, 4, 5]``
	    ``print(my_list[1:4])  # Output: [2, 3, 4]``
	    ``print(my_list[:3])  # Output: [1, 2, 3]``
	    ``print(my_list[2:])  # Output: [3, 4, 5]``
	
	-  *`sort()`*: Ordena la lista de forma ascendente de forma predeterminada, pero puede ordenar de forma descendente si se pasa el argumento `reverse=True`.  
	
	    ``my_list = [5, 2, 8, 1, 9]``
	    ``my_list.sort()``
	    ``print(my_list)  # Output: [1, 2, 5, 8, 9]``
		
	    ``my_list.sort(reverse=True)``
	    ``print(my_list)  # Output: [9, 8, 5, 2, 1]``

-  <strong style ="color: SpringGreen;">Matrices</strong>

	*``matriz.shape()``*: En Python, el atributo ``shape`` de una matriz NumPy devuelve una tupla que representa las dimensiones de la matriz. La tupla tiene dos elementos: el primero indica el número de filas, y el segundo, el número de columnas. 

	```Python
	import pandas as pd
	from typing import List
	
	def getDataframeSize(players: pd.DataFrame) -> List[int]:
	    num_rows, num_cols = players.shape
	    return [num_rows, num_cols]
	
	print(player.shape)
	```

	*``Desempaquetado de la Tupla``*: La línea de código anterior utiliza el desempaquetado de tuplas para asignar directamente el número de filas a la variable filas y el número de columnas a la variable columnas. Esto es posible porque la tupla devuelta por matriz.shape tiene dos elementos y se asignan automáticamente a las variables especificadas.

	```Python
	num_rows, num_cols = players.shape
	```

- <strong style ="color: blue;">Diccionario & tuplas</strong>

	*len(dictionary)*: Devuelve el número de elementos de un diccionario.
	*for key, in dictionary*: Recorre en iteración cada clave de un diccionario.
	*for key, value in dictionary.items()*: Itera sobre cada par clave, valor en un diccionario.
	*if key in dictionary*: Comprueba si una clave está en un diccionario.
	*dictionary[key]*: accede a un valor utilizando la clave asociada de un diccionario.
	*dictionary[key] = value*:  Establece un valor asociado a una clave.
	*del dictionary[key]*:  Elimina un valor usando la clave asociada de un diccionario.
	*dictionary.get(key, default)*:  devuelve el valor correspondiente a una clave, o el valor predeterminado si la clave especificada no está presente.
	*dictionary.keys()*:  Devuelve una secuencia que contiene las claves de un diccionario.
	*dictionary.values()*:  Devuelve una secuencia que contiene los valores de un diccionario.
	*dictionary[key].append(value)*: agrega un nuevo valor para una clave existente.
	*dictionary.update(other_dictionary)*: Actualiza un diccionario con los elementos de otro diccionario. Las entradas existentes se actualizan; Se añaden nuevas entradas.
	*dictionary.clear()*: Elimina todos los elementos de un diccionario.
	*dictionary.copy()*: Hace una copia de un diccionario.
	- *for key, value in dictionary: Recorrer una lista de tupla
		
		```Python
		my_list = [(1, "a"), (2, "b"), (3, "c")]

		for key, value in my_list:
		    print(f"{key}: {value}")

		```

	*items()*: Este método devuelve una tupla para cada elemento del diccionario, donde el primer elemento de la tupla es la clave y el segundo es el valor.

	*keys()*: Si solo quieres acceder a las claves de un diccionario, puedes usar  el método keys()

	*values()*: Si solo quieres los valores, puedes usar el método  values()

	*get()*: Se utiliza para obtener el valor asociado a una clave en un diccionario. El método get() tiene dos parámetros: la clave que se desea buscar y un valor predeterminado que se devolverá si la clave no existe.

	```Python
	pet_dictionary = {"dogs": ["Yorkie", "Collie", "Bulldog"], 
	"cats": ["Persian", "Scottish Fold", "Siberian"], "rabbits": ["Angora", "Holland Lop", "Harlequin"]}   
	print(pet_dictionary.get("dogs", 0))  
	# Should print ['Yorkie', 'Collie', 'Bulldog']**
	```

	Si deseas acceder a un valor específico en la lista resultante (en este caso, la lista de razas de perros), puedes hacerlo después de obtener la lista usando get. Por ejemplo, si deseas acceder a la segunda raza de perro en la lista, puedes hacerlo de esta manera:

	```Python
	pet_dictionary = {"dogs": ["Yorkie", "Collie", "Bulldog"], 
	"cats": ["Persian", "Scottish Fold", "Siberian"], "rabbits": ["Angora", "Holland Lop", "Harlequin"]}  
	print(pet_dictionary.get("dogs"))
	pet_list = pet_dictionary.get("dogs")
	if pet_list:
	    second_pet = pet_list[1]
    print(second_pet)
	```

- <strong style ="color: blue;">Dunder methods (Métodos mágicos)</strong>

	`__init__`: Es un método especial en Python que se llama automáticamente cuando se crea un nuevo objeto de una clase. Es utilizado para inicializar los atributos del objeto. Es similar al constructor en otros lenguajes de programación.

	`__str__`: Es otro método especial que se utiliza para representar una cadena de texto legible para humanos del objeto. Este método se llama cuando se utiliza la función str() en un objeto o cuando se utiliza la función print() para imprimir el objeto.

	```Python
	class Persona:
	    def __init__(self, nombre, edad):
	        self.nombre = nombre
	        self.edad = edad
	
	    def __str__(self):
	        return f"{self.nombre}, {self.edad} años"

	persona1 = Persona("Juan", 25)
	print(persona1)  # Imprimirá: Juan, 25 años
	```

- <strong style ="color: blue;">Import sys</strong>

	*``file``*: Puedes especificar un archivo en el que deseas que se escriba la salida en lugar de la salida estándar. Por defecto, es ``sys.stdout``. 

- <strong style ="color: blue;">Import psutil</strong>

- <strong style ="color: blue;">Import shutil</strong>

- <strong style ="color: blue;">Import secret</strong>

- <strong style ="color: blue;">Import Process</strong>

- <strong style ="color: blue;">Import math</strong>

	*``math.sqrt()``*:  Es una función matemática que se utiliza para calcular la raíz cuadrada de un número. La función devuelve el número real que, multiplicado por sí mismo, da como resultado el número especificado. *La función math.sqrt() puede ser utilizada en una variedad de aplicaciones, como el cálculo de distancias, áreas y volúmenes.*

	```Python
	import math
	número = 16
	raíz_cuadrada = math.sqrt(número)
	print(raíz_cuadrada)
	```

	*``round()``*: Es una función matemática que se utiliza para redondear un número a un número entero o decimal específico. La función devuelve el número redondeado. *La función round() puede ser utilizada en una variedad de aplicaciones, como la presentación de datos, el cálculo de impuestos y la ingeniería.*

	```Python
	número = 12.345
	redondeado = round(número)
	print(redondeado)
	```

	*``round(math.sqrt())``*: La combinación de las funciones math.sqrt() y round() se puede utilizar para redondear la raíz cuadrada de un número a un número entero o decimal específico. 

	```Python
	import math
	número = 16
	raíz_cuadrada = math.sqrt(número)
	redondeado = round(raíz_cuadrada)
	print(redondeado)
	```

	- *``mean()``*: Se utiliza para calcular la media aritmética de una lista de números. La media aritmética es la suma de los valores de la lista dividida por el número de valores.

	```Python
	mean([[1, 2], [3, 4], [5, 6]], axis=0)
	```

	*``max()``*:

	*``min()``*: 

- <strong style ="color: blue;">Import arrow</strong>

	- `arrow.get`: Toma una cadena representando una fecha y hora como argumento y devuelve una instancia de `Arrow` que representa esa fecha y hora. La cadena puede seguir varios formatos diferentes, incluyendo ISO 8601, RFC 2822 y formatos de fecha y hora personalizados.
	  
		```Python
		import arrow
		date = arrow.get('2020-01-18','YYYY-MM-DD')
		date.shift(weeks =+ 6).format('MMM DD YYYY')
		```
	
		Esta línea importa la get función del arrow módulo. La get función toma una cadena de fecha y hora como primer argumento y una cadena de formato como segundo argumento.
		
		Esta línea utiliza el .shift()método para modificar la fecha almacenada en la datevariable. El .shift()método toma un argumento que especifica la cantidad para cambiar la fecha. En este caso, el argumento weeks=+6indica que la fecha debería adelantarse 6 semanas.
		
		El `.format()`método se utiliza para formatear la fecha almacenada en la `date`variable. El argumento `'MMM DD YYYY'`especifica el formato a utilizar. En este caso, la cadena de formato 'MMM DD AAAA' indica que la fecha debe tener el formato de mes (MMM), día (DD) y año (AAAA).

	- ``variable.now``: Crea una instancia de Arrow representando el momento actual
		
		```Python
		from arrow import Arrow

		now = Arrow.get()
		print(now)
		```
	

	- `variable.shift`: El método `.shift()` admite una variedad de argumentos que permiten desplazar la fecha o hora en diferentes cantidades. Por ejemplo, el siguiente código desplazará la fecha 1 año hacia adelante.
		  
		```Python
		import arrow

		date = arrow.get('2023-07-20')
		date.shift(days=-3) # desplazará la fecha 3 días hacia atrás.
		```

- <strong style ="color: blue;">Import PIL</strong>

	- `import PIL.Image`:   La línea de código `import PIL.Image` importa la clase `Image` del módulo `PIL`. El módulo `PIL` es una biblioteca de imágenes para Python que proporciona funciones para cargar, guardar, editar y manipular imágenes. La clase `Image` representa una imagen.

		En otras palabras, esta línea de código hace que la clase `Image` esté disponible para su uso en el script de Python actual.

		Por ejemplo, si tiene un script de Python que carga una imagen, puede utilizar la clase `Image` para acceder a la imagen. Por ejemplo, el siguiente código carga una imagen y muestra su tamaño:

- <strong style ="color: blue;">Import areas</strong>

	`¿?`:

- <strong style ="color: blue;">Import csv</strong>

	 El módulo `csv` en Python proporciona dos clases principales: `csv.reader` y `csv.DictReader` para la lectura de archivos CSV, y `csv.writer` y `csv.DictWriter` para la escritura. Aquí hay una descripción de los principales métodos asociados con estas clases:
	 
	### Métodos de `csv.reader`:
	
	1. **`csv.reader(file_object, dialect='excel', **fmtparams)`**
	   - Constructor que crea un objeto lector de archivos CSV. `file_object` es un objeto de archivo abierto.
	   - `dialect` es opcional y define un conjunto de parámetros específicos para un formato CSV particular.
	   - `fmtparams` son parámetros adicionales que pueden configurarse.
	
	2. **`csv.reader.__iter__()`**
	   - Método que permite la iteración sobre el objeto lector de archivos CSV.
	
	3. **`csv.reader.__next__()`**
	   - Método que devuelve la próxima fila como una lista.
	
	### Métodos de `csv.DictReader`:
	
	1. **`csv.DictReader(file_object, fieldnames=None, restkey=None, restval=None, dialect='excel', **fmtparams)`**
	   - Constructor que crea un objeto lector de archivos CSV que devuelve diccionarios.
	   - `file_object` es un objeto de archivo abierto.
	   - `fieldnames` es una lista opcional de nombres de campo si los encabezados no están presentes en el archivo CSV.
	   - `restkey`, `restval` y `dialect` son parámetros opcionales.
	
	2. **`csv.DictReader.__iter__()`**
	   - Método que permite la iteración sobre el objeto lector de archivos CSV.
	
	3. **`csv.DictReader.__next__()`**
	   - Método que devuelve el próximo diccionario representando una fila.
	
		 `DictReader` es una clase proporcionada por el módulo `csv` en Python, y se utiliza para leer archivos CSV organizando la información en diccionarios. A diferencia de `csv.reader`, que devuelve listas para cada fila, `DictReader` crea un objeto que produce diccionarios para cada fila del archivo CSV.

		Aquí hay algunas características clave de `DictReader`:
		
		1. **Acceso a datos por nombre de columna:**
		   - Cada fila del archivo CSV se representa como un diccionario.
		   - Las claves del diccionario son los encabezados de las columnas del archivo CSV.
		   - Permite acceder a los datos de una fila utilizando el nombre de la columna en lugar de índices numéricos.
		
		2. **Encabezados automáticos:**
		   - `DictReader` asume que la primera fila del archivo CSV contiene los encabezados de las columnas.
		   - Estos encabezados se utilizan como claves para los diccionarios generados.
		
		3. **Iteración sencilla:**
		   - Puede iterar a través de las filas del archivo CSV utilizando un bucle `for` de manera muy natural.
		   - Cada iteración devuelve un diccionario representando una fila.
		
		Veamos un ejemplo de cómo se utiliza `DictReader`:
		
		```python
		import csv
		
		# Supongamos que tenemos un archivo CSV llamado 'datos.csv' con columnas: Nombre, Edad, Ciudad
		with open('datos.csv', newline='') as archivo_csv:
		    lector_dict = csv.DictReader(archivo_csv)
		    
		    for fila in lector_dict:
		        print(f"Fila: {fila['Nombre']}, Edad: {fila['Edad']}, Ciudad: {fila['Ciudad']}")
		```
		
		En este ejemplo, `lector_dict` se crea usando `csv.DictReader`, y cada fila del archivo CSV se convierte en un diccionario. Luego, podemos acceder a los datos de cada fila mediante las claves correspondientes a los encabezados de las columnas.
		
		En resumen, `DictReader` facilita la lectura de archivos CSV al proporcionar una estructura de diccionario más intuitiva y legible, especialmente cuando trabajamos con datos tabulares.
	
	### Métodos de `csv.writer`:
	
	1. **`csv.writer(file_object, dialect='excel', **fmtparams)`**
	   - Constructor que crea un objeto escritor de archivos CSV.
	   - `file_object` es un objeto de archivo abierto.
	   - `dialect` es opcional y define un conjunto de parámetros específicos para un formato CSV particular.
	   - `fmtparams` son parámetros adicionales que pueden configurarse.
	
	2. **`csv.writer.writerow(row)`**
	   - Método que escribe una fila en el archivo CSV. `row` debe ser una secuencia (lista o tupla) de elementos.
	
	3. **`csv.writer.writerows(rows)`**
	   - Método que escribe varias filas en el archivo CSV. `rows` debe ser un iterable de secuencias.
	
	### Métodos de `csv.DictWriter`:
	
	1. **`csv.DictWriter(file_object, fieldnames, restval='', extrasaction='raise', dialect='excel', **fmtparams)`**
	   - Constructor que crea un objeto escritor de archivos CSV que escribe diccionarios.
	   - `file_object` es un objeto de archivo abierto.
	   - `fieldnames` es una lista de nombres de campo.
	   - `restval`, `extrasaction`, `dialect` y `fmtparams` son parámetros opcionales.
	
	2. **`csv.DictWriter.writeheader()`**
	   - Método que escribe la fila de encabezado en el archivo CSV.
	
	3. **`csv.DictWriter.writerow(rowdict)`**
	   - Método que escribe una fila de diccionario en el archivo CSV.
	
	4. **`csv.DictWriter.writerows(rowdicts)`**
	   - Método que escribe varias filas de diccionarios en el archivo CSV.
	
	Estos métodos son los más comunes y utilizados de las clases `csv.reader`, `csv.DictReader`, `csv.writer` y `csv.DictWriter`. Puedes explorar más detalles y opciones en la [documentación oficial de Python sobre el módulo csv](https://docs.python.org/3/library/csv.html).
##### Bibliotecas y módulos Python
-  *``isnumeric()``*: En Python es un método de cadena (string method) que se utiliza para verificar si todos los caracteres en una cadena son numéricos. Devuelve True si todos los caracteres son numéricos y la cadena no está vacía, y False en caso contrario.

	``# Ejemplo 1: Cadena con caracteres numéricos``
	``cadena1 = "12345"``
	``print(cadena1.isnumeric())  # True``
	
	``cadena2 = "abc123"``
	``print(cadena2.isnumeric())  # False``
	
	``cadena3 = ""``
	``print(cadena3.isnumeric())  # False``
	
	``cadena4 = "12.345"``
	``print(cadena4.isnumeric())  # False, porque incluye un punto decimal``
	
	``cadena5 = "-123"``
	``print(cadena5.isnumeric())  # False, porque incluye un signo negativo``

-  *`item()`*: Se utiliza para devolver una colección de pares clave-valor de un objeto.

	```Python
	import requests
	
	url = "https://www.google.com/"
	response = requests.get(url)
	headers = response.headers
	
	for header, value in headers.items():
	print(f"{header}: {value}")
	--- --- ---
	my_dict = {
	"name": "John Doe",
	"age": 30,
	"city": "New York City"
	}
	for key, value in my_dict.items():
	    print(f"{key}: {value}")
	```

-  *`enumerate()`*: La función `enumerate()` en Python se utiliza para agregar un contador a un iterable (como una lista, tupla, o cualquier objeto iterable), retornando una secuencia de tuplas. Cada tupla contiene un par de elementos: el primero es el índice y el segundo es el elemento correspondiente del iterable.

	``# Ejemplo 1: Utilizando enumerate() con una lista``
	``lista = ['a', 'b', 'c', 'd']``
	``for indice, valor in enumerate(lista):``
	``    print(f"El valor en el índice {indice} es {valor}")``

	``# Ejemplo 2: Utilizando enumerate() con una cadena de texto: Iterando sobre cada caracter``
	``cadena = "Python"``
	``for indice, caracter in enumerate(cadena):``
	``    print(f"El caracter en la posición {indice} es {caracter}")``

	``# Ejemplo 3: Especificando el inicio del contador en enumerate()``
	``lista2 = ['uno', 'dos', 'tres', 'cuatro']``
	``for indice, elemento in enumerate(lista2, start=1):``
	``    print(f"En la posición {indice} tenemos el elemento '{elemento}'")``

	```
	El caracter en la posición 0 es P
	El caracter en la posición 1 es y
	El caracter en la posición 2 es t
	El caracter en la posición 3 es h
	El caracter en la posición 4 es o
	El caracter en la posición 5 es n
	```

-  *``isinstance(objeto, clase)``*: `isinstance` es una función incorporada en Python que se utiliza para verificar si un objeto es una instancia o subclase de una clase determinada.

	![[ListComprehension.py]]

	- `objeto`: Es el objeto cuya clase se va a verificar.
	- `clase`: Puede ser cualquier tipo de clase o tipo de datos en Python, como `int`, `str`, `list`, `dict`, etc.
	
	Funcionamiento de `isinstance`: `resultado = isinstance(123, int) > print(resultado) # Output: True, porque 123 es un entero (int) `
	
	1. **Verificación de Tipo Directo**: Si el objeto es una instancia directa de la clase especificada o una subclase de esa clase, `isinstance` devuelve `True`.
	2. **Herencia**: `isinstance` también considera la herencia. Si el objeto es una instancia de una subclase que hereda de la clase especificada, también devuelve `True`.

-  *``mean()``*: Se utiliza para calcular la media aritmética de una lista de números. La media aritmética es la suma de los valores de la lista dividida por el número de valores.

	``array = np.array([1, 2, 3, 4, 5])``
	``media = np.mean(array)``
	``print(media) # 3.0``

-  *``.str.startswith``*: La función `.str.startswith` no es exclusiva de Pandas, aunque se usa comúnmente en Pandas para trabajar con series de datos. Esta función está disponible tanto en Pandas como en la biblioteca estándar de Python (con las cadenas de caracteres).

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
