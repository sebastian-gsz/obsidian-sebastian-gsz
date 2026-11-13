---
def-type: atomic
version: 1.0
id: def-hipaa
status: estandar
category: gobernanza
contexto: proteccion-de-datos
date: 2026-11-11
tags:
  - hipaa
  - cumplimiento
  - salud
  - privacidad
aliases:
  - hipaa
  - ley de responsabilidad y portabilidad del seguro médico
  - health insurance portability and accountability act
---
**HIPAA** (_Health Insurance Portability and Accountability Act_ — Ley de Responsabilidad y Portabilidad del Seguro Médico) es una **ley federal de EE. UU. establecida para proteger la información de salud de los pacientes**: define quién puede ver, usar y divulgar los datos médicos, y con qué garantías de seguridad deben manejarse.

#### Qué Protege

-  La **PHI** (_Protected Health Information_): los datos de salud vinculados a la identidad de un paciente — historiales médicos, tratamientos, facturación sanitaria, resultados de laboratorio.
-  El vínculo con el análisis de datos es directo: cualquier dataset que contenga información de pacientes entra en el alcance de HIPAA — y por eso la PHI es una categoría propia en la clasificación de datos sensibles.

#### Sus Pilares Regulatorios

-  **Regla de Privacidad**: limita quién puede usar y divulgar la PHI y para qué fines.
-  **Regla de Seguridad**: exige salvaguardas administrativas, físicas y técnicas (cifrado, control de acceso, auditoría) para la PHI electrónica.
-  **Regla de Notificación de Brechas**: obliga a notificar a los pacientes y al gobierno cuando la PHI se expone.

#### A Quién Obliga

A los _covered entities_ — proveedores de salud, aseguradoras y cámaras de compensación — y a sus **business associates**: cualquier proveedor que maneje sus datos (cloud, software médico, servicios de facturación). Las sanciones por incumplimiento son severas y escalan con la negligencia.

#### Diferencia Crítica: HIPAA vs. GDPR

-  **HIPAA** es una ley **sectorial** estadounidense: protege solo los datos de salud, dentro del sistema sanitario.
-  El **GDPR** europeo es **general**: protege todos los datos personales de cualquier ciudadano UE, en cualquier sector.
-  Un dataset puede estar fuera del alcance de HIPAA y dentro del del GDPR a la vez — el marco aplicable depende de qué dato, de quién y dónde, no de la buena voluntad del equipo de datos.

### Propósito fundamental

HIPAA es el ejemplo canónico de regulación sectorial de datos: convierte la información de salud en una categoría legalmente protegida con salvaguardas exigibles y sanciones reales — el recordatorio permanente de que en el análisis de datos, la primera pregunta sobre un dataset con pacientes no es "¿qué podemos calcular?", sino "¿qué ley nos obliga y qué se nos permite?".
