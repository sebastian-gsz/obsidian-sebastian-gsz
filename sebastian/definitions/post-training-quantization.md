---
def-type: atomic
version: 1.0
id: def-post-training-quantization
status: estandar
category: inteligencia-artificial
date: 2026-08-23
tags:
  - inteligencia-artificial
  - machine-learning
  - cuantizacion
  - optimizacion
aliases:
  - post-training quantization
  - ptq
  - cuantización posterior al entrenamiento
---
La cuantización posterior al entrenamiento (PTQ, por sus siglas en inglés, _Post-Training Quantization_) es una técnica de optimización que reduce la precisión numérica de los pesos y activaciones de un modelo de aprendizaje profundo ya entrenado (por ejemplo, pasando de FP32 a INT8 o FP8) con el fin de acelerar la inferencia y reducir el uso de memoria.
### Características principales

-  **Calibración rápida**: Utiliza un conjunto de datos reducido y representativo (conjunto de calibración) para determinar los factores de escala y los rangos dinámicos óptimos sin necesidad de reentrenar la red desde cero.
-  **Eficiencia operativa**: Es un proceso notablemente más rápido y económico que la cuantización consciente del entrenamiento (_Quantization-Aware Training_ o QAT), ya que no requiere ejecutar un ciclo completo de entrenamiento.
-  **Reducción de huella**: Disminuye drásticamente el tamaño del modelo en disco y en memoria RAM o VRAM.
### Consideraciones clave

-  **Pérdida de precisión**: Al no reentrenar el modelo, una cuantización agresiva puede introducir errores de redondeo que reduzcan ligeramente la precisión (_accuracy_) de la tarea original.
-  **Compatibilidad**: Está diseñada para ejecutarse sobre hardware e infraestructuras preparadas para procesar de forma nativa formatos de precisión reducida.
### FAQ

-  **¿Qué significa "reducir la precisión numérica de los pesos y activaciones"?**

	Para entenderlo, imagina que los componentes de una red neuronal son de dos tipos:
	
	-  **Los pesos (_weights_):** Son el "conocimiento" fijo que la red aprendió durante su entrenamiento (los valores estáticos guardados en el disco).
	-  **Las activaciones (_activations_):** Son los datos dinámicos que van calculándose y viajando de una capa a otra cuando le haces una pregunta al modelo en tiempo real.
	    
	Normalmente, estos números se almacenan en formatos de alta precisión como **FP32** (32 bits, que ocupan 4 bytes por número) o **FP16/BF16** (16 bits, 2 bytes).
	
	-  **Reducir la precisión** significa forzar a esos números a vivir en un formato más pequeño, como **FP8** u **INT8** (8 bits, 1 byte).
	-  Es el equivalente a pasar de medir distancias con una regla de precisión milimétrica a una regla que solo marca centímetros: el número ocupa cuatro veces menos espacio y se lee mucho más rápido, pero pierdes los decimales más finos.
-  **¿Qué son los "errores de redondeo"?**

	La cuantización "sesga los datos ya entrenados de forma un poco bruta" es conceptualmente muy acertada. Esto es lo que sucede:
	
	-  **El problema de los casilleros limitados:** En un formato de 32 bits, existen millones de valores posibles con una gama altísima de decimales. Al pasar a FP8, estás limitando el universo a **únicamente 256 valores posibles** (porque $2^8 = 256$).
	-  **El redondeo forzoso:** Como hay muchos más números reales que los 256 casilleros disponibles, la cuantización se ve obligada a forzar u obligar a muchos números diferentes a redondearse al mismo valor fijo más cercano.
	-  **¿Qué es el error de redondeo?** Es la pequeña diferencia matemática entre el valor original exacto que tenía el modelo y el valor recortado o redondeado que le tocó al entrar en el casillero de 8 bits.
	    
	**¿Por qué afecta la precisión (_accuracy_)?**
	
	Como bien mencionas, al hacer **PTQ (Post-Training Quantization)** no estás reentrenando la red. Simplemente agarras un modelo ya terminado y le cambias las tuercas de golpe por unas más pequeñas.
	
	Si la cuantización es **demasiado agresiva** (es decir, si intentas meter un rango de números gigantesco en esos 256 pobres casilleros sin calcular bien los rangos), esos pequeños errores de redondeo se acumulan de capa en capa. Algunas neuronas clave reciben información distorsionada, lo que se traduce en respuestas un poco menos precisas o errores de razonamiento en el modelo.
	
	Por esta razón, herramientas avanzadas como el **TensorRT Model Optimizer** invierten tanto esfuerzo en calcular matemáticamente los factores de escala óptimos: buscan la manera de "redondear" de la forma más inteligente posible para que el modelo note lo menos posible ese cambio brusco de precisión.
