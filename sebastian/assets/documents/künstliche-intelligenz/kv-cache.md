---
def-type: atomic
version: 1.01
id: def-kv-cache-optimizacion-llm
status: queued
category: inteligencia-artificial
date: 2026-09-06
tags:
  - inteligencia-artificial
  - llm
  - kv-cache
  - optimizacion
  - tensorrt-llm
  - rendimiento
aliases:
  - key-value cache
  - caché de claves y valores
  - optimización de kv cache
---
> [!NOTE] Es una caché de Claves (K) y Valores (V) que almacena vectores ya calculados en la VRAM de la GPU. Evita recalcular la atención de todo el historial de texto en cada paso autorregresivo, acelerando drásticamente la generación.
> 
> **El gran reto:** Consume muchísima memoria VRAM, lo que puede provocar errores de falta de memoria (_Out of Memory_) con contextos largos o muchos usuarios.

-  **¿Qué es el KV Cache?**

	El **KV Cache** (Key-Value Cache o Caché de Claves y Valores) es una técnica de optimización fundamental en la inferencia de los Modelos de Lenguaje Grandes (LLMs) basados en la arquitectura _Transformer_. Su propósito principal es acelerar la generación de texto de forma drástica, evitando cálculos innecesarios.
	
	-  **¿Cómo funciona el problema sin KV Cache?**
	
		Los LLMs generan texto de forma **autorregresiva**, es decir, palabra por palabra (o _token_ por _token_).
		
		-  En cada paso de la generación, el modelo debe evaluar la relación de atención (_Self-Attention_) entre el nuevo token y todos los tokens anteriores.
		-  Sin una caché, el sistema tendría que recalcular las matrices de Claves ($K$) y Valores ($V$) de **toda la historia del texto desde cero** cada vez que añade un solo token.
		-  Esto genera una complejidad computacional enorme, haciendo que la generación se vuelva extremadamente lenta a medida que el prompt o la respuesta se alargan.
	-  **La solución del KV Cache**
	
		-  **Almacenamiento temporal:** Guarda en la memoria de la GPU los vectores de Clave ($K$) y Valor ($V$) que ya fueron calculados para los tokens anteriores.
		-  **Reutilización directa:** Cuando se genera el siguiente token, el modelo solo calcula el $K$ y el $V$ correspondientes a esa nueva palabra y los añade al caché.
		-  **Aceleración masiva:** Se pasa de recalcular todo el historial a solo procesar el incremento nuevo, reduciendo el tiempo de respuesta de manera exponencial.
		
		El gran reto: El consumo de memoria
		
		Aunque acelera la velocidad, el KV Cache tiene un talón de Aquiles importante: **consume una cantidad masiva de memoria VRAM**.
		
		- A mayor tamaño de contexto (ventanas de miles de tokens) y mayor número de usuarios concurrentes (_batch size_), más espacio físico ocupa la caché en la tarjeta gráfica.
		- Si el caché supera la memoria disponible, el servidor sufre errores de falta de memoria (_Out of Memory_ o _OOM_).
		- Para mitigar esto, hoy en día se utilizan tecnologías de gestión avanzada de memoria como **PagedAttention** (presente en motores de inferencia como vLLM).
	
	Al reutilizar la caché KV, hay que prestar mucha atención a cuánto tiempo permanece en memoria, qué componentes expulsar primero cuando la memoria está llena y cuándo puede reutilizarse para nuevas indicaciones entrantes. Optimizar estos factores puede conducir a mejoras incrementales en el rendimiento en la reutilización de la caché KV. NVIDIA TensorRT-LLM ofrece tres características clave que abordan específicamente estas áreas.
-  **Principios matemáticos (Por qué existe)**

	Una combinación de **principios matemáticos (álgebra lineal)** y **algoritmos de gestión de sistemas** que dictan cómo la memoria y los cálculos deben comportarse.
	
	Para entenderlo con precisión, se divide en dos partes:
	
	1. **La base matemática (Por qué existe)**
	
		Matemáticamente, el mecanismo de autoatención (_Self-Attention_) en un **Transformer** calcula la relación entre tokens usando las matrices de Consulta ($Q$), Clave ($K$) y Valor ($V$) mediante la fórmula clásica:
		
		$$\text{Attention}(Q, K, V) = \text{softmax}\left(\frac{Q K^T}{\sqrt{d_k}}\right) V$$
		
		-  **Sin KV Cache:** En cada paso de generación de un nuevo token, el modelo multiplica $Q$ por la transpuesta de $K$ ($K^T$) recalculando todas las interacciones desde el primer token hasta el último. Es una redundancia matemática masiva.
		-  **Con KV Cache:** El algoritmo matemático **guarda en memoria** los resultados anteriores de las matrices $K$ y $V$. Así, en lugar de recalcular todo, solo añade las nuevas filas correspondientes al token actual:
		
		$$K_{\text{total}} = [K_{\text{historico}}, K_{\text{nuevo}}]$$
	2. **El algoritmo de gestión y optimización (Cómo se comporta)**
	
		Como los vectores $K$ y $V$ crecen sin parar a medida que el texto es más largo, el "algoritmo" que optimiza su comportamiento en la vida real no es solo una fórmula matemática, sino una **estrategia de software de sistemas** (muy similar a cómo un sistema operativo maneja la memoria RAM).
		
		Entre los algoritmos y técnicas de optimización más importantes que gestionan el KV Cache se encuentran:
		
		-  **PagedAttention (vLLM):** Toma la idea de la **memoria virtual** de los sistemas operativos (paginación). Divide el KV Cache en bloques lógicos pequeños que no necesitan estar contiguos en la VRAM, eliminando el desperdicio de memoria por fragmentación.
		-  **GQA (Grouped-Query Attention):** Una modificación arquitectónica donde varios _heads_ (cabezas de atención) comparten las mismas claves y valores ($K$ y $V$), reduciendo drásticamente el tamaño físico que el caché debe ocupar.
		-  **Cuantización del KV Cache:** Algoritmos que comprimen los datos de 16 bits a 8 o 4 bits para que ocupen menos espacio sin perder demasiada precisión en el texto generado.
