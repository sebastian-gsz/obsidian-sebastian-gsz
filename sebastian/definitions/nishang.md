---
def-type: atomic
version: 1.0
id: def-nishang
status: estandar
category: ciberseguridad
contexto: herramientas-seguridad
date: 2026-11-11
tags:
  - powershell
  - pentesting
  - herramientas
  - red-team
aliases:
  - nishang
  - nishang framework
---
**Nishang** es un **framework o colección de scripts de PowerShell diseñado para tareas de seguridad ofensiva** — pruebas de penetración (_penetration testing_) y operaciones de equipo rojo (_red teaming_): un arsenal modular que aprovecha PowerShell, presente por diseño en todo Windows moderno, como plataforma de operación.

#### Qué Contiene

-  Scripts organizados por fase de ataque: enumeración y reconocimiento, escalada de privilegios, movimiento lateral, exfiltración y evasión.
-  Su script más conocido: el que permite establecer una **Reverse Shell (_Shell Inversa_)** con PowerShell — el objetivo se conecta DE VUELTA al atacante, atravesando NAT y firewalls que solo bloquean conexiones entrantes.
-  También incluye _Scan_, _Gather_, _Backdoors_ y utilidades de manipulación de datos — cada script autónomo, encadenable según la operación.

#### El Doble Uso — y el Marco Ético

Nishang es una herramienta de doble filo: en manos de un equipo autorizado, prueba qué un atacante real haría contra la red (y expone los huecos de detección); en manos de un atacante, es el mismo arsenal gratuito. Por eso su uso legítimo exige **autorización explícita** — el marco ético que separa el pentest del delito.

#### Cómo Defenderse de su Uso

-  **PowerShell es el vector**: logging de bloques de scripts, _Script Block Logging_ y AMSI permiten ver lo que los scripts intentan hacer.
-  Restringir la ejecución remota de PowerShell y los privilegios con los que corre; monitorear conexiones salientes inusuales (el patrón reverse shell).
-  En el SIEM: las técnicas que Nishang automatiza están mapeadas en MITRE ATT&CK — la detección se construye contra las técnicas, no contra el nombre de la herramienta.

#### Diferencia Crítica: Nishang vs. Mimikatz

-  **Mimikatz** es una herramienta concreta y especializada: extraer credenciales de Windows.
-  **Nishang** es una colección completa: cubre el ciclo de ataque entero con decenas de scripts — la caja de herramientas frente al destornillador.
-  Ambos comparten la misma naturaleza: herramientas legítimas de prueba cuyo abuso requiere defensa por técnicas (ATT&CK), no por listas negras de nombres.

### Propósito fundamental

Nishang representa la realidad del ataque Windows moderno: el atacante no instala software raro — usa el PowerShell que ya está instalado, con scripts empaquetados y listos. Defenderse de Nishang no es bloquear un archivo: es habilitar la visibilidad de PowerShell y detectar las técnicas que sus scripts ejecutan.
