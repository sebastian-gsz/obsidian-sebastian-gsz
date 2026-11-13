---
def-type: atomic
version: 1.0
id: def-rainbow-table
status: estandar
category: amenazas
contexto: credenciales
date: 2026-11-12
tags:
  - credenciales
  - criptografia
  - ataques
aliases:
  - tabla arcoíris
  - rainbow table
  - tablas rainbow
---
Una **tabla arcoíris** (_rainbow table_) es una **base de datos de hashes precalculados que se usa para descifrar contraseñas**: en lugar de calcular el hash de cada contraseña candidata al momento, el atacante consulta la tabla — el trabajo pesado ya está hecho de antemano.

#### Cómo Funciona

-  El problema del cracking: para cada contraseña candidata habría que calcular su hash y comparar — lento a escala.
-  La tabla arcoíris **precalcula millones (o miles de millones) de pares cadena-hash** con reducciones intermedias que comprimen el espacio — el atacante busca el hash robado en la tabla y recupera la contraseña en segundos.
-  El trade-off clásico: **espacio por tiempo** — la tabla ocupa terabytes pero convierte horas de cálculo en una consulta instantánea.

#### Por Qué Han Muerto (para contraseñas bien guardadas)

-  **La sal (_salt_)**: un valor aleatorio único por usuario mezclado antes de hashear — la misma contraseña produce hashes distintos en cada cuenta — las tablas genéricas quedan inútiles.
-  **Las KDF modernas** (bcrypt, scrypt, Argon2): deliberadamente lentas y configurables — calcular cada hash toma milisegundos o segundos a propósito, haciendo la tabla precalculada insostenible en espacio.
-  Las tablas siguen siendo efectivas contra **hashes rápidos sin sal** (MD5/SHA-1 de contraseñas) — los hallazgos de filtraciones históricas que aún usan estos esquemas.

#### Diferencia Crítica: Rainbow Table vs. Fuerza Bruta

-  La **fuerza bruta** calcula al momento: prueba candidata → hash → compara. Lenta, pero funciona contra cualquier esquema con suficientes recursos.
-  La **tabla arcoíris** consulta lo precalculado: instantánea, pero solo contra esquemas sin sal y solo para las contraseñas incluidas en la tabla.
-  La relación con **Mimikatz**: ni siquiera se necesitan — extraer hashes de la memoria y hacer pass-the-hash salta el cracking por completo; la tabla y la fuerza bruta son el plan B cuando el hash ya está protegido en tránsito.

#### Defensa

Almacenar contraseñas con **sal única + KDF lenta** (bcrypt/Argon2) — nunca MD5/SHA puro; MFA para que el hash robado no sea suficiente; y rotación de credenciales filtradas.

### Propósito fundamental

La tabla arcoíris es el ataque de la preparación: millones de hashes calculados de antemano para responder en segundos — y su muerte a manos de la sal y las KDF lentas es la lección de diseño de credenciales más importante de la criptografía aplicada: el tiempo de cálculo deliberado es una defensa, y la sal única por usuario mata el precalculo.
