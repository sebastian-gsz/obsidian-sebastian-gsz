![[barra.gif]]

##### Biblioteca conexiones API sobre DataBases
-  **Métodos de cursor y conexión**

	1. **Ejecuta una consulta SQL** : **`execute(query, params=None)`** : `cursor.execute("SELECT * FROM empleados WHERE salario > %s", (50000,))`
	
	2. Ejecuta la misma consulta SQL varias veces con diferentes parámetros : **`executemany(query, seq_of_params)`** : `datos = [     ("Ana", 30),     ("Isabella", 25),     ("Carlos", 35), ] cursor.executemany("INSERT INTO usuarios (nombre, edad) VALUES (%s, %s)", datos)`
	
	3. **Recupera la **siguiente fila** del conjunto de resultados** : **`fetchone()`** : `fila = cursor.fetchone() print(fila)  # ('Ana', 30)`
	
		- Devuelve `None` si no hay más filas disponibles.
	
	4. Recupera **todas las filas** del conjunto de resultados : **`fetchall()`** : `filas = cursor.fetchall() for fila in filas:     print(fila)  # Imprime cada registro en la base de datos`
	
	5. **Recupera un número limitado de filas del conjunto de resultados : `fetchmany(size=None)`** : `filas = cursor.fetchmany(size=2) for fila in filas:     print(fila)`
	
		- Si no se especifica `size`, utiliza el valor predeterminado del cursor.
	
	6. Cierra el cursor y libera los recursos asociados : **`close()`** : `cursor.close()`
	
	7. Devuelve el número de filas afectadas por la última operación ejecutada. : **`rowcount` (propiedad)** : `cursor.execute("DELETE FROM usuarios WHERE edad < %s", (20,)) print(cursor.rowcount, "filas eliminadas.")`
	
	8. Devuelve información sobre las columnas del conjunto de resultados : **`description` (propiedad)** : `cursor.execute("SELECT * FROM usuarios") for desc in cursor.description:     print(desc[0])  # Imprime el nombre de cada columna`
	
	9. Configura el tamaño esperado de los parámetros de entrada. No siempre es necesario : **`setinputsizes(sizes)`** : `cursor.setinputsizes([str, int])`
	
	10. Configura el tamaño esperado de los resultados : **`setoutputsize(size, column=None)`** : `cursor.setoutputsize(1024)`
	
		- Puede aplicarse a una columna específica o a todas.
	
	**Buenas prácticas al usar cursores**
	
	11. **Cerrar siempre el cursor**:
	    
	    - Si no lo haces, podrías agotar recursos del sistema o la base de datos.
	    - Usa `try...finally` para asegurarte de que se cierre.
	     
	        `try:     cursor.execute("SELECT * FROM usuarios")     for fila in cursor.fetchall():         print(fila) finally:     cursor.close()`
	12. **Usar cursores con contexto (`with`)**:
	    
	    - Esto asegura que el cursor se cierre automáticamente.
	    - **Ejemplo**:
	     
	        `with connection.cursor() as cursor:     cursor.execute("SELECT * FROM usuarios")     for fila in cursor.fetchall():         print(fila)`
	13. **Evitar inyecciones SQL**:
	    
	    - Siempre usa parámetros en lugar de concatenar cadenas en las consultas.
	    - Malo:
	     
	        `cursor.execute(f"SELECT * FROM usuarios WHERE nombre = '{nombre}'")`
	    - Bueno:
	     
	        `cursor.execute("SELECT * FROM usuarios WHERE nombre = %s", (nombre,))`

	**Ejemplo completo**
	
	``import psycopg2``
	
	``# Conexión a la base de datos``
	``conn = psycopg2.connect(``
	    ``host="localhost",``
	    ``database="mi_base_de_datos",``
	    ``user="mi_usuario",``
	    ``password="mi_contraseña"``
	``)``
	
	``try:``
	    ``with conn.cursor() as cursor:``
	        ``# Crear tabla``
	        ``cursor.execute('''``
	            ``CREATE TABLE IF NOT EXISTS empleados (``
	                ``id SERIAL PRIMARY KEY,``
	                ``nombre VARCHAR(255),``
	                ``salario NUMERIC(10, 2)``
	            ``)``
	        ``''')``
	
	        ``# Insertar datos``
	        empleados = [("Ana", 60000), ("Isabella", 80000)]
	        cursor.executemany("INSERT INTO empleados (nombre, salario) VALUES (%s, %s)", empleados)
	
	        ``# Confirmar cambios``
	        conn.commit()
	
	        ``# Consultar datos``
	        cursor.execute("SELECT * FROM empleados")
	        for fila in cursor.fetchall():
	            print(fila)
	
	``finally:``
	    ``# Cerrar conexión``
	    ``conn.close()``

