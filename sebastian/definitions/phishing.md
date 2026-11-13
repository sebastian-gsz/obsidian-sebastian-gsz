---
def-type: atomic
version: 1.0
id: def-phishing
status: estandar
category: amenazas
contexto: ingenieria-social
date: 2026-11-11
tags:
  - phishing
  - ingenieria-social
  - amenazas
aliases:
  - phishing
  - suplantación de identidad
  - smishing
---
El **phishing** (suplantación de identidad) es una familia de **estafas que utilizan correos, SMS, llamadas o mensajes personalizados para engañar a la víctima**: el atacante se hace pasar por una entidad de confianza — banco, tienda, jefe, servicio técnico — para robar credenciales, dinero o acceso.

#### Las Variantes Según el Canal

-  **Phishing (correo)**: el clásico — correos falsos con enlaces o adjuntos que imitan a una entidad legítima.
-  **Smishing** (_SMS phishing_): la estafa por **mensaje de texto** — el paquete que no pediste, el "banco" que bloquea tu tarjeta.
-  **Vishing** (_voice phishing_): la estafa por **llamada** — el "soporte técnico" que pide tus credenciales o te hace instalar "herramientas" de ayuda.
-  **Spear phishing**: la variante **dirigida** — investigada y personalizada contra una víctima concreta (su variante contra ejecutivos tiene nombre propio: _whaling_).
-  Otras variantes registradas en este glosario: **angler phishing** (suplantación en redes sociales, respondiendo a quejas de clientes).

#### Por Qué Funciona

El phishing no explota un bug del software: explota la **confianza y la prisa humanas** — el contenido suele crear urgencia ("tu cuenta será bloqueada en 24 horas") y autoridad ("el departamento de TI"). Es el vector de entrada inicial de la mayoría de las intrusiones: el clic que abre la puerta a todo lo demás.

#### Defensa

Verificar remitentes y URLs antes de creer; desconfiar de la urgencia; nunca escribir credenciales llegando desde un enlace; MFA para limitar el daño de las credenciales robadas; y en la infraestructura: filtrado de correo (como Defender for Office 365) y capacitación — el usuario entrenado es el último y mejor filtro.

#### Diferencia Crítica: Phishing vs. Kit de Phishing

-  El **phishing** es la estafa y sus variantes: la campaña que engaña.
-  El **kit de phishing** es la herramienta que industrializa la estafa: plantillas, paneles y automatización.
-  La estafa es el comportamiento; el kit es el producto que la escala.

### Propósito fundamental

El phishing es la ingeniería social en su forma más rentable: no rompe el software, rompe la confianza de una persona — y por eso su defensa no es solo técnica: es una combinación de filtros, verificación y cultura, porque el ataque perfecto contra un humano no necesita exploits, solo prisa y un enlace convincente.
