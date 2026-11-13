---
def-type: atomic
version: 1.0
id: def-scp
status: estandar
category: cloud-computing
contexto: control-de-acceso
date: 2026-11-11
tags:
  - aws
  - gobernanza
  - seguridad
  - organizaciones
aliases:
  - scps
  - service control policies
  - políticas de control de servicio de aws
---
Las **SCPs** (_Service Control Policies_ — políticas de control de servicio) son las **políticas de control de acceso de AWS Organizations**: **guardarraíles** que se aplican a nivel de organización, unidad organizativa (OU) o cuenta — el techo máximo de permisos que NADIE dentro de esa cuenta puede superar, ni siquiera el administrador.

#### Cómo Funcionan

-  Las SCPs se definen en **AWS Organizations** y se adjuntan a OUs o cuentas — afectan a TODOS los usuarios y roles de las cuentas bajo su alcance, incluidos los de permisos totales.
-  **No conceden nada**: solo LIMITAN — una SCP declara lo que NO se puede hacer (denegación explícita) o el techo de lo permitido; los permisos efectivos son la intersección entre IAM y las SCPs aplicables.
-  El caso de uso canónico: prohibir la salida de una región, impedir deshabilitar CloudTrail, bloquear la eliminación de recursos críticos — reglas de la casa que ningún equipo puede saltarse, aunque sea dueño de la cuenta.

#### Su Lugar en el Modelo de Permisos de AWS

La cadena de evaluación de permisos en AWS: **SCPs de la organización** → políticas de control de recursos → **políticas IAM de identidad** → el permiso debe estar permitido EN TODAS las capas. Las SCPs son el primer y más alto filtro — la constitución por encima de las leyes locales.

#### Diferencia Crítica: SCP vs. Política IAM

-  La **política IAM** CONCEDE: define qué puede hacer una identidad — el mecanismo de permisos diario.
-  La **SCP** LIMITA: define qué NO puede hacer nadie en la cuenta, pase lo que pase con IAM — el guarda-rail corporativo.
-  La relación jerárquica es la clave: un administrador con `*` en IAM sigue bloqueado por la SCP que niega la región prohibida — el guarda-rail es más fuerte que cualquier permiso local.

#### Diferencia Crítica: SCP vs. RBAC

-  El **RBAC** organiza los permisos por rol — el diseño de QUIÉN accede a qué.
-  Las **SCPs** son el perímetro organizativo: el techo que toda la jerarquía de roles debe respetar.
-  Se complementan: los roles dibujan el acceso fino; las SCPs dibujan los límites que ninguna política interna puede cruzar — gobernanza multicuenta real.

### Propósito fundamental

Las SCPs son los guardarraíles de la organización en AWS: políticas que limitan — sin conceder — lo que cualquier identidad de las cuentas puede hacer, incluidos los administradores — la herramienta de gobernanza que convierte "le pedimos a los equipos que no hagan esto" en "esto es técnicamente imposible".
