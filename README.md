# obsidian-sebastian-gsz

Mi segundo cerebro: bóveda personal de [Obsidian](https://obsidian.md), en español.

Es un vault de trabajo y estudio que combina notas de estudio, un glosario de definiciones
consultable en todo el vault, tableros de proyectos y automatización desde la línea de comandos.

## Estructura

| Carpeta                  | Contenido                                                                |
| ------------------------ | ------------------------------------------------------------------------ |
| `sebastian/`             | Núcleo del vault: notas de estudio y glosario                            |
| `sebastian/definitions/` | **Glosario activo** — 450+ definiciones atómicas (1 archivo = 1 término) |
| `orquestrate-seed/`      | Semilla de orquestación: documentación y convenciones para agentes       |
| `.obsidian/`             | Configuración del vault (plugins, temas, ajustes)                        |

## Áreas temáticas

Ciberseguridad (`cybersicherheit`), cloud computing, inteligencia artificial, quantum,
arquitectura de software, programación, systemtechnik, economía y finanzas, investigación de mercados.

## El glosario (Note Definitions)

Cada archivo en `sebastian/definitions/` define un término en formato atómico:

- **Filename** = el término (kebab-case en inglés o español): `zero-day.md`, `pseudocodigo.md`.
- **Aliases** cubren el término en ambos idiomas y abreviaturas.
- El plugin [Note Definitions](https://github.com/dseum/Obsidian-Note-Definitions) los consume:
  al pasar el ratón sobre cualquier término en cualquier nota, aparece un _popover_ con su definición.
- Cada entrada lleva ciclo de vida propio (`status`: estandar → consolidado → finalizado → obsoleto).

## Automatización con Obsidian CLI

El vault se opera también desde la terminal (Obsidian 1.12+), tanto para uso diario
como para desarrollo de plugins:

```bash
obsidian search:context query="numpy" path="sebastian"   # buscar con contexto grep-style
obsidian daily:append content="- [ ] tarea"              # capturar en la nota diaria
obsidian plugin:reload id=note-definitions               # recargar un plugin tras editarlo
obsidian dev:errors                                      # verificar errores JS
```

## Privacidad

Este es un vault personal y privado. El contenido refleja apuntes de estudio y
trabajo en curso — no es documentación general ni material de referencia.
