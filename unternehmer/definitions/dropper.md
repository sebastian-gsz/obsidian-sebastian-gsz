---
def-type: atomic
version: 1.0
id: def-dropper
status: estandar
category: tipos-de-malware
contexto: seguridad-informática
date: 2026-06-22
tags:
  - malware
  - ciberseguridad
  - amenazas
aliases:
  - cargador
  - malware dropper
  - dropper
---
Un malware dropper (o cargador) es una pieza de software malicioso diseñada específicamente para instalar, depositar o ejecutar otros programas maliciosos en un sistema objetivo. Su función principal es actuar como un vehículo de entrega sigiloso, permitiendo que la carga útil (_payload_) maliciosa logre sortear los controles de seguridad perimetrales iniciales.

El _dropper_ se caracteriza por ser un código generalmente pequeño y minimalista, lo que optimiza su capacidad de evadir la detección estática de los antivirus tradicionales. Una vez que logra infiltrarse en el sistema, procede a descargar, extraer o ejecutar el _payload_ principal, que puede variar desde _ransomware_ hasta troyanos de acceso remoto o _spyware_.

-  **Evasión de seguridad:** Su diseño minimalista y, a menudo, ofuscado, busca minimizar la huella digital del ejecutable para evitar ser bloqueado o analizado durante la fase de entrada.
-  **Desacoplamiento estratégico:** Separa la fase de infección inicial de la ejecución del daño; esto permite que el atacante entregue el _payload_ final solo si el sistema es susceptible o si recibe instrucciones dinámicas de un servidor de mando y control (C2).
-  **Funcionalidad de despliegue:** Facilita la persistencia en el sistema al actuar como un descargador o instalador de componentes adicionales, asegurando que el ataque se complete de forma orquestada y escalonada.