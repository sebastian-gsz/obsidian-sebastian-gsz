---
def-type: def-lab-local
version: 1
status: queued
category: implementación
date: 2026-07-02
id: lab-aws-nfs-storagegateway-datasync-local
---
Esta es la documentación técnica y estratégica del laboratorio de infraestructura híbrida definida para tu entorno de trabajo.

### Objetivos del laboratorio

El propósito es construir un centro de datos local que replique una arquitectura empresarial real, permitiendo el despliegue de servicios críticos como Active Directory (AD), servidores de archivos NFS integrados al dominio y conectividad híbrida con proveedores de nube. El diseño se centra en la orquestación centralizada y la alineación con el ecosistema de Azure.

### Análisis de opciones tecnológicas

Se evaluaron dos arquitecturas principales para el nivel de virtualización y gestión. La decisión se basó en la necesidad de coherencia con tu stack profesional orientado a Azure.

|**Criterio**|**Opción A: Proxmox VE**|**Opción B: Windows Server + Hyper-V**|
|---|---|---|
|**Enfoque**|Hipervisor bare-metal open source (Type 1).|Sistema operativo de servidor con rol de virtualización.|
|**Sinergia Azure**|Alta, pero requiere capa de abstracción externa.|Nativa, alineada con Azure Stack HCI y Azure Arc.|
|**Gestión**|Web GUI local por nodo.|Centralizada mediante Windows Admin Center (WAC).|
|**Decisión**|Descartada.|**Seleccionada.**|

La elección de la **Opción B** se fundamenta en la capacidad de utilizar Windows Admin Center (WAC) para orquestar múltiples nodos (incluyendo el Gaming PC y el HP Pavilion) desde una única consola web, emulando la gestión de clústeres empresariales.

### Arquitectura elegida

- **Capa de gestión (Orquestador):** Tu equipo principal con Windows 11 Enterprise ejecutando Windows Admin Center (WAC). Desde aquí gestionarás todos los nodos de cómputo.
- **Capa de cómputo (Nodos):** Equipos secundarios (Gaming PC y HP Pavilion) con Windows Server 2022 instalado, operando como hosts de Hyper-V.
- **Capa de identidad y servicios:** Controladores de dominio (AD) y servidores NFS virtualizados sobre los hosts de cómputo, unidos al dominio para gestión de permisos centralizada.
- **Capa de conectividad:** Túnel VPN IPsec hacia la nube para extender la red local (Site-to-Site VPN), simulando una conexión Direct Connect

### Pasos para la implementación

El despliegue se ejecutará de forma modular para garantizar estabilidad y control en cada fase:

1. **Preparación de nodos de cómputo**

    - Instalación de Windows Server 2022 en los equipos secundarios (Gaming PC y HP Pavilion).
    - Activación del rol de Hyper-V en cada equipo.
    - Configuración de red estática en cada host para permitir la comunicación con el orquestador.
2. **Configuración del centro de gestión**

    - Instalación de Windows Admin Center en el equipo principal (Windows 11).
    - Registro de los nodos de cómputo (Gaming PC y HP Pavilion) en la consola de WAC para centralizar el despliegue de máquinas virtuales.
3. **Despliegue de servicios core**

    - Virtualización del controlador de dominio (Active Directory) en uno de los nodos.
    - Configuración de servidor NFS en una máquina virtual Linux, realizando la unión al dominio mediante SSSD para integración de permisos POSIX.
4. **Integración híbrida**

    - Despliegue de la solución de VPN Site-to-Site para establecer el túnel con la infraestructura en la nube.
    - Instalación del agente de Azure Arc en las máquinas locales para visualizar y gestionar recursos locales desde el portal de Azure.
        

----
###### 1. La base: Infraestructura de virtualización

No instales antiX (o Windows/Linux de escritorio) directamente para correr máquinas virtuales a mano. Eso es ineficiente.

- **Instala Proxmox VE (Hypervisor de Tipo 1):** Instálalo en el equipo Gaming (el de 2018) y en tu portátil (si decides dedicarlo al lab). Proxmox te permitirá gestionar todas tus máquinas virtuales a través de un navegador, igual que si estuvieras en un entorno corporativo real.
- **Capacidad:** Con Proxmox en ambos equipos, puedes crear un "Cluster". Esto te permitirá, por ejemplo, migrar máquinas virtuales de un equipo a otro en caliente.
- **Gestión:** Esto es lo que usan las empresas reales. Aprender Proxmox es una competencia de alto valor para un arquitecto de soluciones.
###### 2. El desafío de la red: ¿Direct Connect en casa?

No puedes contratar un **Direct Connect (DX)** real en casa porque requiere una conexión física en un centro de datos. Sin embargo, para un arquitecto, **la arquitectura lógica es lo que importa**.

- **La alternativa real:** Utiliza **Site-to-Site VPN (IPsec)**.
- **Cómo hacerlo:**

    1. Instala una máquina virtual con **OPNsense** o **pfSense** en tu Proxmox local.
    2. Esta máquina será tu **Gateway de Seguridad**.
    3. Configura un túnel VPN IPsec entre tu OPNsense y el **Virtual Private Gateway (VGW)** o **Transit Gateway** en AWS.
    4. **Resultado:** AWS creerá que tu casa es una oficina remota más. La red será transparente, segura y cifrada. Esto es exactamente lo que hace una empresa antes de dar el salto a DX.

###### 3. Diseño del lab enterprise

Para que sea un escenario real, vamos a estructurarlo así:

- **AD (Active Directory):** Despliega una VM con Windows Server 2022 Evaluation. Úsala como controlador de dominio principal. Aprenderás a gestionar GPOs, DNS y autenticación Kerberos.
    
- **Servidor NFS:** Puedes montarlo en una VM de Linux (Rocky Linux o Debian) dentro de Proxmox.
    
- **Integración:** Une el servidor NFS al dominio de Active Directory usando SSSD o Winbind. Así, tus permisos POSIX dejarán de ser números (UID/GID) y pasarán a ser nombres reales de usuarios de tu Active Directory.
    
- **Storage Gateway / DataSync:** Aquí es donde el lab se pone interesante. Configura tu servidor NFS local y usa DataSync para migrar datos a S3, tal como planeamos, usando la VPN que creaste en el paso anterior.
    

###### 4. ¿Qué pasa con CML (Cisco Modeling Labs)?

CML es excelente para aprender **enrutamiento avanzado (BGP, OSPF)**.

- **Mi consejo:** No lo uses todavía. Primero domina la arquitectura de red básica con OPNsense + VPN + VPC.
    
- Si más adelante quieres simular redes complejas (ej. tener dos proveedores de internet en casa y hacer balanceo de carga), CML o **GNS3** son las herramientas indicadas. Pero por ahora, tu infraestructura local está subutilizada; úsala antes de pagar por software de emulación.
    

