
Catálogo acumulado de modelos que quedaron fuera de los proveedores de ZCode porque su función no es chat/agente. Se irá ampliando con más proveedores.

**Leyenda de funciones:** 

- `speech` = síntesis de voz
- `embedding` = vectorización para búsqueda/RAG
- `rerank` = reordenamiento de resultados
- `moderation` = filtro de contenido
- `harness-only` = restringido a otros clientes agénticos
- `transcription` = voz a texto

##### **Análisis multi-proveedor: coste × calidad 06112026**

Datos: **QI v3** de Artificial Analysis (API free de AA donde cubre + tablas públicas WhatLLM/explore, misma metodología) × **precios oficiales** de cada panel (Nebius, River, Meta; Alibaba = referencia mediana AA). Mezcla = (in + 3×out)/4. Valor = QI ÷ mezcla. Los QI de escala v2/BenchLM se listan como referencia pero NO entran en el ratio (escalas no comparables).

**Tabla 1 — modelos de pago ordenados por valor (QI/$):**

|Puesto|Proveedor|Modelo|QI v3|In $/M|Out $/M|Mezcla|Valor QI/$|Precisión|
|-|-|-|-|-|-|-|-|-|
|1|River|zai-org/GLM-5.3-Flash|27.8|$0.12|$0.4|$0.33|**84.2**| —|
|2|River|deepseek-ai/DeepSeek-V4.1-Flash|32.5|$0.12|$0.48|$0.39|**83.3**| —|
|3|River|deepseek-ai/DeepSeek-V4.1-Flash-1017|32.5|$0.12|$0.48|$0.39|**83.3**| —|
|4|Nebius|zai-org/GLM-5.3-Flash|27.8|$0.15|$0.5|$0.41|**67.8**| —|
|5|Nebius|MiniMaxAI/MiniMax-M3.1-Flash|28.9|$0.15|$0.6|$0.49|**59**| —|
|6|River|nvidia/Nemotron-3.5-Super-VL-NVFP4|13.6|$0.07|$0.37|$0.29|**46.9**| —|
|7|Nebius|deepseek-ai/DeepSeek-V4.1-Flash-1017|32.5|$0.3|$1.2|$0.97|**33.5**| —|
|8|Alibaba|deepseek-v4.1-flash|32.5|$0.3|$1.2|$0.97|**33.5**| —|
|9|Alibaba|deepseek-v4.1-flash-1017|32.5|$0.3|$1.2|$0.97|**33.5**| —|
|10|Nebius|reflection/beam|17.7|$0.25|$1|$0.81|**21.9**|1M ctx —|
|11|Nebius|MiniMaxAI/MiniMax-M3|18.9|$0.3|$1.2|$0.97|**19.5**| —|
|12|Nebius|nvidia/Nemotron-3.5-Super-VL|13.6|$0.3|$0.9|$0.75|**18.1**| —|
|13|River|Qwen/Qwen3.8-27B-FP8|20.1|$0.1|$2|$1.52|**13.2**| —|
|14|River|zai-org/GLM-5.3|31.7|$1.12|$3.52|$2.92|**10.9**| —|
|15|Nebius|zai-org/GLM-5.3|31.7|$1.4|$4.4|$3.65|**8.7**| —|
|16|Alibaba|glm-5.3|31.7|$1.4|$4.4|$3.65|**8.7**| —|
|17|Nebius|Qwen/Qwen3.8-27B|20.1|$0.45|$3|$2.36|**8.5**|visión —|
|18|Alibaba|qwen3.8-27b|20.1|$0.5|$3|$2.38|**8.4**|visión —|
|19|Nebius|meta-models/muse-spark-open|24.9|$1.25|$4.25|$3.5|**7.1**|visión —|
|20|Alibaba|qwen3.8-max-0902|33.6|$2|$6|$5|**6.7**|visión —|
|21|Alibaba|qwen3.8-max|33.6|$2|$6|$5|**6.7**|visión —|
|22|River|moonshotai/Kimi-K3.1-Pro|46|$2|$10|$8|**5.8**| —|
|23|Nebius|moonshotai/Kimi-K3.1-Pro|46|$2|$10|$8|**5.8**|visión —|
|24|Nebius|nvidia/Nemotron-3-Ultra-550b-a55b|11.8|$1|$3|$2.5|**4.7**|1M ctx —|

**Tabla 2 — modelos de pago sin QI v3 (ordenados por coste de mezcla):**

|Proveedor|Modelo|Ref. calidad|In $/M|Out $/M|Mezcla|Nota|
|-|-|-|-|-|-|-|
|Meta|muse-spark-1.3-contributor|—|$0.1|$0.2|$0.18|entrena con tus datos|
|Meta|muse-spark-1.2-contributor|—|$0.1|$0.2|$0.18|entrena con tus datos|
|Nebius|nvidia/Nemotron-3_5-Lightning|—|$0.06|$0.24|$0.2||
|Nebius|google/gemma-3-27b-it|—|$0.1|$0.3|$0.25|visión|
|Nebius|Qwen/Qwen3-30B-A3B-Instruct-2507|—|$0.1|$0.3|$0.25||
|Alibaba|qwen3.8-flash|—|$0.15|$0.47|$0.39|visión|
|Nebius|openai/gpt-oss-120b|BenchLM 40.7|$0.15|$0.6|$0.49||
|Alibaba|qwen-plus|—|$0.4|$1.2|$1||
|Nebius|NousResearch/Hermes-4-405B|—|$1|$3|$2.5||
|Nebius|deepseek-ai/DeepSeek-V4-Pro-0813|—|$1.32|$3.96|$3.3||
|Meta|muse-spark-1.3|—|$1.25|$4.25|$3.5||
|Meta|muse-spark-1.2|—|$1.25|$4.25|$3.5||
|Meta|muse-spark-1.1|—|$1.25|$4.25|$3.5||
|Nebius|zai-org/GLM-5.2|52.6|$1.4|$4.4|$3.65||
|Alibaba|deepseek-v4-pro-0813|—|$2.4|$4.8|$4.2||
|Alibaba|qwen3.8-2.4t-a95b|—|$2|$6|$5||
|River|moonshotai/Kimi-K3|59.7|$3|$15|$12||
|Nebius|moonshotai/Kimi-K3|59.7|$3|$15|$12|visión|
|Alibaba|kimi-k3|59.7|$3|$15|$12|visión|

**Tabla 3 — capa $0 (créditos free de Ollama y endpoints :free de OpenRouter; misma calidad que sus pesos base):**

|Proveedor|Modelo|QI v3|
|-|-|-|
|OpenRouter|minimax/minimax-m3.1-flash:free|28,9|
|Ollama|beam|17,7|
|OpenRouter|nvidia/nemotron-3.5-super-vl:free|13,6|
|Ollama|nemotron-3-ultra|11,8|
|OpenRouter|nvidia/nemotron-3-ultra-550b-a55b:free|11,8|
|Ollama|gemma4:31b|—|
|Ollama|gpt-oss:120b|—|
|Ollama|gpt-oss:20b|—|
|Ollama|nemotron-3-super|—|
|Ollama|nemotron-3-nano:30b|—|
|OpenRouter|stealth/crouton-alpha|—|
|OpenRouter|recursive/flint-v1.0:free|—|
|OpenRouter|cohere/north-mini-code:free|—|
|OpenRouter|google/gemma-4-31b-it:free|—|
|OpenRouter|google/gemma-4-26b-a4b-it:free|—|
|OpenRouter|dots-studio/dots-3-note-preview:free|—|
|OpenRouter|xingchen-agi/xing4.0-29b-a4b:free|—|
|OpenRouter|liquid/lfm-2.5-2.6b:free|—|
|OpenRouter|nvidia/nemotron-3.5-lightning:free|—|
|OpenRouter|nvidia/nemotron-3-nano-omni-30b-a3b-reasoning:free|—|
|OpenRouter|nvidia/nemotron-3.5-content-safety:free|—|

**Lectura del análisis:** River emerge como el host con mejor valor del conjunto — su DeepSeek V4.1 Flash ($0,39 mezcla, QI 32,5) y su GLM-5.3-Flash ($0,33, QI 27,8) baten a Nebius en el mismo modelo (Nebius cobra 2-3× más por los mismos pesos). El escalón de calidad lo marca Kimi-K3.1-Pro (QI 46, mezcla $8) — el único por encima de QI 40 en toda la lista multi-proveedor. En la capa $0, MiniMax-M3.1-Flash free (QI 28,9) y Nemotron 3.5 Super VL free (13,6) son los más capaces, con la limitación de 50 req/día. GLM-5.3-Flash es la mejor compra global de pago: QI 27,8 por $0,33-0,41 de mezcla.

