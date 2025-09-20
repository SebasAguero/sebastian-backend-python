def clasificar_numeros(numeros: list[int]) -> dict:
  pares = [n for n in numeros if n % 2 == 0]

  impares = []
  positivos = []
  negativos = []

  for n in numeros:
    if n % 2 != 0:
        impares.append(n)
    if n >= 0:
        positivos.append(n)
    else:
        negativos.append(n)

  promedio = sum(numeros) / len(numeros) if numeros else None

  maximo = max(numeros) if numeros else None
  minimo = min(numeros) if numeros else None

  return {
    "pares": pares,
    "impares": impares,
    "positivos": positivos,
    "negativos": negativos,
    "promedio": promedio,
    "maximo": maximo,
    "minimo": minimo
  }

demo = [-3, -1, 0, 2, 4, 5]
print(clasificar_numeros(demo))