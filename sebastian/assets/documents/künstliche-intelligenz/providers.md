

![[barra.gif]]
##### **[PrivateMode API](https://docs.privatemode.ai/reference/)**

Esta documentación detalla las especificaciones técnicas, cuotas de consumo y catálogo de modelos de la API de PrivateMode (_Proxyless API_), con foco en el plan gratuito (**Free Tier**) e integración en entornos de desarrollo (IDEs como Zed o VS Code).
	
**Arquitectura de Rate Limits (Plan Free)**

El sistema de control de cuotas opera mediante un esquema de dos fases: un saldo de bienvenida único y límites cíclicos mensuales restringidos por topes por minuto.
	
Al crear una organización, se asigna una cuota única e irrepetible de **5.000.000 de tokens**.
	
-  **Funcionamiento:** Todos los consumos de entrada (_prompt_), salida (_completion_) y audio se descuentan prioritariamente de este saldo.
-  Durante la vigencia de este saldo positivo, **no se aplican las restricciones de cuotas mensuales estándar**, pero **sí permanecen activos los límites por minuto**.
-  **Tokens en caché:** Los _cached prompt tokens_ no consumen saldo del bono de bienvenida.

**Cuotas mensuales y topes por minuto**

Una vez agotado el bono de bienvenida, se activan los siguientes límites mensuales y por minuto:

| **Métrica**                            | **Límite por Minuto (RPM / TPM)** | **Cuota Mensual (Free Tier)** |
| -------------------------------------- | --------------------------------- | ----------------------------- |
| **Solicitudes (Requests)**             | 40 req/min                        | N/A                           |
| **Tokens de Entrada (Prompt)**         | 200.000 tokens/min                | 1.000.000 tokens/mes          |
| **Tokens de Salida (Completion)**      | 20.000 tokens/min                 | 1.000.000 tokens/mes          |
| **Tokens de Entrada en Caché**         | 500.000 tokens/min                | Sin límite mensual            |
| **Duración de Audio (Speech-to-Text)** | 100 min/min                       | 100 min/mes                   |

> **Nota de concurrencia:** Si cualquier límite por minuto se sobrepasa (por ejemplo, al realizar 40 peticiones cortas en menos de 60 segundos), el servidor retornará un error HTTP `429 Too Many Requests` hasta el inicio del siguiente minuto.

**Cálculo de consumo efectivo (Multiplicadores de modelo)**

El consumo real aplicado a las cuotas mensuales y límites por minuto se calcula mediante la fórmula:

$$\text{Consumo Efectivo} = \text{Cantidad de Tokens} \times \text{Multiplicador del Modelo}$$

| **Modelo**             | **Multiplicador** | **Límite Efectivo de Entrada / min** | **Cuota Mensual Efectiva (Free)** |
| ---------------------- | ----------------- | ------------------------------------ | --------------------------------- |
| **GLM-5.3**            | `1.0`             | 200.000 tokens/min                   | 1.000.000 tokens/mes              |
| **GLM-5.3-Flash**      | `1.0`             | 200.000 tokens/min                   | 1.000.000 tokens/mes              |
| **DeepSeek OCR 2**     | `1.0`             | 200.000 tokens/min                   | 1.000.000 tokens/mes              |
| **gpt-oss-120b**       | `2.0`             | 100.000 tokens/min                   | 500.000 tokens/mes                |
| **Qwen3-Embedding 4B** | `0.5`             | 400.000 tokens/min                   | 2.000.000 tokens/mes              |

**GLM-5.3 (`glm-5.3` / `glm-latest`)**

-  **Uso:** Modelo principal para razonamiento complejo, refactorización y generación de código.
-  **Ventana de contexto:** 1.000.000 tokens.
-  **Capacidades:** Texto, llamadas a herramientas (_tool calling_), salidas estructuradas, razonamiento interno (_thinking_).
-  **Control de razonamiento:** Ajustado a `max` por defecto (no conmutable en API).

**GLM-5.3-Flash (`glm-5.3-flash` / `glm-flash-latest`)**

-  **Uso:** Versión optimizada en velocidad y baja latencia.
-  **Ventana de contexto:** 1.000.000 tokens.
-  **Capacidades:** Texto, entrada de imágenes (visión multimodal), herramientas, salidas estructuradas, razonamiento interno.

**gpt-oss-120b (`gpt-oss-120b`)**

-  **Uso:** Modelo de pesos abiertos de alta capacidad.
-  **Capacidades:** Texto, herramientas, razonamiento configurable.
-  **Control de razonamiento:** Configurable mediante `reasoning_effort` (`low`, `medium`, `high`).
    
**DeepSeek OCR 2 (`deepseek-ocr-2`)**

-  **Uso:** Extracción de texto y análisis de documentos desde imágenes.
-  **Ventana de Contexto:** 8.192 tokens.
-  **Endpoint:** `/v1/chat/completions`
    
**Qwen3-Embedding 4B (`qwen3-embedding-4b`)**

-  **Uso:** Generación de _embeddings_ para búsqueda semántica y arquitecturas RAG.
-  **Ventana de contexto:** 32.768 tokens.
-  **Dimensiones de salida:** 1024 o 2560 dimensiones (vía entrenamiento Matryoshka).
-  **Endpoint:** `/v1/embeddings`

**Voxtral Mini 3B (`voxtral-mini-3b`) / Whisper Large-v3 (`whisper-large-v3`)**

- **Límite por petición:** Archivos de hasta 50 MB / 1 hora de duración.
- **Tasa de conversión de cuota:** $1 \text{ minuto de audio} \approx 2.800 \text{ tokens}$.
- **Endpoint:** `/v1/audio/transcriptions`

