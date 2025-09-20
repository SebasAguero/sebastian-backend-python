from ejercicio1 import normalizar_y_contar
from ejercicio2 import clasificar_numeros
from ejercicio3 import agregar_tarea, priorizar, eliminar_tarea, listar_tareas_ordenadas
from ejercicio4 import vender, abastecer, reporte
from ejercicio5 import promedios_por_estudiante, mejor_estudiante, filtrar_aprobados
from ejercicio6 import jugar_adivina_numero

def main():
    print("Ejercicio 1:")
    print(normalizar_y_contar(" Hora mundo \n Hola amigos. "))

    print("\nEjercicio 2:")
    print(clasificar_numeros([-4, -2, -71, 6, 8]))

    print("\nEjercicio 3:")
    tareas = []
    agregar_tarea(tareas, "estudiar")
    agregar_tarea(tareas, "comprar pan")
    agregar_tarea(tareas, "pasear al scobydoo")
    priorizar(tareas, "comprar pan", 0)
    eliminar_tarea(tareas, "estudiar")
    print(listar_tareas_ordenadas(tareas))

    print("\nEjercicio 4:")
    inv = {"manzana": 5, "banana": 2, "pan": 10}
    vender(inv, "pan", 3)
    abastecer(inv, "banana", 5)
    print(reporte(inv))

    print("\nEjercicio 5:")
    datos = [("Ana", 15), ("Luis", 12), ("Ana", 18), ("Sara", 20), ("Luis", 14)]
    proms = promedios_por_estudiante(datos)
    print(proms)
    print(mejor_estudiante(proms))
    print(filtrar_aprobados(proms, 14))

    print("\nEjercicio 6:")
    jugar_adivina_numero()

if __name__ == "__main__":
    main()