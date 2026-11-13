---
def-type: atomic
version: 1.0
id: def-port-knocking
status: estandar
category: ciberseguridad
contexto: defensa-de-red
date: 2026-11-11
tags:
  - seguridad
  - firewall
  - redes
aliases:
  - port knocking
  - golpeo de puertos
---
**Port knocking** (golpeo de puertos) es una **técnica de seguridad que se utiliza para abrir puertos específicos en un firewall de forma externa**: el puerto deseado permanece cerrado hasta que el cliente envía una **secuencia predefinida de intentos de conexión a puertos cerrados** — el "toctoc" correcto abre la puerta; cualquier otra secuencia, nada.

#### La Analogía del Cerrojo

Imagina una casa con una puerta protegida por un cerrojo adicional: **el cerrojo solo se abre si llamas en un orden específico** — por ejemplo, dos timbres cortos y uno largo. El port knocking funciona igual: solo abre el puerto deseado después de recibir la secuencia correcta de intentos de conexión a puertos específicos — cerrados todos ellos.

#### Cómo Funciona

1.  El firewall mantiene **cerrado** el puerto sensible (por ejemplo, el 22 de SSH) — invisible para los escáneres.
2.  El cliente que lo conoce envía la secuencia acordada: paquetes SYN (o con payload criptográfico en variantes modernas) a puertos como 7001 → 7002 → 7003.
3.  El daemon de port knocking reconoce la secuencia y el firewall **abre dinámicamente** el puerto solo para la IP que golpeó.
4.  Para todos los demás, el puerto sigue inexistente — un escáner no lo ve porque jamás responde.

#### Para Qué se Usa

-  **Ocultar SSH** en servidores expuestos: el 22 deja de aparecer en los escaneos — la superficie visible desaparece mientras los que saben el golpe siguen entrando.
-  Añadir una capa de acceso selectivo a servicios administrativos sin VPN.

#### El Límite Honesto

-  El port knocking es **seguridad por oscuridad**: no cifra ni autentica el servicio — lo ESCONDE. Quien capture el tráfico de un cliente legítimo (o conozca la secuencia) entra igual.
-  Las variantes modernas con **autorización de un solo paquete** (single packet authorization, criptográfica) corrigen la debilidad del golpe plano — pero el principio de fondo queda: es un complemento del control de acceso, no su reemplazo.

#### Diferencia Crítica: Port Knocking vs. Firewall

-  El **firewall** aplica reglas fijas: el puerto está abierto o cerrado para todo el mundo según la política.
-  El **port knocking** hace el firewall DINÁMICO: la regla cambia solo para quien demuestra conocer la secuencia.
-  Se apilan: el firewall sigue siendo la ley; el port knocking añade el secreto que activa la excepción.

### Propósito fundamental

El port knocking es el toctoc criptográfico de la red: esconde el puerto tras una secuencia que solo los legítimos conocen — útil para desaparecer SSH de los escáneres — con su límite bien entendido: escurder no es proteger; la autenticación real del servicio sigue siendo imprescindible.
