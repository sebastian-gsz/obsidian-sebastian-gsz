---
def-type: atomic
version: 1.0
id: def-wannacry
status: estandar
category: amenazas
contexto: malware
date: 2026-11-12
tags:
  - ransomware
  - casos
  - amenazas
  - historia
aliases:
  - wannacry
  - wanna cry
  - wcry
---
**WannaCry** fue un **ataque cibernético devastador de ransomware que se desató en mayo de 2017, afectando a más de 200.000 computadoras en 150 países**: cifra los archivos de los sistemas infectados y exige un rescate en Bitcoin — el brote que convirtió el ransomware en crisis mundial y en lección de higiene de parches.

#### Qué Fue y Cómo Entró

-  **La vulnerabilidad**: explotó **EternalBlue** — una brecha de seguridad en Windows (SMB) descubierta y usada por la **NSA** de EE. UU. antes de ser **robada y filtrada** por el grupo de hackers "The Shadow Brokers".
-  **La propagación**: una vez infectada una máquina, se propagaba **automáticamente a otras en la misma red** vía EternalBlue — con mecánica de gusano: sin phishing, sin clics, la infección caminaba sola — la rápida y extensa diseminación que en horas cruzó hospitales, ferrocarriles y empresas de medio planeta.
-  **El secuestro**: cifraba los archivos y exigía rescate en Bitcoin por liberarlos — el modelo ransomware clásico a escala planetaria.

#### Cómo se Detuvo: el Kill Switch

-  El investigador **Marcus Hutchins** descubrió en el código una peculiaridad: el malware **hacía una solicitud de red a un dominio específico que no estaba registrado**.
-  **La hipótesis**: ese dominio no registrado parecía un **"kill switch"** incorporado por los propios desarrolladores del malware — registrar el dominio activaría el interruptor y detendría la propagación.
-  **La prueba**: Hutchins registró el dominio — el tráfico de todas las nuevas infecciones empezó a llegar a su servidor, el malware recibía respuesta y **se detenía** — la propagación global murió por el registro de un dominio de internet.

#### La Metodología Detrás del Kill Switch (el análisis de Hutchins)

1.  **Análisis del código malware**: al examinar WannaCry encontró la solicitud de red hacia un dominio no registrado — parte integral del proceso de activación.
2.  **Identificación del comportamiento inusual**: un dominio no activo es raro para software normal pero común en malware que busca su C&C — lo identificó como posible punto de falla o de control.
3.  **Hipótesis del kill switch**: la presencia del dominio no registrado llevó a hipotetizar el interruptor incorporado.
4.  **Prueba y activación**: registrar el dominio dirigió el tráfico de nuevas infecciones hacia él — y el kill switch se activó, deteniendo la propagación.

#### Cómo Detecta el Malware que Está Siendo Escaneado

Los desarrolladores de malware incorporan técnicas para detectar el análisis y modificar su comportamiento — las más comunes:

1.  **Detección de entornos virtuales** (las VMs de los investigadores).
2.  **Detección de herramientas de análisis** (procesos de seguridad activos).
3.  **Monitoreo del comportamiento del usuario** (irregularidades de interacción).
4.  **Pruebas de red** (detectar control del investigador).
5.  **Verificación de la integridad del sistema** (archivos y registros alterados).
6.  **Detección de tiempo de ejecución** (medir duraciones que en VM cambian).
7.  **Limitación de la tasa de acción** (actividades maliciosas espaciadas).

#### Diferencia Crítica: WannaCry vs. Ransomware Genérico

-  El ransomware genérico llega por phishing o credenciales y espera ser ejecutado.
-  **WannaCry** era ransomware **con motor de gusano**: propagación autónoma por EternalBlue — sin humano en el bucle.
-  Su lección doble: el parche que nadie instaló (el ataque explotaba una brecha con parche disponible desde marzo) y la dependencia de infraestructura del atacante (el kill switch) — lecciones de higiene y de análisis que el SOC moderno sigue aplicando.

### Propósito fundamental

WannaCry es el caso fundacional del ransomware moderno: un gusano con extorsión que recorrió el mundo explotando una vulnerabilidad ya parcheada — detenido por la lectura astuta de un investigador que halló su kill switch — la lección triple que definió la era: parchea rápido, segmenta la red, y el malware siempre deja una costura que saber leer.