-  **Reutilización temprana de la caché KV**

	Los algoritmos de reutilización tradicionales requieren que todo el cálculo de la caché KV se complete antes de que cualquier parte pueda reutilizarse con nuevas indicaciones de usuario. En escenarios como los chatbots empresariales, donde las indicaciones del sistema —instrucciones predefinidas añadidas a las consultas del usuario— son esenciales para dirigir las respuestas del LLM conforme a las directrices empresariales, este método puede ser ineficiente.
	
	Cuando un aumento de usuarios interactúa simultáneamente con el chatbot, cada usuario requeriría un cálculo separado de la caché KV de prompt del sistema. **Con TensorRT-LLM, podemos reutilizar el prompt del sistema a medida que se genera en tiempo real, permitiendo que se comparta entre todos los usuarios durante la ráfaga, en lugar de recalcularlo para cada usuario. Esto puede acelerar significativamente la inferencia para casos de uso que requieren prompts del sistema hasta en 5 veces.**
	
	![[reutilizacion-caches-kv-tensorrt-llm-puede-acelerar-ttft-hasta-cinco-veces.png]]
-  **Dimensionamiento flexible de bloques de caché KV**

	En las implementaciones de reutilización, solo se pueden asignar bloques completos de memoria caché para su reutilización. Por ejemplo, si el tamaño del bloque de memoria caché es de 64 tokens y la caché KV de 80 tokens, solo se almacenarán 64 tokens para su reutilización, mientras que los 16 tokens restantes deberán ser recalculados. Sin embargo, si el tamaño del bloque de memoria se reduce a 16 tokens, los 64 tokens pueden almacenarse en cinco bloques de memoria, eliminando la necesidad de recomputar.
	
	Este efecto es más pronunciado cuando las secuencias de entrada son cortas. Para secuencias de entrada largas, bloques más grandes pueden ser más beneficiosos. Como está claro, cuanto más granular sea el control que tengas sobre la caché de KV, mejor podrás optimizarlo para tu caso de uso específico.
	
	TensorRT-LLM  proporciona un control detallado sobre los bloques de memoria caché KV, dando a los desarrolladores la capacidad de dividirlos en bloques más pequeños entre 64 y 2 tokens. Esto optimiza el uso de la memoria asignada, aumenta las tasas de reutilización y mejora la TTFT. Al ejecutar LLAMA70B en GPUs NVIDIA H100 Tensor Core, podemos acelerar la TTFT hasta un 7% en entornos multiusuario reduciendo el tamaño del bloque de caché KV de 64 a 8 tokens.
-  **Protocolos eficientes de desalojo de caché KV**

	Particionar la caché KV en bloques más pequeños y expulsar los no utilizados puede ser eficaz para optimizar la memoria, pero introduce complejidades de dependencia. Cuando se utiliza un bloque específico para generar una respuesta y el resultado se almacena como un nuevo bloque, puede formar una estructura de dependencias en forma de árbol.
	
	Con el tiempo, los contadores que rastrean el uso de los bloques fuente (las ramas) pueden volverse obsoletos a medida que se reutilizan los nodos dependientes (las hojas). Expulsar el bloque fuente requiere entonces la expulsión de todos los bloques dependientes, lo que requeriría recalcular la caché KV para nuevos prompts de usuario, aumentando la TTFT.
	
	Para abordar este desafío, TensorRT-LLM incluye algoritmos inteligentes de desalojo que pueden rastrear los nodos dependientes desde sus nodos de origen y expulsar primero a los dependientes, incluso si cuentan contadores de reutilización más recientes. Esto garantiza una gestión de memoria más eficiente y evita desahucios innecesarios de bloques dependientes.
	
	![[logical-representation-kv-cache.png]]

**Técnicas principales de gestión**

- **PagedAttention:** Paginación de memoria (como en los sistemas operativos) para evitar la fragmentación.
- **GQA (Grouped-Query Attention):** Varias cabezas comparten las mismas claves y valores para reducir tamaño.
- **Cuantización:** Compresión de datos de 16 bits a 8 o 4 bits.
    
**Mejoras avanzadas en NVIDIA TensorRT-LLM**

- **Reutilización temprana de prompts del sistema:** Permite compartir las instrucciones base en tiempo real entre múltiples usuarios concurrentes, acelerando el _Time to First Token_ (TTFT) hasta 5 veces.
- **Dimensionamiento flexible de bloques:** Reducir el tamaño de los bloques de caché (por ejemplo, de 64 a 8 tokens) evita recalcular fragmentos sobrantes, mejorando el TTFT hasta un 7%.
- **Desalojo inteligente de caché:** Algoritmos avanzados que gestionan las dependencias en estructura de árbol al expulsar bloques, evitando recálculos masivos innecesarios cuando se libera memoria.


























