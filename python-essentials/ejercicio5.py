datos = [("Ana", 15), ("Luis", 12), ("Ana", 18), ("Sara", 20), ("Luis", 14)]

def promedios_por_estudiante(datos) -> dict[str, float]:
    acumulados = {}
    conteos = {}

    for nombre, nota in datos:
        acumulados[nombre] = acumulados.get(nombre, 0) + nota
        conteos[nombre] = conteos.get(nombre, 0) + 1

    return {nombre: acumulados[nombre] / conteos[nombre] for nombre in acumulados}

def mejor_estudiante(promedios: dict[str, float]) -> tuple[str, float]:
    if not promedios:
        return "", 0.0
    return max(promedios.items(), key=lambda x: x[1])

def filtrar_aprobados(promedios, minimo=13) -> dict[str, float]:
    return {nombre: prom for nombre, prom in promedios.items() if prom >= minimo}

promedios = promedios_por_estudiante(datos)
print("Promedios por estudiante:", promedios)

mejor_nombre, mejor_promedio = mejor_estudiante(promedios)
print("Mejor estudiante:", mejor_nombre, "con promedio", mejor_promedio)

print("Aprobados (min=14):", filtrar_aprobados(promedios, minimo=14))

print("\nTabla de promedios")
print(f"{'Nombre':<10}{'Promedio':<10}")
print("-" * 20)
for nombre, prom in promedios.items():
    print(f"{nombre:<10}{prom:<10.2f}")