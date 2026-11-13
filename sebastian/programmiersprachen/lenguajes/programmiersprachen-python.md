
-  **Enlaces**

	-  **[Python docs ](https://docs.python.org/es/3.14/index.html)**
	-  **Notas de este paquete**
	
		-  **[[python-pandas]]**
		-  **[[python-conexiones-bases-de-datos]]**
		-  **[[python-ejercicios]]**
		-  **[[biblioteca-azure]]**
		-  **[[biblioteca-boto3]]**
		-  **[[biblioteca-matplotlib]]**
		-  **[[biblioteca-pydantic]]**
		-  **[[biblioteca-subprocess]]**
-  **[[package-manager-uv]]**
![[barra.gif]]
Aquí tienes la comparación visual exacta para que nunca se te olvide:

- **Lista (Array):** Usa corchetes `[]`. Ejemplo: `[1, 2, 2, 3]`
- **Tupla:** Usa paréntesis `()`. Ejemplo: `(1, 2, 2, 3)`
- **Diccionario:** Usa llaves `{}` con dos puntos `:` para separar la clave del valor. Ejemplo: `{"numero1": 1, "numero2": 2}`
- **Conjunto (Set):** Usa llaves `{}` pero solo con los valores separados por comas. Ejemplo: `{1, 2, 3}`

**Nota técnica sobre colecciones vacías:**
Un detalle importante: la regla visual de las llaves `{}` tiene una excepción. Si escribes simplemente `mi_coleccion = {}`, Python creará un **diccionario vacío**, no un conjunto vacío. Para crear un **conjunto vacío**, debes utilizar la función `set()`: `mi_conjunto = set()`. 








-  **Bibliotecas o módulos**

	-  **Manejo de datos**
	
		- **``Numpy``**: Biblioteca esencial para computación científica en Python. Ofrece soporte para arrays multidimensionales y funciones matemáticas de alto rendimiento.
		- **``Pandas``**: Librería esencial para análisis y manipulación de datos. Proporciona estructuras como DataFrames y Series, que permiten trabajar con datos tabulares de manera eficiente. Incluye funciones para limpieza, transformación, agregación y visualización de datos, además de integración con otras librerías como NumPy y Matplotlib.
		-  **[[Biblioteca Pydantic]]**: **Pydantic es una biblioteca de validación de datos y creación de modelos en Python basada en** _**type hints**_**.** Su objetivo es garantizar que los datos que entran en tu aplicación sean correctos, completos y del tipo adecuado.
	-  **Visualización de datos**
	
		- **[[Biblioteca Matplotlib]]**: Librería para crear gráficos y visualizaciones de datos, ampliamente usada en ciencia de datos e ingeniería.
		- **``Seaborn``**: Librería de visualización basada en Matplotlib, diseñada para crear gráficos atractivos con menos código. Funciona bien con datos de pandas.
		- **``Plotly``**: Librería para crear visualizaciones interactivas y gráficos avanzados. Soporta gráficos 2D y 3D, mapas, gráficos financieros y más. Es ideal para dashboards y presentaciones dinámicas, con integración en Jupyter Notebooks y aplicaciones web.
	-  **Manipulación de archivos y rutas**
	
		- **``IO``**: Biblioteca estándar de Python para manejar flujos de datos. Trabaja con flujos en memoria RAM, como `StringIO` para texto y `BytesIO` para datos binarios. Es útil para manipular datos sin necesidad de archivos físicos, permitiendo operaciones rápidas y eficientes en memoria.
		- **``Pathlib``**: Librería moderna para manejar rutas de archivos y directorios. Ofrece una API orientada a objetos que simplifica operaciones como creación, eliminación, búsqueda y manipulación de rutas. Es multiplataforma, lo que garantiza compatibilidad entre sistemas operativos.
		- **``OS``**: Módulo estándar de Python que proporciona funciones para interactuar con el sistema operativo. Permite manejar archivos, directorios, variables de entorno y procesos del sistema. Es esencial para tareas de administración y automatización.
	-  **Trabajo con documentos estructurados (HTML, XML, Excel)**
	
		- **``LXML``**: Librería de alto rendimiento para procesar XML y HTML. Combina la velocidad de libxml2/libxslt con una API sencilla y potente. Es ideal para analizar, manipular y generar documentos estructurados, además de soportar XPath y XSLT.
		- **``BeautifulSoup``**: Librería para extraer y manipular datos de archivos HTML y XML. Facilita el web scraping al permitir búsquedas y navegación por el árbol del documento. Es compatible con diferentes parsers como html.parser y lxml.
		- **``html5lib``**: Librería para analizar HTML de manera compatible con los estándares modernos. Es más lento que otros parsers pero ofrece un análisis más preciso y tolerante con HTML mal formado. Ideal para documentos complejos.
		- **``xlrd``**: Librería para leer datos de archivos de Excel (.xls). Es útil para extraer información de hojas de cálculo antiguas, aunque no soporta el formato .xlsx más moderno. Permite acceso a celdas, fórmulas y formatos.
		- **``openpyxl``**: Librería para leer y escribir archivos de Excel (.xlsx). Soporta operaciones avanzadas como la creación de gráficos, fórmulas, estilos y tablas dinámicas. Es ideal para automatizar la generación de informes en Excel.
	-  **Serialización y persistencia de datos**
	
		- **``Pickle``**: Módulo estándar de Python para serializar y deserializar objetos. Permite guardar estructuras de datos complejas (listas, diccionarios, objetos personalizados) en archivos binarios y recuperarlas posteriormente. Es útil para persistir datos entre sesiones de programa.
	-  **Interacción web y APIs**
	
		- **``Requests``**: Librería para realizar solicitudes HTTP de manera sencilla y eficiente. Soporta métodos como GET, POST, PUT y DELETE, y maneja automáticamente detalles como cabeceras, cookies y autenticación. Es ampliamente usada para interactuar con APIs y servicios web.
		- **``Pyodide``**: Implementación de Python en WebAssembly, que permite ejecutar código Python directamente en el navegador. Incluye muchas librerías científicas populares (como NumPy y Pandas) y es ideal para aplicaciones web interactivas y análisis en tiempo real.
	-  **Trabajo con Jupyter Notebooks**
	
		- **``nbformat``**: Librería para trabajar con archivos de Jupyter Notebook (.ipynb). Permite crear, leer y modificar notebooks programáticamente, lo que es útil para automatizar la generación de informes o la manipulación de notebooks.
	-  **Manejo de advertencias**
	
		- **``warnings``**: El módulo `warnings` se importa para manejar y controlar advertencias en Python.
	-  **Automatización de redes**
	
		**`paramiko`, `netmiko` y `NAPALM`** son bibliotecas de Python utilizadas para interactuar con dispositivos de red, como routers, switches y firewalls, mediante protocolos de comunicación como SSH. Estas bibliotecas son populares en la automatización de redes y la administración de dispositivos.
		
		-  **Paramiko**
		
			- **``Descripción``**: Paramiko es una biblioteca de Python para trabajar con SSH2 (Secure Shell) y SFTP (Secure File Transfer Protocol). Permite ejecutar comandos de manera remota, transferir archivos entre dispositivos y establecer conexiones SSH seguras con dispositivos.
			- **``Uso común``**: Automatización de la administración de dispositivos de red, transferencia de archivos de configuración, ejecución de comandos remotos, etc.
			
			**Ejecutar un comando remoto en un dispositivo:**
			
			``import paramiko``
			
			``client = paramiko.SSHClient()``
			``client.set_missing_host_key_policy(paramiko.AutoAddPolicy())  # Añadir la clave del host automáticamente``
			``client.connect('hostname', username='your_username', password='your_password')``
			
			``stdin, stdout, stderr = client.exec_command('show version')``
			``print(stdout.read().decode())  # Imprimir el resultado del comando``
			
			``client.close()``
			
			-  **Importación de la biblioteca paramiko**:
			
			    - Se importa la biblioteca **paramiko**, que es una herramienta para trabajar con SSH en Python. Esta biblioteca permite conectar y ejecutar comandos de forma remota en dispositivos.
			-  **Creación del objeto SSHClient**:
			
			    -  `client = paramiko.SSHClient()`
			     
			        Aquí se crea un objeto de la clase `SSHClient`, que es responsable de gestionar la conexión SSH.
			-  **Configuración de las políticas de clave de host**:
			
			    -  `client.set_missing_host_key_policy(paramiko.AutoAddPolicy())`
			     
			        Este método indica que si la clave del host al que te conectas no se encuentra en el archivo de claves conocidas, la clave se añadirá automáticamente. Esto evita que se genere un error si el host al que nos conectamos no es conocido previamente.
			-  **Conexión al dispositivo remoto**:
			
			    -  `client.connect('hostname', username='your_username', password='your_password')`
			     
			        Aquí se establece la conexión SSH al dispositivo remoto. Se pasan tres parámetros:
			        - `'hostname'`: La dirección IP o el nombre del host del dispositivo al que te quieres conectar.
			        - `'your_username'`: El nombre de usuario para autenticar la sesión SSH.
			        - `'your_password'`: La contraseña asociada al nombre de usuario.
			-  **Ejecutar un comando en el dispositivo remoto**:
			
			    -  `stdin, stdout, stderr = client.exec_command('show version')`
			     
			        Este método ejecuta el comando `'show version'` en el dispositivo remoto. El comando se envía al dispositivo y su salida se captura en tres variables:
			        - `stdin`: Permite enviar datos al comando ejecutado (no se utiliza aquí).
			        - `stdout`: Captura la salida estándar (el resultado del comando).
			        - `stderr`: Captura cualquier error generado por el comando (no utilizado aquí).
			-  **Leer e imprimir el resultado del comando**:
			
			    -  `print(stdout.read().decode())`
			     
			        Se lee la salida estándar del comando ejecutado (`stdout.read()`) y se decodifica desde bytes a texto legible. Luego, el resultado se imprime en pantalla.
			-  **Cerrar la conexión SSH**:
			
			    -  `client.close()`
			     
			        Finalmente, se cierra la conexión SSH al dispositivo remoto para liberar los recursos utilizados.
			
			-  **Netmiko**
			
				- **``Descripción``**: Netmiko es una extensión de Paramiko diseñada específicamente para la automatización de dispositivos de red. Simplifica el uso de SSH en dispositivos de red, y proporciona soporte para múltiples plataformas de redes como Cisco, Juniper, Arista, entre otras.
				- **``Uso común``**: Ejecución de comandos de administración de dispositivos de red, configuración de dispositivos, obtención de información de estado, etc.
				
				**Conectar y ejecutar un comando en un dispositivo Cisco**:
				
				``from netmiko import ConnectHandler``
				
				``device = {``
				    ``'device_type': 'cisco_ios',``
				    ``'host': 'hostname',``
				    ``'username': 'your_username',``
				    ``'password': 'your_password',``
				    ``'secret': 'your_enable_password',  # Si se requiere el modo enable``
				``}``
				
				``net_connect = ConnectHandler(**device)``
				``net_connect.enable()  # Si es necesario entrar en modo habilitado``
				
				``output = net_connect.send_command('show version')``
				``print(output)``
				
				``net_connect.disconnect()``
				
				-  **Importación de la biblioteca netmiko**:
				
				    - `from netmiko import ConnectHandler`  
				        Aquí se importa la clase `ConnectHandler` de la biblioteca **Netmiko**. Esta clase es la encargada de gestionar la conexión y ejecución de comandos en dispositivos de red.
				-  **Definición del diccionario del dispositivo**:
				    
				    - `device = {...}`  
				        Se define un diccionario `device` con los detalles necesarios para establecer la conexión SSH con el dispositivo de red:
				        - `'device_type'`: Especifica el tipo de dispositivo, en este caso, `cisco_ios`, lo que indica que el dispositivo es un router o switch Cisco con IOS.
				        - `'host'`: La dirección IP o el nombre del host del dispositivo de red.
				        - `'username'`: El nombre de usuario para autenticar la sesión SSH.
				        - `'password'`: La contraseña asociada al nombre de usuario.
				        - `'secret'`: La contraseña enable (si el dispositivo requiere entrar en modo enable para ejecutar comandos privilegiados).
				-  **Conexión al dispositivo**:
				    
				    - `net_connect = ConnectHandler(**device)`  
				        Se crea una instancia de `ConnectHandler` usando el diccionario `device`. El operador `**device` descompone el diccionario y pasa sus claves como argumentos del constructor. Esto establece la conexión SSH con el dispositivo de red.
				-  **Acceder al modo enable (si es necesario)**:
				    
				    - `net_connect.enable()`  
				        Si el dispositivo requiere acceder al modo **enable** para ejecutar comandos privilegiados, este método se utiliza para autenticar el acceso a ese modo usando la contraseña `secret` especificada.
				-  **Ejecutar un comando en el dispositivo**:
				    
				    - `output = net_connect.send_command('show version')`  
				        Este método envía el comando `show version` al dispositivo. El comando generalmente se usa en dispositivos Cisco para obtener información sobre la versión del sistema operativo del dispositivo. El resultado se guarda en la variable `output`.
				-  **Imprimir el resultado del comando**:
				    
				    - `print(output)`  
				        Se imprime la salida del comando ejecutado, que es la información sobre la versión del dispositivo.
				-  **Cerrar la conexión**:
				    
				    - `net_connect.disconnect()`  
				        Finalmente, se cierra la conexión SSH al dispositivo, liberando los recursos utilizados.
		-  **NAPALM**
		
			- **``Descripción``**: NAPALM es una biblioteca que proporciona una capa de abstracción para interactuar con dispositivos de red de manera programática. Es una herramienta que permite la automatización en una forma más abstracta y es compatible con múltiples proveedores de dispositivos.
			- **``Uso común``**: Automación de redes, obtención de información de estado de dispositivos de red, configuración y gestión de dispositivos de forma programática, y cumplimiento de políticas de configuración.
			
			**Obtener la configuración de un dispositivo**:
			
			``from napalm import get_network_driver``
			
			``driver = get_network_driver('ios')  # 'ios' para dispositivos Cisco``
			``device = driver('hostname', 'your_username', 'your_password')``
			
			``device.open()  # Establece la conexión``
			``config = device.get_config()  # Obtiene la configuración del dispositivo``
			``print(config)``
			
			``device.close()  # Cierra la conexión``
			
			-  **Importación de la función `get_network_driver` de NAPALM**:
			    
			    - `from napalm import get_network_driver`
			        - Se importa la función `get_network_driver` de la librería **NAPALM**. Esta función permite obtener el controlador adecuado para gestionar un dispositivo de red, según el tipo de dispositivo (por ejemplo, Cisco, Juniper, etc.).
			-  **Obtener el controlador adecuado para el dispositivo**:
			    
			    - `driver = get_network_driver('ios')`
			        - Se llama a `get_network_driver` con el argumento `'ios'`, que corresponde a los dispositivos **Cisco IOS**. Esto obtiene el controlador para los dispositivos Cisco. Puedes cambiar `'ios'` por otro valor como `'junos'` para Juniper, `'eos'` para Arista, etc.
			-  **Crear una instancia de conexión con el dispositivo**:
			    
			    - `device = driver('hostname', 'your_username', 'your_password')`
			        - Con el controlador obtenido, se crea una instancia de `device` que contiene la información de conexión al dispositivo de red, pasando el **nombre del host** o dirección IP, **nombre de usuario** y **contraseña** para autenticar la conexión SSH al dispositivo.
			-  **Abrir la conexión con el dispositivo**:
			    
			    - `device.open()`
			        - Este método establece la conexión SSH con el dispositivo. A partir de este punto, puedes interactuar con el dispositivo usando las capacidades de NAPALM.
			-  **Obtener la configuración del dispositivo**:
			    
			    - `config = device.get_config()`
			        - Este método solicita la configuración actual del dispositivo de red. La configuración puede ser en forma de configuración activa (running config) o de configuración guardada (startup config), dependiendo de los parámetros configurados.
			-  **Imprimir la configuración del dispositivo**:
			    
			    - `print(config)`
			        - Imprime la configuración que fue obtenida del dispositivo, lo que permite ver las configuraciones activas.
			-  **Cerrar la conexión con el dispositivo**:
			    
			    - `device.close()`
			        - Se cierra la conexión SSH al dispositivo, liberando los recursos utilizados.
	-  **Acceso a datos**
	
		- **``yfinance``**: Librería para acceder a datos financieros de Yahoo Finance. Proporciona información histórica y en tiempo real sobre acciones, índices, divisas y criptomonedas. Es útil para análisis financieros y creación de modelos predictivos.
	-  **Kit de desarrollo de software**
	
		-  **[[Biblioteca Boto3|Amazon SDK for Python]]**
		-  **[[Biblioteca Azure|Azure SDK for Python]]**
	-  **Multi-tareas**
	
		-  **[[Biblioteca Subprocess]]**: El módulo permite lanzar nuevos procesos, conectarse a sus pipes de entrada/salida/error y obtener sus códigos de resultado.
		- 
-  **Fundamentos: Tipos builtins y objetos**
    -  **Tipos de datos innatos/básicos (Builtins)**
    
    	los **tipos básicos o "builtins"** son estructuras de datos fundamentales y predefinidas que el lenguaje proporciona para gestionar información de manera rápida y eficiente. Los tipos básicos de Python incluyen **números** (enteros y flotantes), **cadenas de texto**, **listas**, **tuplas**, **diccionarios**, **conjuntos**, entre otros.
    	
    	A diferencia de lenguajes como **C** o **C++**, donde el programador tiene que implementar manualmente estructuras de datos y gestionar memoria (lo cual puede llevar a errores y complicaciones), **Python ofrece una solución mucho más simple** y poderosa, pues las estructuras de datos básicas ya están implementadas y optimizadas.
    	
    	-  **Ejemplo en C**: 
    	
			```c
			#include <stdio.h>
			#include <stdlib.h>
			int main() {
			     // Declarar un arreglo de tamaño 3 y reservamos memoria
			     int *arr = (int *)malloc(3 * sizeof(int));
			     // Asignamos valores al arreglo
			     arr[0] = 5;
			     arr[1] = 10;
			     arr[2] = 15;
			     // Agregar un nuevo valor (requiere redimensionar la memoria)
			     int *new_arr = (int *)realloc(arr, 4 * sizeof(int));
			        if (new_arr == NULL) {
			            free(arr);  // Si realloc falla, liberamos la memoria
			            printf("Error de memoria\n");
			            return 1;
			        }
			        new_arr[3] = 20;
			        // Imprimimos los valores del arreglo
			        for (int i = 0; i < 4; i++) {
			            printf("%d ", new_arr[i]);
			        }
			        // Liberamos la memoria al final
			        free(new_arr);
			        return 0;
			    }
			```
	    -  **Ejemplo en Python**: 

			```python
			arr = [5, 10, 15]  # Crear una lista con 3 elementos
			arr.append(20)
			for num in arr:
			  print(num)
			```
    	-  **Ejemplos de los tipos básicos de Python**:
    	
	    	-  **Números**:
	    	
	    	    - `int`: enteros (`1`, `100`, `-45`)
	    	    - `float`: números decimales (`3.14`, `0.1`, `-5.75`)
	    	-  **Cadenas**:
	    	
	    	    - `str`: cadenas de texto (`'Hola'`, `"Python"`)
	    	-  **Colecciones**:
	    	
	    	    - `list`: listas ordenadas y mutables (`[1, 2, 3]`)
	    	    - `tuple`: tuplas ordenadas e inmutables (`(1, 2, 3)`)
	    	    - `set`: conjuntos sin elementos duplicados (`{1, 2, 3}`)
	    	    - `dict`: diccionarios clave-valor (`{'clave1': 'valor1', 'clave2': 'valor2'}`)
    -  **¿Qué significa que las funciones y módulos sean objetos?**
    
    	En Python, las funciones no son simplemente bloques de código que se ejecutan cuando se llaman. Son **objetos de primera clase**. Esto significa que las funciones en Python pueden:
    	
    	- Ser **asignadas a variables**.
    	- Ser **pasadas como parámetros** a otras funciones.
    	- Ser **devueltas como resultados** desde otras funciones.
    	- Ser **almacenadas** en estructuras de datos como listas o diccionarios.
    	
    	**Ejemplo funciones como objeto**:
    	
    		def saludar():
    		    print("¡Hola, mundo!")
    		
    		mi_funcion = saludar # Asignar la función a una variable
    		mi_funcion()  # Esto ejecuta la función saludar
    		
    		def ejecutar(func): # Pasar la función como parámetro
    		    func()
    		
    		ejecutar(saludar)  # También ejecuta saludar()
    	**Ejemplo módulos como objeto**:
    	
    		import math  # Importa el módulo math
    		
    		def usar_modulo(modulo): # Pasar el módulo como parámetro
    		    print(modulo.pi)  # Usamos el atributo 'pi' del módulo
    		
    		usar_modulo(math)  # Imprime el valor de pi desde el módulo math

	-  **Operadores Python**
	  
		-  **`yield x`**: Utilizado en funciones generadoras. Devuelve un valor y suspende la ejecución de la función, permitiendo la reanudación más tarde. Este protocolo es parte del generador "send".
		-  **`lambda args: expresión`**: Define una **función anónima**. Es útil cuando necesitas una función pequeña, generalmente para pasarla como argumento a otra función como `map()`, `filter()`, o `sorted()`.
		-  **`x if y else z`**: **Selección ternaria**. Retorna `x` si la condición `y` es verdadera, de lo contrario retorna `z`. Es una forma compacta de escribir un `if-else`.
		-  **`x or y`**: **OR lógico**. Si `x` es verdadero, retorna `x`, de lo contrario evalúa y retorna `y`. La evaluación de `y` solo ocurre si `x` es falso, lo que significa que es evaluada **perezosamente**.
		-  **`x and y`**: **AND lógico**. Si `x` es falso, retorna `x`; de lo contrario, evalúa y retorna `y`. Similar al operador `or`, `y` solo se evalúa si `x` es verdadero.
		-  **`not x`**: **Negación lógica**. Invierte el valor de `x`. Si `x` es verdadero, retorna falso; si `x` es falso, retorna verdadero.
		-  **`x in y, x not in y`**: **Operadores de membresía**. Determinan si el valor `x` es miembro de la secuencia o colección `y`. `x in y` retorna `True` si `x` está en `y`, mientras que `x not in y` retorna `True` si `x` no está en `y`.
		-  **`x is y, y is not x`**: **Operadores de identidad**. Comparan si `x` y `y` son el mismo objeto en memoria. `is` retorna `True` si ambos objetos son idénticos (el mismo objeto), mientras que `is not` retorna `True` si no lo son.
		-  **`x < y, x <= y, x > y, x >= y`**: **Comparación de magnitudes**. Compara `x` con `y` utilizando los operadores de menor que (`<`), menor o igual que (`<=`), mayor que (`>`), y mayor o igual que (`>=`).
		-  **`x == y, x != y`**: **Operadores de igualdad**. `==` compara si `x` es igual a `y`, y `!=` compara si `x` es distinto de `y`.
		-  **`x | y`**: **Bit a bit (bitwise) OR**. Realiza una operación OR a nivel de bits. En el contexto de conjuntos, también se utiliza para realizar la **unión** de sets.
		-  **`x ^ y`**: **Bitwise XOR**. Realiza una operación XOR a nivel de bits. En el contexto de conjuntos, realiza la **diferencia simétrica** entre dos sets, es decir, los elementos que están en uno de los conjuntos, pero no en ambos.
		-  **`x & y`**: **Bit a bit AND**. Realiza una operación AND a nivel de bits. En el contexto de conjuntos, representa la **intersección** de los conjuntos, es decir, los elementos que están en ambos.
		-  **`x << y, x >> y`**: **Desplazamiento de bits**. Desplaza los bits de `x` a la izquierda (`<<`) o a la derecha (`>>`) por `y` posiciones. Esto puede ser útil para manipulación de datos binarios.
		-  **`x + y`**: **Adición** o **concatenación**. Realiza la adición de números o concatena secuencias como cadenas de texto o listas.
		-  **`x - y`**: **Sustracción** o **diferencia entre sets**. Resta números o calcula la diferencia entre dos sets (elementos de `x` que no están en `y`).
		-  **`x * y`**: **Multiplicación** o **repetición**. Multiplica números o repite una secuencia (como una lista o cadena) `y` veces.
		-  **`x % y`**: **Resto de la división**. Calcula el residuo de la división de `x` entre `y`.
		-  **`x / y`**: **División real**. Realiza una división con el resultado en **punto flotante**. Siempre devuelve un valor decimal (flotante).
		-  **`x // y`**: **División truncada**. Realiza una división que **descarta la parte decimal**, devolviendo el cociente entero.
		-  **`-x, +x`**: **Negación** y **identidad**. El operador `-x` invierte el signo de `x`, mientras que `+x` simplemente retorna `x` sin cambios (identidad).
		-  **`~x`**: **Negación bit a bit**. Invierte todos los bits de `x` (complemento a uno).
		-  **`x ** y`**: **Potencia**. Calcula `x` elevado a la potencia de `y`, es decir, `x`^`y`.
		-  **`x[i]`**: **Indexado**. Accede al elemento en la posición `i` de una secuencia (como una lista, tupla o cadena).
		-  **`x[i:j:k]`**: **Troceado (slicing)**. Extrae una subsecuencia de `x` comenzando desde el índice `i`, hasta el índice `j`, y con un **paso** de `k`.
		-  **`x(...)`**: **Llamada a función**. Llama a una función, método, o clase. Se pasan los parámetros dentro de los paréntesis.
		-  **`x.attr`**: **Referencia a un atributo**. Accede a un atributo o método de un objeto.
	-  **Operadores y caracteres especiales**
	
		- **`//`**: Operador de división entera. Devuelve el cociente sin el residuo.
		- **`\`**: Carácter de escape para saltos de línea o continuar una línea de código en la siguiente.
		- **`&`**: Operador lógico para operaciones a nivel de bits o en matrices multidimensionales.
		-  **`[]`**: Las listas son colecciones ordenadas y mutables (se pueden modificar). Pueden contener elementos de cualquier tipo (enteros, cadenas, otros objetos, etc.).
		  
			**``mi_lista = [1, "hola", 3.14, True] ``**
			**``print(f"Lista: {mi_lista}")``**
		-  **`()`**: Las tuplas son colecciones ordenadas e inmutables (no se pueden modificar después de su creación). También pueden contener elementos de diferentes tipos.
		
			``mi_tupla = (10, "mundo", 2.71, False) ``
			``print(f"Tupla: {mi_tupla}")``
		-  **`{}`**: Los diccionarios son colecciones desordenadas.
		  
			- Son **mutables**.
			- Almacenan pares **clave-valor**.
			- Las **claves** deben ser **únicas** e **inmutables** (cadenas, números, tuplas).
			- Los **valores** pueden ser de cualquier tipo
			  
			**``mi_diccionario = {"nombre": "Ana", "edad": 30, "ciudad": "Madrid"} ``**
			**``print(f"Diccionario: {mi_diccionario}")``**
		-  **`{}`**: Los **``conjuntos/sets``** son colecciones no ordenadas, mutables y que no permiten duplicados. Se utilizan principalmente para operaciones matemáticas como uniones, intersecciones, etc. `{1, 2, 3, 4}`.
		
			Los conjuntos son especialmente útiles para:
			
			-  **Eliminar duplicados** de una lista u otro iterable.
			-  Realizar **operaciones de conjuntos** como:
			
			    - **Unión:** Combinar los elementos de dos conjuntos.
			    - **Intersección:** Encontrar los elementos comunes en dos conjuntos.
			    - **Diferencia:** Encontrar los elementos que están en un conjunto pero no en otro.
			    - **Pertenencia:** Verificar si un elemento está presente en un conjunto de manera muy eficiente.
			
			**``mi_conjunto = {1, 2, 2, 3, 4, 4, 5} ``**
			**``print(f"Conjunto: {mi_conjunto}")``**
			
			- Se define utilizando llaves `{}`.
			- Contiene números enteros.
			- Observa que aunque el número `2` y el número `4` se agregaron dos veces, el conjunto solo almacena una instancia de cada uno, ya que los conjuntos no permiten duplicados.
			- Los conjuntos no mantienen un orden específico de los elementos.
		-  **`*`**: El operador `*` también puede usarse para **desempaquetar** una colección (como una lista o tupla) y pasar sus elementos como argumentos individuales a una función.
		
			``def suma(a, b, c):``
			    ``return a + b + c``
			
			``numeros = [1, 2, 3]``
			``resultado = suma(*numeros) ``
			``print(resultado)``
		
		**Diferencias clave**
		
		-  **No ordenado (Unordered):**
		
			- **``Conjuntos``:** Los elementos dentro de un conjunto no tienen un orden específico. Cuando iteras sobre un conjunto o lo imprimes, los elementos pueden aparecer en un orden diferente cada vez. No se almacenan en una secuencia particular como en las listas o tuplas.
			- **``Listas y Tuplas``:** Mantienen el orden en el que se insertan los elementos. El primer elemento que agregas siempre será el primer elemento, y así sucesivamente.
			- **``Diccionarios`` (a partir de Python 3.7):** Mantienen el orden de inserción de las claves.
		-  **No permite duplicados:**
		
			- **``Conjuntos``:** Si intentas agregar un elemento que ya existe en un conjunto, simplemente no se agregará. El conjunto contendrá solo elementos únicos.
			- **``Listas y Tuplas``:** Pueden contener elementos duplicados.
			- **``Diccionarios``:** Las claves deben ser únicas, pero los valores pueden duplicarse.
		-  **Mutable (se pueden modificar):**
		
			- **``Conjuntos``:** Puedes agregar y eliminar elementos de un conjunto después de su creación.
			- **``Listas``:** Son mutables; puedes agregar, eliminar y modificar elementos.
			- **``Tuplas``:** Son inmutables; una vez creadas, no puedes cambiar sus elementos.
			- **``Diccionarios``:** Son mutables; puedes agregar, eliminar y modificar pares clave-valor.
		-  **Almacenamiento de datos:**
		
			- **``Conjuntos``:** Principalmente diseñados para almacenar colecciones de elementos únicos sin un orden específico. Son muy eficientes para realizar operaciones matemáticas de conjuntos como unión, intersección, diferencia, etc.
			- **``Listas``:** Se utilizan para almacenar colecciones ordenadas de elementos donde el orden es importante y puede haber duplicados.
			- **``Tuplas``:** Similares a las listas, pero se utilizan cuando necesitas una colección ordenada de elementos que no deben modificarse.
			- **``Diccionarios``:** Se utilizan para almacenar datos en forma de pares clave-valor, donde cada valor está asociado a una clave única. Son ideales para buscar información rápidamente utilizando las claves.
	-  **Aprendizaje general**
	  
		-  **``def``**: Es la palabra clave en Python para definir una función.
		-  **`*args`** : Es un parámetro especial que permite pasar un número variable de argumentos (en forma de tupla) a la función. Cualquier cantidad de argumentos que se pase a la función será almacenada en `args` como una tupla.
		  
			Un **argumento** es un valor que se pasa a una función cuando la invocas (la llamas). Estos valores son utilizados por la función para realizar ciertas operaciones o cálculos: 
			
			``def saludar(nombre):``
			    ``print(f"Hola, {nombre}!")``
			
			A veces, no sabes cuántos argumentos vas a pasar a una función. En estos casos, puedes usar el operador especial `*args` para permitir que la función acepte un **número variable de argumentos** .
			
			Cuando usas `*args`, todos los argumentos adicionales que pases a la función se empaquetan automáticamente en una **tupla** . Esto significa que puedes pasar tantos argumentos como quieras, y la función los manejará sin problemas.
			
			``def mostrar_argumentos(*args):``
			    ``print("Los argumentos pasados son:", args)``
			    ``print("El tipo de args es:", type(args))``
			
			``mostrar_argumentos(1, 2, 3)``
			``mostrar_argumentos("hola", "mundo")``
			``mostrar_argumentos()``
		-  **`__init__`**: Es el **constructor** de una clase su función principal es inicializar los **atributos** de una nueva instancia de la clase cuando se crea un objeto. Es decir, el método `__init__` se ejecuta automáticamente cuando se crea un **nuevo objeto** de una clase.
		
			**¿Qué es un constructor en programación?**
			
			- En programación orientada a objetos, un **constructor** es un **método especial** que se llama automáticamente cuando creamos un **nuevo objeto** de una clase.
			- El constructor se utiliza para **inicializar** el objeto, es decir, para darle valores a sus **atributos** (propiedades) cuando el objeto se crea.
			
			**¿Qué hace `__init__` en Python?**
			
			- El **`__init__`** es el **método constructor** en Python.
			- Cada vez que creas un nuevo **objeto** de una **clase**, Python ejecuta automáticamente el método **`__init__`** de esa clase.
			- Dentro del **`__init__`**, puedes inicializar los **atributos** de ese objeto.
			
			**¿Cómo funciona `__init__`?**
			
			1. **Creas una clase** con un **constructor** (el método `__init__`).
			2. **Al crear un objeto de esa clase**, Python llama automáticamente a **`__init__`**.
			3. En el **`__init__`**, puedes establecer los valores iniciales de los atributos del objeto.
			
			**Paso 1: Definir la clase y el constructor `__init__`**:
			
			``class Coche:``
			    ``def __init__(self, marca, modelo, color):``
			        ``self.marca = marca``
			        ``self.modelo = modelo``
			        ``self.color = color``
			
			- **`class Coche:`**: Crea una clase llamada `Coche`.
			- **`def __init__(self, marca, modelo, color):`**: Este es el **constructor** de la clase. Se llama **automáticamente** cuando creas un nuevo objeto de tipo `Coche`. Los parámetros **`marca`**, **`modelo`** y **`color`** se pasan cuando creas un objeto.
			- **`self.marca = marca`**: Esto asigna el valor de `marca` al atributo `marca` del objeto.
			
			**Paso 2: Crear un objeto de la clase `Coche`**:
			
			**``mi_coche = Coche("Toyota", "Corolla", "Rojo")``**
			
			- Cuando creas el objeto `mi_coche` de tipo `Coche`, **Python llama automáticamente al constructor `__init__`**.
			- Los valores `"Toyota"`, `"Corolla"` y `"Rojo"` son pasados al constructor como parámetros.
			- Dentro del constructor, **`self.marca = "Toyota"`**, **`self.modelo = "Corolla"`** y **`self.color = "Rojo"`** inicializan los atributos del objeto `mi_coche`.
			
			**Paso 3: Usar los atributos del objeto**:
			
			``print(mi_coche.marca)   # Imprime "Toyota"``
			``print(mi_coche.modelo)  # Imprime "Corolla"``
			``print(mi_coche.color)   # Imprime "Rojo"``
			
			- **`mi_coche.marca`** se refiere al atributo `marca` del objeto `mi_coche`, que fue inicializado en el constructor `__init__`.
			  
			**¿Qué hace `self` en el constructor?**
			
			- **`self`** es una **referencia** al **objeto actual** que se está creando.
			- Siempre que creas un objeto de una clase, **`self`** apunta a ese objeto específico y se utiliza para acceder a los atributos y métodos de ese objeto.
		-  **`__str__()`**: Es un método especial de Python que se utiliza para definir cómo se representa un objeto como cadena de texto (string) cuando se intenta imprimir el objeto o convertirlo a una cadena con la función ``str()``.
		
			**¿Por qué existe `__str__`?**
			
			La razón de la existencia de `__str__` es que **por defecto**, si intentas imprimir un objeto que has creado, Python no sabe cómo representarlo de manera legible. Python solo muestra una **referencia de memoria** del objeto (algo como `<__main__.Clase object at 0x...>`), lo cual no es útil si quieres mostrar información significativa sobre el objeto.
		-  **`__repr__`**: También tiene otro método especial llamado **`__repr__`**, que tiene una finalidad similar pero ligeramente diferente. Este método está diseñado para devolver una **representación oficial** del objeto, que puede ser utilizada para reconstruir el objeto usando `eval()` (es decir, algo que podría ser utilizado por los desarrolladores para crear el objeto nuevamente). Si no se implementa `__repr__`, Python usará el valor de `__str__`.
		-  **`self`**: Es un **parámetro especial** que se utiliza en los métodos de una clase para referirse a la **instancia actual** de esa clase. En otras palabras, **`self`** es como un marcador de posición que se refiere al objeto en sí mismo. **`self`** permite acceder a los **atributos y métodos** del objeto que estás creando o utilizando. A través de **`self`**, el objeto mantiene su propio estado y puedes modificarlo o consultarlo.
	-  **Obtener y mostrar el código ASCII**
	  
		La instrucción **`print(ord('h'))`** en Python se usa para obtener y mostrar el **código ASCII (o Unicode) de un carácter**.
		
		- **Convertir caracteres a valores numéricos** en ASCII/Unicode.
		- **Comparar caracteres** basándose en sus códigos.
		- **Manipulación de texto**.
		- **Convertir caracteres a binario o hexadecimal**.
		
		-  **``print(ord('h')) # Salida: 104``**
		-  **``print(bin(ord('h'))) # Salida: 0b1101000``**
		-  **``print(hex(ord('h'))) # Salida: 0x68``**
	-  **Elección de bucle**
	  
		 Se sugiere utilizar bucles **``for``** cuando se tiene una secuencia de elementos que se desea recorrer y **``while``** cuando se desea repetir una acción hasta que se cumpla una condición.
		
		-  **``if``: Permite ejecutar un bloque de código si se cumple una condición.**
		
			``age = 25``
			``if age >= 18:``
		    ``print("Eres mayor de edad.")``
		-  **``if is``: Se utiliza para comparar objetos por identidad, no por valor.**
		
			``name = "Juan"``
			``if name is "Juan":``
			    ``print("El nombre es Juan")``
			``else:``
			    ``print("El nombre no es Juan")``
		-  **``elif``: Se proporciona una condición alternativa en una estructura condicional if.**
		
			``score = 85``
			``if score >= 90:``
				    ``grade = "A"``
			``elif score >= 80:``
			    ``grade = "B"``
			``elif score >= 70:``
			    ``grade = "C"``
			``else:``
			    ``grade = "D"``
			``print(f"Puntuación: {score}, Calificación: {grade}")``
		-  **``else``: Se ejecuta cuando ninguna de las condiciones anteriores se cumple.**
		
			``age = 15``
			``if age >= 18:``
			    ``print("Eres mayor de edad.")``
			``else:``
			    ``print("Eres menor de edad.")``
		-  **``for``: Se utiliza para iterar sobre una secuencia (como una lista, una tupla o una cadena) y ejecutar un bloque de código para cada elemento.**
		
			``students = [``
			    ``{"name": "Juan", "age": 25},``
			    ``{"name": "Maria", "age": 22},``
			    ``{"name": "Carlos", "age": 30}``
			``] # Iterando sobre una lista de diccionarios y extrayendo información``
			``for student in students:``
			    ``print(f"Nombre: {student['name']}, Edad: {student['age']}")``
		-  **``for in``: Se utiliza para iterar sobre una secuencia y es muy común en estructuras de bucle.**
		 
			``def mirrored_string(my_string):``
			    ``forwards = ""``
			    ``backwards = ""``
			    ``for character in my_string:``
			        ``if character.isalpha():``
			            ``forwards += character``
			            ``backwards = character + backwards``
			    ``if forwards.lower() == backwards.lower():``
			        ``return True``
			    ``return False``
			``print(mirrored_string("12 Noon"))``
			``print(mirrored_string("Was it a car or cat I saw"))``
			``print(mirrored_string("'eve, Madam Eve"))``
		-  **``in``: Se utiliza para verificar la pertenencia de un elemento a una secuencia, como una lista, una cadena, una tupla o un diccionario y nos devolverá true o false. Esta sintaxis se utiliza en diferentes contextos para comprobar si un elemento específico está presente en una secuencia o colección de datos.**
		
			``mi_cadena = "Hola, mundo"``
			``caracter = 'a'``
				``if caracter in mi_cadena:``
			    ``print("El carácter está en la cadena.")``
			
			``mi_diccionario = {'nombre': 'Juan', 'edad': 25, 'ciudad': 'Madrid'}``
			``clave = 'edad'`` # Buscar una cadena en un diccionario
				``if clave in mi_diccionario:``
			    ``print(f"La clave '{clave}' está en el diccionario.")``
		-  **``break``: Se utiliza para salir de un bucle antes de que termine su ejecución.**
		
			``for i in range(5):``
		    ``if i == 3:``
		        ``break``
		    ``print(i)``
		-  **``continue``: Se utiliza para saltar la iteración actual de un bucle y continuar con la siguiente.**
		
			``for i in range(5):``
		    ``if i == 3:``
		        ``continue``
		    ``print(i)``
		-  **``return``: El método return se utiliza para devolver un valor desde una función. El valor que se devuelve puede ser de cualquier tipo de dato, incluyendo números, cadenas, listas, tuplas, diccionarios, etc.**
		
			Cuando se encuentra una declaración return, la función finaliza su ejecución y regresa al llamador. Esto significa que cualquier código después de return en la función no se ejecutará.
			
			``def funcion_terminar():``
		    ``print("Esta línea se ejecuta")``
		    ``return``
		    ``print("Esta línea NO se ejecuta")``
		    
			``funcion_terminar()``
			``def suma(a, b):``
			    ``result = a + b``
			    ``return result``
			``total = suma(3, 4)``
			``print(total)``
			
			Si no se proporciona una expresión con return, o se utiliza return sin ningún valor, la función devolverá automáticamente *None*.
	-  <strong style ="color: ;">Concepto POO</strong>
	
		El concepto de Programación Orientada a Objetos (POO) es un paradigma de programación que se basa en el uso de "objetos" para diseñar y desarrollar aplicaciones. 
		
		Estos objetos son entidades que combinan datos (conocidos como atributos o propiedades) y funciones (llamadas métodos) que operan sobre esos datos. La POO se centra en la creación de estructuras de software modular, donde los objetos interactúan entre sí para realizar tareas específicas.
		
		**Principios fundamentales de la POO**
		
		- **``Abstracción``**: Permite modelar entidades del mundo real como objetos en el software, enfocándose en sus características relevantes y ignorando los detalles irrelevantes.
		- **``Encapsulamiento``**: Agrupa los datos (atributos) y los métodos que operan sobre esos datos en un solo objeto, ocultando los detalles internos de su implementación y protegiendo los datos sensibles.
		- **``Herencia``**: Permite que un objeto (llamado subclase o clase derivada) herede características y comportamientos de otro objeto (llamado superclase o clase base), fomentando la reutilización del código y la jerarquía de clases.
		- **``Polimorfismo``**: Permite que los objetos de diferentes clases puedan ser tratados de manera uniforme, facilitando la programación genérica y la manipulación de objetos de manera flexible.
		
		**Componentes clave de la POO**
		
		- **``Clases``**: Definen los tipos de objetos, especificando los datos que contendrán y los métodos que operarán sobre esos datos. Una clase es como un plano o plantilla para crear múltiples instancias de objetos.
		- **``Objetos``**: Son instancias individuales de una clase. Cada objeto tiene su propio conjunto único de datos (atributos) y puede realizar acciones específicas mediante sus métodos.
		- **``Métodos``**: Son funciones asociadas a los objetos que definen su comportamiento. Los métodos pueden acceder y manipular los datos internos del objeto.
		- **``Atributos``**: Son variables que contienen los datos asociados a un objeto. Cada objeto tiene su propio conjunto de atributos que representan su estado actual.
		
		**Ventajas de la POO**
		
		- **``Reutilización de código``**: Las clases y objetos permiten reutilizar y extender el código fácilmente, ya que los objetos pueden heredar y modificar comportamientos de otros objetos.
		- **``Modularidad``**: Permite dividir el programa en módulos independientes (objetos), facilitando el mantenimiento y la depuración del código.
		- **``Flexibilidad y escalabilidad``**: Facilita la organización y gestión de proyectos complejos, permitiendo un diseño flexible y adaptable a cambios futuros.
	-  **Separar lógica principal y lógica modular**
	  
		La declaración `if __name__ == "__main__"` en Python se utiliza para separar dos tipos de lógica en un archivo de código: **lógica principal** y **lógica modular**. 
		
		**Explicación de `if __name__ == "__main__"`**:
		
		- **`__name__`**: Es una variable especial en Python. Cuando un archivo se ejecuta directamente, Python asigna a la variable `__name__` el valor `__main__`. Sin embargo, si el archivo se importa como un módulo en otro script, `__name__` tendrá el nombre del archivo.
		- **`if __name__ == "__main__"`**: Esta condición asegura que el bloque de código solo se ejecute cuando el archivo es ejecutado directamente y **no cuando es importado como módulo**.
		
		-  **Lógica principal**:
		
			La **lógica principal** es el código que debe ejecutarse cuando el archivo Python se ejecute directamente como un programa principal. Es decir, el código dentro de esta sección es el que se debe ejecutar cuando el archivo es ejecutado como un script independiente.
			
			- Se suele utilizar para ejecutar funciones principales o iniciar el flujo de un programa.
			- Generalmente, contiene el comportamiento que se espera que ocurra cuando el programa se ejecuta de manera directa.
			
			Ejemplo: [[ResolucionIP.py]]
			
			En este caso:
			
			Cuando ejecutas este archivo directamente, Python ejecutará la función `main()` y, por lo tanto, imprimirá el mensaje `"Este es el comportamiento principal del script."`.
		-  **Lógica modular**:
		
			La **lógica modular** se refiere a las funciones, clases o métodos que están diseñados para ser reutilizados o importados en otros archivos. Es decir, el código que se encuentra fuera del bloque `if __name__ == "__main__"` forma parte de la **lógica modular** porque puede ser **importado** por otros scripts sin que se ejecute automáticamente.
			
			- Este tipo de lógica no debería ejecutarse cuando el archivo es importado como módulo en otro script.
			- El código dentro de la sección `if __name__ == "__main__"` asegura que solo la lógica principal (la parte que corresponde al script ejecutado directamente) se ejecute.
			
			**Ejemplo**:
			  
			``import ResolucionIP # otro_script.py``
			``ResolucionIP.main() # Llamar a la función main manualmente``
			
			En este caso, **no se ejecutará automáticamente el código dentro de `main()`** cuando importes `ResolucionIP.py`. Sin embargo, puedes llamar manualmente a la función `ResolucionIP.py.main()` desde el otro script para obtener los resultados.
	-  **Definición de funciones y estructuras básicas**
	
		-  **`def`**: Palabra clave que indica el inicio de la definición de una función.
		-  **`lambda`**: Expresión anónima que actúa como una función en línea. Se usa comúnmente en funciones como `map()`, `filter()` y en listas por comprensión. Su sintaxis es: `lambda parámetros: expresión`.
		
			``a = [1, 2, 3]``
			``b = map(lambda x: str(x), a)``
			``print(list(b))  # Output: ['1', '2', '3']``
	-  **Manejo de objetos y documentación**
	
		- **`dir("")`**: Muestra todos los atributos y métodos disponibles para un objeto. En el caso de una cadena, muestra los métodos de la clase `str`.
		- **`help("")`**: Proporciona documentación sobre un objeto, incluyendo métodos, parámetros y descripciones de su uso.
	-  **Estructura de una list comprehension**
	
		Es proporcionar una forma **concisa y legible** de crear nuevas listas basadas en listas existentes u otros iterables.
		
		-  **``Concisión``:** Permiten escribir en una sola línea de código lo que a menudo requeriría un bucle `for` y una o más sentencias `if`. Esto hace que el código sea más corto y fácil de leer.
		-  **``Legibilidad``:** Cuando se usan correctamente, las comprensiones de lista pueden hacer que el código sea más intuitivo y fácil de entender, especialmente para operaciones comunes como transformar o filtrar elementos de una lista. La lógica de la creación de la nueva lista se expresa de forma más directa.
		-  **``Eficiencia`` (en algunos casos):** Aunque la diferencia no siempre es significativa, las comprensiones de lista a menudo pueden ser ligeramente más eficientes en términos de rendimiento que los bucles `for` tradicionales para la creación de listas. Esto se debe a que la mayor parte del trabajo se realiza en el intérprete de C subyacente de Python, en lugar de en el código de Python puro.
		-  **``Expresividad``:** Facilitan la realización de operaciones comunes en listas de manera más expresiva, como:
		
		    - **Transformar elementos:** Aplicar una función o expresión a cada elemento de una lista para crear una nueva lista con los resultados transformados.
		    - **Filtrar elementos:** Crear una nueva lista que contenga solo los elementos de la lista original que cumplen una determinada condición.
		    - **Combinar transformación y filtrado:** Realizar ambas operaciones simultáneamente.
			
			Por ejemplo, en lugar de escribir:
			
				numbers = [1, 2, 3, 4, 5]
				squared_numbers = []
				for number in numbers:
				    if number % 2 == 0:
				        squared_numbers.append(number ** 2)
				print(squared_numbers)  # Output: [4, 16]
			
			Puedes lograr el mismo resultado de manera más concisa con una comprensión de lista:
			
			``mixed_data = ["apple", "10", "True", "2.5", "123", "45abc", "-42", "0"]``
			``integers = [int(element) for element in mixed_data if element.lstrip("-").isdigit()]``
			``print(integers)``
			
			- **`expresión`**: Es lo que se va a agregar a la nueva lista. En este caso, es `int(element)`.
			- **`elemento`**: Es la variable que toma cada valor del iterable. En este caso, es `element`.
			- **`iterable`**: Es la colección de la cual se extraen los elementos. En este caso, es `mixed_data`
			- **`condición` (opcional)**: Es un filtro que decide si el elemento debe ser incluido en la nueva lista. En este caso, es `element.isdigit()`.
		-  **`for element in mixed_data`**:
		
		    - Itera sobre cada elemento en la lista `mixed_data`.
		    - En cada iteración, `element` toma el valor de uno de los elementos de `mixed_data`.
		-  **`if element.isdigit()`**:
		
		    - Filtra los elementos de `mixed_data`.
		    - Solo incluye en la nueva lista aquellos elementos para los cuales `element.isdigit()` devuelve `True`.
		    - `element.isdigit()` verifica si `element` es una cadena que contiene solo dígitos (0-9).
		-  **`int(element)`**:
		
		    - Convierte el elemento (que es una cadena de dígitos) a un número entero.
		    - Este es el valor que se agrega a la nueva lista.
		-  **`[ ]`**:
		
		    - Encierra toda la expresión y crea una nueva lista con los resultados.
	-  **Manejo de archivos y recursos**
	
		-  **`with`**: Estructura que garantiza la liberación adecuada de recursos (archivos) al finalizar su uso, incluso si ocurren excepciones. Utiliza los métodos `__enter__` y `__exit__`.
		  
			- **`__enter__`**: Se ejecuta al entrar en el bloque `with`. Devuelve el recurso que se asignará a la variable.
			- **`__exit__`**: Se ejecuta al salir del bloque `with`. Maneja excepciones y libera recursos.
			
		    - **`exc_type`**: Tipo de excepción (si ocurre).
		    - **`exc_value`**: Valor de la excepción (si ocurre).
		    - **`traceback`**: Información de la pila de llamadas (si ocurre una excepción).
		-  **`open()`**: Función para abrir archivos. Acepta dos argumentos principales: el nombre del archivo y el modo de apertura.
		  
			- `"r"`: Lectura (predeterminado).
			- `"w"`: Escritura (sobrescribe o crea un archivo).
			- `"a"`: Escritura (agrega al final del archivo).
			- `"b"`: Modo binario.
			- `"r+"`: Lectura y escritura.
			- `"a+"`: Lectura y escritura (agrega al final).
			- `"x"`: Creación exclusiva (falla si el archivo ya existe).
			
		    - **`read()`**: Lee todo el contenido del archivo.
		    - **`readline()`**: Lee una línea del archivo.
		    - **`readlines()`**: Lee todas las líneas y las devuelve como una lista.
		    - **`seek()`**: Mueve el puntero del archivo a una posición específica (en bytes).
		    - **`write()`**: Escribe datos en el archivo.
		    - **`close()`**: Cierra el archivo y libera recursos.
			
			``with open("archivo.txt", "w") as file:``
				``file.write("Hola, mundo!\n")``
				``file.write("Segunda línea.")``
	-  **Generadores e iteración**
	
		-  **`yield`**: Transforma una función en un generador, permitiendo la producción de valores bajo demanda sin almacenarlos en memoria.
		-  **`range()`**: Genera una secuencia de números bajo demanda. No almacena todos los valores en memoria, lo que lo hace eficiente.
		  
			``def to_celsius(x):``
		    ``return (x-32)*5/9``
			
			``for x in range(0, 101, 10):``
			    ``print(x, to_celsius(x)) ``
			
			``rango (parada)``
			``rango(3) ``
			``rango(3+1) ``
			``rango (inicio, parada)``
			``rango(2, 6)     ``
			``rango(5,10+1) ``
			``rango (inicio, parada, paso)``
			``rango(4, 15+1, 2)    ``     
			``rango(2*2, 25, 3+2) ``
			``rango(10, 0, -2)``º
		-  **`len()`**: Devuelve la longitud de un objeto iterable (como una lista o cadena). No funciona directamente con generadores porque no tienen una longitud predefinida.
		
			  a = [2, 5, 15]
			  b = [3, 6, 18]
			  ab = [a[i] * b[i] for i in range(len(a))]  # Multiplica elementos de dos listas
			  print(ab)  # Output: [6, 30, 270]
	-  **Métodos numéricos** 
	
		- **``int()``**: Convierte un valor (normalmente un flotante) a un tipo de datos entero.
		- **``float()``**: Convierte un valor (normalmente un entero) en un tipo de datos flotante.
		- **``toFixed(2)``**: Se utiliza para formatear un número decimal con un cierto número de decimales específicos. Toma un argumento, en este caso, “``2``”. Este argumento especifica cuántos decimales deben mostrarse en el número resultante.
		-  **`min()` y `max()`**: Devuelve el valor mínimo o máximo en la tupla.
		  
			``numbers = (10, 20, 5, 30)``
			``print(min(numbers))  # Output: 5``
			``print(max(numbers))  # Output: 30``
		-  **`sum()`**: Devuelve la suma de los elementos numéricos de la tupla.
		  
			``numbers = (10, 20, 5, 30)``
			``print(sum(numbers))  # Output: 65``
	-  **Métodos string**
	
		-  **``\n ``and`` \t``**: Utilizadas en cadenas de texto. ``\n`` representa un salto de línea, lo que significa que el texto siguiente se imprimirá en una nueva línea. ``\t`` representa un carácter de tabulación que se utiliza para crear un espacio en blanco con un ancho de tabulación en el texto.
		
			``# Ejemplo de uso de \n y \t``
			``mensaje = "Hola,\n\t¿Cómo estás?\n\tEspero que todo esté bien."``
			``print(mensaje)``
		- **``type``**: Es una **función incorporada** que se utiliza para determinar el tipo de dato de un objeto o variable.
		
			``print(type(numero))      # <class 'int'>``
			``print(type(texto))       # <class 'str'>``
			``print(type(flotante))    # <class 'float'>``
			``print(type(lista))       # <class 'list'>``
			``print(type(diccionario)) # <class 'dict'>``
			
			-  **Cuando un alias se convierte en contrato**
			
				En Python moderno, `type` no define una acción (como `def`), sino que define un **``alias de tipo``**.
				
				-  **``Significado``:** Estás creando un nombre nuevo para una estructura de datos compleja.
				-  **`Diferencia con def`:**  Define **comportamiento** (cómo se hace algo). `type` define **identidad** (qué es algo).
				
				Técnicamente, `type ArbitraryDate = ...` es un nombre alternativo. Es como decir: "Cada vez que yo escriba `ArbitraryDate`, tú, Python, entiende que me refiero a todo este bloque de `Annotated`". No crea una estructura nueva en la memoria, solo renombra una existente para que sea legible.
				
				**Como "Contrato" (su función en el código)**
				
				Aunque técnicamente es un alias, para tu aplicación actúa como un **Contrato de Comportamiento**. Al usarlo en un modelo de Pydantic, estás estableciendo un acuerdo:
				
				- **``La promesa``:** "Este campo aceptará `int` o `str`".
				- **``La cláusula de cumplimiento``:** "Pero antes de aceptarlo, **debe** pasar con éxito por la función `validate_arbitrary_date`".
				- **``La consecuencia``:** "Si la función falla (lanza un error), el contrato se rompe y los datos no se procesan".
				
				**``type ArbitraryDate = Annotated[ int | str, pydantic.AfterValidator(validate_arbitrary_date)]``**
			-  **Cómo se emplea `Annotated`**
			  
				En Python normal, si dices `x: int`, solo estás diciendo qué **es** el dato. `Annotated` permite añadir **Metadatos**. Los metadatos son información extra que no cambia la naturaleza del dato, pero le dice a otras herramientas (como Pydantic) qué hacer con él.
				
				**¿Por qué es una "Instrucción Especial"?**
				
				Imagina que `Annotated` es un sobre.
				
				- **Afuera del sobre** está escrito: `int | str`. (Esto es lo que ve Python para no dar error).
				- **Dentro del sobre** está la nota: `AfterValidator(validate_arbitrary_date)`.
				
				Python ignora la nota del interior. Pero **Pydantic** tiene la capacidad de abrir el sobre, leer la nota y decir: _"¡Ah! El programador me dejó una instrucción: después de comprobar que el dato es un número o texto, debo ejecutar esta función obligatoriamente"_.
				
				**El flujo paso a paso**
				
				Cuando usas tu alias `ArbitraryDate` en un modelo, Pydantic hace esto:
				
				1. **Validación de Tipo (La caja):** ¿El dato que llegó es `int` o `str`?
				
				    - Si llega un booleano (`True`), Pydantic se detiene y da error.
				    - Si llega un `int` o `str`, pasa al siguiente nivel.
				2. **Ejecución de la Instrucción (AfterValidator):** Pydantic ve que usaste `Annotated` y que hay una instrucción `AfterValidator`. Entonces, toma ese `int` o `str` y se lo envía a tu función `validate_arbitrary_date`.
				3. **Resultado Final:**
				
				    - Si tu función termina bien, el dato se guarda.
				    - Si tu función lanza un error (porque la fecha no existe), Pydantic lo atrapa y avisa que el dato no es válido.
		-  **``end``**: Es un argumento que te permite especificar el carácter que se debe agregar al final de cada llamada a print. Por defecto, end es un salto de línea **``\n``**. 
		
			`print("Este es un mensaje", end=" *** ")`
		-  **``sep``**: Es un argumento que te permite especificar el carácter que se debe usar para separar múltiples argumentos que se imprimen en la misma llamada a print. 
			
			Por defecto, **``sep``** es un espacio " ", lo que significa que los argumentos se separan por espacios. Puedes cambiar esto asignando un valor diferente a sep. 
			
			``print("Hola", "Mundo", sep="-") ``
		- **``input()``**: Se utiliza para obtener la entrada del usuario desde la consola. Cuando utilizas **``input``**, el programa se pausa y espera a que el usuario ingrese datos.
		-  **``format()``**: Se utiliza para formatear cadenas. Su función principal es reemplazar marcadores de posición en una cadena con valores especificados. 
		
			``name = "Juan"``
			``age = 30``
			``formatted_text = "Mi nombre es {} y tengo {} años.".format(name, age)``
			``print(formatted_text)``
			
			``# Otro``
			
			``name = 'Manny'``
			``number = len(name) * 3``
			``print("Hello {}, your lucky number is {}".format(name, number))``
			
			``def to_celsius(x):``
			    ``return (x-32)*5/9``
			``for x in range(0, 101, 10):``
			    ``print("{:>3} F | {:>6.2f} C".format(x, to_celsius(x)))``
		- **``f-strings``**: Puedes usar ``f-strings`` para incrustar variables en cadenas directamente.
		  
			``print(f"Hola, mi nombre es {nombre} y tengo {edad} años.")``
		-  **``upper()``**: Convierte una cadena a mayúsculas.
		
			``# Manipulación de cadenas con upper() y lower()``
			``text = "Hola, Mundo"``
			``uppercase_text = text.upper()``
			``print(f"Original: {text}, En mayúsculas: {uppercase_text}, En minúsculas: {lowercase_text}")``
		-  **``lower()``**: Convierte una cadena a minúsculas.
		
			``# Manipulación de cadenas con upper() y lower()``
			``text = "Hola, Mundo"``
			``lowercase_text = text.lower()``
			``print(f"Original: {text}, En minúsculas: {lowercase_text}")``
		- **``strip()``**: Elimina espacios en blanco al principio y al final de una cadena.
		
			``text = "   Hola, mundo   "``
			``stripped_text = text.strip()``
			``left_stripped_text = text.lstrip()``
			``right_stripped_text = text.rstrip()``
			``print(stripped_text)  # "Hola, mundo"``
			``print(left_stripped_text)  # "Hola, mundo   "``
			``print(right_stripped_text)  # "   Hola, mundo"``
		- **`lsrip()`**: Elimina espacios en blanco al principio de una cadena.
		- **`rsrip()`**: Elimina espacios en blanco al final de una cadena.
		-  **``count()``**: Se utiliza para contar cuántas veces aparece una subcadena dentro de una cadena: `cadena.count(subcadena, inicio, fin)`
		
			- **`cadena`**: La cadena en la que se buscará la subcadena.
			- **`subcadena`**: La subcadena que se desea contar.
			- **`inicio` (opcional)**: Índice desde donde comenzar la búsqueda (por defecto es 0).
			- **`fin` (opcional)**: Índice donde terminar la búsqueda (por defecto es el final de la cadena).
			
			``# Definimos una cadena de texto``
			``texto = "Python es genial, Python es fácil, Python es poderoso."``
			
			``# Contamos cuántas veces aparece la palabra "Python"``
			``cantidad = texto.count("Python")``
			
			``# Imprimimos el resultado``
			``print(f"La palabra 'Python' aparece {cantidad} veces.")``
			``# Salida:``
			``La palabra 'Python' aparece 3 veces.``
			
			**Ejemplo con parámetros opcionales (`inicio` y `fin`)**
			
			``# Definimos una cadena de texto``
			``texto = "Python es genial, Python es fácil, Python es poderoso."``
			
			``# Contamos cuántas veces aparece "Python" entre los índices 10 y 30``
			``cantidad = texto.count("Python", 10, 30)``
			
			``# Imprimimos el resultado``
			``print(f"La palabra 'Python' aparece {cantidad} veces entre los índices 10 y 30.")``
			``# Salida:``
			`La palabra 'Python' aparece 1 vez entre los índices 10 y 30.`
			
			**Explicación**:
			
			1. **Cadena original**: `"Python es genial, Python es fácil, Python es poderoso."`
			2. **Subcadena a buscar**: `"Python"`.
			3. **Búsqueda entre los índices 10 y 30**: Solo se busca en la porción `"Python es fácil"`.
			4. **Resultado**: La palabra `"Python"` aparece **1 vez** en este rango.
		- **``isalpha()``**: Se utiliza para comprobar si una cadena solo contiene caracteres alfabéticos. Este método devuelve **``True``** si la cadena solo contiene caracteres alfabéticos, y **``False``** en caso contrario.
		- **``str()``**: Convierte un valor (a menudo numérico) en un tipo de datos de cadena.
		- **``rfind()``**: Se utiliza para encontrar la última ocurrencia de una subcadena en una cadena.
		- **``index()``**: Este método devuelve el índice del primer carácter que coincide con la subcadena que pasamos como argumento.
		
			``text = "Hola, mundo"``
			``index_of_coma = text.index(",")``
			``print(f"La coma está en el índice {index_of_coma}.") # La coma está en el índice 4.``
		-  **``replace()``**: Se utiliza para reemplazar una subcadena de una cadena con otra subcadena.
		
			Los argumentos: `string.replace(old, new, count)`
			
			- **``old``**: La subcadena que se va a reemplazar.
			- **``new``**: La subcadena que se va a usar para reemplazar a old.
			- **``count``**: El número de veces que se va a reemplazar old. Si se establece en **``None``**, se reemplazarán todas las ocurrencias de old.
			
			``string = "Hola, mundo"``
			``new_string = string.replace("Hola", "Adiós")``
			``print(new_string)``
			`# Salida:`
			`Adiós, mundo`
			
			``# También se puede utilizar para eliminar una subcadena de una cadena.`` ``
			``# Para ello, basta con establecer el argumento new en una cadena vacía. ``
			``# Por ejemplo, el siguiente código elimina la subcadena "hola" de la cadena "Hola, mundo":``
			
			``string = "Hola, mundo"``
			``new_string = string.replace("Hola", "")``
			``print(new_string)``
			`# Salida:`
			``# , mundo``
		- **``string.lower()``**: Devuelve una copia de la cadena con todos los caracteres en minúsculas
		- **``string.upper()``**: Devuelve una copia de la cadena con todos los caracteres en mayúsculas
		- **``string.lstrip()``**: Devuelve una copia de la cadena sin el espacio en blanco del lado izquierdo 
		- **``string.rstrip()``**: Devuelve una copia de la cadena sin el espacio en blanco del lado derecho 
		- **``string.strip()``**: Devuelve una copia de la cadena sin espacios en blanco del lado izquierdo y derecho.
		- **``string.count(substring)``**: Devuelve el número de veces que la subcadena está presente en la cadena.
		- **``string.isnumeric()``**: Devuelve **``True``** si solo hay caracteres numéricos en la cadena. Si no, devuelve **``False``**.
		- **``string.isalpha()``**: Devuelve **``True``** si solo hay caracteres alfabéticos en la cadena. Si no, devuelve **``False``**.
		- **``string.split()``**: Devuelve una lista de subcadena que fueron separadas por espacios en blanco (los espacios en blanco pueden ser un espacio, una tabulación o una nueva línea)
		- **``string.split(delimiter)``**: Devuelve una lista de subcadena que estaban separadas por espacios en blanco o un delimitador
		- **``string.replace(antiguo, nuevo)``**: Devuelve una nueva cadena donde todas las apariciones de lo antiguo han sido reemplazadas por nuevas.
		- **``string[i]``**: Accede al carácter en el índice **``i``** de la cadena, comenzando en cero
		- **``string[i:j]``**: Accede a la subcadena que comienza en el índice **``i``** y termina en el índice **``j``** -1. Si se omite **``i``** , su valor predeterminado es 0 . Si se omite **``j``** , el valor predeterminado será len(string).
		- **``delimiter.join(lista de cadenas)``**: Devuelve una nueva cadena con todas las cadenas unidas por el delimitador
		-  **``endswith()``**: Comprueba si una cadena termina con una subcadena dada.
		
			``file_name = "document.pdf"``
			``if file_name.endswith(".pdf"):``
			    ``print("Es un archivo PDF.")``
			``else:``
			    ``print("No es un archivo PDF.")``
		-  **``isnumeric()``**: Comprueba si una cadena contiene solo caracteres numéricos.
		
			``number = "12345"``
			``if number.isnumeric():``
			    ``print("Es un número.")``
			``else:``
			    ``print("No es un número.")``
		-  **``join()``**: Une elementos de una secuencia con una cadena como separador.
		
			``fruits = ["manzana", "banana", "cereza"]``
			``fruits_string = ", ".join(fruits)``
			``print(fruits_string)``
			
			``# Imprimimos el resultado``
			``manzana, banana, cereza``
		-  **``split()``**: Divide una cadena en una lista de subcadena utilizando un separador.
		
			``sentence = "Esta es una oración de ejemplo"``
			``words = sentence.split()``
			``print(words)``
			
			``# Imprimimos el resultado``
			``['Esta', 'es', 'una', 'oración', 'de', 'ejemplo']``
		-  **``isdigit()``**: Es una función de cadena que se utiliza para comprobar si una cadena solo contiene caracteres numéricos. La función devuelve **``True``** si la cadena solo contiene caracteres numéricos, y **``False``** si la cadena contiene cualquier otro carácter. 
		
			- Para validar una entrada de usuario para asegurarse de que solo contiene números.
			- Para convertir una cadena de texto a un número entero.
			- Para filtrar una lista de cadenas para que solo contenga cadenas que sean números.
			
			**Estructura de una list comprehension**:
			
			- **`expresión`**: Es lo que se va a agregar a la nueva lista. En este caso, es `int(element)`.
			- **`elemento`**: Es la variable que toma cada valor del iterable. En este caso, es `element`.
			- **`iterable`**: Es la colección de la cual se extraen los elementos. En este caso, es `mixed_data`
			- **`condición` (opcional)**: Es un filtro que decide si el elemento debe ser incluido en la nueva lista. En este caso, es `element.isdigit()`.
			
			-  **`for element in mixed_data`**:
			
			    - Itera sobre cada elemento en la lista `mixed_data`.
			    - En cada iteración, `element` toma el valor de uno de los elementos de `mixed_data`.
			-  **`if element.isdigit()`**:
			
			    - Filtra los elementos de `mixed_data`.
			    - Solo incluye en la nueva lista aquellos elementos para los cuales `element.isdigit()` devuelve `True`.
			    - `element.isdigit()` verifica si `element` es una cadena que contiene solo dígitos (0-9).
			-  **`int(element)`**:
			
			    - Convierte el elemento (que es una cadena de dígitos) a un número entero.
			    - Este es el valor que se agrega a la nueva lista.
			-  **`[ ]`**:
			
			    Encierra toda la expresión y crea una nueva lista con los resultados.
			
			``mixed_data = ["apple", "10", "True", "2.5", "123", "45abc", "-42", "0"]``
			``integers = [int(element) for element in mixed_data if element.isdigit()]``
			``print(integers)``
	-  **Métodos de almacenamiento**
	  
		-  **`len()`**: Devuelve la cantidad de elementos en la tupla.
		
			``fruits = ("apple", "banana", "orange")``
			``print(len(fruits))  # Output: 3``
		-  **`index()`**: Devuelve el índice de la primera aparición del valor especificado. Si no existe, lanza un error.
		  
			``fruits = ("apple", "banana", "orange")``
			``print(fruits.index("banana"))  # Output: 1``
-  **Programación estructurada y orientada a objetos (POO)**

	**Programación Estructurada:**
	
	En la programación estructurada, los datos se gestionan de manera secuencial mediante funciones que operan sobre estructuras de datos, como listas o diccionarios. En este caso, se tiene una lista de **diccionarios** para representar a los **clientes**.
	
		clientes = [
		    {'Nombre': 'Hector', 'Apellidos':'Costa Guzman', 'dni':'11111111A'},
		    {'Nombre': 'Juan', 'Apellidos':'González Márquez', 'dni':'22222222B'}
		]
		
		def mostrar_cliente(clientes, dni):
		    for c in clientes:
		        if dni == c['dni']:
		            print('{} {}'.format(c['Nombre'], c['Apellidos']))
		            return
		    print('Cliente no encontrado')
		
		def borrar_cliente(clientes, dni):
		    for i, c in enumerate(clientes):
		        if dni == c['dni']:
		            del(clientes[i])
		            print(str(c), "> Cliente Borrado")
		            return
		    print('Cliente no encontrado')
		
		print("==Listado de clientes==")
		print(clientes)
		
		print("\n==Mostrar clientes por DNI==")
		mostrar_cliente(clientes, '11111111A')
		mostrar_cliente(clientes, '11111111Z')
		
		print("\n==Borrar clientes por DNI==")
		borrar_cliente(clientes, '22222222V')
		borrar_cliente(clientes, '22222222B')
		
		print("\n==Listado de clientes==")
		print(clientes)
	
	**Programación Orientada a Objetos (POO)**: 
	
	En la programación orientada a objetos, los datos y las funciones están **encapsulados** en **clases**. Las clases permiten representar **entidades del mundo real**, como en este caso los **clientes** y las **empresas**, con **atributos** (como `dni`, `nombre`, `apellidos`) y **métodos** (como `mostrar_cliente()`, `borrar_cliente()`).
	
	```python
	class Cliente:
	  def __init__(self, dni, nombre, apellidos):
	    self.dni = dni
	    self.nombre = nombre
	    self.apellidos = apellidos
	  def __str__(self):
	    return '{} {}'.format(self.nombre, self.apellidos)
	  def __repr__(self):
	    return f"Cliente(dni='{self.dni}', nombre='{self.nombre}', apellidos='{self.apellidos}')"
	
	class Empresa:
	  def __init__(self, clientes=None):
	    if clientes is None:
	      clientes = []
	    self.clientes = clientes
	  def mostrar_cliente(self, dni=None):
	    for c in self.clientes:
	      if c.dni == dni:
	        print(c)
	        return
	    print("Cliente no encontrado")
	  def borrar_cliente(self, dni=None):
	    for i, c in enumerate(self.clientes):
	      if c.dni == dni:
	        del self.clientes[i]
	        print(str(c), "> Cliente Borrado")
	        return
	    print("Cliente no encontrado")
	hector = Cliente(nombre="Hector", apellidos="Costa Guzman", dni="11111111A")
	juan = Cliente("22222222B", "Juan", "Gonzalez Marquez")
	empresa = Empresa(clientes=[hector, juan])
	print("==Listado de clientes==")
	print(empresa.clientes)
	print("\n==Mostrar clientes por DNI==")
	empresa.mostrar_cliente("11111111A")
	empresa.mostrar_cliente("11111111Z")
	print("\n==Borrar clientes por DNI==")
	empresa.borrar_cliente("22222222V")
	empresa.borrar_cliente("22222222B")
	print("\n==Listado de clientes==")
	print(empresa.clientes)
	```
-  **Funciones Lambda**

	Las **funciones Lambda**, que son una forma de crear funciones pequeñas y anónimas (es decir, sin nombre) en Python.
	
	**¿Qué las hace especiales?**
	
	- **``Anónimas``:** A diferencia de las funciones regulares que definimos con `def` (como `def mi_funcion():`), las funciones Lambda no tienen un nombre. Esto significa que no las "almacenas" para reutilizarlas fácilmente en otras partes del código si no las asignas a una variable.
	- **``Una sola línea``:** Están diseñadas para expresar una operación simple y se limitan a una única expresión. No puedes escribir bloques de código complejos con múltiples sentencias dentro de una Lambda.
	- **``Sintaxis concisa``:** Su formato es `lambda argumentos: expresión`.
	
	-  **Función `def` normal:**
	
		``def cualitativa(nota):``
		    ``return nota + 0.5``
		
		``nota_ingresada = float(input("Escriba una nota: "))``
		``resultado = cualitativa(nota_ingresada)``
		``print(resultado)``
	-  **Función Lambda equivalente:**
	
		``cualitativa_lambda = lambda x: x + 0.5``
		
		``nota_ingresada = float(input("Escriba una nota: "))``
		``resultado = cualitativa_lambda(nota_ingresada)``
		``print(resultado)``
	-  **Funciones Lambda con `map()` para listas**
	
		Un punto crucial de la clase es cuando intentan aplicar una función Lambda directamente a una **lista de datos**. Las funciones Lambda, por sí mismas, no saben cómo "recorrer" una lista y aplicar una operación a cada elemento. Para eso, Python nos ofrece la función **`map()`**.
		
		`map()` toma dos argumentos principales:
		
		- La **función** que quieres aplicar (en este caso, nuestra Lambda).
		- El **iterable** (la lista, tupla, etc.) a la que quieres aplicar la función.
		
		``notas = [6, 7, 9, 5.5, 8]``
		``notas_actualizadas_map_obj = map(lambda x: x + 0.5, notas)``
		
		``notas_actualizadas_lista = list(notas_actualizadas_map_obj)``
		``print(f"Notas originales: {notas}")``
		``print(f"Notas actualizadas: {notas_actualizadas_lista}")``





###### Módulo random
- ``random()``: Es parte de la biblioteca estándar y proporciona funciones para generar números pseudoaleatorios.

**Principales Funciones del Módulo** `random`

1. **``random()``**: Devuelve un número float pseudoaleatorio en el rango [0.0, 1.0).

2. **``randint(a, b)``**: Devuelve un entero pseudoaleatorio `N` tal que `a <= N <= b`.

3. **``randrange(start, stop[, step])``**: Genera un número aleatorio dentro de un rango específico.

4. **``choice(seq)``**: Retorna un elemento aleatorio de una secuencia no vacía.

5. **``choices(population, weights=None, *, cum_weights=None, k=1)``**: Retorna una lista de elementos seleccionados aleatoriamente de la población especificada, con reemplazo.

6. **``shuffle()``**: Permuta (reordena aleatoriamente) una secuencia.

	``import random``
	
	``letras = list('asfasdashjbasfiyvqfhbadnkfbaiyfvakn')``
	``vocales = 'aeiou'``
	
	``random.shuffle(letras)``
	``print(' '.join(letras))``
	
	``for i, letra in enumerate(letras):``
	    ``if letra in vocales:``
	        ``print('{} en la posición {}'.format(letra, i))``

7. **``sample(population, k)``**: Retorna una lista de `k` elementos únicos seleccionados aleatoriamente de una secuencia.

8. **``uniform(a, b)``**: Devuelve un número float pseudoaleatorio `N` tal que `a <= N <= b`.

9. **``triangular(low, high, mode)``**: Devuelve un número flotante aleatorio con una distribución triangular.

10. **``betavariate(alpha, beta)``**: Devuelve un número flotante aleatorio con una distribución Beta.

11. **``expovariate(lambd)``**: Devuelve un número flotante aleatorio con una distribución exponencial.

12. **``gammavariate(alpha, beta)``**: Devuelve un número flotante aleatorio con una distribución Gamma.

13. **``gauss(mu, sigma)``**: Devuelve un número flotante aleatorio con una distribución normal Gaussiana.

14. **``lognormvariate(mu, sigma)``**: Devuelve un número flotante aleatorio con una distribución log-normal.

15. **``normalvariate(mu, sigma)``**: Devuelve un número flotante aleatorio con una distribución normal.

16. **``vonmisesvariate(mu, kappa)``**: Devuelve un número flotante aleatorio con una distribución Von Mises.

17. **``paretovariate(alpha)``**: Devuelve un número flotante aleatorio con una distribución de Pareto.

18. **``weibullvariate(alpha, beta)``**: Devuelve un número flotante aleatorio con una distribución de Weibull.

19. **``SystemRandom``**: Usa fuentes de aleatoriedad proporcionadas por el sistema operativo para generar números aleatorios. Es más adecuado para aplicaciones criptográficas.
###### Módulo Pathlib
`pathlib` es un módulo incorporado en Python a partir de la versión 3.4 que proporciona clases para representar rutas de archivos y directorios de manera más eficiente y orientada a objetos. Es parte de la librería estándar de Python y está diseñado para facilitar la manipulación y operación con rutas de manera más legible y menos propensa a errores que los métodos tradicionales del módulo `os`.

**Principales características y funcionalidades:**

1. **Objetos de ruta (`Path`):** `pathlib` introduce la clase `Path`, que representa una ruta en el sistema de archivos. Esta clase tiene métodos para realizar operaciones comunes como verificar la existencia de la ruta, unir rutas, obtener información sobre el archivo o directorio representado, entre otros.
   
   `pathlib.path`: Es una clase del módulo `pathlib` que ofrece una interfaz más orientada a objetos para manipular rutas de archivos y directorios. A diferencia de `os.path`, `pathlib.Path` representa las rutas como objetos que tienen métodos para realizar operaciones comunes. Esta forma de trabajar es más orientada a objetos y más intuitiva. Algunos de sus submódulos más importantes son `Path`, `PurePath`, `PurePosixPath`, `PureWindowsPath`.

	``from pathlib import Path``
	
	`# Crear una ruta`
	``p = Path('/path/to/directory')``
	
	`# Comprobar si la ruta es un directorio`
	``if p.is_dir():``
		``print("Es un directorio")``
	
	`# Iterar sobre los archivos en el directorio`
	``for file in p.iterdir():``
		``print(file)``
	
	`# Crear un archivo `
	``file_path = Path('/path/to/file.txt') file_path.write_text('Hola, mundo!')``
	
	`# Leer el contenido del archivo`
	``content = file_path.read_text() print(content)``
	
	`# Buscar archivos que tengan la extensión .txt en el directorio actual y sus subdirectorios`
	``for file in Path('.').glob('**/*.txt'): print(file)`` 

	-  **Operaciones comunes con `Path` en `pathlib`:**
	    
	    - `Path.cwd()`: Devuelve la ruta actual del directorio de trabajo.
	    - `Path.home()`: Devuelve la ruta al directorio home del usuario.
	    - `Path.exists()`: Verifica si la ruta existe.
	    - `Path.is_dir()`, `Path.is_file()`: Verifica si la ruta representa un directorio o un archivo.
	    - `Path.glob(pattern)`: Encuentra todos los archivos que coinciden con el patrón especificado.
		- **`Path.exists()`**: Comprueba si la ruta existe en el sistema de archivos.
		- **`Path.is_file()`**: Comprueba si la ruta apunta a un archivo existente.
		- **`Path.is_dir()`**: Comprueba si la ruta apunta a un directorio existente.
		- **`Path.parent`**: Devuelve el directorio padre de la ruta.
		- **`Path.name`**: Devuelve el nombre base de la ruta.
		- **`Path.suffix`**: Devuelve la extensión del archivo.
	
	-  **Manipulación de rutas:**
	    
	    - `Path.joinpath(other)`: Une la ruta actual con `other` y devuelve un nuevo objeto `Path`.
	    - `Path.parent`: Proporciona la ruta del directorio padre.
	    - `Path.name`: Devuelve el último componente de la ruta (el nombre del archivo o directorio).

2. `PurePath`: Es una clase base para `Path` y representa una ruta abstracta. No proporciona ninguna  funcionalidad específica del sistema de archivos y se utiliza para trabajar con rutas de manera independiente de la plataforma.

3. `PurePosixPath ` y `PureWindowsPath`: Son subclases de `PurePath` que proporcionan comportamiento específico para sistemas de archivos ``Posix`` (Linux, macOS) y `Windows` sistemas de archivos Windows, respectivamente. Estas clases manejan las diferencias en la forma en que las rutas de archivos se representan en cada sistema.
   
   
##### Biblioteca Numpy
- *``import numpy as np``*: Cuando usas `import numpy as np`, estás importando toda la librería `numpy` y dándole un alias (en este caso, `np`). Esto significa que para acceder a las funciones de `numpy`, necesitas escribir `np.random.randn()`.

	```Python
	import numpy as np
	from numpy.random import  randn
	randn() # -0.6537610998632966
	```

	``from numpy.random import randn``: Por otro lado, cuando usas `from numpy.random import randn`, estás importando específicamente la función `randn` desde el módulo `numpy.random`. Esto significa que puedes usar `randn()` directamente sin tener que agregar `np.` antes.

- *``np.sum``*: Se utiliza para calcular la suma de los elementos de un array. La sintaxis es la siguiente: 

	``np.sum(array, axis=None, dtype=None, out=resultado, keepdims=False)``
	
	``# Por ejemplo, el siguiente código calcula la suma de todos los elementos del array `array`:``
	``array = np.array([1, 2, 3, 4, 5])``
	`resultado = np.zeros(1)`
	``print(np.sum(array))``
	
	``# El siguiente código calcula la suma de los elementos del array array por columnas:``
	``array = np.array([[1, 2], [3, 4], [5, 6]])``
	``print(np.sum(array, axis=1))``

	-  *array*: El array o estructura de datos que deseas sumar. Este puede ser una lista, una tupla o un array de NumPy.
	-  *axis*: El eje a lo largo del cual se va a calcular la suma. Si no se especifica, la suma se calculará sobre todos los elementos del array. Los valores posibles son:
		- `None`: Suma todos los elementos del array (default).
		- `0`: Suma a lo largo de las filas (por columnas).
		- `1`: Suma a lo largo de las columnas (por filas).
		- Otros valores posibles para arrays de más dimensiones.
	-  *dtype*: Tipo de datos del resultado. Por defecto, usa el tipo de datos del array de entrada. Puedes especificar un tipo de datos diferente, como `np.float64`, `np.int32`, etc.
	-  *out*: El parámetro `out` en la función `np.sum` es opcional y permite especificar un array de salida en el que almacenar el resultado de la suma. Esto puede ser útil cuando se quiere evitar la creación de un nuevo array y en su lugar reutilizar un array existente. En este ejemplo, `resultado` se usa como el array de salida.
	-  *keepdims*: Si es True, mantiene las dimensiones reducidas con tamaño uno. Sin `keepdims=True`, el resultado de la suma a lo largo de `axis=1` sería un array unidimensional con las sumas de cada fila: `[1, 2, 3}`
		- El parámetro `keepdims=True` es útil porque mantiene la estructura dimensional del array original, lo cual puede ser beneficioso en operaciones posteriores donde se requiere que las dimensiones de los arrays sean compatibles para la transmisión (broadcasting). Esto es particularmente útil en operaciones matriciales y en cálculos que dependen de la coherencia de dimensiones.

- *``np.zeros()``*: Se utiliza para crear un nuevo array con todos sus elementos inicializados a cero. Esta función es útil cuando necesitas un array de un tamaño específico con valores predeterminados a cero, lo que puede ser útil en una variedad de aplicaciones, como la inicialización de matrices, el almacenamiento de resultados intermedios, y más.

	![[Utilizacion_numpy.zeros.ipynb]]

	`np.zeros(shape, dtype=float, order='C')`

	Parámetros
	
	- **`shape`**: Una tupla de enteros que define la forma del array. Puede ser un solo entero para un array unidimensional.
	- **`dtype`**: (opcional) El tipo de datos de los elementos del array. El valor predeterminado es `float64`.
	- **`order`**: (opcional) Puede ser `'C'` para ordenar los elementos en estilo C (filas) o `'F'` para ordenar en estilo Fortran (columnas). El valor predeterminado es `'C'`.

	1. Array unideimencional
	
	``import numpy as np``
	
	``# Crear un array unidimensional de 5 elementos, todos inicializados a 0.0``
	``array = np.zeros(5)``
	``print(array)``
	``# Salida: [0. 0. 0. 0. 0.]``

	2. Array bidimensional
	
	``import numpy as np
	
	``# Crear un array 2x3, todos los elementos inicializados a 0.0``
	``array = np.zeros((2, 3))``
	``print(array)``
	``# Salida: [[0. 0. 0.]``
	``#          [0. 0. 0.]]``

	3. Array con un tipo de dato específico
	   
	``import numpy as np``
	
	``# Crear un array de enteros de 4 elementos, todos inicializados a 0``
	``array = np.zeros(4, dtype=int)``
	``print(array)``
	``# Salida: [0 0 0 0]``

	4. Array tridimensional
	
	``import numpy as np``
	
	``# Crear un array 2x2x2, todos los elementos inicializados a 0.0``
	``array = np.zeros((2, 2, 2))``
	``print(array)``
	``# Salida: [[[0. 0.]``
	``#           [0. 0.]]``
	``# ``
	``#          [[0. 0.]``
	``#           [0. 0.]]]``

	**Uso Típico**
	
	- **Inicialización de matrices**: Cuando necesitas inicializar matrices antes de realizar operaciones matemáticas en ellas.
	- **Almacenamiento de resultados intermedios**: Para almacenar temporalmente los resultados de cálculos que se realizan en bucles o iteraciones.
	- **Preparación de estructuras de datos**: Antes de rellenarlas con valores calculados o importados de alguna fuente de datos.

-  *``np.arange()``*: La función `arange()` genera secuencias de números en forma de array basándose en los parámetros que le proporcionas. Es similar a la función `range()` de Python estándar, pero devuelve un array en lugar de una lista.

	`numpy.arange([start,] stop[, step,], dtype=None)` > `arr = np.arange(0, 1, 0.1, dtype=float)`

	- `start`: Valor inicial de la secuencia (por defecto es 0).
	- `stop`: Valor final de la secuencia (exclusivo).
	- `step`: Tamaño del paso entre cada número de la secuencia (por defecto es 1).
	- `dtype`: Tipo de datos de los elementos en el array (opcional). 

- *``np.reshape()``*: Cambia la forma del array a una nueva forma especificada. Permite reorganizar los elementos de un array en una nueva estructura de dimensiones diferentes, siempre y cuando el tamaño total de elementos se mantenga constante. Esto es especialmente útil para adaptar los datos a diferentes dimensiones requeridas por ciertas operaciones matemáticas, visualización de datos o modelado numérico.

	- `a`: Array que se desea reorganizar.
	- `newshape`: Tupla o lista que especifica las nuevas dimensiones del array.
	- `order`: Opcional. Especifica cómo se deben leer los elementos del array en la reorganización (por defecto es 'C', que es orden C-style).
		- **Orden de lectura**: El parámetro `order` especifica si los elementos deben ser leídos en orden 'C-style' (fila por fila) o 'F-style' (columna por columna). Este parámetro es opcional y generalmente se utiliza el orden 'C' por defecto, a menos que se necesite un orden específico.

	`import numpy as np`
	`numpy.reshape(a, newshape, order='C')` 
	
	``Array original:``
	``arr = np.arange(1, 9)``
	``[1 2 3 4 5 6 7 8]``

	``reshaped_arr = arr.reshape(2, 4)``
	``[[1 2 3 4]``
	`` [5 6 7 8]]``

	-  <strong style ="color:red;">Otra opción</strong>

	``matriz = np.array([[1, 2, 3], [4, 5, 6]]) # Array / diccionario bidimensional``
	``matriz_reshaped = np.reshape(matriz, (3, 2)) # Modifica el array``
	``print(matriz_reshaped) #  [[1 2], [3 4], [5 6]]`` 
	
	``matriz_reshaped_dos = np.reshape(matriz, (1, -1)) # Remodelar la matriz para tener una sola fila (-1 indica ajuste automático)``
	``print(matriz_reshaped_dos) # [[1 2 3 4 5 6]]``
	
	``matriz_reshaped_C = np.reshape(matriz, (3, -1), order='C') # Remodelar en estilo C (row-major)``
	``print(matriz_reshaped_C) # [[1 2], [3 4], [5 6]]``
	
	``matriz_reshaped_F = np.reshape(matriz, (3, -1), order='F')# Remodelar en estilo F (column-major)``
	``print(matriz_reshaped_F) # [[1 5], [4 3], [2 6]]``

	`np.reshape` está configurado para crear una matriz con `3` fila y el número de columnas se ajustará automáticamente (`-1`). El número de columnas se calculará como el total de elementos dividido por el número de filas.
	
	$$
	Numerodecolumnas =Numerodefilas  /  Total de elementos​ = 3 / 6​ = 2
	$$
	
	Por lo tanto, la matriz remodelada tendrá una forma de `(3, 2)`.

-  *``np.matrix()``*: En NumPy, `np.matrix` y `np.array` son dos estructuras diferentes que puedes utilizar para representar datos en forma de matrices o arreglos. Aunque `np.matrix` es una clase especializada en matrices bidimensionales, es recomendable utilizar `np.array` para la mayoría de las tareas debido a su mayor flexibilidad y funcionalidad.

	`np.matrix` es una clase en NumPy que representa datos en una estructura bidimensional. Aunque es menos flexible en comparación con `np.array`, proporciona una sintaxis que se asemeja más a las matemáticas tradicionales. Sin embargo, en la práctica, `np.array` es más comúnmente utilizado debido a su versatilidad y compatibilidad con muchas operaciones y funciones de NumPy.

-  *``np.dot()``*: La función `np.dot()` en NumPy se utiliza para realizar productos punto (o productos escalares) entre dos arrays. Dependiendo de las dimensiones de los arrays que se pasan como argumentos, `np.dot()` puede realizar diferentes tipos de multiplicación:

	1. **Producto Punto de Vectores**: Si ambos argumentos son vectores unidimensionales (arrays), `np.dot()` realiza el producto escalar, que es una suma de los productos de los elementos correspondientes de ambos vectores.
	
	2. **Producto Matricial**: Si ambos argumentos son matrices bidimensionales (arrays), `np.dot()` realiza la multiplicación de matrices, siguiendo la regla estándar del [[álgebra lineal]] donde el elemento en la posición (i, j) de la matriz resultante es el producto punto de la fila i de la primera matriz y la columna j de la segunda matriz.
	
	3. **Producto entre un Vector y una Matriz**: Si uno de los argumentos es un vector unidimensional y el otro es una matriz bidimensional, `np.dot()` realiza una multiplicación de matriz por vector. Si el vector es un vector fila, el producto se realiza como un producto matricial estándar. Si el vector es un vector columna, el producto se realiza como una multiplicación de matriz por vector.
	
	4. **Multiplicación de Tensores**: Para arrays de más de dos dimensiones (tensores), `np.dot()` realiza el producto a lo largo de los ejes especificados, siguiendo la regla de multiplicación de tensores.
	
	-  **Producto Escalar de Vectores**
	
		``# Vectores unidimensionales``
		``vector1 = np.array([1, 2, 3])``
		``vector2 = np.array([4, 5, 6])``
		
		``# Producto punto``
		``resultado = np.dot(vector1, vector2)``
		``print(resultado)  # Salida: 32``
		
		$$
		1×4+2×5+3×6=4+10+18=32
		$$
	
	-  **Multiplicación de Matrices**
	
		``# Matrices bidimensionales ``
		``matriz1 = np.array([[1, 2], [3, 4]]) ``
		``matriz2 = np.array([[5, 6], [7, 8]]) ``
		
		``# Producto de matrices`` 
		``resultado = np.dot(matriz1, matriz2) ``
		
		``print(resultado) # Salida: ``
		``# [[19 22] ``
		``# [43 50]]``
		
		Para multiplicar dos matrices, se usa el **producto matricial**. La regla general es que el elemento en la posición ``(i,j)`` de la matriz resultante es el producto punto de la fila ``i`` de la primera matriz y la columna ``j`` de la segunda matriz.
		
		Supongamos que queremos multiplicar las siguientes dos matrices:
		$$
		Matriz A=[1, 2] [3, 4]  
		$$
		$$
		Matriz A=[5, 6] [7, 8]  
		$$
		Para encontrar el elemento en la posición ``(1,1)`` de la matriz resultante, tomamos la primera fila de la matriz ``A`` y la primera columna de la matriz ``B``:
		$$
		(1×5)+(2×7)=5+14=19
		$$
		Para el elemento en la posición ``(1,2)``:
		$$
		(1×6)+(2×8)=6+16=22
		$$
		Para el elemento en la posición ``(2,1)``:
		$$
		(3×5)+(4×7)=15+28=43
		$$
		Para el elemento en la posición ``(2,2)``:
		$$
		(3×6)+(4×8)=18+32=50
		$$
		Entonces, la matriz resultante es:
		$$
		Resultado = [19, 43][​22, 50​]
		$$
	
	-  **Producto entre un Vector y una Matriz**
	
		``# Vector y matriz``
		``vector = np.array([1, 2])``
		``matriz = np.array([[1, 2], [3, 4]])``
		
		``# Producto de matriz por vector``
		``resultado = np.dot(matriz, vector)``
		
		``print(resultado)  # Salida: [ 5 11]``
	
		Cuando multiplicamos un vector por una matriz, interpretamos el vector como una matriz de una sola fila o columna (dependiendo del contexto). Aquí vamos a ver cómo multiplicar una matriz por un vector.
		
		Supongamos que tenemos la siguiente matriz y vector:
		$$
		Matriz = [1, 2][​3, 4]
		$$
		$$
		Vector = [1,2]
		$$
		Para encontrar el producto de la matriz por el vector, realizamos el producto punto de cada fila de la matriz con el vector.
		
		Primera fila de la matriz:
		$$
		(1×1)+(2×2)=1+4=5
		$$
		Segunda fila de la matriz:
		$$
		(3×1)+(4×2)=3+8=11
		$$
		Entonces, el vector resultante es:
		$$
		Resultado = [5, 11]
		$$

-  *``np.linspace()``*: La función `np.linspace()` en NumPy es muy útil cuando necesitas generar una secuencia de números igualmente espaciados en un intervalo especificado. Esta función es especialmente valiosa en aplicaciones científicas y de ingeniería donde se requieren secuencias numéricas con un control preciso sobre el número de puntos generados.

	`np.linspace()` crea un arreglo de números distribuidos uniformemente en un intervalo cerrado ``[start,stop]``. Es útil para generar puntos de datos en un rango continuo, por ejemplo, para crear gráficos o realizar cálculos en intervalos específicos.

	La sintaxis básica de `np.linspace()` es: `np.linspace(start, stop, num=50, endpoint=True, retstep=False, dtype=None, axis=0)`
	
	- **`start`**: El valor inicial de la secuencia.
	- **`stop`**: El valor final de la secuencia.
	- **`num`**: El número de muestras a generar. El valor predeterminado es 50.
	- **`endpoint`**: Si `True`, el valor `stop` se incluye en el arreglo. Si `False`, no se incluye. El valor predeterminado es `True`.
	- **`retstep`**: Si `True`, la función también devuelve el paso entre valores. El valor predeterminado es `False`.
	- **`dtype`**: Tipo de dato del resultado. El valor predeterminado es `None`, lo que significa que NumPy elige el tipo más adecuado.
	- **`axis`**: El eje a lo largo del cual se realiza el muestreo. El valor predeterminado es 0.

	-  Aplicaciones Comunes
	
		- **Generación de Datos para Gráficos**: Crear datos para gráficos de líneas o visualizaciones continuas.
		- **Cálculos en Intervalos**: Realizar cálculos en intervalos precisos para análisis científicos o de ingeniería.
		- **Simulaciones**: Generar secuencias de valores para simulaciones numéricas.

	``import numpy as np``

	-  Ejemplo 1: **Generar una Secuencia Básica**
	
	``numeros = np.linspace(0, 1, num=10) # Generar 10 números equidistantes entre 0 y 1, incluyendo ambos extremos.
	``print(numeros) # [0.         0.11111111 0.22222222 0.33333333 0.44444444 0.55555556 0.66666667 0.77777778 0.88888889 1.        ]``

	-  Ejemplo 2: **Excluir el Valor Final**
	
	``numeros = np.linspace(0, 1, num=10, endpoint=False) # Generar 10 números entre 0 y 1, excluyendo el 1``
	``print(numeros) # [0.         0.11111111 0.22222222 0.33333333 0.44444444 0.55555556 0.66666667 0.77777778 0.88888889]``
	
	Aquí, `endpoint=False` significa que el valor 1 no se incluye en la secuencia.

	-  Ejemplo 3: **Obtener el Paso Entre Valores**
	
	``numeros, paso = np.linspace(0, 1, num=5, retstep=True) # Generar 5 números entre 0 y 1 y obtener el paso entre ellos``
	``print("Números:", numeros)``
	``print("Paso:", paso)``
	
	``Números: [0.  0.25 0.5  0.75 1.  ]``
	``Paso: 0.25``
	
	En este caso, `retstep=True` devuelve el paso entre los valores generados, que es 0.25.

-  *``np.abs()``*: La función `np.abs()` en NumPy se utiliza para calcular el valor absoluto de los elementos de un array o matriz. El valor absoluto de un número es su magnitud sin considerar su signo. En otras palabras, convierte los números negativos en positivos, mientras que los números positivos permanecen sin cambios.

	El propósito de `np.abs()` es obtener el valor absoluto de cada elemento de un array, que es útil en diversos contextos como el análisis de errores, transformaciones matemáticas, y procesamiento de datos. Es una función muy común en cálculos científicos y de ingeniería.
	
	Sintaxis: `numpy.abs(x, out=None, where=True)`
	
	- **`x`**: El array o matriz de entrada cuyos valores se desean transformar en valores absolutos.
	- **`out`**: (Opcional) Un array de salida en el que colocar los resultados. Debe tener el mismo tamaño que el array de entrada.
	- **`where`**: (Opcional) Un array de booleanos que indica dónde se deben aplicar las operaciones. Por defecto, se aplica a todos los elementos.

	Ejemplo 1: **Valores Absolutos de un Array Numérico**
	
	``array = np.array([-1, -2, 3, -4, 5])``
	``valores_absolutos = np.abs(array)``
	``print(valores_absolutos) # [1 2 3 4 5]``
	
	Ejemplo 2: **Valores Absolutos de una Matriz**
	
	``matriz = np.array([[-1, -2, -3], [4, 5, -6]])``
	``valores_absolutos = np.abs(matriz)``
	``print(valores_absolutos)``
	
	Ejemplo 3: **Valores Absolutos de Números Complejos**
	
	``array_complejo = np.array([1+2j, 3-4j, -5+6j])``
	``valores_absolutos = np.abs(array_complejo)``
	``print(valores_absolutos) # [2.23606798 5.         7.81024968]``

-  *``unique()``*: Es una función que devuelve los valores únicos de un array. Es similar a la versión de pandas, pero se aplica directamente a arrays de NumPy. Se aplica a un array de NumPy y devuelve un array con los valores únicos presentes en ese array.

	- **`return_counts`**: Si se establece en `True`, devuelve un segundo array que contiene el número de veces que cada valor único aparece en el array original.
	- **`return_index`**: Si se establece en `True`, devuelve un tercer array que contiene los índices originales de los valores únicos en el array original.
	- **`return_inverse`**: Si se establece en `True`, devuelve un cuarto array que puede usarse para reconstruir el array original a partir de los valores únicos.

	``import numpy as np``
	
	``# Crear un array de ejemplo``
	``arr = np.array([1, 2, 3, 2, 1, 3, 4, 5, 4])``
	
	``# Obtener los valores únicos en el array``
	``unique_values = np.unique(arr, return_counts=True)``
	
	``print(unique_values)  # Salida: [1 2 3 4 5]``

---

- np.linspace(): Genera números espaciados uniformemente.
- np.ones(): Crea un array de unos.
- np.eye(): Crea una matriz identidad.
- np.diag(): Extrae la diagonal de una matriz o construye una matriz diagonal.
- np.concatenate(): Concatena arrays a lo largo de un eje existente.
- np.vstack(): Apila arrays verticalmente.
- np.hstack(): Apila arrays horizontalmente.
- np.split(): Divide un array en subarrays.
- np.unique(): Encuentra valores únicos en un array.
- np.argmax(): Devuelve el índice del valor máximo a lo largo de un eje.
- np.argmin(): Devuelve el índice del valor mínimo a lo largo de un eje.
- np.where(): Devuelve los índices donde se cumple una condición dada.

###### Random
En NumPy es una herramienta poderosa para generar números aleatorios, especialmente útil para aplicaciones científicas y de ingeniería.

El submódulo `numpy.random` ofrece una variedad de funciones para generar números aleatorios y realizar operaciones aleatorias en matrices. Algunas de las funciones principales incluyen la generación de números aleatorios de diferentes distribuciones y la manipulación de arrays de manera aleatoria.

- ``np.random.rand(3, 2)``: Genera un array bidimensional de forma con números aleatorios uniformemente distribuidos en el rango ``[0, 1]``.
- ``np.random.randn(3, 2)``: Genera un array de forma con números aleatorios de una distribución normal estándar (media 0, desviación estándar 1).
- `np.random.randint(1, 10, size=(3, 2))`: Genera enteros aleatorios desde un intervalo especificado bidimensional.
- ``np.random.random((3, 2))``: Genera números aleatorios en el rango ``[0.0, 1.0) en la forma especificada por`` `size` bidimensional.
- ``np.random.choice([1, 2, 3, 4, 5], size=3, replace=False)``: choice(a, size=None, replace=True, p=None): Genera una muestra aleatoria de una array.
- `random.shuffle(arr)`: Permuta una array en su lugar.
- `random.seed(42)`: Establece la semilla para el generador de números aleatorios. Utilizar una semilla (seed) en la generación de números aleatorios es crucial cuando necesitas resultados reproducibles. La semilla asegura que cada vez que ejecutes tu código, obtendrás la misma secuencia de números aleatorios.

**Distribuciones Aleatorias**

Además de las funciones básicas, `numpy.random` también proporciona funciones para generar números aleatorios de diversas distribuciones probabilísticas:

- ``np.random.normal(0, 1, size=(3, 2))``: **normal(loc=0.0, scale=1.0, size=None)**: Genera números aleatorios de una distribución normal (Gaussiana) con media `loc` y desviación estándar `scale`.
- ``np.random.uniform(1, 10, size=(3, 2))``: **binomial(n, p, size=None)**: Genera números aleatorios de una distribución binomial.
- `np.random.poisson(5, size=10)`: **poisson(lam=1.0, size=None)**: Genera números aleatorios de una distribución de Poisson.

###### Propiedades del Array Bidimensional
La clase `ndarray` es el corazón de NumPy, ya que representa arrays multidimensionales que pueden contener datos homogéneos (todos los elementos son del mismo tipo).

El término `ndarray` significa "N-dimensional array". Es la estructura de datos fundamental en NumPy para almacenar y manipular datos numéricos de manera eficiente. Un `ndarray` puede ser un array de cualquier dimensión: unidimensional (vector), bidimensional (matriz) o de dimensiones superiores.

**Creación de un  array en ``ndarray``**

	``zeros = np.zeros((3, 2))``
	``print(zeros)  # Salida: [[0. 0.]``
	              ``#         [0. 0.]``
	              ``#         [0. 0.]]``
	
	``ones = np.ones((2, 3))``
	``print(ones)  # Salida: [[1. 1. 1.]``
	             ``#         [1. 1. 1.]]``
	
	``full = np.full((2, 2), 7)``
	``print(full)  # Salida: [[7 7]``
	             ``#         [7 7]]``
	
	``arange = np.arange(0, 10, 2)``
	``print(arange)  # Salida: [0 2 4 6 8]``
	
	``linspace = np.linspace(0, 1, 5)``
	``print(linspace)  # Salida: [0.   0.25 0.5  0.75 1.  ]``

**Creación de un array de forma aleatoria**

	``random_array = np.random.rand(3, 2)``

**Propiedades de ndarray**

El objeto `ndarray` en NumPy tiene varias propiedades que permiten acceder a información clave sobre el array.

- **``shape``**: Devuelve una tupla que indica las dimensiones del array. La propiedad `shape` te indica las dimensiones del array. En el ejemplo, `(2, 3)` significa que el array tiene 2 filas y 3 columnas.
	- `arr = np.array([[1, 2, 3], [4, 5, 6]]) print(arr.shape) # Salida: (2, 3) - Dos filas y tres columnas`
- **``ndim``**: Devuelve el número de dimensiones del array. `ndim` te indica cuántas dimensiones tiene el array. En este caso, `2` indica que es un array bidimensional.
	- `print(arr.ndim)  # Salida: 2 - El array es bidimensional`
- **``dtype``**: Devuelve el tipo de datos de los elementos del array. `dtype` te dice el tipo de datos de los elementos del array. En este caso, `int64` indica que son enteros de 64 bits.
	- `print(arr.dtype)  # Salida: int64 (puede variar según el sistema)`
- **``size``**: Devuelve el número total de elementos en el array.
	- `print(arr.size)  # Salida: 6 - Hay seis elementos en el array`
- **``itemsize``**: Devuelve el tamaño en bytes de cada elemento del array.
	- `print(arr.itemsize)  # Salida: 8 (en una máquina de 64 bits)`
- **``nbytes``**: Devuelve el tamaño total en bytes del array.
	- `print(arr.nbytes)  # Salida: 48 (6 elementos * 8 bytes)`
- **``data``**: Devuelve un buffer de memoria que contiene los elementos del array.
	- `print(arr.data)  # Salida: <memory at 0x7f3d87f0b3a0>`
- **``strides``**: Devuelve una tupla de enteros que indica el número de bytes que debe desplazarse en memoria para avanzar un elemento a lo largo de cada dimensión.
	- `print(arr.strides)  # Salida: (24, 8) - Desplazamiento de bytes en cada dimensión`
- **``flags``**: Devuelve un objeto que indica ciertas propiedades del array, como si es de solo lectura, C-contiguo, o Fortran-contiguo. La propiedad `flags` proporciona información sobre ciertas características del array, como su contigüidad en memoria y si es dueño de sus datos. Esto es útil en ciberseguridad para entender cómo se gestionan y acceden los datos en memoria, lo cual puede ser crucial para evitar vulnerabilidades o para optimizar la manipulación de datos sensibles.
	
	- **C_CONTIGUOUS** y **F_CONTIGUOUS**: Indican si el array está almacenado en memoria de manera contigua (C-contiguo o Fortran-contiguo). Esto puede afectar la eficiencia de acceso a los datos y la manera en que se realizan operaciones sobre el array.
	- **OWNDATA**: Indica si el array es dueño de sus datos. Esto es importante para asegurar la integridad y confidencialidad de los datos, especialmente en entornos donde se comparten o manipulan datos sensibles.
	- **WRITEABLE**: Indica si el array permite la escritura de datos. En algunos casos, se puede requerir que los datos sean de solo lectura para evitar modificaciones no autorizadas.
  
	``print(arr.flags)``
	``# Salida:   C_CONTIGUOUS : True``
	``#          F_CONTIGUOUS : False``
	``#          OWNDATA : True``
	``#          ...``

**Métodos de ndarray**

-  **Manipulación de forma y dimensionalidad:**
    
    - **flatten**: Devuelve una copia plana del array.
    - **ravel**: Devuelve una vista aplanada del array (si es posible, de lo contrario, una copia).
    - **fromfile()**: Lee el array desde un archivo binario.
    - **squeeze()**: Elimina dimensiones de longitud 1 del array.
    - **diagonal()**: Devuelve la diagonal del array.
    - **trace()**: Calcula la suma de la diagonal del array.
    - **clip()**: Limita los valores del array dentro de un rango dado.
    - **conj()**: Devuelve el conjugado complejo del array.
    - **real()**: Devuelve la parte real del array.
    - **imag()**: Devuelve la parte imaginaria del array.
    - **round()**: Redondea los elementos del array al número de decimales especificado.

-  **Operaciones matemáticas y estadísticas:**
    
    - **sum**: Calcula la suma de los elementos del array.
    - **mean**: Calcula la media de los elementos del array.
    - **std**: Calcula la desviación estándar de los elementos del array.
    - **min**: Devuelve el valor mínimo a lo largo de un eje.
    - **max**: Devuelve el valor máximo a lo largo de un eje.

-  **Operaciones de álgebra lineal:**
    
    - **dot**: Producto punto entre dos arrays.
    - **transpose**: Transpone el array.
    - **linalg.inv**: Inversa de una matriz cuadrada.
    - **linalg.det**: Determinante de una matriz.

-  **Ordenamiento, búsqueda y manipulación:**
    
    - **sort**: Ordena el array.
    - **argsort**: Devuelve los índices que ordenan el array.
    - **reshape**: Cambia la forma del array.
    - **resize**: Cambia la forma y el tamaño del array.

-  **Manipulación de datos:**
    
    - **astype**: Cambia el tipo de datos del array.
    - **tolist**: Convierte el array a una lista de Python.
  
-  **Entrada y salida:**
    
    - **tofile, fromfile**: Lectura y escritura de datos en archivos.
    - **dump, load**: Guarda y carga arrays desde archivos binarios.

-  **Código**
	  
	``import numpy as np``
	
	``# Crear un array de ejemplo``
	``arr = np.array([[1, 2, 3], [4, 5, 6]])``
	
	``# Métodos del objeto ndarray``
	``print("Métodos del objeto ndarray en NumPy:")``
	``print("------------------------------------")``
	
	``# Métodos de manipulación de forma y dimensionalidad``
	``print("\nManipulación de forma y dimensionalidad:")``
	``print("reshape:", arr.reshape(3, 2))``
	``print("flatten:", arr.flatten())``
	``print("ravel:", arr.ravel())``
	
	``# Métodos matemáticos y estadísticos``
	``print("\nOperaciones matemáticas y estadísticas:")``
	``print("sum:", arr.sum())``
	``print("mean:", arr.mean())``
	``print("std:", arr.std())``
	``print("min:", arr.min())``
	``print("max:", arr.max())``
	
	``# Métodos de álgebra lineal``
	``print("\nOperaciones de álgebra lineal:")``
	``print("dot:", np.dot(arr, arr.T))``
	``print("transpose:", arr.transpose())``
	``print("linalg.inv:", np.linalg.inv(arr))``
	``print("linalg.det:", np.linalg.det(arr))``
	
	``# Métodos de ordenamiento, búsqueda y manipulación``
	``print("\nOrdenamiento, búsqueda y manipulación:")``
	``print("sort:", np.sort(arr))``
	``print("argsort:", np.argsort(arr))``
	``print("reshape:", arr.reshape(3, 2))``
	``print("resize:", np.resize(arr, (3, 3)))``
	
	``# Métodos de manipulación de datos``
	``print("\nManipulación de datos:")``
	``print("astype:", arr.astype(float))``
	``print("tolist:", arr.tolist())``
	
	``# Métodos de entrada y salida``
	``print("\nEntrada y salida:")``
	``arr.tofile("archivo.dat")``
	``arr_from_file = np.fromfile("archivo.dat", dtype=int)``
	``print("fromfile:", arr_from_file)``
	
	``print("------------------------------------")``



##### Biblioteca Pickle
La biblioteca `pickle` en Python es utilizada para la serialización y deserialización de objetos.

La serialización es el proceso de convertir un objeto en una secuencia de bytes para que pueda ser almacenado en un archivo, transmitido a través de una red, o guardado en una base de datos. En términos simples, convierte un objeto de Python (como una lista, un diccionario, o una instancia de clase) en un formato que puede ser fácilmente almacenado o transferido.

![[Serializacion_Deserializacion.ipynb]]

**¿Por qué usar `pickle`?**

- **Facilidad**: `pickle` es muy fácil de usar y permite almacenar casi cualquier tipo de objeto Python, incluidas clases y funciones.
- **Compatibilidad**: Es parte de la biblioteca estándar de Python, por lo que no necesitas instalar dependencias externas.
- **Persistencia**: Es útil cuando necesitas guardar el estado de un programa, para reanudarlo más tarde desde donde lo dejaste.

**Problemas de Seguridad con `pickle`**

- **Ejecución de Código Arbitrario**: `pickle` es capaz de serializar y deserializar una amplia variedad de objetos de Python, incluidas funciones y clases. Sin embargo, esta flexibilidad tiene un costo. Si se deserializa un archivo `pickle` que ha sido manipulado por un atacante, es posible que se ejecute código malicioso. Esto se debe a que `pickle` no verifica la seguridad de los datos que deserializa, lo que significa que un archivo `pickle` puede contener código que se ejecutará durante la deserialización.

- **Falta de Validación y Sanitización**: Cuando deserializas datos con `pickle`, asumes que los datos son seguros y están bien formados. Sin embargo, si los datos provienen de una fuente externa o no confiable, no tienes garantías de que no hayan sido alterados. Esto representa un riesgo significativo en cualquier aplicación que maneje datos sensibles o en entornos donde la seguridad es una prioridad.

-  **Serialización**: Con `pickle.dump()`, puedes convertir un objeto Python en una secuencia de bytes y almacenarlo en un archivo. Esto es útil para guardar estructuras de datos complejas, como listas, diccionarios, e incluso instancias de clases personalizadas, en archivos para su posterior uso.

	- `pickle.dump(obj, file)`: Serializa el objeto `obj` y lo escribe en un archivo.
	- `pickle.dumps(obj)`: Serializa el objeto `obj` y lo convierte en una secuencia de bytes, que puede ser almacenada o transmitida.

-  **Deserialización**: Con `pickle.load()`, puedes recuperar un objeto Python a partir de una secuencia de bytes almacenada en un archivo. Esto te permite recuperar la estructura de datos guardada y trabajar con ella en tu programa.

	- `pickle.load(file)`: Lee la secuencia de bytes de un archivo y la deserializa para recuperar el objeto original.
	- `pickle.loads(bytes_object)`: Deserializa una secuencia de bytes en un objeto Python.


##### Biblioteca Pathlib
- **`pathlib`** es un módulo incluido en la biblioteca estándar de Python a partir de la versión 3.4.
- Este módulo proporciona clases para trabajar con rutas de archivos y directorios de una manera orientada a objetos.
- La clase más comúnmente utilizada de este módulo es `Path`, que representa una ruta de archivo o directorio y ofrece una API fácil de usar para realizar operaciones comunes con archivos y directorios.

**Ventajas de `pathlib` sobre el enfoque tradicional (`os.path`)**:

- **Orientación a objetos**: En lugar de trabajar con rutas como cadenas de texto, `pathlib` utiliza objetos `Path`, lo que permite realizar operaciones de una manera más intuitiva y segura.
- **Portabilidad**: `pathlib` maneja automáticamente las diferencias entre los sistemas operativos (como los separadores de directorios), lo que hace que el código sea más portátil.
- **Métodos útiles**: Proporciona métodos y propiedades convenientes para realizar operaciones comunes, como comprobar si un archivo o directorio existe, crear directorios, o leer/escribir archivos.

![[Gestor_Archivos.ipynb]]


##### Biblioteca Warnings
- ``warnings.filterwarnings()``: La función se utiliza para filtrar las advertencias emitidas por el intérprete de Python. La sintaxis de la `warnings.filterwarnings()`función es la siguiente: `warnings.filterwarnings('action='action, category=category, module=module, lineno=lineno, append=append)

	``import warnings``
	``warnings.filterwarnings('ignore')``

	- `action`especifica qué hacer con la advertencia. Los valores posibles para `action`incluyen:
		- `ignore`: Ignore la advertencia.
		- `module`: Reportar la advertencia en el módulo donde se generó.
		- `always`: Informa la advertencia independientemente de dónde se generó.
		- `once`: Informe la advertencia solo una vez y luego suprímala.
	- `category`especifica la categoría de la advertencia. Los valores posibles para `category`incluyen:
		- `UserWarning`: Una advertencia generada por el usuario.
		- `DeprecationWarning`: Una advertencia sobre funciones obsoletas.
		- `PendingDeprecationWarning`: Una advertencia sobre funciones que pronto quedarán obsoletas.
		- `SyntaxWarning`: Una advertencia sobre errores de sintaxis.
		- `RuntimeWarning`: Una advertencia sobre errores de tiempo de ejecución.
		- `FutureWarning`: una advertencia sobre funciones que pronto se eliminarán.
		- `ImportWarning`: Una advertencia sobre las importaciones de objetos que se han movido o eliminado del módulo.
		- `module`especifica el módulo en el que se generó la advertencia.
		- `lineno`especifica el número de línea en el módulo donde se generó la advertencia.
		- `append`especifica si se debe agregar la advertencia a la lista de advertencias que ya se han emitido.

##### Biblioteca OS
Cuando importas `os` en Python, estás incluyendo un módulo estándar que te proporciona funciones para interactuar con el sistema operativo en el que se ejecuta tu programa. Esto es útil para realizar operaciones como navegar por el sistema de archivos, obtener información del entorno de ejecución, manipular rutas de archivos y directorios, entre otras tareas relacionadas con el sistema.

En Python, el comando `import os` importa el módulo `os`, que proporciona una serie de funciones para interactuar con el sistema operativo. Estas funciones permiten a los desarrolladores realizar tareas como:

	- Crear y eliminar archivos y directorios
	- Leer y escribir archivos
	- Ejecutar procesos
	- Obtener información sobre el sistema operativo

-  **Ejemplo**: 

	``with open("my_file.txt", "w") as f: # Escribir en un archivo``
		``f.write("Hello, world!")``
	
	``with open("my_file.txt", "r") as f: # Leer un archivo``
		``print(f.read())``
	
	`os.system("ls") # Ejecutar un proceso`
	
	``print(os.name) # Obtener información sobre el sistema operativo``

1. **Manipulación de Archivos y Directorios:**
	- `os.remove(path)`: Elimina el archivo especificado por la ruta `path`.
	- `os.rename(src, dst)`: Cambia el nombre del archivo o directorio de `src` a `dst`.
	- `os.path.exists(path)`: Verifica si un archivo o directorio existe en la ruta especificada.
	- `os.path.abspath(path)`: Devuelve la ruta absoluta del archivo o directorio especificado. 
	- `os.path.join(path1, path2, ...)`: Une uno o más componentes de ruta de forma inteligente.
	- `os.listdir(path)`: Lista los archivos y directorios en la ruta especificada.
	- `os.mkdir(path)`: Crea un nuevo directorio.
	- `os.rmdir(path)`: Elimina un directorio vacío.

2. **Información sobre el Sistema de Archivos:**
	- `os.path.getsize(path)`: Devuelve el tamaño en bytes de un archivo.
	- `os.path.getmtime(path)`: Devuelve la marca de tiempo de la última modificación de un archivo en segundos desde la época (marca de tiempo de Unix).

3. **Interacción con el Sistema Operativo:**
	- `os.system(command)`: Ejecuta el comando del sistema operativo especificado.
	- `os.getcwd()`: Devuelve el directorio de trabajo actual del proceso. El directorio de trabajo actual es el directorio en el que se encuentra el archivo que se está ejecutando actualmente.
	- `os.chdir(path)`: Cambia el directorio de trabajo actual al especificado por la ruta `path`.

4. **Constantes y Funciones Relacionadas con el Sistema:**
	- `os.sep`: Cadena que representa el separador de ruta del sistema operativo (`'/'` en sistemas basados en Unix, `'\\'` en sistemas Windows, etc.).
	- `os.linesep`: Cadena que representa el separador de líneas del sistema operativo.
	- `os.name`: Nombre del sistema operativo (por ejemplo, `'posix'` para sistemas Unix, `'nt'` para sistemas Windows).

5. **Variables y métodos del entorno:**
	- `os.environ`: Diccionario que contiene las variables de entorno del sistema.
	- `os.getenv(variable_name)`: Obtiene el valor de una variable de entorno específica.

6. **Subprocesos os.fork**

Estas son solo algunas de las funciones proporcionadas por el módulo `os`. La biblioteca `os` es esencial cuando necesitas interactuar con el sistema operativo para realizar operaciones relacionadas con archivos, directorios y más.


##### Biblioteca LXML
- **Propósito**: `lxml` es una biblioteca muy eficiente para procesar y analizar archivos XML y HTML. Proporciona un parser de alto rendimiento para trabajar con estos formatos, y es mucho más rápido que `html5lib`.

- **¿Cuándo se usa?**: Es muy recomendable usar `lxml` cuando trabajas con grandes volúmenes de datos XML o HTML debido a su velocidad. Es la opción preferida en muchos casos cuando se necesita rendimiento y velocidad.

-  ¿Qué hace especial a lxml?

	- **Combina lo mejor de dos mundos:** lxml es un enlace Python para las bibliotecas C **libxml2** y **libxslt**. Esto significa que hereda la velocidad y la capacidad de procesamiento de estas bibliotecas C, a la vez que proporciona una interfaz Python intuitiva y fácil de usar.
	- **Amplia compatibilidad:** Es compatible con una gran variedad de estándares XML, incluyendo XML Schema, XPath, XSLT y Relax NG.
	- **Versatilidad:** Se puede utilizar tanto para leer y analizar documentos XML y HTML existentes, como para crear nuevos documentos.
	- **Facilidad de uso:** Ofrece una API similar a la biblioteca estándar de Python `xml.etree.ElementTree`, pero con características adicionales y un rendimiento mejorado.
	- **Orientada a objetos:** La estructura de lxml se basa en objetos, lo que facilita la navegación y manipulación de los elementos XML.
-  ¿Para qué se utiliza lxml?

	- **Análisis de documentos XML:** Extraer información específica de documentos XML complejos.
	- **Transformación de documentos XML:** Modificar la estructura o el contenido de documentos XML utilizando XSLT.
	- **Validación de documentos XML:** Verificar que un documento XML cumple con un esquema definido.
	- **Creación de documentos XML:** Generar nuevos documentos XML a partir de datos.
	- **Web scraping:** Extraer datos de páginas web que utilizan HTML.


##### Biblioteca Request
- `requests.get`: Una solicitud GET es un método HTTP utilizado para recuperar recursos de un servidor web. La función `requests.get` toma una URL como argumento y devuelve un objeto `Response` que representa la respuesta del servidor web. El objeto `Response` contiene varios atributos, incluyendo el contenido del recurso, el código de estado y el encabezado de la respuesta.

	- `url`: La URL a la que se envió la solicitud.
	- `status_code`: El código de estado de la respuesta.
	- `headers`: El encabezado de la respuesta.
	- `cookies`: Las cookies de la respuesta.
	- `content`: El contenido de la respuesta.
	- `raw`: La respuesta binaria sin procesar.
	- `text`: El contenido de la respuesta como texto.
	- `json()`: El contenido de la respuesta como un objeto JSON.
	- `raise_for_status()`: Levanta una excepción si el código de estado de la respuesta no es satisfactorio.
	
	Además de estos atributos, el objeto `Response` también tiene los siguientes métodos:
- `iter_content()`: Itera sobre el contenido de la respuesta.
- `close()`: Cierra la conexión con el servidor web.

		import requests
		respuesta = requests.get("https://www.google.com/")
		len(respuesta.text)
		--- --- ---
		import requests
		url = "https://www.google.com/"
		response = requests.get(url)
		status_code = response.status_code

##### Biblioteca Pyodide
-  **``pyfetch``**: El módulo `pyfetch` es similar al módulo `fetch` de JavaScript o a la librería `requests` de Python - permite hacer peticiones HTTP para descargar datos de URLs, pero está optimizado para funcionar en el contexto del navegador.

		from pyodide.http import pyfetch
		
		async def download(url, filename):
		    response = await pyfetch(url)
		    if response.status == 200:
		        with open(filename, "wb") as f:
		            f.write(await response.bytes())


##### Biblioteca BeautifulSoup
**BeautifulSoup** es una biblioteca en Python utilizada para **analizar** (parsear) y **extraer** datos de documentos HTML y XML. Lo que hace especial a BeautifulSoup es que permite navegar fácilmente la estructura de un documento HTML, que generalmente es complejo y en forma de árbol (DOM). Al usar esta herramienta, puedes localizar, extraer y manipular datos específicos dentro de las etiquetas HTML de una página web.

- Instalar librería : `!pip install bs4`

- `BeautifulSoup(data, 'html.parser')`: Analizar datos.
	-  `soup = BeautifulSoup(data, 'html.parser')`
	-  `title = soup.title.string`: Extraer el titular de la página.
	-  `links = soup.find_all('a')` : Obtener todos los enlaces
	-  Imprimir los href de cada enlace:
		for link in links: 
			print(link.get('href'))
	- 

##### Biblioteca yfinance
- ``Ticker()``: Permite interactuar con información financiera de una empresa específica mediante su símbolo bursátil.
- ``history()``: Se utiliza para obtener el historial de precios de una acción o un activo financiero a lo largo del tiempo.

	- **`period`**:
	    
	    - Define el rango de tiempo de los datos históricos que quieres obtener. Algunos valores posibles son:
	        - `"1d"`: Último día.
	        - `"5d"`: Últimos 5 días.
	        - `"1mo"`: Último mes.
	        - `"3mo"`: Últimos 3 meses.
	        - `"1y"`: Último año.
	        - `"max"`: Todos los datos disponibles desde que comenzó a cotizar la acción.
	    - Ejemplo: `period="1mo"` para obtener el historial del último mes.
	- **`interval`**:
	    
	    - Define el intervalo de tiempo entre cada punto de datos.
	        - `"1m"`: Datos de 1 minuto.
	        - `"2m"`: Datos de 2 minutos.
	        - `"5m"`: Datos de 5 minutos.
	        - `"15m"`, `"30m"`, `"60m"`: Datos por intervalos de 15, 30 o 60 minutos.
	        - `"1h"`: Datos por hora.
	        - `"1d"`: Datos diarios (default).
	        - `"1wk"`: Datos semanales.
	        - `"1mo"`: Datos mensuales.
	    - Ejemplo: `interval="1d"` para obtener los datos diarios.
	- **`start`** y **`end`**:
	    
	    - Puedes usar estas opciones para especificar las fechas de inicio y fin en formato `YYYY-MM-DD` o `datetime`.
	    - Ejemplo: `start="2023-01-01", end="2023-12-31"` para obtener datos entre el 1 de enero de 2023 y el 31 de diciembre de 2023.
	- **`actions`**:
	    
	    - Si se establece en `True`, incluye los eventos de dividendos y splits en los datos históricos.
	    - Ejemplo: `apple.history(period="1mo", actions=True)` para incluir dividendos y splits.
	- **`auto_adjust`**:
	    
	    - Si se establece en `True`, ajusta los precios históricos para tener en cuenta dividendos y splits. Esto permite obtener datos más representativos del rendimiento de la acción.
	    - Ejemplo: `apple.history(period="1y", auto_adjust=True)` para obtener los precios ajustados de los últimos 12 meses.
	- **`back_adjust`**:
	    
	    - Similar a `auto_adjust`, pero ajusta solo los precios históricos de acuerdo con los dividendos y los splits, sin ajustar otros parámetros.
- ``download()``: Descargar datos de varios tickers: 
	- `data = yf.download("SPY AAPL", start="2017-01-01", end="2017-04-30", group_by="ticker")` 
- 

##### Biblioteca html5lib
- **Propósito**: Es un parser HTML que permite analizar y parsear contenido HTML de una forma más flexible y fiel a las especificaciones del HTML5. Se utiliza principalmente en el contexto de "web scraping" para extraer información de páginas web.

- **¿Cuándo se usa?**: Es útil cuando necesitas trabajar con documentos HTML que no están bien formateados o que contienen errores de sintaxis. Aunque es más lento que otros parsers (como `lxml`), es muy preciso en la interpretación de HTML.


##### Biblioteca plotly
- **Propósito**: `plotly` es una poderosa librería para crear gráficos interactivos, visualizaciones web y dashboards. Se utiliza para crear gráficos dinámicos, como gráficos de líneas, barras, mapas, etc. Los gráficos generados con `plotly` se pueden visualizar en navegadores web y son interactivos por defecto (permitiendo hacer zoom, mover el gráfico, etc.).

- **¿Cuándo se usa?**: Se utiliza cuando se necesita crear visualizaciones interactivas y atractivas que se pueden integrar fácilmente en aplicaciones web o dashboards. Es muy popular en ciencia de datos y análisis interactivo.


##### Biblioteca nbformat
- **Propósito**: La librería `nbformat` se utiliza para leer, escribir y manipular archivos de Jupyter Notebook (con extensión `.ipynb`). Los archivos `.ipynb` contienen el código fuente de Python, así como los resultados de las ejecuciones, texto explicativo (en Markdown), imágenes y otros elementos interactivos que conforman un notebook de Jupyter.

- **¿Cuándo se usa?**: Esta librería es útil cuando necesitas trabajar programáticamente con notebooks, es decir, leer y escribir archivos `.ipynb`, manipular celdas, extraer información de un notebook o generar notebooks de manera automática.


##### Biblioteca xlrd
- **Propósito**: Esta biblioteca se usa principalmente para leer archivos de Excel en el formato antiguo `.xls` (Excel 97-2003). No es compatible con el formato más reciente `.xlsx`.
- **Uso común**: `xlrd` permite abrir y leer datos en hojas de cálculo de Excel, acceder a las celdas y manipular los datos de manera sencilla.

##### Biblioteca openpyxl
- **Propósito**: `openpyxl` es una biblioteca más moderna que permite leer y escribir archivos de Excel en el formato `.xlsx` (formato de Excel 2007 y versiones posteriores).
- **Uso común**: Es muy útil cuando necesitas manipular, crear o modificar archivos `.xlsx`, incluyendo tareas como:
    - Leer y escribir datos en celdas.
    - Modificar las propiedades de las celdas, como fuentes, colores, bordes, etc.
    - Agregar gráficos, fórmulas y otras características avanzadas.


##### Biblioteca Process
- multiprocessing


---