-  **¿A qué nos referimos con "una gama altísima de decimales" en 32 bits?**

	Imagina que quieres medir la distancia entre dos puntos.
	
	-  En **32 bits (FP32)**, el sistema operativo tiene 32 espacios (ceros y unos) para describir un número. La arquitectura de este formato está diseñada para dar una **precisión decimal brutal**.
	-  Entre el número `1.0` y el número `2.0`, un formato de 32 bits no solo conoce el 1.5; puede representar **millones de pequeños escalones intermedios** (como `1.0000001`, `1.0000002`, etc.).
	
	Esto significa que el modelo puede afinar tanto su "razonamiento" que una neurona puede pasarle a otra un valor ultra específico con muchísimos decimales de diferencia respecto a la neurona de al lado. Es como tener una regla dividida en micrómetros donde puedes apreciar diferencias microscópicas.
-  **De millones de posibilidades a solo 256 casilleros en FP8**

	Cuando pasamos a **FP8 (8 bits)**, el espacio físico se reduce drásticamente. Un byte de 8 bits solo tiene 8 interruptores (ceros y unos).
	
	-  Como cada interruptor tiene 2 estados (0 o 1), las combinaciones posibles totales se calculan multiplicando el 2 por sí mismo 8 veces ($2 \times 2 \times 2 \times 2 \times 2 \times 2 \times 2 \times 2$), lo que da exactamente **256 combinaciones únicas**.
	-  Esto significa que **solo existen 256 "etiquetas" o "casilleros" disponibles** en todo el universo de FP8.
	
	Por lo tanto, si una neurona calcula un número con una precisión larguísima en el mundo de 32 bits (por ejemplo, `3.14159265...`), al entrar en FP8 la herramienta de cuantización se ve obligada a decir: _"No quepo aquí con tanto detalle; te voy a meter a la fuerza en el casillero 84"_ (que quizás representa el valor fijo `3.14`). Esa pérdida de matices es el "error de redondeo" del que hablábamos.
