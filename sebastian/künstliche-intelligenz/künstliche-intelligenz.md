
-  **[Tareas ](kanban-künstliche-intelligenz.md)**
-  **Enlaces**

	-  **Internos**
	  
		-  **[Agentes](orquestrate-seed/AGENTS.md)**
		-  **[Providers](sebastian/assets/documents/künstliche-intelligenz/providers)**
		
			- **[[nvidia]]**
		-  **Herramientas**
		  
			-  **[KV cache ](sebastian/assets/documents/künstliche-intelligenz/kv-cache.md)**
		-  **[Generación aumentada por recuperación](retrieval-augmented-generation)**
	-  **Externos**

		-  **Investigation**
		
			-  **[Ponder ](https://ponder.ing/es/dashboard)**
		-  **Storage learning**
		  
			-  **[Recall ](https://app.recall.it/items)**
![[barra.gif]]

-  **Introducción a la inteligencia artificial**

	-  **El ecosistema de la inteligencia artificial**
	
		La **Inteligencia Artificial (IA)** es el campo general de la informática dedicado a crear sistemas capaces de realizar tareas que requieren inteligencia humana (percibir, razonar, aprender).
		
		**Categorías de la IA:**
		
		- **IA Débil (Narrow AI):** Diseñada para tareas específicas (la que usamos hoy en día).
		- **IA Fuerte (General AI):** Con habilidades cognitivas equivalentes a las humanas (teórica).
		- **Súper IA (Super AI):** Supera la inteligencia humana (teórica).
		
		**Computación Cognitiva:**
		
		Es un enfoque dentro de la IA que busca imitar los procesos de pensamiento humano. No solo ejecuta comandos, sino que entiende necesidades, anticipa preguntas y procesa datos estructurados y no estructurados. Su objetivo principal es mejorar la toma de decisiones y facilitar la comunicación humano-máquina.
	-  **Aprendizaje automático**
	
		El **Machine Learning (ML)** es un subcampo de la IA. En lugar de usar reglas fijas creadas por humanos (programación tradicional tipo if-then-else), utiliza **algoritmos** que aprenden de grandes conjuntos de datos para construir un **modelo** de decisión que mejora continuamente.
		
		**Proceso de entrenamiento y evaluación:**
		
		-  **División de datos:** El conjunto se divide en datos de entrenamiento, validación y prueba.
		-  **Entrenamiento:** Ajusta los parámetros del modelo.
		-  **Validación y prueba:** Afina el modelo y evalúa su desempeño con datos nuevos.
		-  **Métricas de éxito:** Precisión, exactitud y recall.
		  
		### **Tipos de aprendizaje automático**
		
		-  **Aprendizaje supervisado:** Utiliza datos etiquetados (con intervención humana) para entrenar al algoritmo. Sus tareas principales son la **regresión** (estimar valores continuos) y la **clasificación** (asignar etiquetas discretas).
		
			A diferencia de la clasificación, donde buscas una categoría fija, en la **regresión** el objetivo es predecir un valor numérico continuo. Por ejemplo, en lugar de decir si una foto contiene un coche o una moto (clasificación), el modelo de regresión predice el precio exacto de venta de ese coche o la velocidad a la que se desplaza.
			
			**Ejemplo práctico con datos visuales**
			
			Siguiendo con el escenario de las fotos, imagina que tienes un conjunto de imágenes de rostros humanos y quieres entrenar un modelo para adivinar la **edad** exacta de la persona:
			
			-  **Datos de entrada:** Las fotografías digitales junto con el valor numérico real de la edad de cada persona (por ejemplo, 25 años, 42 años, 61.5 años).
			-  **Salida esperada:** Un número continuo. El modelo no asigna una etiqueta fija como "joven" o "anciano" (lo cual sería clasificación), sino que arroja una cifra numérica precisa.
			
			Otro ejemplo muy común fuera de la visión por computadora es predecir el precio de una casa basándose en metros cuadrados, número de habitaciones y antigüedad.
			
			**Proceso de entrenamiento**
			
			El entrenamiento de un modelo de regresión supervisada sigue una lógica similar a la clasificación, pero utiliza métricas matemáticas diseñadas para calcular distancias numéricas:
			
			-  **Alimentación de datos:** Se le proporcionan al algoritmo las entradas junto con el valor numérico objetivo real.
			-  **Predicción inicial:** El modelo realiza un cálculo estimado utilizando sus parámetros internos.
			-  **Medición del error:** Se calcula la diferencia matemática entre el valor predicho y el valor real mediante una función de pérdida (por ejemplo, midiendo qué tan lejos quedó el número estimado del número real).
			-  **Ajuste y optimización:** El algoritmo actualiza sus pesos internos para reducir ese error en la siguiente iteración, repitiendo el proceso hasta que las predicciones numéricas sean lo más precisas posibles.
		-  **Aprendizaje no supervisado:** Encuentra patrones ocultos en datos sin etiquetar. Se usa principalmente para **clustering** (agrupación) y detección de anomalías.
		-  **Aprendizaje por refuerzo:** Aprende mediante prueba y error para alcanzar un objetivo. Su mecánica se basa en maximizar **recompensas** y minimizar penalizaciones bajo ciertas reglas.
	-  **Aprendizaje profundo y redes neuronales**
	
		El **Deep Learning (DL)** es una especialización del ML que procesa datos complejos y no estructurados (imágenes, texto) sin necesidad de etiquetado humano previo. Su base son las **Redes Neuronales (NN)**.
		
		**Estructura y funcionamiento de las redes neuronales:**
		
		-  Inspiradas en el cerebro humano, están compuestas por nodos (neuronas).
		-  Se dividen en tres partes: **capa de entrada**, **capas ocultas** (aplican funciones de activación), y **Capa de salida**. Se consideran "profundas" cuando tienen más de tres capas en total.
		-  **Forward pass:** La información avanza para generar una salida y calcular el error.
		-  **Backpropagation (Retropropagación):** El sistema ajusta sus parámetros internos (pesos y sesgos) hacia atrás para minimizar el error en futuras predicciones.
		
		**Tipos de Redes Neuronales**
		
		-  **Perceptrón:** Es la forma más simple, compuesta únicamente por una capa de entrada y una de salida.
		-  **Feed-forward:** La información fluye en una sola dirección, desde la entrada hasta la salida.
		-  **Convolucionales (CNN):** Están especializadas en el análisis profundo de datos visuales, como imágenes y video.
		-  **Recurrentes (RNN):** Consideran el contexto temporal al procesar la información, siendo ideales para secuencias y texto.
		-  **Modulares:** Combinan el procesamiento de varias redes neuronales distintas para obtener un resultado final unificado.
	-  **IA Generativa y modelos avanzados**
	
		La **IA Generativa** utiliza el conocimiento adquirido para crear contenido completamente nuevo (texto, imágenes, audio).
		
		**Modelos Base (Foundation Models):** Son redes neuronales masivas entrenadas de forma no supervisada con volúmenes gigantescos de datos no estructurados. Sirven como base para múltiples tareas mediante un proceso de ajuste fino (_tuning_).
		
		-  **Grandes Modelos de Lenguaje (LLMs):** Un tipo de modelo base enfocado en procesar y generar texto prediciendo la siguiente palabra (ej. ChatGPT, Google Gemini).
		-  **Ventajas:** Alto rendimiento y menor necesidad de datos etiquetados.
		-  **Desventajas:** Altos costos computacionales y riesgo de sesgos o datos tóxicos.
		
		**Tipos de Modelos generativos y modalidades**
		
		-  **Autoregresivos:** Generan datos de forma secuencial prediciendo el siguiente elemento basado en los anteriores (ej. WaveNet).
		-  **Transformadores:** Utilizan capas de codificador y decodificador, siendo sumamente eficaces para procesar lenguaje natural (ej. GPT).
		-  **VAEs (Autoencoders Variacionales):** Codifican datos de entrada a una representación latente y los decodifican para generar nuevas salidas.
		-  **GANs (Redes Generativas Adversarias):** Constan de un "generador" que crea datos falsos y un "discriminador" que evalúa si son reales o falsos, entrenándose mutuamente.
		-  **Modelos Unimodales:** Procesan y generan contenido dentro de una única modalidad, como texto a texto.
		-  **Modelos Multimodales:** Manejan y cruzan diferentes tipos de datos simultáneamente, como texto a imagen (ej. DALL-E).
	-  **Procesamiento y percepción **
	
		Para que las máquinas interactúen de forma natural, la IA se apoya en dos grandes pilares de percepción.
		
		**Procesamiento de Lenguaje Natural (NLP):** Traduce entre lenguaje humano cotidiano (no estructurado) y datos que la computadora entiende (estructurados). Se divide en NLU (comprensión) y NLG (generación).
		
		-  **Casos de uso:** Traducción, chatbots, análisis de sentimientos, detección de spam.
		-  **Herramientas técnicas:** Tokenización (dividir en palabras), Stemming/Lematización (reducir a la raíz gramatical), Etiquetado de partes del habla, y Reconocimiento de Entidades Nombradas (NER).
		-  **Tecnologías de voz asociadas:** **STT** (Speech-to-Text / dictado) y **TTS** (Text-to-Speech / generación de voz).
		
		**Visión por Computadora:** Permite a las máquinas interpretar datos visuales mediante redes neuronales (específicamente CNNs).
		
		- **Tareas clave:** Clasificación de imágenes, detección de objetos y segmentación de imágenes.
	-  **Agentes de IA y sistemas compuestos**
	
		Los **Agentes de IA** son programas autónomos que interactúan con su entorno para cumplir objetivos. Poseen autonomía, reactividad (responden a cambios), proactividad (toman iniciativa) y habilidad social (colaboran).
		
		**Evolución y Funcionamiento:**
		
		-  **De Monolíticos a Compuestos:** Los modelos antiguos estaban limitados a su entrenamiento base (monolíticos). Los sistemas actuales (compuestos/agénticos) integran LLMs con herramientas externas (APIs, bases de datos) y memoria.
		-  **Método REACT:** Combina razonamiento y acción, permitiendo al agente iterar, planificar y usar herramientas externas de forma dinámica bajo supervisión humana.
		-  **Sistemas Multiagente:** Coordinación de varios agentes para resolver problemas distribuidos (gestión de tráfico, mercados online).
	-  **IoT, Cloud, Edge y Robótica**
	
		La IA se integra con el hardware físico y las redes de telecomunicaciones para interactuar con el mundo real.
		
		**IoT y Computación:**
		
		-  **IoT (Internet of Things):** Objetos físicos conectados que recopilan datos (termostatos, relojes).
		-  **Cloud Computing (Nube):** Almacenamiento y procesamiento masivo centralizado a través de internet.
		-  **Edge Computing (Borde):** Procesamiento de datos directamente en el dispositivo (o muy cerca de él) para tomar decisiones instantáneas sin depender de la latencia de la nube.
		
		**Robótica y Automatización:**
		
		-  **Robótica física:** Máquinas compuestas por sensores (percepción), actuadores (movimiento) y controladores. Usan IA (visión, NLP) para ser autónomos. Los **Cobots** (robots colaborativos) trabajan junto a humanos de forma segura.
		-  **RPA (Robotic Process Automation):** No son robots físicos. Es software (bots virtuales) que automatiza tareas digitales repetitivas y basadas en reglas fijas (ej. finanzas, RRHH).
-  **Layers LLMs**

	En el contexto de los modelos de lenguaje grande (LLMs) y las técnicas de optimización e inferencia que venimos estudiando (como el co-diseño de hardware y la cuantización), una **capa** es un bloque modular y estructurado dentro de la red neuronal donde ocurren las transformaciones matemáticas.
	
	-  **¿Qué es una capa (_layer_) exactamente?**
	
		Imagina un gran edificio de muchos pisos. Para que el edificio funcione, la información tiene que pasar por cada piso de forma secuencial:
		
		-  Cada **capa** recibe un conjunto de datos (llamados **activaciones**), realiza operaciones matemáticas pesadas (principalmente multiplicaciones de matrices combinando los datos con los **pesos** fijos del modelo) y le entrega el resultado procesado a la capa siguiente.
		-  En el proceso de optimización (como los motores de TensorRT o la cuantización a FP8), las capas son los objetivos principales: algunas se cuantizan para ahorrar memoria, mientras que otras se dejan en alta precisión para no perder calidad.
	-  **Tipos principales de capas en un modelo de lenguaje (Transformer)**
	
		Basándonos en los componentes que se optimizan en la infraestructura moderna de IA, destacan principalmente tres tipos de capas:
		
		-  **Capas de atención (_Attention Layers_ / _Multi-Head Attention_):**
		
		    -  Son fundamentales para que el modelo entienda el contexto de una frase, conectando unas palabras con otras sin importar la distancia entre ellas.
		    -  Como se menciona en los procesos de optimización avanzada, estas capas manejan el flujo de la _KV Cache_ y son clave en la inferencia de contexto largo.
		-  **Capas lineales y de redes de alimentación (_Linear / MLP Layers_):**
		
		    Son las capas encargadas de procesar y transformar la información numérica que sale de los mecanismos de atención, aplicando los cálculos masivos que definen el "razonamiento" del modelo.
		-  **Capas de proyección final (`lm_head`):**
		    
			Es la capa ubicada al final de toda la red. Su trabajo es tomar los vectores matemáticos internos y traducirlos en probabilidades reales para decidir cuál será la siguiente palabra (_token_) que el modelo va a escribir.
	-  **¿Cuántas capas tiene un modelo?**
	
		**No existe un número fijo; depende enteramente de la arquitectura y la escala del modelo:**
		
		-  **Modelos pequeños o compactos (ej. 1B a 7B parámetros):** Suelen tener entre **24 y 32 capas** apiladas de manera vertical.
		-  **Modelos gigantescos (ej. Llama de cientos de miles de millones de parámetros):** Al requerir una capacidad de abstracción mucho mayor, multiplican su profundidad, contando habitualmente con **80, 126 o más capas** de bloques transformadores uno tras otro.
		
		Entre mayor sea el número de capas, más pesada es la red, mayor cantidad de VRAM exige y más obligatorias se vuelven las técnicas avanzadas de optimización y cuantización para poder ejecutarlas con fluidez.
  



















































































































