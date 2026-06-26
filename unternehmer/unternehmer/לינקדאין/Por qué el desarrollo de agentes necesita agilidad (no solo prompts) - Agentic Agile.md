
----
**[Evolución de las habilidades de agente en Python](https://devblogs.microsoft.com/agent-framework/agent-skills-for-python-file-code-and-class-composed-in-one-provider/)**

Los desarrolladores de Python que trabajan con Agent Skills ahora pueden crear habilidades de tres formas: como archivos en disco, como código en línea o como clases reutilizables.

La verdadera potencia llega con las fuentes componibles. Ahora puedes mezclar habilidades de diferentes orígenes sin fricción: una habilidad local en tu repositorio, otra instalada desde el índice interno de paquetes de tu organización y un puente en línea que escribiste hace diez minutos para cubrir una necesidad inmediata. Todo conectado al mismo proveedor.

Este es el tercer capítulo de nuestra serie sobre Habilidades para Agentes. Tras presentar las habilidades basadas en archivos y las definidas por código, completamos el cuadro con habilidades basadas en clases y composición multifuente.

El escenario: un agente de autoservicio de RRHH.

1. Empezamos con una guía de incorporación basada en archivos.
2. Integramos una habilidad de inscripción de beneficios empaquetada como paquete de Python.
3. Creamos un puente temporal en línea para consultar saldos de vacaciones, que será reemplazado por el paquete oficial cuando esté listo, sin tocar el resto del código.

Por qué esto cambia la forma en que construimos agentes:

- Propiedad independiente: cada equipo desarrolla y publica sus habilidades a su ritmo.
- Crecimiento aditivo: las habilidades se suman, no requieren refactorización.
- Prototipado rápido: pasa de código en línea a paquetes oficiales con un cambio de una sola línea.
- Seguridad: la nueva capacidad de requerir aprobación humana garantiza que los scripts con efectos secundarios tengan supervisión antes de ejecutarse.

El SDK de Python ahora ofrece la flexibilidad total para combinar, filtrar y deduplicar habilidades según las necesidades de tu arquitectura. Si trabajas con .NET, el flujo es idéntico con las mismas APIs idiomáticas.

Puedes consultar el detalle técnico y los ejemplos completos en nuestra documentación.

---

