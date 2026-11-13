---
def-type: atomic
version: 1.0
id: def-logica-de-negocio
status: estandar
category: general
contexto: ingenieria-de-software
date: 2026-11-11
tags:
  - arquitectura
  - negocio
  - software
  - diseno
aliases:
  - lógica de negocio
  - logica de negocio
  - business logic
---
La **lógica de negocio** es el conjunto de **reglas, validaciones y procesos que representan cómo funciona tu aplicación en el mundo real**: el corazón funcional del sistema — lo que define cómo deben comportarse las operaciones para cumplir las necesidades del negocio, independientemente de cómo se muestren o almacenen los datos.

#### El Ejemplo Canónico

En un sistema bancario, la lógica de negocio define que **una transferencia no puede superar el saldo disponible** o que un préstamo requiere cierta validación de crédito. La interfaz puede ser una app o un cajero; la base de datos puede ser PostgreSQL o Oracle — pero la regla "no gastas lo que no tienes" es del negocio, y vive en esta capa.

#### Sus Tres Ingredientes

-  **Lógica de negocio**: cómo debe comportarse el sistema — el corazón funcional.
-  **Reglas de negocio**: las normas específicas que la gobiernan, expresadas como condiciones y validaciones ("no más de 3 préstamos activos", "pedidos superiores a 100 € con envío gratis") — las leyes internas que el software respeta.
-  **Procesos centrales**: los flujos de trabajo que materializan la lógica — facturación, alta de cliente, gestión de inventario — conjuntos organizados de tareas críticas (una tarea puntual es "enviar un correo"; un proceso es el onboarding completo). La lógica de negocio es lo que asegura que tareas y procesos sigan las reglas correctas.

#### Diferencia Crítica: Lógica de Negocio vs. las Otras Capas

-  **Lógica de presentación** → cómo se muestran los datos al usuario (colores, pantallas, formularios).
-  **Lógica de acceso a datos** → cómo se guardan y recuperan de la base.
-  **Lógica de negocio** → qué reglas gobiernan el comportamiento real del negocio. Confundir capas — meter una regla de negocio en la interfaz — es la semilla del software imposible de mantener.

#### Beneficios de Encapsularla

**Reutilización** (las reglas aplican en distintos contextos sin duplicar código), **mantenibilidad** (cambia la regla, se toca una capa), **seguridad** (la lógica crítica no queda expuesta ni manipulable desde la interfaz), **escalabilidad** (añadir reglas sin romper el resto) y **claridad arquitectónica** (cada capa con su responsabilidad).

### Propósito fundamental

La lógica de negocio es donde el software deja de ser tecnología y empieza a ser la empresa: al encapsular reglas, validaciones y procesos en su propia capa, el sistema modela el negocio de forma explícita y evolucionable — y protege sus reglas críticas de vivir dispersas e incontrolables en las interfaces y en las bases de datos.
