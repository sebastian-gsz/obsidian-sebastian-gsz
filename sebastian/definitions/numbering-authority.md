---
def-type: atomic
version: 1.0
id: def-cna
status: estandar
category: organizaciones
contexto: ciberseguridad
date: 2026-06-16
tags:
  - vulnerabilidades
  - estandarizacion
  - cve
aliases:
  - cna
  - cve numbering authority
  - autoridad de numeración cve
---
Una CVE Numbering Authority (CNA) es una entidad autorizada por el programa CVE para asignar identificadores únicos (CVE IDs) a vulnerabilidades de seguridad que afectan a productos dentro de su ámbito de cobertura. Son los nodos descentralizados que permiten que la base de datos oficial de vulnerabilidades (el catálogo CVE) crezca de manera ordenada y eficiente.

#### Roles y responsabilidades

-  **Asignación de identificadores:** Cada CNA tiene un bloque de CVE IDs reservados. Cuando se descubre una vulnerabilidad, la CNA asigna un número (ej. CVE-2026-XXXXX) para rastrear el hallazgo de forma inequívoca.
-  **Divulgación responsable:** Actúan como puntos de contacto para investigadores de seguridad. Gestionan el ciclo de vida de la vulnerabilidad: recepción, validación, análisis, coordinación del parche y publicación final.
-  **Documentación técnica:** Son responsables de completar la información necesaria (descripción, vector de ataque, impacto, CVSS) para que la vulnerabilidad sea útil para otros equipos de seguridad y sistemas de escaneo.

#### ¿Por qué es importante para la seguridad?

La existencia de las CNAs permite una gestión de vulnerabilidades distribuida y a escala global:

-  **Estandarización:** Garantiza que cuando un equipo de TI busca información sobre un error en un software, todos los fabricantes y herramientas de seguridad hablen el mismo lenguaje utilizando el estándar CVE.
-  **Agilidad en la respuesta:** Al permitir que fabricantes (como Microsoft, Google, AWS) o empresas de seguridad (como Rapid7, Palo Alto) actúen como CNA, el tiempo desde que se descubre la vulnerabilidad hasta que se publica la alerta oficial se reduce significativamente.
-  **Visibilidad centralizada:** Aunque el proceso de numeración está descentralizado, la información final se consolida en el catálogo central mantenido por MITRE (y alimentado hacia el NVD - National Vulnerability Database), lo que facilita que los escáneres de vulnerabilidades detecten riesgos automáticamente en infraestructuras complejas.