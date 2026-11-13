---
def-type: atomic
version: 1.0
id: def-ransomware
status: estandar
category: amenazas
contexto: malware
date: 2026-11-11
tags:
  - ransomware
  - malware
  - amenazas
  - extorsion
aliases:
  - ransomware
  - secuestro de datos
  - ransomware attack
---
El **ransomware** (secuestro de datos) es **malware diseñado para mantener cautivo un sistema computacional o los datos que contiene hasta que se realice un pago**: cifra los archivos de la víctima con una clave que solo el atacante tiene y exige un rescate — típicamente en criptomonedas — por la llave de recuperación.

#### Cómo Opera

-  **Entrada**: phishing con adjunto, credenciales robadas por RDP expuesto, vulnerabilidades sin parchear — el acceso inicial, luego escalada y movimiento lateral hasta el objetivo valioso.
-  **Cifrado**: los archivos del sistema y de los recursos compartidos se cifran con claves asimétricas — la clave privada vive solo en el servidor del atacante.
-  **Extorsión**: la nota de rescate exige pago por la llave — con contador de tiempo y amenaza de destrucción.

#### El Ransomware Moderno: Doble Extorsión

-  El ransomware clásico solo cifraba; el moderno **también exfiltra**: copia los datos ANTES de cifrarlos y amenaza con publicarlos si no se paga — pagar la llave ya no garantiza el silencio.
-  Operado como negocio (RaaS — _Ransomware as a Service_): grupos como los históricos WannaCry (el brote de 2017 via worm), LockBit o REvil venden el ransomware a afiliados — la extorsión industrializada.

#### Defensa — la Que de Verdad Funciona

-  **Backups fuera de línea** y probados: la única garantía real de recuperación sin pagar — el atacante ataca también los backups accesibles por red.
-  Superficie reducida: parcheo, MFA, RDP cerrado al exterior, segmentación (que el ransomware no cruce de una máquina a todo el dominio).
-  Detección temprana (EDR): el cifrado masivo es un patrón evidente — si se detecta en la primera máquina, el desastre no se convierte en catastrofe.

#### Diferencia Crítica: Ransomware vs. Malware Genérico

-  El malware genérico daña, espía o persiste — su objetivo es el sistema.
-  El **ransomware** extorsiona: su objetivo es el NEGOCIO de la víctima — el daño es la palanca de negociación, no el fin.
-  Por eso el ransomware es económicamente racional para el atacante y cada vez más dirigido: vale más secuestrar la operación de una empresa que infectar mil PCs de particular.

### Propósito fundamental

El ransomware convierte el malware en negocio de extorsión: secuestra el dato — el activo que la empresa no puede esperar a recuperar — y monetiza directamente la interrupción — la amenaza que redefinió la ciberdefensa corporativa, porque cambió la pregunta de "¿cómo evito la infección?" a "¿cómo garantizo que puedo continuar sin pagar?".
