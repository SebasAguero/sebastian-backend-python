def normalizar_y_contar(texto: str) -> dict:
  texto = texto.strip()
  texto = texto.lower()
  texto = texto.replace(",", "")
  texto = texto.replace(".", "")
  texto = ' '.join(texto.split())

  palabras = texto.split()

  resultado = {
    "texto": texto,
    "palabras": palabras,
    "total_palabras": len(palabras),
    "unicas": len(set(palabras))
  }

  return resultado

demo = "Hola, mundo \n Hola Python"
print(normalizar_y_contar(demo))