**Guía de configuración recomendada para IDEs**

Para prevenir errores de tipo `429 Rate Limit Exceeded` en editores como Zed, Cursor o VS Code bajo el plan Free, se deben aplicar los siguientes valores límite en la configuración del proveedor OpenAI-Compatible:

```JSON
{
  "provider": "PrivateMode",
  "base_url": "https://proxyless-api.privatemode.ai/v1",
  "parameters": {
    "max_completion_tokens": 20000,
    "max_output_tokens": 20000,
    "preserve_thinking_in_history": false,
    "default_reasoning_effort": "minimal"
  }
}
```

**Reglas de optimización de tokens**

1. **Tope de salida:** Nunca configurar `max_output_tokens` por encima de **20.000** (límite estricto por minuto de tokens de salida).
2. **Desactivar historial de pensamiento:** Asegurar que los bloques de razonamiento (_thinking process_) no se envíen de vuelta en el contexto del historial para evitar la saturación rápida de la cuota de entrada de 1M/mes.

##### **[Autohand](https://console.autohand.ai/billing)**

Autohand es una plataforma de ingeniería de software asistida por agentes enfocada en automatizar tareas repetibles del ciclo de vida del desarrollo de software (SDLC). Funciona mediante la combinación de dos sistemas principales: 👉 **[Casos de uso](https://autohand.ai/use-cases/)** 👈

*  **Autohand Code:** Se encarga del trabajo activo dentro de los repositorios (escribir código, crear parches, ejecutar pruebas e inspeccionar archivos).
*  **Weka:** Funciona como un motor de decisiones y políticas. Evalúa estados específicos de la aplicación (como resultados de pruebas o análisis de seguridad) para tomar decisiones automatizadas y deterministas, autorizando o bloqueando procesos.

**¿En qué se diferencia de Auggie?**

- La diferencia radica en la **capacidad de acción**. Como vimos antes, **Auggie** es un indexador de *solo lectura* (un motor RAG local); su única misión es leer tu repositorio y enviarle el contexto a una IA para que te responda dudas o te sugiera código mientras tú programas.
- **Autohand**, por el contrario, es un **agente autónomo activo**. No solo lee el código, sino que toma el control para ejecutar el trabajo: edita los archivos, arregla pruebas fallidas, diseña esquemas de bases de datos, redacta documentación y toma decisiones de bloqueo (con Weka) en los despliegues sin necesidad de que tú intervengas en el editor.

**Casos de uso SDLC (Autohand Code y Weka)**

De acuerdo con la documentación que compartiste, así se distribuyen las acciones de Autohand Code y las decisiones de Weka en las fases clave del desarrollo:

*  **Descubrimiento:**
  
	*  Rastrea módulos desconocidos, traza peticiones y mapea la arquitectura y los comandos de validación antes de realizar la primera edición.
	*  Convierte un problema (de Jira, GitHub o Linear) en un plan de implementación detallado con alcance, archivos involucrados y notas de despliegue.
*  **Implementación:**

	*  Genera parches con alcance específico basándose en patrones cercanos del código.
	*  Ejecuta tareas complejas como crear una API REST desde cero, extraer componentes de frontend (ej. Vue) a partir de un resumen, dividir monolitos en módulos independientes o migrar de forma segura bases de código de JavaScript a TypeScript.
*  **Revisión (Calidad):**
  
	*  Realiza revisiones automáticas de ramas (Branch Review) para detectar regresiones, falta de pruebas, derivaciones del producto y vulnerabilidades.
	*  Lee los comentarios dejados por humanos en un Pull Request (PR), asigna cada comentario a una parte del código, aplica los parches necesarios en los archivos y vuelve a ejecutar las comprobaciones.
*  **Pruebas:**
  
	*  *Autohand Code* inspecciona pruebas fallidas analizando el registro de errores, parchea la causa raíz y vuelve a ejecutar la suite.
	*  Genera pruebas unitarias para código existente encontrando casos límite.
	*  Identifica y corrige pruebas inestables (*flaky tests*), reproduciendo problemas de temporización o filtraciones de estado.
	*  Configura arneses de pruebas para el backend (fixtures, mocks) y añade pruebas de integración o E2E para entornos web.
*  **Liberación (Entrega y Despliegue):**
  
	*  Automatiza la redacción de notas de lanzamiento (Release Notes) inspeccionando los commits y PRs fusionados.
	*  Añade y repara trabajos en pipelines de CI/CD (linting, compilación, despliegue).
	*  *Intervención de Weka:* Actúa como una compuerta en el despliegue. Weka evalúa el riesgo del cambio, el estado de los incidentes y las pruebas, aplicando un umbral determinista para decidir si el código pasa a producción o se detiene. Weka también puede bloquear herramientas o comandos riesgosos propuestos por otros agentes.
*  **Calidad de datos:**
  
	*  Modela esquemas de bases de datos proponiendo tablas, relaciones, índices y restricciones.
	*  Escribe migraciones de base de datos de forma segura, actualizando simultáneamente el código de la API que depende de esos cambios.
*  **Respuesta en producción (Operaciones/SRE):**
  
	*  Investiga errores de producción analizando trazas de pila (stack traces) o informes de usuarios para encontrar y parchear la ruta que está fallando.
	*  Optimiza endpoints o flujos lentos rastreando el acceso a datos y la cobertura.
	*  Añade instrumentación de observabilidad (logs, métricas y trazas) asegurando que no se filtren datos sensibles.
	*  Automatiza "runbooks" operativos convirtiendo manuales de resolución de problemas en scripts y comprobaciones ejecutables.