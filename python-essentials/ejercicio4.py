alias = {"banano": "banana"}

def normalizar_producto(producto: str) -> str:
    return alias.get(producto, producto)

def stock(inventario: dict[str, int], producto: str) -> int | None:
    producto = normalizar_producto(producto)
    return inventario.get(producto)

def abastecer(inventario: dict[str, int], producto: str, cantidad: int) -> None:
    producto = normalizar_producto(producto)
    if producto in inventario:
        inventario[producto] += cantidad
    else:
        inventario[producto] = cantidad

def vender(inventario: dict[str, int], producto: str, cantidad: int) -> bool:
    producto = normalizar_producto(producto)
    if producto in inventario and inventario[producto] >= cantidad:
        inventario[producto] -= cantidad
        return True
    return False

def reporte(inventario: dict[str, int]) -> dict:
    total_items = sum(inventario.values())
    agotados = [p for p, c in inventario.items() if c == 0]
    top = max(inventario.items(), key=lambda x: x[1])[0] if inventario else None

    return {
        "total_items": total_items,
        "agotados": agotados,
        "top": top
    }

inventario = {"manzana": 5, "banana": 2, "pan": 10}

print("\nInventario inicial:", inventario)

print("\nVenta de 3 'pan':", vender(inventario, "pan", 3))
print("Inventario tras venta:", inventario)

abastecer(inventario, "banana", 5)
print("\nInventario tras abastecer banana:", inventario)

print("\nStock de 'banano':", stock(inventario, "banano"))

print("\nReporte final:", reporte(inventario))