-  **RAM o VRAM**

	**Ninguna de las dos hace cálculos.** Tanto la memoria RAM tradicional (del sistema) como la VRAM (de la tarjeta gráfica) sirven **exclusivamente para almacenar** datos de forma temporal.
	
	-  **La analogía:** Imagina que la memoria es una gran mesa de trabajo o un archivero. Ahí se colocan los libros, los números y los pesos del modelo de IA listos para usarse.
	-  **¿Quién hace los cálculos?:** Los encargados de hacer las operaciones matemáticas reales son los **procesadores**. En el caso de la RAM, quien procesa es el **CPU**; en el caso de la VRAM, quienes hacen los cálculos pesados (como las multiplicaciones de matrices de la IA) son los **núcleos de la GPU**, especialmente los **Tensor Cores**.
	
	-  **¿Qué capacidad, hilos o canales tiene la VRAM?**
	
		Aclarado que la memoria es solo almacenamiento, veamos cómo está estructurada por dentro en cuanto a espacio y velocidad:
		
		-  **Capacidad:** Es el volumen total de datos que puede retener al mismo tiempo. Se mide en gigabytes (GB).
		
		    -  Las tarjetas gráficas orientadas a consumo o creadores suelen tener **16 GB o 24 GB** de VRAM.
		    -  Las GPUs especializadas para centros de datos e inteligencia artificial manejan capacidades mucho mayores, superando los **80 GB o hasta 141 GB** de memoria de ultra alta velocidad para poder cargar modelos gigantescos como Llama de cientos de miles de millones de parámetros.
		-  **¿Tiene hilos (_threads_)?:** **No.** Los hilos de ejecución pertenecen exclusivamente a los procesadores (núcleos del CPU o de la GPU). La memoria por sí sola no ejecuta código ni hilos lógicos.
		-  **Canales y Bus de datos:** En lugar de hilos, la VRAM cuenta con un **bus de memoria** y canales de transferencia.
		
		    -  Esto funciona como una **autopista de varios carriles**. Un bus de memoria (por ejemplo, de 256-bit o las tecnologías avanzadas de alta densidad como HBM) determina cuántos datos pueden viajar simultáneamente en cada ciclo de reloj desde la VRAM hacia los núcleos de cálculo de la GPU.
		    -  De este ancho de banda depende que la GPU no se quede "esperando" a que llegue la información, evitando los cuellos de botella durante la inferencia de los modelos.
	-  **Capacidad de VRAM**
	
		Asumiendo que se trata de la serie **GTX 1650 / 1650 Ti para laptops**, estas son sus capacidades reales:
		
		**Capacidad de VRAM**
		
		- **Memoria de video:** **4 GB GDDR6** (algunas versiones iniciales de la GTX 1650 salieron con memoria GDDR5, pero comparten la misma capacidad de 4 GB).
		    
		**Capacidad y especificaciones de la GPU**
		
		-  **Arquitectura:** Turing (TU117)
		-  **CUDA Cores (Núcleos de procesamiento):**
		
		    -  **GTX 1650 Mobile:** 896 núcleos.
		    -  **GTX 1650 Ti Mobile:** 1024 núcleos.
		-  **Bus de memoria:** 128-bit
		
		_(**Nota alternativa**: Si por el contrario tu portátil equipa una gama ligeramente superior como la **GTX 1660 Ti Mobile**, esta sube a **6 GB de VRAM GDDR6** y **1536 CUDA Cores**)._
	-  **Cómo calcular $2^8 = 256$ en tu calculadora científica**
	
		Para calcular esto en la interfaz de la calculadora científica de Windows que tienes en la imagen, sigue estos sencillos pasos:
		
		1. Presiona el botón del número **`2`** (esta es la base).
		2. Busca y presiona la tecla de potencia **`x²`** (se encuentra en la columna de la izquierda, justo encima del número `7`). Esta tecla le indica a la calculadora que el siguiente número que escribas será un exponente elevado.
		3. Presiona el número **`8`** (este es el exponente, que indica cuántas veces se multiplica el 2 por sí mismo).
		4. Por último, presiona la tecla de igual **`=`** (el botón azul brillante situado en la esquina inferior derecha).
		    
		¡Listo! La pantalla de tu calculadora mostrará el resultado: **`256`**.
	-  **La diferencia clave: Bits vs. Bytes**
	
		-  **Un bit ($1 \text{ bit}$):** Es la unidad mínima de información en informática (un simple interruptor que guarda un `0` o un `1`).
		-  **Un byte ($1 \text{ byte}$):** Equivale exactamente a **8 bits**.
		
		Cuando hablamos de los formatos de los modelos, usamos la terminología de **bits**, no de bytes:
		
		-  **FP32 (32 bits):** No significa 32 bytes. Significa **32 bits**. Si haces la conversión a bytes dividiendo entre 8 ($32 / 8$), obtienes que cada número ocupa **4 bytes** de memoria en la GPU.
		-  **FP8 (8 bits):** Son exactamente **8 bits**, lo que equivale a **1 byte** ($8 / 8 = 1$).
		
		Por lo tanto, cuando un modelo pasa de FP32 a FP8, no pasa de 32 bytes a 8 bits; pasa de **32 bits (4 bytes)** a **8 bits (1 byte)**. ¡Esa es la razón por la que el tamaño del modelo se reduce a una cuarta parte!
		
		**¿Cómo influye la arquitectura del hardware?**
		
		Aquí es donde entra la magia del diseño físico de las GPUs modernas (como las arquitecturas Hopper o Blackwell):
		
		1. **El ancho de banda y los buses de memoria:** Los carriles físicos por donde viajan los datos dentro de la tarjeta gráfica tienen un ancho determinado.
		2. **Empaquetado de datos:** Si un carril de memoria está diseñado para mover bloques de 4 bytes, cuando trabajabas con FP32 (que mide 4 bytes), ese carril solo podía llevar **un número a la vez**.
		3. **El superpoder de FP8:** Al reducir el número a FP8 (1 byte), ese mismo carril físico de 4 bytes ahora puede transportar **cuatro números al mismo tiempo** empaquetados en un solo viaje.
		
		Los **Tensor Cores** de hardware están construidos específicamente para "desempaquetar" y procesar esos cuatro números en paralelo de un solo golpe de reloj. De ahí surge el salto masivo en rendimiento e inferencia del que hablan las guías de optimización de NVIDIA.