**Tabla 4 — capacidad intrínseca: benchmarks reportados por los creadores (precisión completa, agnósticos de host y cuantización):**

Estos números salen de las model cards/blogs oficiales (medidos por cada laboratorio en su precisión de referencia), no de endpoints servidos — son el techo de lo que cada modelo puede dar si el host no degrada con cuantización agresiva. Ordenados por GPQA Diamond. **Advertencia doble:** (1) cada laboratorio usa su propio harness — la comparabilidad entre creadores es orientativa, no exacta; (2) un QI de host bajo no contradice estos números: refleja la degradación del serving cuantizado y/o variantes de esfuerzo medidas.

|Familia (parámetros)|GPQA Diamond|SWE-bench Verified|AIME|Otros reportados|Fuente|
|-|-|-|-|-|-|
|**Kimi-K3** (2.8T MoE)|**93,5%**|—|—|HLE-Full 67,3|[kimi.ai/blog/kimi-k3](https://www.kimi.ai/blog/kimi-k3)|
|**DeepSeek V4.1 Flash**|**90,9%**|— (DeepSWE v1.1 **74,2**; 1017: 77,0)|—|Terminal-Bench 2.1 **90,6**; AutomationBench 54,8; SkillsBench #1/35|[llm-stats](https://llm-stats.com/models/deepseek-v4.1-flash)|
|**Beam 1.0** (501B-A23B)|**90,6%**|**81,6%**|97,7%|LiveCodeBench 88,3|[HF reflection/Beam-1.0](https://huggingface.co/reflection/Beam-1.0-501B-A23B)|
|**Muse Spark Open** (816B-A42B)|~89,7%|**84,3%**|91,1%|JobBench 61,8 (xhigh)|[research.meta.ai/blog/muse-spark-open](https://research.meta.ai/blog/muse-spark-open)|
|**Nemotron 3 Ultra** (550B-A55B)|**86,7%**|~69%|>90%|τ²-Bench 83,3; SciCode 40,3|[NVIDIA dev blog + HF card](https://huggingface.co/nvidia/NVIDIA-Nemotron-3-Ultra-550B-A55B-BF16)|
|**GLM-5.3** (750B MoE)|—|—|—|+50% vs GLM-5.2 en Z.ai Code Bench; Terminal-Bench 3.0 +4,6|[z.ai/blog/glm-5.3](https://z.ai/blog/glm-5.3)|
|**gpt-oss-120b** (117B-A5,1)|—|—|—|Nivel o4-mini (OpenAI, reasoning high)|[ollama.com/library/gpt-oss:120b](https://ollama.com/library/gpt-oss:120b)|

**Cruce con el análisis por host (lo que explica las diferencias):** la caída de Beam de GPQA 90,6 (creador) a QI v3 17,7 en Nebius, o de Muse Spark Open de 89,7 a 24,9, NO significa que los modelos sean malos — combina tres efectos: (1) serving cuantizado (NVFP4/FP8 en Nebius), (2) el QI de AA se mide a un esfuerzo concreto (xhigh/high) con su propio harness, y (3) las escalas del índice. Para elegir host: Tabla 1 (valor QI/$). Para elegir familia: esta Tabla 4. Kimi-K3.1-Pro no tiene model card completa aún (AA le mide QI 44-46 en max, 11 puntos sobre K3).

##### ![[barra.gif]]
##### **Mistral**

Proveedor `mistral` en ZCode — endpoint `https://api.mistral.ai/v1`, OpenAI-compatible, clave `mstrl_...`. Auditado **07/11/2026**: catálogo de **55 modelos**; podado a **14 asociados** — solo los empleables por chat con tu tier (32 retirados: tier-blocked 403, Labs 403, OCR/embeddings/moderation/Voxtral-mini-TTS-transcribe que no aceptan chat). Límites del panel destacados: `mistral-large-2512` **250K TPM**, `mistral-embed-2312` **20M TPM**, `labs-leanstral-1-5-1` **5M TPM**, pools de 40K TPM para ministral/codestral.

⚠️ **Lección de la auditoría:** los pools con `1.00 solicitudes/segundo` (medium/small/magistral/vibe comparten pool de 20K TPM) aplican **penalización por ráfaga** que dura varios minutos — peticiones seguidas rápidas → 429 en cascada. Otros pools (ministral 0.03 RPS, large-4 0.83 RPS) siguieron operativos durante la penalización. En ZCode el ritmo normal de agente no suele dispararla.

**Verificados en vivo (07/11):** `mistral-large-4` ✅ (el flagship vivo), `voxtral-small-2507`/`-latest` ✅ (audio-understanding que también acepta chat de texto), `codestral-2508` ✅, `mistral-code-latest` ✅, `ministral-8b-2512`/`-14b-2512`/`-3b-2512` ✅.

|Grupo|Modelos|Estado|
|-|-|-|
|**Chat verificados (14 asociados)**|`mistral-large-4`/`-4-0` (flagship vivo), `voxtral-small-2507`/`-latest`, `codestral-2508`/`-latest`, `mistral-code-latest`/`-fim-latest` (FIM acepta chat, verificado), `ministral-3b/8b/14b-2512` + `-latest`|✅ 200 — 9 probados uno a uno|
|**Pool medium (NO en config — podado en tu reorganización del 03/11)**|`mistral-medium-latest` + alias, `mistral-small-2603`/`-latest`, `magistral-medium/small-latest`, `mistral-vibe-cli-*`|Empleables por tu tier (20K TPM, 1 RPS) pero estaban fuera ya; durante la auditoría dpieron 429 por ráfaga propia. Re-añadibles si los quieres|
|**Bloqueados por tier — RETIRADOS de la config (403 tier_not_allowed)**|`mistral-large-2512` (250K TPM), `deepseek-v4-1-flash-1017`, `glm-5-2`, `zai-glm-5-3`, `zai-glm-5-3-flash` (terceros alojados por Mistral)|403 — requieren suscripción superior|
|**Labs experimentales — RETIRADOS (403)**|`labs-leanstral-1-5-1` (5M TPM), `labs-leanstral-1-5`|403 — un admin debe activar Labs en consola|
|**OCR — RETIRADOS (superficie `/v1/ocr`, no chat)**|`mistral-ocr-4-1`, `-4`, `-3`, `-3-0`, `-2512`, `-latest`|400 "invalid model" vía chat/completions|
|**Embeddings — RETIRADOS (superficie `/v1/embeddings`)**|`mistral-embed-2312` (20M TPM), `mistral-embed`, `codestral-embed` (50K TPM), `codestral-embed-2505`|no chat|
|**Moderación — RETIRADA (superficie propia)**|`mistral-moderation-2603` (50K TPM, 1.67 RPS)|no chat|
|**Voxtral audio — RETIRADOS salvo small (superficie de audio)**|TTS: `voxtral-mini-tts-*`; transcribe: `voxtral-mini-transcribe-*`, `voxtral-small-transcribe-*`; realtime: `voxtral-mini-realtime-*`, `voxtral-mini-transcribe-realtime-*`; `voxtral-mini-2602`/`-latest` NO aceptan chat de texto (400)|no chat (salvo voxtral-small, que sí queda)|

**Novedades desde la config original:** `mistral-large-4` (flagship), `mistral-large-2512` (250K TPM, tier-blocked), familia OCR ×6, familia Voxtral ×16 (audio: TTS/transcripción/realtime/understanding), `labs-leanstral` ×2 (5M TPM), embeddings ×4, moderation, y **terceros alojados por Mistral** (DeepSeek V4.1 Flash-1017, GLM-5.2, GLM-5.3/Flash — mismos pesos que en Nebius/River/Alibaba, aquí tras paywall de tier).

Nota: los alias `-latest`/`-0` duplican pesos base (p. ej. `mistral-large-4-0` = snapshot de `mistral-large-4`); los pools TPM son por modelo exacto según panel.

**Medición coste × calidad (07/11/2026):** QI v3 de Artificial Analysis (API free: solo `mistral-large-4` cubierto, QI 25,3; el resto sin QI en plan free — referencia: AA Coding de tablas públicas) × **precios oficiales de Mistral** (mistral.ai/pricing + docs; Large-4 bajó de $1,36/$4,18 en preview a $0,70/$2,10 tras el open-weight del 30/10). Mezcla 1:3; Valor = QI ÷ mezcla.

|Modelo|QI v3|AA Coding|In $/M|Out $/M|Mezcla|Valor|Fuente precio|Nota|
|-|-|-|-|-|-|-|-|-|
|**mistral-large-4**|25,3|N/A|$0,70|$2,10|$1,75|**14,5**|oficial|1T MoE (52B activos), 1M ctx, multimodal — el único medible de punta a punta|
|**mistral-small-2603** (Small 4)|—|26,6|$0,15|$0,60|$0,49|—|ref. AA|reasoning; el barato con mejor coding del catálogo|
|**codestral-2508**|—|—|$0,30|$0,90|$0,75|—|oficial|especialista código; 0,03 RPS|
|**ministral-14b-2512**|—|14,4|~$0,20|~$0,60|~$0,50|—|aprox.|volume worker|
|**ministral-8b-2512**|—|9,7|~$0,10|~$0,20|~$0,18|—|aprox.|ligero|
|**ministral-3b-2512**|—|4,8|$0,10|$0,10|$0,10|—|oficial|el más barato, precio simétrico|
|**mistral-medium-latest** (3.1)|—|—|$0,40|$2,00|$1,60|—|oficial|gama media; pool 1 RPS|
|**voxtral-small-2507**|—|—|—|—|—|—|—|audio-understanding + chat|
|**magistral-medium/small**|—|—|—|—|—|—|—|razonamiento; sin precio público recopilado|
|**zai-glm-5-3-flash** (tercero)|27,8|—|—|—|—|—|tier-blocked|QI heredado de los mismos pesos en River/Nebius|
|**deepseek-v4-1-flash-1017** (tercero)|32,5|—|—|—|—|—|tier-blocked|ídem|
|**mistral-large-2512**|—|—|—|—|—|—|tier-blocked|250K TPM — el tope del panel|
|**labs-leanstral-1-5-1**|—|—|—|—|—|—|tier+admin|5M TPM|

**Benchmarks del creador — Mistral Large 4 ("Le Chonk", 1T/52B, open-weight 30/10):** lidera open-source en **FrontierCode 2.0** y **Terminal-Bench 4.0**; **AA Coding Agent Index 48%** (empatado con GLM-5.3 como top open-weight) usando **~47% menos tokens por tarea**; liderazgo en **Cyber Index** (detección de vulnerabilidades). GPQA/SWE-bench no publicados en las coberturas consultadas.

**Lectura:** dentro de Mistral, `mistral-large-4` es el único medible de punta a punta y su valor (14,5 QI/$) es competitivo con el mejor de Nebius (Super-VL 18,1) sin llegar a River (GLM-5.3-Flash 84). Comparativa de mismos pesos entre hosts: **GLM-5.3-Flash y DeepSeek V4.1 Flash existen en Mistral pero tu tier los bloquea (403)** — en River cuestan $0,33/$0,39 de mezcla con valor 84/83, así que hoy esos pesos conviene consumirlos por River y usar Mistral para Large-4, Codestral y los Ministral de volumen. Cache de Mistral: input cacheado reduce hasta 90% (batch -50%).

##### **Nebius**

Proveedor `nebius` en ZCode — endpoint `https://api.tokenfactory.nebius.com/v1`, OpenAI-compatible. Actualizado 06/11/2026: la API expone 31 modelos; **19 asociados** tras la limpieza de deprecados. Todos con `supportsJsonSchemaOutput: true`. Ningún modelo se sirve en BF16/FP16 — el serverless de Nebius despliega todo en **FP8 o NVFP4** (BF16 solo en Dedicated Endpoints con pesos propios).

**Deprecación 09/11/2026:** Nebius retira 11 modelos del serverless ese día. Fueron eliminados de la config: GLM-5.1, Nemotron-3-Nano-30B, nemotron-3-super-120b, DeepSeek-V4-Pro (base), DeepSeek-V4-Flash-0731, DeepSeek-V4.1-Flash (base), Qwen3.5-397B, Qwen3-235B-A22B, Kimi-K2.6, Kimi-K2.7-Code, MiniCPM-V-4.5. Reemplazos oficiales: GLM-5.2, Lightning, Super-VL, Pro-0813, V4.1-Flash-1017, Qwen3.8-27B, Qwen3-30B-A3B y Kimi-K3 respectivamente.

**Modelos asociados (19):**

|Modelo|ID en Nebius|Contexto|Multimodal|Nota|
|-|-|-|-|-|
|Reflection Beam|`reflection/beam`|1.073.152|No|501B/23B MoE, 1M ctx, NVFP4|
|NVIDIA Nemotron 3.5 Lightning|`nvidia/Nemotron-3_5-Lightning`|1.073.152|No|30B-A3B rápido, el más barato ($0,06/$0,24)|
|NVIDIA Nemotron 3 Ultra|`nvidia/Nemotron-3-Ultra-550b-a55b`|1.048.576|No|550B MoE híbrido Mamba, 1M ctx|
|NVIDIA Nemotron 3.5 Super VL|`nvidia/Nemotron-3.5-Super-VL`|1.048.576|Sí (imagen)|120B-A12B visión, NVFP4|
|DeepSeek V4.1 Flash|`deepseek-ai/DeepSeek-V4.1-Flash-1017`|1.048.576|No|El vivo más reciente de DeepSeek (~$1,20 out)|
|DeepSeek V4 Pro|`deepseek-ai/DeepSeek-V4-Pro-0813`|1.002.496|No|Tope de gama DeepSeek|
|GLM 5.3|`zai-org/GLM-5.3`|1.048.576|No|Razonamiento Z.ai (~$1,00/$3,20), FP8|
|GLM 5.3 Flash|`zai-org/GLM-5.3-Flash`|1.048.576|Sí (imagen)|Flash multimodal de Z.ai|
|GLM 5.2|`zai-org/GLM-5.2`|—|No|Generación previa (~$1,40/$4,40)|
|Qwen 3 30B A3B Instruct|`Qwen/Qwen3-30B-A3B-Instruct-2507`|268.288|No|Instruct (no thinking)|
|Qwen 3.8 27B|`Qwen/Qwen3.8-27B`|262.144|Sí (imagen)|Serie 3.8, niveles none→xhigh|
|Muse Spark Open|`meta-models/muse-spark-open`|—|Sí (imagen)|Meta 816B-A42B open-weight, $1,25/$4,25|
|Kimi K3.1 Pro|`moonshotai/Kimi-K3.1-Pro`|1.048.576|No|Lo nuevo de Moonshot (~$0,33/$8,12)|
|Kimi K3|`moonshotai/Kimi-K3`|1.048.576|No|Coding agéntico top (~$2,31/$14,25), 8×B300|
|GPT-OSS 120B|`openai/gpt-oss-120b`|131.072|No|MXFP4 nativo, rápido, $0,15/$0,60|
|MiniMax M3.1 Flash|`MiniMaxAI/MiniMax-M3.1-Flash`|—|No|FP8 barato ($0,15/$0,60, cache $0,015)|
|MiniMax M3|`MiniMaxAI/MiniMax-M3`|—|No|FP8 ($0,30/$1,20)|
|Hermes 4 405B|`NousResearch/Hermes-4-405B`|131.072|No|Razonamiento steerable (<think>), 405B denso|
|Gemma 3 27B|`google/gemma-3-27b-it`|131.072|Sí (imagen)|Visión ligera de Google|

**Recomendación de uso:** para coordinador de agentes complejos, **GLM-5.3** y **Kimi-K3** lideran coding agéntico entre los alojados (Muse Spark Open les sigue en tool-use pero cede en código); **Nemotron 3 Ultra** es el techo en razonamiento puro del catálogo; **Beam** aporta 1M de contexto nativo a precio bajo para análisis de repos enormes. Cifras de **Artificial Analysis, BenchLM, OpenRouter y agregadores públicos** — índices distintos, **no se promedian**.

|Modelo|Estimación índice|Fortaleza|Precio $/M (in/out)|
|---|---:|---|---|
| **GLM-5.3** | — | Coding + razonamiento (top host) | 1,00 / 3,20 |
| **Kimi-K3 / K3.1-Pro** | — | Coding agéntico día-0 de Moonshot | 2,31-3,00 / 14,25-15,00 (Pro: 0,33/8,12) |
| **Nemotron 3 Ultra** | 47,4 (AA est.) | Razonamiento profundo, 1M | — |
| **Muse Spark Open** | — | Tool-use y seguridad; cede en coding | 1,25 / 4,25 |
| **Beam** | 30 AA (43,1 BenchLM) | Contexto 1M para planificación | 0,25 / 1,00 |
| **GPT-OSS 120B** | 40,7 BenchLM | Velocidad + tool-calling | 0,15 / 0,60 |

**Clasificación por función recomendada, no ranking de potencia:**

|Modelo|Dónde colocarlo|Precaución|
|---|---|---|
| **GLM-5.3** | **Coordinador principal:** agentes, código, razonamiento | Requiere reasoning (no admite apagarlo); FP8 |
| **Kimi-K3.1-Pro** | **Programador agéntico:** repos grandes, bucles de herramientas | Output caro ($8-15/M); reservarlo para trabajo que lo justifique |
| **Nemotron 3 Ultra** | **Razonador de respaldo:** planificación profunda | Sin multimodal; pesos en low-precision |
| **Beam** | **Analizador de contexto masivo:** repos/reports de 1M tokens | Índice AA modesto; "correcto, no mágico" |
| **DeepSeek V4.1 Flash-1017** | **Ejecutor económico:** volumen alto de tokens | No es el más brillante; su valor es el coste |
| **GPT-OSS 120B** | **Ejecutor rápido:** tool-calling frecuente | Solo 131K de contexto |
| **Nemotron 3.5 Super VL** | **Agente visual:** capturas, documentos, imagen | NVFP4; el texto puro lo resuelve mejor Ultra/GLM |
| **Muse Spark Open** | **Agente general multimodal:** seguridad y tool-use | Cede en coding frente a GLM-5.3/Kimi |
| **MiniMax M3.1 Flash / M3** | **Trabajadores baratos:** subtareas masivas | Sin optionSpecs de reasoning (comportamiento nativo) |
| **Qwen3.8-27B** | **Multimodal ligero:** imagen + texto ágil | 262K; no para contextos enormes |
| **Gemma 3 27B / Lightning** | **Relleno económico:** tareas triviales | Gemma 3 es generación anterior; Lightning el más barato |
| **Hermes 4 405B** | **Experimental:** razonamiento steerable estilo <think> | Denso 405B: lento y caro en cómputo |
| **GLM-5.2** | **Respaldo del coordinador** | Superado por 5.3 a precio similar |

**Disponibles y NO asociados (función especial):**

- **`Qwen/Qwen3-Embedding-8B`** — `embedding`. Único embedding del catálogo de la API; **verificado en vivo 06/11/2026: HTTP 200, dimensión 4096**, vía `POST /v1/embeddings` (formato OpenAI). No asociable a ZCode (no es chat); útil para RAG/búsqueda semántica propia. La serie Qwen3 Embedding también cubre ranking.
- **Rerankers** — la serie Qwen3 Embedding sirve para reordenado, pero no hay reranker expuesto como modelo independiente en `/v1/models`.
- **Audio (TTS/ASR)** — `ninguno`. Token Factory **no tiene catálogo de audio nativo**: la voz se resuelve vía partners (Dubformer), Serverless AI con Docker (motor Piper) o integraciones externas. Nada que asociar.
- **Los 11 deprecados** del 09/11 siguen expuestos por la API hasta esa fecha pero ya no están en la config.

Referencia: precios compilados de agregadores públicos (la página de precios exacta requiere sesión en tokenfactory.nebius.com → Pricing). La API no expone precios ni precisión (objetos con solo `id/created/owned_by`).

**Análisis coste-calidad (06/11/2026, precios oficiales del panel de Nebius + índice de calidad AA vía WhatLLM).** APIs de evaluación encontradas con Tavily: **Artificial Analysis Data API** (gratuita, ~1.000 req/día, clave por registro en artificialanalysis.ai/api-reference) es la referencia del sector — WhatLLM la consume y publica sus tablas; Alternativas: BenchLM, LLM-Stats, Requesty rankings. La AA API no se pudo usar directamente (requiere clave manual), así que el índice de calidad (QI) sale de sus tablas públicas de noviembre 2026 y los precios del panel oficial.

**Tabla A — análisis (coste, razonamiento, benchmarks, velocidad):** *(corrección 06/11: la columna antes etiquetada GPQA es en realidad el **AA Coding Index** — segunda columna numérica sin encabezado de WhatLLM; los valores son índices compuestos de coding, no GPQA Diamond)*

|Modelo|QI AA nov|AA Coding|Coste in|Cached|Coste out|Mezcla 1:3|Tok/s|Razonamiento (config)|Precisión|
|-|-|-|-|-|-|-|-|-|-|
|Kimi-K3.1-Pro|46,0|—|$2,00|$0,20|$10,00|$8,00|195|none→max (config none={} | Vision|
|DeepSeek V4.1 Flash-1017|32,5|—|$0,30|$0,006|$1,20|$0,98|738|none→max (config none={})|Vision|
|GLM-5.3|31,7|74,8%|$1,40|$0,26|$4,40|$3,65|455|low/high/max (requerido)|NVFP4+DFlash2|
|MiniMax-M3.1-Flash|28,9|—|$0,15|$0,015|$0,60|$0,49|25|nativo (sin param)|FP8, Vision|
|Muse Spark Open|24,7 (xhigh)|—|$1,25|$0,15|$4,25|$3,50|143|none→high (config)|816B MoE, Vision|
|DeepSeek V4 Pro-0813|23,1|68,8%|$1,32|$0,04|$3,96|$3,30|37|disabled→high|37 tok/s (lento)|
|Qwen3.8 27B|20,1 (xhigh)|68,1%|$0,45|$0,10|$3,00|$2,36|218|none→xhigh|NVFP4, Vision|
|MiniMax-M3|18,7|58,6%|$0,30|$0,06|$1,20|$0,98|248|nativo (sin param)|FP8, B200+EAGLE3|
|Reflection Beam|17,7|—|$0,25|$0,05|$1,00|$0,81|611|disabled→high|NVFP4, 1M ctx|
|Nemotron 3.5 Super VL|13,6|—|$0,30|$0,06|$0,90|$0,75|282|disabled→medium/high|NVFP4, Vision|
|Nemotron 3 Ultra|11,8|49,3%|$1,00|$0,12|$3,00|$2,50|523|disabled→high|Híbrido Mamba, 1M|
|GLM-5.3-Flash|—|71,5%|$0,15|$0,03|$0,50|$0,41|349|low/high/max (requerido)|320B-A18B, Vision|
|Nemotron 3.5 Lightning|—|26,8%|$0,06|$0,03|$0,24|$0,20|314|disabled→high|30B-A3B|
|Kimi-K3|— (59,7 índice anterior)|—|$3,00|$0,30|$15,00|$12,00|265|none→max|NVFP4+DSpark, 8×B300|
|GLM-5.2|— (52,6 anterior)|—|$1,40|$0,14|$4,40|$3,65|25|disabled→high/max|FP8|
|gpt-oss-120b|— (40,7 BenchLM)|—|$0,15|$0,10|$0,60|$0,49|40|disabled→high|MXFP4 nativo|
|Hermes-4-405B|—|—|$1,00|$0,20|$3,00|$2,50|20|steerable <think>|405B denso|
|Gemma 3 27B|—|—|$0,10|$0,04|$0,30|$0,25|20|no reasoning|Vision|
|Qwen3-30B-A3B|—|—|$0,10|$0,10|$0,30|$0,25|70|instruct (no thinking)|30B-A3B|
|*Qwen3-Embedding-8B*|*no aplica*|*—*|*$0,01*|*—*|*—*|*—*|*—*|*embedding dim 4096*|*RAG*|

**Tabla B — ordenada por valor (QI por dólar de mezcla 1:3, descendente):**

|Puesto|Modelo|QI|Mezcla $/M|QI por $|Veredicto|
|-|-|-|-|-|-|
|1|**MiniMax-M3.1-Flash**|28,9|$0,49|**59,3**|Rey del valor: multimodal, 1M ctx, FP8|
|2|**DeepSeek V4.1 Flash-1017**|32,5|$0,98|**33,2**|Calidad casi GLM-5.3 a cuarto de precio, 738 tok/s|
|3|**Reflection Beam**|17,7|$0,81|**21,8**|El 1M-ctx más barato del catálogo|
|4|**MiniMax-M3**|18,7|$0,98|**19,2**|Hermano mayor del Flash, mismo precio base|
|5|**Nemotron 3.5 Super VL**|13,6|$0,75|**18,1**|La visión más barata por punto de calidad|
|6|**GLM-5.3**|31,7|$3,65|**8,7**|El mejor Equilibrio en el top de calidad|
|7|**Qwen3.8 27B**|20,1|$2,36|**8,5**|Multimodal razonador; xhigh sube el coste|
|8|**Muse Spark Open**|24,7|$3,50|**7,1**|Meta a precio razonable, mejor en tool-use|
|9|**DeepSeek V4 Pro-0813**|23,1|$3,30|**7,0**|Calidad sólida pero lento (37 tok/s)|
|10|**Kimi-K3.1-Pro**|46,0|$8,00|**5,8**|El más listo del catálogo; pagarás por ello|
|11|**Nemotron 3 Ultra**|11,8|$2,50|**4,7**|Su QI penaliza en esta escala; AA Coding 49,3|
|—|Grupo sin QI (ordenado por coste): Lightning $0,20 → Gemma 3/Qwen3-30B $0,25 → GLM-5.3-Flash $0,41 → gpt-oss $0,49 → Hermes $2,50 → GLM-5.2 $3,65 → Kimi-K3 $12,00|—|—|—|GLM-5.3-Flash con AA Coding 71,5 es la ganga oculta del grupo|

**Lectura rápida:** el ranking de valor lo dominan los MoE pequeños/medianos (MiniMax, DeepSeek Flash, Beam); para calidad bruta el salto a Kimi-K3.1-Pro (QI 46) cuesta ~16× el blend del MiniMax-M3.1-Flash. GLM-5.3 es el punto medio: top-3 en calidad, AA Coding 74,8, precio medio. Advertencias: el QI de AA depende del esfuerzo de razonamiento medido (los valores xhigh/high de cada fila son los medidos), los índices entre escalas nov-2026 y anteriores no son comparables, y Kimi-K3 (QI no asignado en escala nueva) queda documentado con su valor del índice anterior.
##### **Alibaba**

Proveedor `dashscope` ("Alibaba") en ZCode — endpoint `https://dashscope-intl.aliyuncs.com/compatible-mode/v1`, OpenAI-compatible. Actualizado **06/11/2026**: **asociada la totalidad del catálogo** — 101 de 114 (los 13 restantes son slugs internos de test `pre-mock_*`, excluidos adrede). La cuenta tiene **25 modelos con cuota gratuita activa** (Stop-on-Exhaust activado — sin riesgo de cargos); los asociados sin cuota devuelven 403 `AllocationQuota.FreeTierOnly` al agotarse. `kimi-k3.1-pro` se sirve aunque no figura en `/models`. Sin integraciones reales nuevas desde el 30/10: las 12 altas del catálogo son mocks de test de autenticación.

**Asociados a ZCode: 101 en total** (toda la catalogación real). Los 90 restantes están asociados sin cuota (403 al agotarse bajo Stop-on-Exhaust).

**Cuota gratuita activa — totalidad (25 modelos, estado 07/11/2026, ordenados por vencimiento):**

|Modelo|Tipo|Cuota restante|Expira|Días|En ZCode|Uso|
|-|-|-|-|-|-|-|
|qwen3.7-text-embedding|Embedding|999.98K / 1M|2026/11/08|**1** ⚠️|—|solo API (RAG)|
|qwen3.8-2.4t-a95b|LLM|999.86K / 1M|2026/11/11|4|✅|chat|
|deepseek-v4-pro-0813|LLM|999.91K / 1M|2026/11/12|5|✅|chat|
|qwen3.8-27b|LLM|999.17K / 1M|2026/11/16|9|✅|chat|
|kimi-k3|LLM|999.79K / 1M|2026/11/16|9|✅|chat|
|wan3.0-video-prime|Vídeo|30 / 30 gens|2026/11/20|13|—|solo API (vídeo)|
|qwen-plus|LLM|999.97K / 1M|2026/11/22|15|✅|chat|
|glm-5.3|LLM|999.98K / 1M|2026/11/22|15|✅|chat|
|qwen3.8-flash|LLM|999.78K / 1M|2026/11/24|17|✅|chat|
|qwen-mt-image-2.0|Imagen|100 / 100 gens|2026/11/25|18|—|solo API (imagen)|
|qwen3.8-max-0902|LLM|1M / 1M|2026/11/30|23|✅|chat|
|deepseek-v4.1-flash|LLM|1M / 1M|2026/12/12|35|✅|chat|
|qwen-audio-3.1-tts-plus|Voz TTS|10K / 10K|2026/12/15|38|—|solo API (voz)|
|qwen3.8-livetranslate-flash-realtime|Realtime|1M / 1M|2026/12/15|38|—|solo API (websocket)|
|qwen3.8-omni-flash|Multimodal|999.78K / 1M|2026/12/16|39|✅|chat (omni)|
|qwen3.8-omni-flash-realtime|Realtime|1M / 1M|2026/12/20|43|—|solo API (websocket)|
|qwen-audio-3.1-asr-flash-message|Voz ASR|1M / 1M|2026/12/20|43|—|solo API (voz)|
|qwen-audio-3.1-asr-flash-streaming|Voz ASR|1M / 1M|2026/12/20|43|—|solo API (voz)|
|qwen-audio-3.1-asr-flash|Voz ASR|1M / 1M|2026/12/20|43|—|solo API (voz)|
|qwen-audio-3.1-tts-flash|Voz TTS|1M / 1M|2026/12/20|43|—|solo API (voz)|
|qwen-audio-3.1-asr-flash-filetrans|Voz ASR|1M / 1M|2026/12/20|43|—|solo API (voz)|
|qwen-audio-3.1-tts-next|Voz TTS|1M / 1M|2026/12/20|43|—|solo API (voz)|
|qwen-image-2.1-pro|Imagen|10 / 10 gens|2026/12/31|54|—|solo API (imagen)|
|qwen-image-2.1-turbo|Imagen|10 / 10 gens|2026/12/31|54|—|solo API (imagen)|
|kimi-k3.1-pro|LLM|999.9K / 1M|2027/02/01|86|✅|chat|

Resumen: **14 chat asociados con cuota** (los 11 anteriores + kimi-k3.1-pro, y ojo: qwen3.8-27b/kimi-k3 comparten fecha 16/11) y **11 de uso especial** (1 embedding, 7 de voz, 2 realtime, 3 imagen/vídeo). Los 14 chat suman ~14M tokens free; el más longevo es kimi-k3.1-pro (86 días).

**Eliminados de la config (06/11/2026, sin cuota — 403 AllocationQuota.FreeTierOnly):** `qwen3.8-max` (cuota agotada 31/10/2026, verificado 403 en vivo) y `deepseek-v4.1-flash-1017` (sin cuota en el panel; su variante viva con cuota es el base `deepseek-v4.1-flash`). Vuelven a funcionar solo si se desactiva "Free Only" en consola.

**Candidatos a asociar:** ya ninguno — la totalidad del catálogo real (qwen 3.5/3.6/3.7/3.8 y snapshots, qwen-plus/plus-latest, qwen-max/flash, qwq-plus, qwen2-7b, qwen3-coder-flash, qwen3-vl-plus, qwen-vl-ocr, qwen-mt-*, GLM-5.1/5.2/5.3-prime, ZHIPU/GLM-5.3, kimi-k2.7-code, kimi/kimi-k3, deepseek-v4-flash-0731/pro, qwen3-omni y 3.5-omni) quedó asociada el 06/11/2026, incluidos  y  re-asociados aunque sin cuota (403 bajo Stop-on-Exhaust).

**Con cuota free activa pero NO asociables a ZCode (uso directo por API):**

- **embedding**: `qwen3.7-text-embedding` (999.98K restantes) — ⚠️ **expira 2026/11/08 (2 días)**, dim 1024 vía `/embeddings`.
- **voz TTS (serie 3.1, nueva)**: `qwen-audio-3.1-tts-plus` (10K), `qwen-audio-3.1-tts-flash` (1M), `qwen-audio-3.1-tts-next` (1M) — expiran 15-20/12.
- **voz ASR (serie 3.1, nueva)**: `qwen-audio-3.1-asr-flash` + variantes `-streaming`, `-message`, `-filetrans` (1M cada uno) — expiran 20/12.
- **realtime (websocket)**: `qwen3.8-livetranslate-flash-realtime` (1M, 15/12), `qwen3.8-omni-flash-realtime` (1M, 20/12).
- **imagen (serie 2.1, nueva)**: `qwen-image-2.1-pro` y `qwen-image-2.1-turbo` (10 generaciones cada uno, 31/12); `qwen-mt-image-2.0` traducción de imagen (100, 25/11).
- **vídeo**: `wan3.0-video-prime` (30 generaciones, 20/11).

**Resto del catálogo sin cuota (114 totales; inventario antiguo en `dashscope_models.json`):** imagen serie 2.0/3.0, wan2.7, z-image, voz serie 3.0, embeddings v3/v4, realtime antiguos, internos (`ccai-pro`, `pre-mock_*`).

Referencia de endpoints por familia: `alibaba-model-studio-endpoints.md` en el workspace. Cuotas free compartidas solo entre workspaces de Singapur; con Stop-on-Exhaust activado la plataforma corta con 403 antes de cobrar.



##### **OpenRouter**

| Modelo                                             | Tipo                     | Modalidad                                  | Contexto | Razonamiento | Para qué sirve                       |
| :------------------------------------------------- | ------------------------ | ------------------------------------------ | -------- | ------------ | ------------------------------------ |
| stealth/crouton-alpha                              | Chat multimodal completo | text + image + file + audio + video → text | 1M       | ✅            | Todo en uno (archivos, audio, video) |
| openrouter/free                                    | Router automático        | text+image → text                          | 200K     | ❌            | Enruta a modelos free disponibles    |
| recursive/flint-v1.0:free                          | Chat texto               | text → text                                | 262K     | ✅            | Razonamiento general                 |
| xingchen-agi/xing4.0-29b-a4b:free                  | Chat texto (MoE)         | text → text                                | 262K     | ✅            | 29B activos, eficiente               |
| liquid/lfm-2.5-2.6b:free                           | Chat texto pequeño       | text → text                                | 65K      | ✅            | Ultra-ligero (2.6B)                  |
| cohere/north-mini-code:free                        | Código / agentic         | text → text                                | 256K     | ✅            | Optimizado para coding               |
| nvidia/nemotron-3-ultra-550b-a55b:free             | Top potencia             | text → text                                | 1M       | ✅            | 550B MoE, razonamiento profundo      |
| nvidia/nemotron-3.5-lightning:free                 | Rápido + contexto largo  | text → text                                | 1M       | ✅            | Velocidad + 1M ctx                   |
| nvidia/nemotron-3.5-super-vl:free                  | Multimodal visión        | text+image+video → text                    | 1M       | ✅            | Imagen + video entendimiento         |
| nvidia/nemotron-3-nano-omni-30b-a3b-reasoning:free | Omni                     | text+image+audio+video → text              | 256K     | ✅            | Todo modalidades                     |
| dots-studio/dots-3-note-preview:free               | Notas/documentos         | text+image → text                          | 512K     | ✅            | Procesamiento documentos             |
| thinkingmachines/inkling-small:free                | Multimodal compacto      | text+image+audio → text                    | 1M       | ✅            | Imagen + audio                       |
| thinkingmachines/inkling:free                      | Multimodal completo      | text+image+audio → text                    | 1M       | ✅            | Igual pero mayor                     |
| google/gemma-4-26b-a4b-it:free                     | Gemma 4 MoE              | text+image+video → text                    | 262K     | ✅            | Google MoE 26B                       |
| google/gemma-4-31b-it:free                         | Gemma 4 denso            | text+image+video → text                    | 262K     | ✅            | Google denso 31B                     |
| nvidia/nemotron-3.5-content-safety:free            | Moderación/Safety        | text+image → text                          | 128K     | ✅            | Clasificador seguro/no seguro        |
| google/lyria-3-pro-preview                         | Generación audio         | text+image → text+audio                    | 1M       | ❌            | Crea música/voz (no chat)            |
| google/lyria-3-clip-preview                        | Generación audio clip    | text+image → text+audio                    | 1M       | ❌            | Versión recortada Lyria              |

**Para tu uso, empezaría probando Nemotron 3 Ultra como coordinador, North Mini Code y Flint para programación, y Nemotron 3.5 Super VL para tareas visuales.** Son candidatos por su especialización, no ganadores demostrados frente a todos los demás. Estas cifras corresponden a evaluaciones de **Artificial Analysis recogidas en las fichas consultadas**, no a mediciones propias. Cada columna mide algo diferente; **no conviene promediarlas para fabricar una nota general**.

| Modelo | Ciencia: GPQA | Razonamiento difícil: HLE | Contexto largo: AA-LCR |
|---|---:|---:|---:|
| **Inkling — Xhigh** | **87,2%** | **31,9%** | **77,3%** |
| **Nemotron 3 Ultra** | 86,7% | 28,4% | — |
| **Nemotron 3.5 Super VL** | — | 30,7% | 69,0% |
| **Nemotron 3.5 Lightning** | 74,3% | 10,6% | 60,3% |
| **Nemotron Nano Omni** | 46,9% | 4,8% | 39,7% |

**Lectura práctica:** Inkling y Ultra destacan en las pruebas de razonamiento disponibles; Lightning ofrece un perfil más orientado a ejecución frecuente, mientras Nano Omni está concebido como subagente de percepción multimodal, no como sustituto del coordinador principal.

**Esta es una clasificación por función recomendada, no un ranking absoluto de potencia.**

| Modelo                     | Dónde lo colocaría                                                                       | Precaución                                                                                                                                                                                                    |
| -------------------------- | ---------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Nemotron 3 Ultra**       | **Coordinador:** planificación, razonamiento y agentes complejos                         | Solo texto; candidato principal para organizar el trabajo.  [openrouter ](https://openrouter.ai/nvidia/nemotron-3-ultra-550b-a55b:free)                                                                       |
| **Nemotron 3.5 Super VL**  | **Agente visual:** documentos, capturas, vídeo y herramientas                            | No asumir que supera a Ultra en razonamiento textual. [Ficha oficial ](https://openrouter.ai/nvidia/nemotron-3.5-super-vl-20261015:free)                                                                      |
| **North Mini Code**        | **Programador especializado:** repositorios, terminal, cambios y pruebas                 | No elegirlo como asistente universal solo por destacar en código.  [huggingface ](https://huggingface.co/blog/CohereLabs/introducing-north-mini-code)                                                         |
| **Flint v1.0**             | **Programador especializado:** investigar proyectos, corregir errores y escribir pruebas | No es únicamente un modelo de razonamiento general, como indica tu tabla.  [openrouter ](https://openrouter.ai/recursive/flint-v1.0:free/providers)                                                           |
| **Gemma 4 31B**            | **Generalista multimodal:** código, documentos e instrucciones                           | Candidato equilibrado; sin evidencia aquí para colocarlo por encima de Ultra.  [openrouter ](https://openrouter.ai/google/gemma-4-31b-it)                                                                     |
| **Gemma 4 26B A4B**        | **Ejecutor multimodal eficiente:** herramientas, imágenes y vídeo                        | Su arquitectura activa unos 3,8B parámetros por token; eso no garantiza menor latencia del endpoint.  [openrouter ](https://openrouter.ai/google/gemma-4-26b-a4b-it)                                          |
| **Nemotron 3.5 Lightning** | **Ejecutor textual:** muchos pasos pequeños y llamadas a herramientas                    | Mejor plantearlo como trabajador de un coordinador que como sustituto automático de Ultra. [Explicación oficial ](https://openrouter.ai/blog/insights/nemotron-3-5-lightning/)                                |
| **Xing4.0-29B-A4B**        | **Ejecutor textual:** herramientas y tareas de varios pasos                              | Corrección: **29B totales y 4B activos**, no 29B activos.  [techcrunch ](https://techcrunch.com/press-release/xing4-0-29b-a-versatile-agentic-large-model-that-runs-on-a-single-gpu-now-officially-released/) |
| **Inkling Small**          | **Alternativa multimodal a evaluar:** razonamiento, código e imagen/audio                | No hay aquí resultados suficientes para ubicarlo exactamente frente a los anteriores. [Ficha de familia ](https://openrouter.ai/thinkingmachines/inkling-20260715:free)                                       |
| **Dots3-Note Preview**     | **Documentos y trabajo multimodal:** también código y agentes                            | No se limita a notas; tiene retirada anunciada para el **31 de diciembre**.  [surfmind ](https://surfmind.ai/es/models/dots-studio/dots-3-note-preview:free)                                                  |
| **Nemotron Nano Omni**     | **Subagente sensorial:** procesar audio, vídeo e imágenes y devolver texto               | Su amplitud de modalidades no equivale a mayor capacidad de razonamiento. [Ficha oficial ](https://openrouter.ai/nvidia/nemotron-3-nano-omni-30b-a3b-reasoning-20260428:free)                                 |
| **Crouton Alpha**          | **Experimental:** subtareas, herramientas y análisis multimodal                          | Proveedor anónimo; sin base suficiente para asignarle un puesto de potencia.  [openrouter ](https://openrouter.ai/stealth/crouton-alpha:free)                                                                 |
| **LFM2.5-2.6B**            | **Trabajador ligero:** extracción, RAG y tareas acotadas                                 | Liquid desaconseja programación agéntica y tareas intensivas en conocimiento.  [openrouter ](https://openrouter.ai/liquid/lfm-2.5-2.6b-20260811:free)                                                         |

##### **Ollama Cloud**

Todos los modelos de la capa gratuita de Ollama Cloud **ya están integrados** en el proveedor
`ollama-cloud` de ZCode (endpoint `https://ollama.com/v1`, OpenAI-compatible). Créditos free
que se reponen cada 2 semanas; el dashboard muestra 7 modelos con uso de 1-2 peticiones cada uno.

| Modelo en Ollama      | Estado en ZCode | Nota                                                             |
| --------------------- | --------------- | ---------------------------------------------------------------- |
| `beam`                | ✅ añadido       | Modelo de razonamiento/agente de Ollama, contexto 1M configurado |
| `gemma4:31b`          | ✅ añadido       | Con `supportsImage` y contexto 256K configurados                 |
| `gpt-oss:120b`        | ✅ añadido       | El mayor de la familia abierta de OpenAI                         |
| `gpt-oss:20b`         | ✅ añadido       | Versión ligera                                                   |
| `nemotron-3-ultra`    | ✅ añadido       | 550B MoE, contexto 256K configurado                              |
| `nemotron-3-super`    | ✅ añadido       | 120B, contexto 256K configurado                                  |
| `nemotron-3-nano:30b` | ✅ añadido       | El más pequeño de la familia Nemotron                            |

**Ojo:** `minimax-m3.1-flash` también está en la config de `ollama-cloud` pero **no** aparece en la lista de modelos gratuitos del dashboard — usarlo consumiría créditos de pago.

**Recomendación de uso:** para coordinator de tareas complejas empezaría por **Nemotron 3 Ultra**, con **Nemotron 3 Super** como especialista en código agéntico y **Gemma 4 31B** como generalista multimodal. **GPT-OSS 120B** es el ejecutor rápido cuando el contexto no pasa de 131K. Cifras de **Artificial Analysis, BenchLM y evals de NVIDIA recogidas de las fichas consultadas** — índices distintos que miden cosas distintas; **no se promedian**.

| Modelo | SWE-bench Verified | AA Coding Index | Estimación BenchLM | Contexto nativo |
|---|---:|---:|---:|---|
| **Nemotron 3 Ultra** | — (líder en evals propias de NVIDIA) | — | 47,4 | **1M** |
| **Nemotron 3 Super** | **60,5** | — | — | 1M |
| **Beam (Reflection)** | — | — | 43,1 | **1M** |
| **Gemma 4 31B** | — | **33,2** | 54,4 | 256K |
| **GPT-OSS 120B** | 41,9 | — | 40,7 | 131K |
| **Nemotron 3 Nano 30B** | — | 14,4 | 33,9 | 256K |

**Lectura práctica:** Super casi duplica a GPT-OSS 120B en SWE-bench Verified (60,5 vs 41,9) y domina el contexto largo (RULER@1M: 91,8 vs 22,3), pero corre ~2-4× más lento. Ultra es el techo del free tier en razonamiento/coding según NVIDIA; Beam, con índice AA de 30 ("correcto, no mágico"), aporta 1M de contexto nativo para planificación larga. Gemma 4 es el mejor multimodal del grupo; Nano es percepción rápida, no razonador.

**Clasificación por función recomendada, no ranking de potencia:**

| Modelo | Dónde colocarlo | Precaución |
| --- | --- | --- |
| **Nemotron 3 Ultra** | **Coordinador:** planificación, agentes complejos, código exigente | El más lento del grupo junto a Super; gasta créditos más rápido |
| **Nemotron 3 Super** | **Programador agéntico:** refactors, SWE-bench-style, repos grandes | Misma lentitud; elegirlo solo cuando la calidad de código importa |
| **Gemma 4 31B** | **Generalista multimodal:** imágenes, documentos, código moderado | Denso (no MoE): tokens más caros en cómputo que los MoE de la lista |
| **GPT-OSS 120B** | **Ejecutor rápido:** tool-calling frecuente, tareas de respuesta ágil | Contexto de solo **131K** — no para conversaciones/documentos largos |
| **Beam** | **Planificador de contexto largo:** análisis de repos inmensos, resúmenes 1M | Índice AA modesto (30); "correcto, no mágico" según reseñas |
| **GPT-OSS 20B** | **Trabajador ligero:** tareas cortas, ahorrar créditos free | Mucho menor calidad; solo para labores triviales |
| **Nemotron 3 Nano 30B** | **Subagente sensorial rápido:** OCR/percepción, pasos masivos baratos | El más débil en coding (índice 14,4); no usar como coordinador |

**Presupuesto:** los créditos free se reponen cada 2 semanas y son compartidos — para maximizarlos: Nano/20B en tareas triviales, 120B en ejecución, Super/Ultra solo cuando el trabajo lo amerita.
##### **Google Studio**

**Configuración de razonamiento (arreglada 21/10, verificada 06/11):** los Gemini aceptan `reasoning_effort` limitado a low/medium/high (la config `optionSpecs` mapea "disabled" a no enviar nada); los Gemma **no aceptan ningún parámetro** (ni siquiera "none" — map `{}`). Ruta ZCode verificada: 3.6-flash con effort low → 200.

| Modelo                | RPM | TPM  | RPD   | Estado                   |
| --------------------- | --- | ---- | ----- | ------------------------ |
| Gemini 3.8 Flash      | 5   | 250K | 20    | 503 alta demanda         |
| Gemini 3.6 Flash      | 5   | 250K | 20    | ✅ operativo              |
| Gemini 3 Flash        | 5   | 250K | 20    | ✅ (preview)              |
| Gemini 3.5 Flash Lite | 15  | 250K | 500   | ✅ el más generoso en RPD |
| Gemini 3.1 Flash Lite | 15  | 250K | 500   | ✅                        |
| Gemma 4 31B / 26B     | 30  | 16K  | 14,4K | ✅ 1M de contexto         |
**Mapa completo del catálogo por usabilidad** (doc oficial: [aistudio.google.com/docs ](https://aistudio.google.com/docs/models), cada página en `.md`; API de consulta: `https://aistudio.google.com/api/v2` con `x-api-key`):

**A. Chat en ZCode (11 asociados; ver límites en la tabla superior):** 8 operativos — `gemini-flash-lite-latest`, `gemini-3-flash-preview`, `gemini-3.1-flash-lite`, `gemini-3.5-flash`, `gemini-3.5-flash-lite`, `gemini-3.6-flash`, `gemma-4-26b-a4b-it`, `gemma-4-31b-it`; 3 en 503 alta demanda — `gemini-flash-latest`, `gemini-3.7-flash`, `gemini-3.8-flash`.

**B. 🆕 Operativos vía otras superficies (no chat — verificados/doc oficial 06-07/11/2026):**

| Modelo (código) | Superficie | Qué es / receta | Cuota | Verificación |
|---|---|---|---|---|
| **Antigravity** `antigravity-preview-09-2026` | Interactions API `POST /v1beta/interactions` con `{"agent":"...","input":"...","environment":"remote"}` | **Agente gestionado**: planea, ejecuta código (bash/Python/Node), gestiona archivos y navega la web en sandbox Linux de Google. Motor 3.8 Flash, 1M ctx (compactado ~135K), out 65K. `agent_config` (modelo subyacente, `max_total_tokens`), multi-turno, background, SSE, Triggers cron, MCP externo | **100 req/día**, 60 RPM, 100K TPM | ✅ tarea en 13,3s con razonamiento |
| **TTS flagship** `gemini-3.8-flash-tts` | `generateContent` con `responseModalities:["AUDIO"]` + `speechConfig.voiceConfig.prebuiltVoiceConfig.voiceName` → WAV inline | TTS creativo: acentos regionales, voice design/replicación/remix, 130 lenguas. Voces: `GET /v1beta/voices` | **10 req/día**, 3 RPM, 10K TPM | ✅ WAV 184 KB generado |
| **TTS lite** `gemini-3.8-flash-lite-tts` | misma superficie | TTS rápido para volumen, 101 lenguas | 10 req/día, 3 RPM | sin probar |
| **TTS legacy** `gemini-3.1-flash-tts-preview` · `gemini-2.5-flash-preview-tts` | misma superficie | Generaciones anteriores (doc: migrar a 3.8) | 10 req/día | sin probar |
| **Embedding 2 (multimodal)** `gemini-embedding-2` | `POST /v1beta/models/gemini-embedding-2:embedContent` | Texto+imagen+vídeo+audio+PDF en un espacio; prefijos `task: search result \| query: ...`; agrega múltiples inputs en un vector | **1.000 req/día**, 100 RPM, 30K TPM | ✅ 3.072 dims |
| **Embedding 1 (texto)** `gemini-embedding-001` | misma superficie | Solo texto, acepta lotes (un embedding por string) | **1.000 req/día**, 100 RPM, 30K TPM | sin probar |
| **Transcribe** `gemini-3.5-transcribe` | REST | Speech-to-text: detección de idioma, diarización, timestamps por palabra | **25 req/día**, 3 RPM, 10K TPM | sin probar |
| **Robotics ER 2** `gemini-robotics-er-2-preview` | generateContent | Razonamiento encarnado: vídeo, espacial, multi-paso, multi-robot | **20 req/día**, 5 RPM, 250K TPM | sin probar (nicho) |
| **Live** `gemini-3.8-live` · `gemini-3.8-live-extended-thinking` | **WebSocket** `wss://generativelanguage.googleapis.com/ws/...` | Voz bidireccional en tiempo real (el segundo, con razonamiento alto de fondo) | **Ilimitado RPD**, 65K TPM | requiere cliente WS |
| **Live translate** `gemini-3.5-live-translate-preview` | WebSocket | Traducción de voz en vivo, 70+ lenguas | **Ilimitado RPD**, 20K TPM | requiere cliente WS |
| **Live legacy** `gemini-3-flash-live` · `gemini-3.5-transcribe-live` · `gemini-2.5-flash-native-audio-preview-12-2025` | WebSocket | Variantes Live anteriores | Ilimitado RPD | requiere cliente WS |

**C. Sin cuota en esta clave (0/0 — inutilizables de momento):**

| Modelo (código) | Uso |
|---|---|
| `gemini-4-argon` | Chat — el nuevo flagship (1M ctx, output hasta 1M) |
| `gemini-3.1-pro-preview` | Chat de gama pro |
| `gemini-nano-banana-2.1` | **Imagen**: eficiencia, tipografía, multi-turno |
| `gemini-3.1-flash-image` (Nano Banana 2) | **Imagen**: producción a escala |
| `gemini-3.1-flash-lite-image` (NB 2 Lite) | **Imagen**: el más rápido y barato |
| `gemini-3-pro-image` (NB Pro) | **Imagen**: 4K, layouts complejos, texto preciso |
| `gemini-2.5-flash-image` (Nano Banana 1) | **Imagen**: generación nativa |
| `gemini-omni-1.2-flash` / `gemini-omni-1.1-flash` | **Vídeo**: generación/edición hasta 15 s con audio nativo |
| `lyria-3.5` / `lyria-3-clip-preview` / `lyria-3-pro-preview` / `lyria-realtime-exp` | **Música**: canciones completas, clips 30 s, tiempo real |
| `deep-research-preview-04-2026` / `deep-research-max-preview-04-2026` | **Agente** de investigación multi-fuente con citas |
| `gemini-2.5-pro-preview-tts` | TTS legacy sin cuota |

**D. Deprecated:** Gemini 2.0 Flash/Lite y Computer Use (apagados), Imagen 4 (apagado), 3 Pro Preview y 3.1 Flash-Lite Preview (apagados); **2.5 Pro y 2.5 Flash redirigen automáticamente el 01/12/2026** a `3.8-flash` y `3.5-flash-lite`.

**Antigravity en detalle** (doc oficial minada: [antigravity-agent](https://aistudio.google.com/docs/antigravity-agent)):

- **Qué es**: agente gestionado de propósito general — un bucle autónomo de razonamiento + herramientas, no un modelo de chat. Construido con Gemini 3.8 Flash, mismo harness que la IDE Antigravity. Release sept-2026: prompt caching mejorado, búsqueda de código nativa, edición de ficheros por rangos de línea.
- **Especificaciones**: ctx 1.048.576 (compactado auto a ~135K) · out 65.536 · entrada texto+imagen (base64) · superficie Interactions API.
- **Herramientas**: por defecto `code_execution` (bash/Python/Node con stdout/stderr), `google_search`, `url_context`; con `environment: "remote"` se activan solas las de filesystem (leer/escribir/editar/buscar/listar); extraíbles: funciones personalizadas (tus APIs) y **servidores MCP externos**. Restrictibles vía `tools`.
- **Capacidades avanzadas**: `agent_config` (cambiar modelo subyacente + `max_total_tokens` de presupuesto), multi-turno con contexto persistente, ejecución en background, SSE streaming en vivo, cancelación, **Triggers** (cron de ejecuciones autónomas: `POST /v1beta/triggers`) y Environments API (sandboxes dedicados).
- **Precio**: pay-as-you-go por tokens del modelo subyacente + herramientas; free tier con cuota propia. Cada interacción gasta muchos tokens (la prueba trivial consumió 4.676 de entrada por el harness) — usar `max_total_tokens` para blindarse.
- **Cuota en tu clave**: 60 RPM · 100K TPM · **100 req/día**.
- **Verificado en vivo (06/11)**: tarea completada en 13,3 s — output correcto, 98 thought tokens, 4.777 tokens totales, `environment_id` asignado, status completed.

**Receta REST (verificada):**

```bash
curl -X POST "https://generativelanguage.googleapis.com/v1beta/interactions" \
  -H "Content-Type: application/json" -H "x-goog-api-key: $KEY" \
  -d '{"agent":"antigravity-preview-09-2026","input":"Tu tarea…","environment":"remote"}'
```

**Cómo emplearlo desde ZCode:** no es chat — se consume por script (patrón ask2.js: tareas en JSON → ejecutar → guardar resultados/ficheros). Con las 100 diarias es un equipo de investigación autónomo gratuito: investigar en la web y escribir informes, procesar datos con código en el sandbox, validar repos descargándolos ahí. Los Triggers permiten automatizaciones diarias (ej. resumen matutino de novedades de tus proveedores). Advertencias: es preview (puede cambiar), los datos se procesan en el sandbox de Google, y las 100 diarias se agotan rápido en tareas largas.

**Lectura del inventario:** los tesoros infrautilizados de esta cuenta son las **1.000 embeddings diarias** (RAG multimodal gratuito a escala) y la **voz bidireccional ilimitada por WebSocket** (Live API) — ambas sin coste y sin apenas uso. En el extremo opuesto, los dos mejores modelos de chat (4 Argon, 3.1 Pro) y toda la generación de imagen/vídeo/música están a 0/0: aparecerán en el panel cuando Google les asigne cuota free. Corrección documentada 07/11: `gemini-robotics-er-2-preview` y `gemini-embedding-001` SÍ tienen cuota (20 y 1.000 RPD) — versiones anteriores de este doc los daban por 0/0.

**Nomenclatura de versiones:** `stable` (fija), `preview` (facturable, límites más duros, deprecación con 2 semanas de aviso), `latest` (alias que se sustituye en caliente en cada release con aviso por email), `experimental`.

**Nota de integración ZCode:** los de la fila B no son chat — Antigravity/TTS/embeddings se consumen por script con la misma clave (patrón ask2.js). El embedding complementa al de Nebius (`Qwen3-Embedding-8B`, 1024 dims) para RAG; este de Google es multimodal y de 3.072 dims con 1.000 req/día.



##### **Meta Model API**

Proveedor `meta` en ZCode — endpoint `https://api.meta.ai/v1`, OpenAI-compatible (chat completions). Clave tipo `LLM_...` generada en el dashboard de Meta. Solo se asociaron los modelos **Spark** (descartados: muse-wonder-1.0, sam-3.1, muse-image-1.0, muse-voice-transcribe-1.0 — no chat o fuera de interés).

Contexto 1.048.576 tokens y salida máx 131.072 en todos. Entrada: texto + imagen + PDF (el vídeo solo existe en la API Responses, que ZCode no usa). Modelo *thinking*: consume `reasoning_tokens`.

|Modelo|Razonamiento|Nota|
|-|-|-|
|`muse-spark-1.3`|none → xhigh|Recomendado por Meta para coding agéntico|
|`muse-spark-1.3-contributor`|none → **max**|Único Spark con nivel `max` — verificado 200 el 11/11 (el 1.2-contributor lo rechaza)|
|`muse-spark-1.2`|none → xhigh|Generación anterior|
|`muse-spark-1.2-contributor`|none → xhigh (**max NO soportado** — verificado 400 el 11/11)|Variante contributor|
|`muse-spark-1.1`|none → xhigh|La más antigua de la familia|

**Limitación conocida:** en chat completions el razonamiento **no se conserva entre turnos** (cada turno razona desde cero); la continuidad de razonamiento cifrado requiere la API Responses, que ZCode no utiliza. En bucles agénticos largos puede comportarse algo más errático que en Codex. En "none" no se envía parámetro; el resto manda `reasoning_effort` con el nivel elegido.

**Re-verificado 11/11/2026 — los 5 Spark responden (HTTP 200) y el diagnóstico de "no responden":** son *thinking models* que razonan **server-side**: incluso para "di ok" queman 280-380 reasoning tokens SIN enviarlos por streaming — en ZCode se percibe como una pausa silenciosa (5-90 s según la tarea) y luego el contenido llega de golpe en un solo chunk. Con un `max_tokens` pequeño la respuesta puede llegar `content: null` con `finish_reason: length` (todo el presupuesto se lo come el razonamiento interno). `reasoning_effort` (high/low/etc. de nuestra config) es aceptado sin error. Si "no responde", esperar el ciclo de pensamiento o revisar si hay un tope de `max_tokens` en la sesión.

Verificado en vivo (06/11/2026): `muse-spark-1.3`, `-1.2` y `-1.1` responden HTTP 200 con la clave actual.
