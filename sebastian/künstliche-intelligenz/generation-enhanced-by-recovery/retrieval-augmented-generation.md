

| Prioridad alta                            | Prioridad media                                                                                              | Prioridad baja | Ideas experimentales |
| ----------------------------------------- | ------------------------------------------------------------------------------------------------------------ | -------------- | -------------------- |
| Entender algoritmos como **BM25, TF-IDF** | Investigar modelos Nemetron "**Safety, Page Elements, Table Structure, Graphic Elements, OCR, VLM, Speech**" |                |                      |

-  **[Generación aumentada por recuperación ](https://www.nvidia.com/en-us/glossary/retrieval-augmented-generation/)**
![[barra.gif]]
La generación aumentada por recuperación (RAG) es una técnica de IA en la que una fuente de datos externa se conecta a un gran modelo de lenguaje (LLM) para generar respuestas en tiempo real. 

**¿Qué es la generación aumentada por recuperación (RAG)?**

Los LLMs son potentes, pero su conocimiento se limita a sus datos de preentrenamiento. Esto supone un reto para las empresas que necesitan aplicaciones de IA que dependan de sus propios documentos y datos específicos.

RAG aborda esta limitación complementando los LLMs con datos externos. Esta técnica recupera información relevante de fuentes estructuradas y no estructuradas diversas, incluyendo texto, imágenes y vídeos, para fundamentar las respuestas de los LLM en los datos propietarios de una empresa, mejorando la precisión y reduciendo las alucinaciones. Esta recuperación activa —a menudo facilitada por bases de datos vectoriales para una búsqueda semántica eficiente— permite a los LLMs proporcionar respuestas más informadas y contextualmente relevantes que si dependieran únicamente de su preentrenamiento.

En resumen, RAG funciona de la siguiente manera:

- ​La consulta de un usuario se codifica en una representación vectorial.
- ​El sistema busca datos semánticamente similares.
- ​La información recuperada más relevante se añade al contexto del modelo.
- ​Se genera una respuesta que se fundamenta en los datos recuperados.

RAG te permite integrar conocimientos especializados sin tener que reentrenar completamente el LLM, ahorrando recursos de cómputo.

-  **Búsqueda semántica frente a búsqueda por palabras clave**

	La búsqueda por palabras clave se centra en encontrar coincidencias exactas con las palabras o frases que introduce un usuario, tratando la consulta de forma literal y con un conocimiento limitado de sinónimos o contexto. Por ejemplo, una búsqueda con palabra clave "mejores zapatillas de correr para pies planos" puede devolver solo resultados que contengan esa frase exacta.
	
	Por el contrario, la búsqueda semántica busca comprender el significado y la intención detrás de la consulta analizando el contexto y las relaciones entre palabras e historial de usuario para ofrecer resultados más relevantes. Una búsqueda semántica de "mejores zapatillas para pies planos" puede devolver resultados de "zapatillas de estabilidad", "zapatillas de correr con soporte de arco" o incluso reseñas de modelos específicos de zapatos adecuados para pies planos, incluso si esas palabras clave exactas no se usaron en la consulta.
	
	Básicamente, la búsqueda por palabras clave busca las palabras, mientras que la búsqueda semántica busca el significado.
-  **¿Qué es la recuperación de información y en qué se diferencia de RAG?**

	La recuperación de información es el proceso de encontrar documentos o datos relevantes a partir de una consulta de usuario. Utiliza algoritmos como BM25, TF-IDF y búsqueda vectorial para devolver una lista de fuentes, que los usuarios deben revisar manualmente para obtener información sobre la información. En lugar de simplemente devolver documentos, RAG sintetiza una respuesta directa usando los datos recuperados, reduciendo la necesidad de interpretación manual. Mientras que la recuperación de información se centra en encontrar contenido relevante, RAG utiliza ese contenido para generar respuestas coherentes y conscientes del contexto en tiempo real.
-  **¿Cuáles son los componentes clave de una arquitectura RAG?**

	Una pipeline RAG típica funciona en tres pasos: extracción (donde se ingieren e incrustan los datos), recuperación (donde se encuentra información relevante) y generación (donde se crean las respuestas). Cada fase es fundamental para garantizar que una tubería RAG recupere datos precisos, fiables y relevantes.
	
	-  **Extracción:** Durante la fase de extracción, los datos empresariales se recopilan, transforman, indexan y almacenan en una base de datos vectorial. En esta fase, un modelo de incrustación convierte contenido textual, de audio o visual en representaciones vectoriales de alta dimensión, permitiendo búsquedas basadas en similitudes. Los vectores de incrustación se indexan (por ejemplo, como grafos) antes de almacenarse para una recuperación rápida utilizando métodos aproximados de vecino más cercano (ANN).
	-  **Recuperación:** La recuperación identifica y recupera datos relevantes utilizando técnicas de búsqueda vectorial y por palabras clave. Muchos sistemas RAG también utilizan un modelo de reclasificación para identificar cuál de los datos recuperados es el más relevante. Añadir un modelo de reclasificación a la fase de recuperación ayuda al sistema RAG a mejorar la precisión general de la generación final de respuesta.
	-  **Generación:** Finalmente, durante la fase de generación, los LLMs combinan el prompt del usuario con los datos recuperados para elaborar respuestas que son simultáneamente semánticas y contextualmente precisas. Esta combinación otorga a RAG una ventaja clara sobre las soluciones solo LLM.

![[componentes-clave-de-una-arquitectura-rag.png]]
🤢 Gems: Canva





























