-  **Conexión Database SQLite**

	El proceso básico para interactuar con una base de datos desde Python implica los siguientes pasos:
	
	1. **Establecer la conexión**: Para abrir la conexión con la base de datos, se utiliza un **objeto de conexión** proporcionado por el módulo correspondiente (por ejemplo, `sqlite3`, `psycopg2`, `mysql.connector`).
	2. **Crear un cursor**: Una vez que tienes una conexión abierta, creas un **cursor**. El cursor es el que se encarga de **ejecutar las consultas** en la base de datos y devolver los resultados.
	3. **Ejecutar consultas**: El cursor ejecuta sentencias SQL, como `SELECT`, `INSERT`, `UPDATE`, etc. A medida que el cursor ejecuta las consultas, va moviéndose a través de los **resultados**.
	4. **Gestionar transacciones**:
	    
	    - **Confirmar transacciones:** Una vez que se han realizado cambios en la base de datos (como `INSERT` o `UPDATE`), debes **confirmar** la transacción para hacerla permanente usando el método `commit()`.
	    - **Revertir transacciones:** Si algo sale mal o deseas deshacer los cambios, puedes **revertir** la transacción con el método `rollback()`.
	5. **Cerrar la conexión**: Finalmente, después de realizar todas las operaciones necesarias, debes **cerrar la conexión** con la base de datos para liberar recursos utilizando el método `close()`.

	``import sqlite3``
	``# Paso 1: Conectar a la base de datos (en este caso, un archivo SQLite)``
	``conexion = sqlite3.connect('mi_base_de_datos.db')``
	``# Paso 2: Crear un cursor``
	``cursor = conexion.cursor()``
	``# Paso 3: Ejecutar una consulta (por ejemplo, obtener todos los registros de la tabla 'usuarios')``
	``cursor.execute('''
	    ``CREATE TABLE usuarios (``
	        ``id INTEGER PRIMARY KEY,``
	        ``nombre TEXT,``
	        ``edad INTEGER``
	    ``)``
	`''')`
	`cursor.commit()`
	``cursor.execute('SELECT * FROM usuarios')``
	``# Paso 4: Obtener los resultados``
	``resultados = cursor.fetchall()``
	``# Paso 5: Imprimir los resultados``
	``for fila in resultados:``
	    ``print(fila)``
	``# Paso 6: Cerrar la conexión``
	``conexion.close()``

	**Explicación del código:**
	
	6. **`sqlite3.connect('mi_base_de_datos.db')`:** Conecta a la base de datos `mi_base_de_datos.db`. Si no existe, se creará un archivo.
	7. **`conexion.cursor()`:** Crea un cursor, que es el objeto que se usará para ejecutar consultas.
	8. **`cursor.execute("SELECT * FROM usuarios")`:** Ejecuta una consulta SQL. En este caso, se seleccionan todos los registros de la tabla `usuarios`.
	9. **`cursor.fetchall()`:** Obtiene todos los resultados de la consulta. `fetchall()` devuelve todos los registros en forma de lista de tuplas.
	10. **`conexion.close()`:** Cierra la conexión a la base de datos.
	
	**Métodos importantes de la API DB:**
	
	- **`commit()`:** Confirma las transacciones, haciendo permanentes los cambios en la base de datos.
	- **`rollback()`:** Revierte cualquier transacción pendiente, deshaciendo cambios no confirmados.
	- **`close()`:** Cierra la conexión a la base de datos, liberando los recursos.

-  **Conexión Database MySQL and PyMySQL**

	Usaremos el paquete `mysql-connector` o `PyMySQL`. Asegúrate de instalarlo: `pip install mysql-connector-python pymysql`

	Con `mysql-connector`: 
	
		import mysql.connector
		
		``# Conexión a MySQL``
		conn = mysql.connector.connect(
		    host="localhost",
		    user="tu_usuario",
		    password="tu_contraseña",
		    database="mi_base_de_datos"
		)
		
		cursor = conn.cursor()
		
		``# Ejemplo: Crear tabla``
		cursor.execute('''
		    CREATE TABLE IF NOT EXISTS productos (
		        id INT AUTO_INCREMENT PRIMARY KEY,
		        nombre VARCHAR(255) NOT NULL,
		        precio DECIMAL(10, 2) NOT NULL
		    )
		''')
		
		conn.commit()
		conn.close()

	Con `PyMySQL`:
	
		import pymysql
		
		conn = pymysql.connect(
		    host="localhost",
		    user="tu_usuario",
		    password="tu_contraseña",
		    database="mi_base_de_datos"
		)
		
		cursor = conn.cursor()
		
		``# Ejemplo: Insertar datos``
		cursor.execute('''
		    INSERT INTO productos (nombre, precio)
		    VALUES (%s, %s)
		''', ("Laptop", 899.99))
		
		conn.commit()
		conn.close()

-  **Conexión Database PostgreSQL**

	Usaremos `psycopg2`. Instálalo con: ``pip install psycopg2``
	
		import psycopg2
		
		``# Conexión a PostgreSQL``
		conn = psycopg2.connect(
		    host="localhost",
		    database="mi_base_de_datos",
		    user="tu_usuario",
		    password="tu_contraseña"
		)
		
		cursor = conn.cursor()
		
		``# Ejemplo: Crear tabla``
		cursor.execute('''
		    CREATE TABLE IF NOT EXISTS empleados (
		        id SERIAL PRIMARY KEY,
		        nombre VARCHAR(255) NOT NULL,
		        salario NUMERIC(10, 2) NOT NULL
		    )
		''')
		
		conn.commit()
		conn.close()

-  **Conexión Database SQL Server**

	Usaremos `pyodbc`. Asegúrate de instalarlo: `pip install pyodbc`
	
		import pyodbc
		
		``# Conexión a SQL Server``
		conn = pyodbc.connect(
		    'DRIVER={SQL Server};'
		    'SERVER=tu_servidor;'
		    'DATABASE=mi_base_de_datos;'
		    'UID=tu_usuario;'
		    'PWD=tu_contraseña'
		)
		
		cursor = conn.cursor()
		
		``# Ejemplo: Consultar datos``
		cursor.execute('SELECT * FROM clientes')
		for fila in cursor.fetchall():
		    print(fila)
		
		conn.close()

-  **Conexión Database Oracle**

	Usaremos `cx_Oracle`. Instálalo con: ``pip install cx_Oracle``
	
	Asegúrate de tener las **Instant Client libraries** instaladas en tu máquina.
	
		import cx_Oracle
		
		``# Conexión a Oracle``
		conn = cx_Oracle.connect(
		    user="tu_usuario",
		    password="tu_contraseña",
		    dsn="tu_servidor:puerto/servicio"
		)
		
		cursor = conn.cursor()
		
		``# Ejemplo: Crear tabla``
		cursor.execute('''
		    CREATE TABLE departamentos (
		        id NUMBER GENERATED BY DEFAULT AS IDENTITY,
		        nombre VARCHAR2(100) NOT NULL,
		        ubicacion VARCHAR2(100),
		        PRIMARY KEY (id)
		    )
		''')
		
		conn.commit()
		conn.close()

-  **Conexión Database IBM DB2**

	Usaremos `ibm_db`. Instálalo con: ``pip install ibm_db``
	
		import ibm_db
		
		``# Configuración de la conexión``
		dsn = (
		    dns_drive ="IBM DB2 ODBC DRIVE";
		    dns_database = "BLUDB" # Nombre de la base de datos
		    dns_hostname = "your_name";" # "dashdb-txn-sdox-yp-dal09-04.services.dal.bluemix.net"
		    dns_port = "50000;" # Puerto del servidor
		    dns_protocolo = "TCPIP;" # Protocolo
		    dns_user = "tu_usuario;" # Usuario
		    dns.password = "tu_contraseña;" # Contraseña
		)
		
		try:
		    ``# Intentar establecer la conexión``
		    conn = ibm_db.connect(dsn, "", "")
		    print("¡Conexión exitosa a Db2!")
		except Exception as e:
		    print(f"Error al conectar a Db2: {e}")
		
		ibm_db.close(conn)

-  **Conexión Database MongoDB**

	Usaremos `pymongo`. Instálalo con: `pip install pymongo`
	
		from pymongo import MongoClient
		
		``# Conexión a MongoDB``
		cliente = MongoClient("mongodb://localhost:27017/")
		db = cliente["mi_base_de_datos"]
		
		``# Ejemplo: Insertar documento``
		coleccion = db["productos"]
		coleccion.insert_one({"nombre": "Smartphone", "precio": 499.99})
		
		``# Consultar documentos``
		for producto in coleccion.find():
		    print(producto)
		
		cliente.close()

-  **Conexión Database DynamoDB**

	Usaremos `boto3`. Instálalo con: `pip install boto3`
	
		import boto3
		
		``# Conexión a DynamoDB``
		dynamodb = boto3.resource('dynamodb', region_name='us-east-1')
		
		``# Crear tabla``
		tabla = dynamodb.create_table(
		    TableName='Usuarios',
		    KeySchema=[
		        {'AttributeName': 'id', 'KeyType': 'HASH'}  # Clave primaria
		    ],
		    AttributeDefinitions=[
		        {'AttributeName': 'id', 'AttributeType': 'S'}
		    ],
		    ProvisionedThroughput={
		        'ReadCapacityUnits': 5,
		        'WriteCapacityUnits': 5
		    }
		)
		
		tabla.wait_until_exists()
		
		``# Insertar datos``
		tabla.put_item(Item={"id": "1", "nombre": "Carlos", "edad": 30})
		
		``# Consultar datos``
		response = tabla.get_item(Key={"id": "1"})
		print(response['Item'])

-  **Conexión Database Cassandra**

	Usaremos `cassandra-driver`: ``pip install cassandra-driver``
	
		from cassandra.cluster import Cluster
		
		``# Conexión al clúster de Cassandra``
		cluster = Cluster(['localhost'])
		session = cluster.connect()
		
		``# Crear un keyspace y usarlo``
		session.execute('''
		    CREATE KEYSPACE IF NOT EXISTS mi_keyspace
		    WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1}
		''')
		session.set_keyspace('mi_keyspace')
		
		``# Crear una tabla``
		session.execute('''
		    CREATE TABLE IF NOT EXISTS usuarios (
		        id UUID PRIMARY KEY,
		        nombre TEXT,
		        edad INT
		    )
		''')
		
		``# Insertar datos``
		import uuid
		session.execute('''
		    INSERT INTO usuarios (id, nombre, edad) VALUES (%s, %s, %s)
		''', (uuid.uuid4(), "Ana", 30))
		
		``# Consultar datos``
		rows = session.execute('SELECT * FROM usuarios')
		for row in rows:
		    print(row)
		
		``# Cerrar conexión``
		cluster.shutdown()

-  **Conexión Database Aurora**

	Aurora es compatible con MySQL y PostgreSQL. Usaremos **boto3** para la gestión y `mysql-connector` o `psycopg2` para conectarnos: ``pip install boto3 mysql-connector-python psycopg2``
	
		import mysql.connector
		
		``# Conexión a Aurora (MySQL)``
		conn = mysql.connector.connect(
		    host="tu_endpoint_aurora",
		    user="tu_usuario",
		    password="tu_contraseña",
		    database="mi_base_de_datos"
		)
		
		cursor = conn.cursor()
		
		``# Consultar datos``
		cursor.execute("SELECT * FROM empleados")
		for fila in cursor.fetchall():
		    print(fila)
		
		conn.close()

	**Gestión con Boto3**: 
	
		import boto3
		
		``# Cliente RDS para Amazon Aurora``
		rds_client = boto3.client('rds', region_name='us-east-1')
		
		``# Listar clústeres``
		response = rds_client.describe_db_clusters()
		for cluster in response['DBClusters']:
		    print(cluster['DBClusterIdentifier'], cluster['Endpoint'])

-  **Conexión Database RDS**

	Con RDS puedes usar MySQL, PostgreSQL, SQL Server, etc. La conexión se realiza igual que con una base de datos local, pero apuntando al **``endpoint de RDS``**.
	
		import psycopg2
		
		``# Conexión a RDS (PostgreSQL)``
		conn = psycopg2.connect(
		    host="tu_endpoint_rds",
		    database="mi_base_de_datos",
		    user="tu_usuario",
		    password="tu_contraseña"
		)
		
		cursor = conn.cursor()
		
		``# Crear tabla``
		cursor.execute('''
		    CREATE TABLE IF NOT EXISTS productos (
		        id SERIAL PRIMARY KEY,
		        nombre VARCHAR(255),
		        precio NUMERIC(10, 2)
		    )
		''')
		
		``# Insertar datos``
		cursor.execute('''
		    INSERT INTO productos (nombre, precio) VALUES (%s, %s)
		''', ("Tablet", 299.99))
		
		conn.commit()
		conn.close()

-  **Conexión Databases Azure**

	Azure SQL Database es un servicio administrado basado en SQL Server: `pip install pyodbc`
	
		import pyodbc
		
		``# Conexión a Azure SQL Database``
		conn = pyodbc.connect(
		    'DRIVER={ODBC Driver 17 for SQL Server};'
		    'SERVER=tu_servidor.database.windows.net;'
		    'DATABASE=mi_base_de_datos;'
		    'UID=tu_usuario;'
		    'PWD=tu_contraseña;'
		)
		
		cursor = conn.cursor()
		
		``# Crear tabla``
		cursor.execute('''
		    CREATE TABLE IF NOT EXISTS clientes (
		        id INT PRIMARY KEY IDENTITY(1,1),
		        nombre NVARCHAR(100),
		        correo NVARCHAR(255)
		    )
		''')
		
		``# Insertar datos``
		cursor.execute('''
		    INSERT INTO clientes (nombre, correo) VALUES (?, ?)
		''', ("Isabella", "isabella@example.com"))
		
		conn.commit()
		conn.close()
