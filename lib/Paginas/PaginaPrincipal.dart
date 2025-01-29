import 'package:applicacion_libre_davih_laia/Componentes/AppbarPer.dart';
import 'package:applicacion_libre_davih_laia/Componentes/DrawerPer.dart';
import 'package:applicacion_libre_davih_laia/Data/BBDD.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Paginaprincipal extends StatefulWidget {
  const Paginaprincipal({super.key});

  @override
  State<Paginaprincipal> createState() => _PaginaprincipalState();
}

class _PaginaprincipalState extends State<Paginaprincipal> {
  // final Box _boxHive = Hive.box("box_carrito_app");
  // BaseDeDades db = BaseDeDades();

  List productos = [
    {"Nombre": "Bici", "Precio": "50", "Imagen": "bici.png"}
  ];

  // void anadirCarrito(String nombre, int precio) {
  //   setState(() {
  //     db.productosCarrito.add({"Nombre": nombre, "Precio": precio});
  //   });
  //   db.actualitzarDades();
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.pink,
        child: Scaffold(
          drawer: Drawerper(),
          appBar: appbarPer(),
          body: ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Text(productos[index]["Nombre"]),
                    Text(productos[index]["Precio"]),
                    Text(productos[index]["Imagen"]),

                  ],
                ),
              );
              
              
              // ItemTasca(
              //   TextTasca: db.tasquesLlistes[index]["Titol"].toString(),
              //   valorCheckbox: db.tasquesLlistes[index]["Valor"],
              //   canviarValorCheckbox: (valor) =>
              //       canviarCheckbox(db.tasquesLlistes[index]["Valor"], index),
              //   esborrarTasca: (valor) => accioEsborrarTasca(index),
              // );
            },
          ),
        ),
      ),
    );
  }
}
