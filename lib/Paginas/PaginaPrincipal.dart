import 'package:applicacion_libre_davih_laia/Componentes/AppbarPer.dart';
import 'package:applicacion_libre_davih_laia/Componentes/ContainerProducto.dart';
import 'package:applicacion_libre_davih_laia/Componentes/DrawerPer.dart';
import 'package:applicacion_libre_davih_laia/Data/BBDD.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:applicacion_libre_davih_laia/Data/BBDDProductos.dart';

class Paginaprincipal extends StatefulWidget {
  const Paginaprincipal({super.key});

  @override
  State<Paginaprincipal> createState() => _PaginaprincipalState();
}

class _PaginaprincipalState extends State<Paginaprincipal> {
   final Box _boxHive = Hive.box("box_carrito_app");
   BaseDeDades db = BaseDeDades();

  List <dynamic> LstProductos = productos;
  

   void anadirCarrito(String nombre, int precio) {
     setState(() {
       db.productosCarrito.add({"Nombre": nombre, "Precio": precio});
     });
     db.actualitzarDades();
   }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.pink,
        child: Scaffold(
          drawer: Drawerper(),
          appBar: appbarPer(),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.builder(
                itemCount: LstProductos.length,
                itemBuilder: (context, index) {
                  
                  return Containerproducto(
                    Nombre: LstProductos[index]["Nombre"], 
                    Precio: LstProductos[index]["Precio"], 
                    Imagen: LstProductos[index]["Imagen"],
                    Tipo: LstProductos[index]["Tipo"],
                    Info: LstProductos[index]["Info"],
                    AccioCarrito: () {anadirCarrito(LstProductos[index]["Nombre"], LstProductos[index]["Precio"]);},
                    );
                
                }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, //num columnas
                    crossAxisSpacing: 25.0 ,//espoacio horizontal entre elementos
                    mainAxisSpacing: 25.0 ,//Espacio vertical entre elementos
                    childAspectRatio: 1.0, //Relacion de aspecto entre ancho y alto
                  ),
              ),
          ),
          
        ),
      ),
    );
  }
}
