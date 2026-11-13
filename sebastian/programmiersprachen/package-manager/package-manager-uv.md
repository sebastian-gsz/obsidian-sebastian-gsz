
**Cómo evitar ver la carpeta `.venv` en cada proyecto, me molesta estéticamente**, aprovechando al mismo tiempo el motor ultraeficiente de `uv`.

Con `uv`, no necesitas sacrificar la limpieza ni crear un Python global gigante:

1. **`uv` comparte los intérpretes de Python:** No duplica ejecutables en cada proyecto. Si usas Python 3.12 en tres proyectos, `uv` descarga el binario una sola vez en una caché global de tu sistema y hace enlaces simbólicos (*symlinks*) o copias ultra rápidas. En disco apenas ocupa espacio.
2. **Entornos independientes por proyecto:** Mantener un `.venv` local por proyecto (generado con `uv sync`) es la opción recomendada tanto por `uv`. Esto evita que el autocompletado y el linter (*basedpyright* / *ruff*) se confundan mezclando librerías de proyectos distintos.
![[barra.gif]]
-  **Directorios**

	-  **``~\AppData\Roaming\uv\python\``**: Aquí viven los intérpretes de Python
	-  **``~\AppData\Local\uv\cache``**: Aquí viven los paquetes
-  **Procesos**

	-  **Purga**
	
		`uv` cuenta con comandos nativos específicos en su interfaz de línea de comandos para limpiar y purgar la caché global, funcionando de manera similar a lo que hacen gestores como `npm` o `pnpm` con sus almacenes:
		
		-  **`uv cache prune`**: Es el equivalente más directo para la limpieza de mantenimiento periódico. Se encarga de eliminar entradas de caché que ya no se utilizan u objetos obsoletos (por ejemplo, archivos temporales o rastros dejados por versiones anteriores de la propia herramienta `uv`). Es seguro ejecutarlo de vez en cuando para liberar espacio.
		-  **`uv cache clean`**: Borra **absolutamente toda** la caché global de golpe. También te permite limpiar el historial de un paquete específico si ha corrompido algo (por ejemplo, ejecutando `uv cache clean ruff`).
		
		**La gran diferencia con `npm prune`:**
		
		-  En Node.js, `npm prune` elimina de una carpeta local `node_modules` aquellos paquetes que ya no están declarados en tu `package.json`.
		-  En `uv`, como cada proyecto tiene su propio `.venv` independiente que se crea y se destruye limpio con `uv sync`, no necesitas "purgar" dependencias huérfanas dentro del proyecto: si eliminas un paquete del `pyproject.toml` y vuelves a ejecutar `uv sync`, `uv` lo desinstala automáticamente de ese `.venv` local. Los comandos `uv cache prune` y `uv cache clean` operan sobre la **caché global del sistema operativo**, no sobre un repositorio individual.
	-  **Inicializar proyecto**
	
		- **``mkdir proyecto``**
		- **``cd proyecto``**
		- **``uv init``**
		- **``uv add pandas``**
		- **``uv add sqlalchemy``**
		- **``uv sync``**: Cada vez que realices un cambio en el proyecto ejecutas.

















































