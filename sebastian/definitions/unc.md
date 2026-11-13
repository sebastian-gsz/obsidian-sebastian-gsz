---
def-type: atomic
version: 1.0
id: def-unc
status: estandar
category: redes
contexto: servicios-de-red
date: 2026-11-12
tags:
  - redes
  - windows
  - samba
  - archivos
aliases:
  - unc
  - universal naming convention
  - convención de nomenclatura universal
---
La **UNC** (_Universal Naming Convention_ — convención de nomenclatura universal) es la **forma estándar de referirse y acceder a archivos y carpetas compartidos en una red local** — especialmente en entornos **Windows** (aunque también soportada por macOS y Linux vía **Samba**): la ruta que nombra un recurso por su servidor, no por su letra de unidad.

#### La Estructura

`\\NombreDelServidor\NombreDelRecursoCompartido\RutaDeLaCarpeta\NombreDelArchivo`

-  **NombreDelServidor**: la computadora o servidor que comparte el recurso — por nombre o por dirección IP.
-  **NombreDelRecursoCompartido**: el nombre que recibió la carpeta cuando se configuró como compartida (_share_).
-  **RutaDeLaCarpeta\NombreDelArchivo** (opcional): la subruta dentro del recurso compartido.

#### Cómo se Usa

-  En el explorador o la línea de comandos: `\\servidor-archivos\publico\informes\Q4.xlsx` — sin mapear unidad.
-  **Contra la unidad mapeada** (`Z:\informes\...`): el mapeo depende de la sesión del usuario y de qué letras quedan libres; la UNC funciona igual para todos, siempre, desde scripts y servicios.
-  Es el mecanismo natural de acceso a **recursos SMB** — los shares de Windows (y de Samba en Linux/macOS) — la capa de archivo sobre la que corren los NAS de entorno Windows.

#### Nota de Seguridad

Los paths UNC aparecen en forense y en ofensiva: la navegación de shares (`\\servidor\c$` — el share administrativo oculto) es técnica clásica de movimiento lateral — y su monitoreo (quién accede a qué share con qué credenciales) es control básico en entornos Windows.

#### Diferencia Crítica: UNC vs. Unidad Mapeada

-  La **unidad mapeada** (Z:) es un atajo personal y por sesión — conveniente para el usuario, frágil para los scripts.
-  La **UNC** es la dirección completa y canónica del recurso — funciona en cualquier contexto, sin mapeo previo, para humanos y servicios por igual.
-  En automatización y auditoría, siempre UNC: la ruta que no depende de quién, cuándo ni con qué letras mapeó.

### Propósito fundamental

La UNC es la dirección canónica de los recursos compartados en red: servidor, recurso compartido y ruta — el estándar que nombra archivos de red sin unidades mapeadas — la referencia universal del mundo SMB/Windows y el rastro que deja el movimiento lateral en los logs.
