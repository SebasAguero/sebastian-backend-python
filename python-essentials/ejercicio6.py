import random

def jugar_adivina_numero(max_intentos=10):
    numero_secreto = random.randint(1, 100)
    historial = []

    print("Bienvenido al juego: Adivina el número (1–100)!")
    print(f"Tienes {max_intentos} intentos para adivinarlo.\n")

    for intento in range(1, max_intentos + 1):
        guess = int(input(f"Intento {intento}: Ingresa un número: "))
        historial.append(guess)

        if guess == numero_secreto:
            print(f"✅ ¡Felicidades! Adivinaste el número {numero_secreto} en {intento} intentos.")
            break
        elif guess < numero_secreto:
            print("🔼 El número secreto es más alto.\n")
        else:
            print("🔽 El número secreto es más bajo.\n")
    else:
        print(f"❌ Te quedaste sin intentos. El número era {numero_secreto}.")

    print("\n📊 Estadísticas del juego:")
    print(f"- Intentos realizados: {len(historial)}")
    print(f"- Números repetidos: {len(historial) - len(set(historial))}")
    print(f"- Historial de intentos: {historial}")

if __name__ == "__main__":
    jugar_adivina_numero()