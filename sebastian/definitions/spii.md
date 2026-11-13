---
def-type: atomic
version: 1.0
id: def-spii
status: estandar
category: gobernanza
contexto: proteccion-de-datos
date: 2026-11-11
tags:
  - privacidad
  - pii
  - datos-sensibles
  - cumplimiento
aliases:
  - spii
  - información confidencial de identificación personal
  - sensitive pii
---
La **SPII** (_Sensitive Personally Identifiable Information_ — información confidencial de identificación personal) es un **tipo específico de PII que se rige por pautas de manejo más estrictas**: si la filtración de PII común incomoda o expone, la filtración de SPII causa daño directo e inmediato a la persona — por eso su manipulación exige controles reforzados por diseño.

#### Qué Califica como SPII

-  Identificadores gubernamentales: número de seguridad social, pasaporte, documento de identidad.
-  Datos financieros: números de tarjetas, cuentas bancarias, historial crediticio.
-  Datos biométricos: huellas, iris, reconocimiento facial.
-  Credenciales de acceso y secretos; información de salud; orientación u origen que habilite discriminación.

#### Diferencia Crítica: SPII vs. PII

-  Toda SPII es PII, pero no toda PII es SPII: el **nombre completo** identifica (PII) pero filtrado solo no habilita fraude; el **número de tarjeta con CVV** habilita robo directo (SPII).
-  La consecuencia práctica: PII puede manejarse con controles estándar; SPII exige **cifrado en reposo y tránsito obligatorio, acceso mínimo por necesidad de saber, retención corta, tokenización o máscara** y auditoría de cada lectura.
-  El criterio de decisión: pregunta "¿si este dato se filtra, la persona sufre daño inmediato (fraude, suplantación, chantaje)?" — si sí, es SPII y las reglas se endurecen.

#### Familia de Datos Sensibles

La SPII convive con acrónimos hermanos según el marco: PHI (datos de salud regulados por HIPAA) y PSI (información personal sensible) apuntan al mismo territorio con definiciones propias de cada norma — en todos los casos la lógica es la misma: cuanto más directo el daño potencial, más estricta la pauta.

### Propósito fundamental

La SPII marca la línea roja del manejo de datos personales: dentro de todo lo que identifica a una persona, existe un subconjunto cuyo filtrado causa daño inmediato — y clasificar los datos en PII frente a SPII es lo que permite aplicar cifrado, acceso mínimo y retención donde de verdad importan, en lugar de tratar toda la información con la misma laxitud.
