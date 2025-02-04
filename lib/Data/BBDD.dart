import 'package:hive/hive.dart';

class BaseDeDades {

  List productosCarrito = [];

  final Box _boxDeLaHive = Hive.box("box_carrito_app");

  void carregarDades(){
    productosCarrito = _boxDeLaHive.get("box_carrito_app");
  }

  void actualitzarDades(){
    _boxDeLaHive.put("box_carrito_app", productosCarrito);
  }

  void generarDadesEx(){
    productosCarrito = [
      
    ];
  }

}