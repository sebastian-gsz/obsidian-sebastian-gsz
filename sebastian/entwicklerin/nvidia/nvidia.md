
-  **Enlaces**

	-  **Internos**
	
		-  **Herramientas**
		
			-  **[KV Cache ](sebastian/assets/documents/künstliche-intelligenz/kv-cache.md)**
	-  **Externos**
	
		-  **[NVIDIA ](https://www.nvidia.com/en-us/)**
		
			-  **[NVIDIA Nemetron ](https://www.nvidia.com/en-us/ai-data-science/foundation-models/nemotron/)**
			-  **[NVIDIA Generative AI Tools for Business ](https://www.nvidia.com/en-us/executive-insights/generative-ai-tools/?modal=stay-inf)**
		-  **[NVIDIA Blog ](https://blogs.nvidia.com/)**
		  
			-  **[Tag: Nemotron Labs ](https://blogs.nvidia.com/blog/tag/nemotron-labs/)**
		-  **[NVIDIA Build ](https://build.nvidia.com/)**
		-  **[NVIDIA Developer ](https://developer.nvidia.com/)**

			-  **[Community Hub ](https://developer.nvidia.com/community?size=n_12_n&sort-field=last_name&sort-direction=asc)**
		-  **[NVIDIA On-Demand ](https://resources.nvidia.com/en-us-ai-powered-telco-operations-for-exec-nurture/gtcdc25-dc51143/?ncid=em-nurt-534169-vt26-ex7&mkt_tok=MTU2LU9GTi03NDIAAAGj9ZyUM9atzoaILaAWdG9gEioEMkWeCDi2jOzAQDMnXcwdKYBgTt4LacdWqsvFzFbUJhHXmZJCUnZ0LZqxzz8in4iFeIlayRRBML466xSDpGy_9MbAixzyBg)**
		-  **[NVIDIA Developers Blog ](https://developer.nvidia.com/blog)**
		-  **[NVIDIA Documentation Hub ](https://docs.nvidia.com/)**
		-  
![[barra.gif]]
#### Library

###### TensorRT LLM

-  **[Documentación ](https://nvidia.github.io/TensorRT-LLM/latest/overview.html)**

#### Developer Learning

-  **[[developer-nvidia.xlsx|Introducción]]**

	Cada archivo recopila artículos técnicos, guías de implementación, SDKs y arquitecturas de referencia enfocadas en un dominio específico del ecosistema NVIDIA:
	
	-  **Agentic and Generative AI (1,010 registros):** Cubre modelos de lenguaje, sistemas de recomendación generativos, arquitectura RAG y flujos de IA generativa.
	-  **Build AI agents (21 registros):** Enfocado específicamente en el diseño, evaluación y observabilidad de agentes de IA y herramientas como NVIDIA SkillEvaluator.
	-  **Computer Vision and Video Analytics (1,219 registros):** Contiene desarrollos en procesamiento de video, codecs, visión por computador y análisis en tiempo real.
	-  **Content Creation and Rendering (999 registros):** Aborda tecnologías de renderizado, ray tracing, path tracing y herramientas para la industria del videojuego y la animación.
	-  **Data Center and Cloud (876 registros):** Enfocado en la infraestructura de computación, optimización energética de centros de datos, ejecución distribuida y aceleración en la nube.
	-  **Data Science (1,145 registros):** Trata sobre algoritmos acelerados por GPU, manipulación masiva de datos con cuDF/RAPIDS y analítica predictiva.
	-  **Edge Computing (245 registros):** Centrado en el despliegue de modelos en dispositivos embebidos, robótica y procesamiento en el extremo con NVIDIA Holoscan o Jetson.
	-  **Inference Performance (999 registros):** Cubre técnicas de optimización de inferencia, cuantización, compilación con TensorRT y reducción de latencia en LLMs.
	-  **Networking and Communications (383 registros):** Aborda redes de alta velocidad, interconexión de GPUs, observabilidad y almacenamiento orientado a IA.
	-  **Simulation Modeling Design (1,851 registros):** Centrado en gemelos digitales, simulación física, robótica y modelado a escala con NVIDIA Omniverse.
    
	Para ingresar al sector de la IA con el mayor impacto en el menor tiempo posible, las hojas de cálculo se clasifican en cuatro fases prioritarias según su relevancia actual en la industria (LLMs, agentes e inferencia eficiente):
	 
	-  **Fase 1: Fundamentos y rendimiento esencial (Prioridad alta)**
	
		-  **Inference Performance:** Es fundamental aprender a servir e inferir modelos de forma eficiente con baja latencia.
		-  **Data Science:** Proporciona las bases de procesamiento masivo de datos acelerado por GPU antes de alimentar cualquier modelo de IA.
		
		Al analizar los datos de estas dos hojas, encontramos que **Data Science** se centra en preparar, procesar y entrenar con cantidades masivas de datos usando aceleración GPU (RAPIDS, UMAP, NVFlare), mientras que **Inference Performance** se enfoca en tomar esos modelos entrenados y servirlos de la forma más rápida y eficiente posible (TensorRT, Cuantización FP8, Speculative Decoding, optimización LLM).
		
		-  **Módulo 1: Fundamentos de procesamiento de datos en GPU**
		
			**Objetivo**: Aprender a manejar volúmenes masivos de datos sin los cuellos de botella de la CPU, preparando el terreno para la IA.
			
			-  **Paso 1: Aceleración de flujos de datos básicos:** Comienza estudiando la aceleración de analítica con **RAPIDS** y **cuDF** (librerías que actúan como Pandas pero en GPU).
			-  **Paso 2: Consultas y matemáticas a gran escala:** Revisa los artículos sobre _GPU-Accelerated Presto_ y _nvmath-python_ para ejecutar operaciones matemáticas y analíticas de baja latencia.
			-  **Paso 3: Reducción de dimensionalidad y clustering:** Analiza las publicaciones sobre la ejecución de **UMAP a escala masiva** en múltiples GPUs y clustering acelerado por GPU (ej. para instrumentos financieros). Esto te enseñará cómo extraer características importantes de tus datos antes de pasarlos a un modelo.
		-  **Módulo 2: Entornos avanzados y datos sintéticos**
		
			**Objetivo**: Proveer a los modelos de datos de alta calidad preservando la privacidad y generando lo que falta.
			
			-  **Paso 4: Generación de datos sintéticos:** Estudia el uso de **NVIDIA NeMo** para generar datos sintéticos (por ejemplo, para investigación financiera). El dato sintético es el motor actual del pre-entrenamiento.
			-  **Paso 5: Aprendizaje federado:** Sumérgete en **NVIDIA FLARE**. Aprenderás cómo construir flujos de IA multimodales federados, lo que te permite entrenar modelos en conjuntos de datos distribuidos sin comprometer la privacidad de los datos.
		-  **Módulo 3: Co-Diseño de modelos y preparación**
		
			**Objetivo**: Diseñar el modelo de IA y prepararlo para la "vida real" (producción) minimizando su peso y maximizando su compatibilidad de hardware.
			
			-  **Paso 6: Arquitectura orientada a hardware:** Lee sobre el _Hardware-Friendly LLM Design_. Aprender a co-diseñar la atención del modelo y su estructura sabiendo cómo funciona la memoria de la GPU te ahorrará muchos dolores de cabeza.
			-  **Paso 7: Distribución de artefactos:** Aprende cómo mover checkpoints gigantes de modelos (cientos de GBs) a la velocidad de la luz usando **ModelExpress**.
			-  **Paso 8: Cuantización de modelos:** Este es el puente directo hacia el alto rendimiento. Revisa las guías de _Model Quantization_ para transformar checkpoints de alta precisión a motores de inferencia FP8 de alto rendimiento sin perder calidad.
		-  **Módulo 4: Inferencia de alto rendimiento y escalamiento**
		
			**Objetivo**: Desplegar el modelo para que responda a miles de usuarios simultáneamente con la latencia más baja posible.
			
			-  **Paso 9: El estándar de la industria (TensorRT & TensorRT-LLM):** Este es el núcleo de la inferencia. Dedica tiempo a compilar modelos con **TensorRT** y escalar su inferencia a través de múltiples GPUs (_Multi-Device Inference Support_).
			-  **Paso 10: Técnicas de vanguardia para LLMs:** Estudia sobre la inferencia interactiva de contexto largo (_Long-Context Inference_) y la **decodificación especulativa (Speculative Decoding con DFlash)**, que puede multiplicar el rendimiento de la inferencia por 15x en arquitecturas como Blackwell.
			-  **Paso 11: Eficiencia energética y seguridad:** Finalmente, revisa cómo maximizar la eficiencia energética (_Full-Stack Inference and Training Optimizations_) y cómo implementar seguridad a nivel de hardware sin ralentizar los modelos de IA.
		
		**Proyecto final integrador sugerido**
		
		Para consolidar esta ruta, el mejor ejercicio que podrías hacer basado en este plan de estudios es:
		
		1. Tomar un dataset masivo público (ej. logs financieros o textos biomédicos), limpiarlo y procesarlo con **RAPIDS/cuDF**, y generar datos sintéticos de aumento usando **NVIDIA NeMo**.
		2. Tomar un LLM open-source (como Llama 3) y aplicar **cuantización a FP8**.
		3. Compilar el modelo cuantizado usando **TensorRT-LLM** y desplegarlo en inferencia evaluando la mejora en la latencia vs el modelo original.
	-  **Fase 2: IA generativa y arquitectura de agentes (Prioridad alta)**
	
		-  **Agentic and Generative AI:** Representa el núcleo actual de la demanda del mercado en LLMs y modelos multimodales.
		-  **Build AI agents:** Aporta guías concisas para construir agentes autónomos y medir su desempeño.
	-  **Fase 3: Despliegue, nube e infraestructura (Prioridad media)**
	
		-  **Data Center and Cloud:** Permite entender cómo escalar modelos de IA en clústeres y entornos de nube.
		-  **Edge Computing:** Crucial si se busca desplegar IA en dispositivos locales, IoT o robótica.
		-  **Networking and Communications:** Importante para la optimización de ancho de banda y almacenamiento en clústeres de gran tamaño.
	-  **Fase 4: Especializaciones y nichos de mercado (Prioridad opcional/secundaria)**
	
		-  **Computer Vision and Video Analytics:** Especialización en análisis de video e imágenes.
		-  **Simulation Modeling Design:** Especialización en robótica, simulación física y gemelos digitales.
		-  **Content Creation and Rendering:** Especialización en gráficos de computadora y motores de juegos.
##### Inference Performance

###### nvidia-model-optimizer-recipe-quantification

-  **Enlaces**

	 -  **[NVIDIA TensorRT-LLM ](https://nvidia.github.io/TensorRT-LLM/1.3.0rc24/)**
	 -  **[TensorRT Model Optimizer ](https://github.com/NVIDIA/TensorRT-Model-Optimizer)**
![[barra.gif]]
> [!NOTE]
> 
> **Optimización de Llama 3.1 405B con TensorRT-LLM**
> 
> -  **Objetivo:** Hacer viables modelos gigantes en producción reduciendo latencia, costes y consumo de VRAM en GPUs avanzadas (como la H200).
> -  **INT4 AWQ:** Comprime los pesos a 4 bits, permitiendo ejecutar modelos masivos utilizando únicamente dos GPUs H200 sin una pérdida crítica de precisión.
>   
> **Cuantización FP8 (Estrategia Híbrida)**
> 
> -  **Pesos (Estáticos por canal):** Se calculan de antemano ya que el conocimiento fijo de la red no cambia, ahorrando tiempo de procesamiento.
> -  **Activaciones (Dinámicos por token):** Se calculan al vuelo para adaptarse con flexibilidad a cada palabra nueva del usuario, evitando errores de redondeo.
> -  **Beneficio:** Incrementa el rendimiento hasta **1.44x más throughput** y reduce la latencia manteniendo intacta la precisión en benchmarks.
>     
> **Capas (_Layers_) en los LLMs**
> 
> -  **¿Qué son?:** Bloques modulares y secuenciales donde la información pasa por transformaciones matemáticas pesadas.
>     
> -  **Tipos principales:**
>    
>     -  **Atención (_Attention Layers_):** Conectan palabras para entender el contexto y gestionan la KV Cache.   
>     -  **Lineales / MLP:** Realizan los cálculos masivos del "razonamiento" del modelo. 
>     -  **Proyección final (`lm_head`):** Convierte los vectores internos en probabilidades para elegir el siguiente token.  
> -  **Profundidad:** Varían desde 24–32 capas en modelos compactos hasta 80 o más en redes gigantescas.

Modelos de gran escala como **Llama 3.1 405B** (405B parámetros y soporte para contextos de hasta 128K tokens) exigen una enorme demanda computacional. Para hacerlos viables en producción, la combinación de **TensorRT-LLM** y el **NVIDIA TensorRT Model Optimizer** maximiza el rendimiento, reduce la latencia y optimiza costes operativos en arquitecturas de hardware avanzadas como las GPUs NVIDIA H200.

**Despliegue con INT4 AWQ (Recursos Limitados):** Para escenarios con restricciones estrictas de hardware, la técnica de cuantización INT4 AWQ (_Quantization-Aware Weight_) comprime los pesos de las capas lineales hasta enteros de 4 bits, permitiendo ejecutar modelos gigantescos utilizando únicamente dos GPUs NVIDIA H200 sin pérdida crítica de precisión.

**Cuantización FP8 y ventajas de las receta  personalizadas**

El formato **FP8** (específicamente utilizando el tipo **FP8E4M3**) acelera drásticamente la inferencia en GPUs modernas de arquitecturas Hopper o Ada Lovelace, manteniendo un excelente equilibrio de precisión frente a los formatos tradicionales de 16 bits (BF16 o FP16).

-  **Rendimiento superior:** El uso de una receta personalizada de Post-Training Quantization (PTQ) y Quantization-Aware Training (QAT) en formato FP8 —incorporando cuantización de caché FP8 KV y cuantización estática de autoatención— incrementa significativamente el rendimiento de tokens por segundo (hasta **1.44x** más _throughput_) y reduce la latencia en comparación con la receta oficial de Meta.
-  **Estabilidad en precisión:** A pesar del aumento de velocidad, las técnicas avanzadas de optimización preservan de forma rigurosa la calidad de las respuestas en pruebas de evaluación estándar como MMLU y MT-Bench.
    
**Estructura y flexibilidad del model optimizer (`nvidia-modelopt`)**

Por defecto, la librería incluye perfiles predeterminados como `mtq.FP8_DEFAULT_CFG`, que aplican esquemas simétricos estándar tanto para los pesos como para las activaciones. No obstante, una **receta personalizada** permite configurar de forma granular los siguientes aspectos:

-  **Precisión mixta por capas:** Permite aplicar FP8 en los bloques de atención (como operaciones de matrices en MHA) y combinarlo con otros formatos en los bloques tipo MLP (como NVFP4 o INT4).
-  **Granularidad del escalado:** Define si el escalado de los pesos se realiza por tensor o por canal (`axis=0`), y si las activaciones utilizan cuantización estática basada en calibración o dinámica por token.
-  **Exclusión de módulos:** Desactiva la capa de cuantización en módulos sensibles del modelo, tales como la proyección final `lm_head` o las incrustaciones iniciales.
-  **Algoritmos de calibración:** Facilita el ajuste de algoritmos avanzados (como el cálculo del valor máximo absoluto `amax` o el uso de optimizaciones locales basadas en MSE) para recuperar la máxima precisión en modelos complejos.

```python
import modelopt.torch.quantization as mtq

FP8_CUSTOM_CFG = {
    "quant_cfg": [
        {"quantizer_name": "*weight_quantizer", "cfg": {"num_bits": 8, "axis": 0}},
        {"quantizer_name": "*input_quantizer", "cfg": {"num_bits": 8, "axis": None}},
        {"quantizer_name": "*lm_head*", "cfg": {"enable": False}},
    ],
    "algorithm": "max",
}
```

![[barra.gif]]
-  **Factor de escalado estático para cada canal de peso de salida (antes de la ejecución)**

	-  **¿Qué son los pesos?** Son el "conocimiento" fijo de la red neuronal (los números que se guardaron tras entrenar el modelo). Como ya no cambian, son estáticos.
	-  **¿Qué significa el escalado estático por canal?** Antes de poner a funcionar el modelo, se analizan sus matrices de pesos y se calcula un factor de escala fijo y específico para cada canal o fila de salida.
	-  **Ventaja:** Como los pesos nunca cambian, calcular esto de antemano evita gastar tiempo de procesamiento en tiempo real. Al hacerlo "por canal", se afina mucho mejor el ajuste que si se hiciera a todo el bloque por igual.
-  **Factor de escalado dinámico para cada token (durante la ejecución)**

	-  **¿Qué son las activaciones y los tokens?** Cada vez que le escribes algo al modelo, las palabras se convierten en _tokens_ y generan datos dinámicos (las activaciones) que viajan de una capa a otra. Estos datos cambian radicalmente dependiendo de lo que le preguntes.
	-  **¿Qué significa el escalado dinámico?** Como no se puede predecir qué números exactos va a generar el modelo para cada palabra nueva, el sistema tiene que calcular el factor de escala **al vuelo (en tiempo real)** para cada token justo en el momento en que se procesa.
	-  **Ventaja:** Las activaciones son muy inestables; si se usara un factor fijo para ellas, un número atípico rompería la precisión. Calcularlo dinámicamente adapta el "rango de los 256 casilleros" de FP8 exactamente a lo que el modelo necesita en esa fracción de segundo.
	
	**¿Por qué se hace esto? ("Para preservar la máxima precisión")**
	
	El gran reto de la cuantización a FP8 es meter un universo de números complejos en solo 256 opciones posibles sin corromper el modelo.
	
	Esta estrategia híbrida equilibra la balanza:
	
	1. Deja los **pesos fijos** bien medidos de antemano (estático por canal).
	2. Se adapta con flexibilidad a las **palabras y frases cambiantes** del usuario (dinámico por token).
	    
	Gracias a esta combinación, el modelo sufre el menor "error de redondeo" posible, logrando mantener una precisión altísima a pesar de haber reducido drásticamente su tamaño.
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

###### nvidia-tensor parallel-and-pipeline parallel

> [!NOTE]
> 
> **Paralelismo en TensorRT-LLM para LLMs Gigantes**
> 
>   
> 
> Permite distribuir la carga de trabajo de modelos masivos (como Llama 3.1 405B) entre múltiples GPUs para optimizar tanto la latencia como el rendimiento general (_throughput_).
> 
>   
> 
> ### 1. Paralelismo de Tensores (Tensor Parallelism - TP)
> 
> - **Funcionamiento:** Divide el cálculo de cada capa individual del modelo entre múltiples GPUs, sincronizando los resultados parciales mediante operaciones _AllReduce_.
>     
>       
>     
> - **Ventaja principal:** Altamente efectivo para **reducir la latencia individual** en escenarios de baja concurrencia.
>     
>       
>     
> 
> ### 2. Paralelismo de Tuberías (Pipeline Parallelism - PP)
> 
> - **Funcionamiento:** Distribuye bloques de capas secuenciales (etapas) a lo largo de distintas GPUs, funcionando como una línea de ensamblaje de fábrica donde múltiples solicitudes avanzan simultáneamente.
>     
>       
>     
> - **Ventaja principal:** No reduce la latencia de una sola solicitud, pero es **ideal para maximizar el rendimiento global (_throughput_)** en escenarios de alta concurrencia.
>     
>       
>     
> 
> ### 3. El papel crítico de NVLink y NVSwitch
> 
> - **Alta velocidad:** Proporcionan un bus de comunicación ultrarrápido (hasta 900 GB/s) en arquitecturas NVIDIA Hopper (HGX H100/H200).
>     
>       
>     
> - **Impacto:** Su uso combinado con el paralelismo de tuberías logra **mejoras de hasta 1.5x** en tareas exigentes y benchmarks de la industria.
>

![[barra.gif]]
El despliegue eficiente de modelos de lenguaje grande (LLMs) de gran escala, como Llama 3.1 405B, requiere distribuir la carga de trabajo entre múltiples unidades de procesamiento gráfico (GPUs). Para ello, bibliotecas como TensorRT-LLM integran técnicas avanzadas de paralelismo que optimizan tanto la latencia como el rendimiento general (_throughput_).

-  **Paralelismo de tensores (Tensor Parallelism - TP)**
	![[tensor-parallelism-on-dnn.gif]]
	-  **Funcionamiento:** Divide la ejecución de cada capa individual del modelo entre múltiples GPUs. Cada GPU procesa una porción del cálculo y comparte los resultados parciales mediante operaciones de tipo `AllReduce`.
	-  **Casos de uso y ventajas:** Es un mecanismo de mayor sobrecarga de comunicación, pero altamente efectivo para reducir la latencia en escenarios de baja concurrencia, permitiendo que varios dispositivos colaboren para generar cada token de forma más rápida.
-  **Paralelismo de tuberías (Pipeline Parallelism - PP)**
	![[pipeline-parallelism-on-dnn.gif]]
	-  **Funcionamiento:** Distribuye grupos de capas secuenciales (etapas) del modelo a lo largo de distintas GPUs. La ejecución fluye de un dispositivo a otro y la comunicación se limita estrictamente entre etapas adyacentes.
	-  **Casos de uso y ventajas:** Presenta una sobrecarga menor de comunicación global, lo que lo convierte en el método ideal para maximizar el rendimiento general (_throughput_) y la eficiencia en escenarios de alta concurrencia.
-  **¿Qué significa exactamente?**

	Para entenderlo de forma sencilla, imagina que el modelo se divide en "etapas" o bloques de capas secuenciales a lo largo de varias GPUs:
	
	- **GPU 1** procesa las primeras capas.
	- **GPU 2** procesa las capas intermedias.
	- **GPU 3** procesa las capas finales.
	    
	Cuando un usuario envía una solicitud para generar un token, esa solicitud **debe pasar por cada etapa de forma secuencial**. En un instante determinado:
	
	- Solo la GPU que tiene las capas activas de esa solicitud en ese momento está trabajando en ella.
	- Las demás GPUs están procesando otros tokens o esperando su turno en la cadena.
	- Los recursos de cálculo de todas las GPUs **no se combinan** para acelerar la generación de un solo token.
	
	**Implicaciones prácticas**
	
	-  **No reduce la latencia individual:** Debido a que el poder de cómputo dedicado a un solo token no aumenta por tener más GPUs en la cadena, el paralelismo de pipeline **no es adecuado para escenarios de mínima latencia** (como un chatbot para un solo usuario que necesita una respuesta instantánea).
	-  **Excelente para el rendimiento global (Throughput):** Aunque no acelera una sola solicitud individual, funciona como una línea de ensamblaje de una fábrica. Múltiples solicitudes pueden avanzar por las distintas etapas simultáneamente, lo que permite procesar una gran cantidad de datos en total a gran escala.
-  **El papel crítico de NVLink y NVSwitch**

	-  **Ancho de banda elevado:** Arquitecturas basadas en sistemas NVIDIA Hopper (como HGX H100 o H200) equipadas con switches NVLink proporcionan un bus de comunicación ultrarrápido (hasta 900 GB/s).
	-  **Escalabilidad superior:** Gracias a este tejido de interconexión de alta velocidad, el uso combinado de paralelismo de tuberías y conmutadores NVSwitch incrementa significativamente el rendimiento en tareas exigentes, logrando mejoras de hasta 1,5x en escenarios sensibles al _throughput_ y optimizando los resultados en benchmarks de la industria como MLPerf.

###### 



















































