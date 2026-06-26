---
def-type: atomic
version: 1.0
id: def-criptografia-fundamentos
status: estandar
category: mecanismos-de-seguridad
contexto: criptografía
date: 2026-06-26
tags:
  - criptografía
  - seguridad
  - pki
  - cifrado
aliases:
  - pki
  - cifrado simétrico
  - cifrado asimétrico
  - aes
  - symmetric encryption
  - asymmetric encryption
---
La criptografía es la ciencia que garantiza la confidencialidad, integridad y autenticidad de la información mediante algoritmos matemáticos.

-  **Cifrado (Encriptación)**

	Proceso técnico de transformar datos legibles (_plaintext_) en una representación codificada (_ciphertext_) mediante el uso de algoritmos y claves. El objetivo es asegurar que solo los usuarios autorizados, poseedores de la clave correspondiente, puedan revertir el proceso para acceder a la información original.
-  **Cifrado Simétrico (Ej. AES)**

	Utiliza una **única clave secreta** tanto para cifrar como para descifrar la información.
	
	-  **Eficiencia:** Es significativamente más rápido que el cifrado asimétrico, por lo que es el estándar para cifrar grandes volúmenes de datos.
	-  **AES (Advanced Encryption Standard):** Es el estándar actual de la industria. AES-256 (con clave de 256 bits) es considerado altamente seguro y es utilizado globalmente para el cifrado en reposo y en tránsito.
	-  **Desafío:** La distribución de la clave es crítica; si la clave es interceptada durante el envío, la seguridad se ve comprometida.
-  **Cifrado Asimétrico (Clave Pública)**

	Utiliza un **par de claves vinculadas matemáticamente**:
	
	-  **Clave Pública:** Se distribuye abiertamente y se utiliza para cifrar datos.
	-  **Clave Privada:** Se mantiene secreta y es la única capaz de descifrar los datos cifrados con la clave pública correspondiente.
	-  **Uso:** Ideal para intercambio seguro de claves simétricas (como en el protocolo TLS) y firmas digitales.
-  **PKI (Infraestructura de Clave Pública)**

	Es el ecosistema jerárquico diseñado para gestionar la confianza en un sistema de claves asimétricas.
	
	-  **Certificados Digitales:** Documentos electrónicos que vinculan una identidad (sujeto) con su clave pública.
	-  **Autoridad de Certificación (CA):** Entidad de confianza que firma los certificados, garantizando que la clave pública pertenece realmente a la entidad declarada.
	-  **Función:** Permite que sistemas remotos (ej. navegadores web) verifiquen la autenticidad de servidores antes de establecer una conexión cifrada.