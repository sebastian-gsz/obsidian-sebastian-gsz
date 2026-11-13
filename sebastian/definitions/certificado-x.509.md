---
def-type: atomic
version: 1
id: def-certificado-x509
status: estandar
category: seguridad
contexto: infraestructura-de-clave-publica
date: 2026-06-27
tags:
  - seguridad
  - pki
  - criptografia
  - certificados
aliases:
  - x.509
  - certificado digital
  - certificate x.509
  - certificado x.509
---
El certificado x.509 es un estándar internacional que define el formato de los certificados de clave pública utilizados en la Infraestructura de Clave Pública (PKI). Su función principal es vincular una clave pública a una identidad específica (una persona, organización o servidor), permitiendo verificar la autenticidad y asegurar la integridad de la información en comunicaciones digitales.

#### Estructura del certificado

Un certificado x.509 contiene información estructurada que permite a terceros verificar la confianza:

-  **Versión:** Indica la versión del estándar x.509 (actualmente la v3).
-  **Número de serie:** Identificador único asignado por la Autoridad de Certificación (CA).
-  **Algoritmo de firma:** Define el método criptográfico usado para firmar el certificado.
-  **Emisor (Issuer):** La identidad de la CA que emitió y firmó el certificado.
-  **Periodo de validez:** Fechas de inicio (_not before_) y expiración (_not after_).
-  **Asunto (Subject):** La identidad a la que pertenece la clave pública.
-  **Clave pública:** La clave pública del sujeto, usada para cifrado o verificación.
-  **Firma digital:** Hash del contenido del certificado firmado con la clave privada de la CA, lo que garantiza que el certificado no ha sido alterado.

#### Propósito y casos de uso

El certificado x.509 es la piedra angular de la seguridad moderna:

-  **Seguridad web:** Es el componente central en el protocolo TLS/SSL (HTTPS), donde el navegador verifica que el certificado presentado por el servidor es auténtico y pertenece al dominio visitado.
-  **Autenticación de servicios:** Es fundamental para mTLS, donde servidores y clientes utilizan certificados para validarse mutuamente.
-  **Firma de documentos y correos:** Utilizado en S/MIME y firmas digitales para garantizar que el remitente es quien dice ser y que el mensaje no fue modificado.

#### Verificación técnica

Para inspeccionar el contenido de un certificado en formato PEM desde la línea de comandos, utiliza: `openssl x509 -in certificado.crt -text -noout`