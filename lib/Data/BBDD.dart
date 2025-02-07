import 'package:hive/hive.dart';

class BaseDeDades {
  // Implementación del Singleton
  static final BaseDeDades _instance = BaseDeDades._internal();
  factory BaseDeDades() => _instance;
  BaseDeDades._internal();

  // Lista que almacena los productos del carrito
  List productosCarrito = [];

  // Usamos una clave específica para la lista en Hive
  final Box _boxDeLaHive = Hive.box("box_carrito_app");
  final String _claveCarrito = "productosCarrito";

  void carregarDades() {
    // Si no existe la clave, inicializamos la lista como vacía
    productosCarrito = _boxDeLaHive.get(_claveCarrito) ?? [];
  }

  void actualitzarDades() {
    _boxDeLaHive.put(_claveCarrito, productosCarrito);
  }

  void generarDadesEx() {
    productosCarrito = [
      {"Nombre": "Bici", "Precio": "50"},
      {"Nombre": "Bici", "Precio": "50"},
    ];
    actualitzarDades();
  }
}
