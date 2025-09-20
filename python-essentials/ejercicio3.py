def agregar_tarea(tareas: list[str], tarea: str) -> None:
    tarea = tarea.strip()
    if tarea and tarea not in tareas:
        tareas.append(tarea)

def eliminar_tarea(tareas: list[str], tarea: str) -> bool:
    if tarea in tareas:
        tareas.remove(tarea)
        return True
    return False

def priorizar(tareas: list[str], tarea: str, nueva_pos: int) -> bool:
    if tarea in tareas:
        tareas.remove(tarea)
        nueva_pos = max(0, min(nueva_pos, len(tareas)))
        tareas.insert(nueva_pos, tarea)
        return True
    return False

def listar_tareas_ordenadas(tareas: list[str]) -> list[str]:
    copia = tareas.copy()
    copia.sort()
    return copia

tareas = []

agregar_tarea(tareas, "Jugar")
agregar_tarea(tareas, "Ir a comprar")
agregar_tarea(tareas, "Ir al cine")
agregar_tarea(tareas, "Estudiar")

print("\nTareas iniciales:", tareas)

eliminar_tarea(tareas, "Jugar")
print("\nTras eliminar 'Jugar':", tareas)

priorizar(tareas, "Ir al cine", 0)
print("\nTras priorizar 'Ir al cine':", tareas)

ordenadas = listar_tareas_ordenadas(tareas)
print("\nTareas ordenadas:", ordenadas)

print("\n📋 Lista de Tareas:")
for i, t in enumerate(tareas, 1):
    print(f"{i:2d}. {t}")