import 'package:applicacion_libre_davih_laia/Componentes/AppbarPer.dart';
import 'package:applicacion_libre_davih_laia/Componentes/DrawerPer.dart';
import 'package:applicacion_libre_davih_laia/Componentes/ItemProducto.dart';
import 'package:applicacion_libre_davih_laia/Data/BBDD.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Paginacarrito extends StatefulWidget {
  const Paginacarrito({super.key});

  @override
  State<Paginacarrito> createState() => _PaginacarritoState();
}

class _PaginacarritoState extends State<Paginacarrito> {
  final Box _boxHive = Hive.box("box_carrito_app");
  BaseDeDades db = BaseDeDades();
  num total = 0;

  void _calcularTotal() {
    total = 0;
    for (var producto in db.productosCarrito) {
      total += num.parse(producto["Precio"]);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    if (_boxHive.get("box_carrito_app") == null) {
      db.generarDadesEx();
    } else {
      db.carregarDades();
    }
    _calcularTotal();
  }

  void accioEsborrarTasca(int index) {
    setState(() {
      db.productosCarrito.removeAt(index);
      _calcularTotal();
    });
    db.actualitzarDades();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[500],
      drawer: Drawerper(),
      appBar: appbarPer(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blueGrey[200],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "CARRITO DE LA COMPRA",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey[500],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("PRODUCTOS"),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: db.productosCarrito.length,
                          itemBuilder: (context, index) {
                            return ItemProducto(
                              Nombre: db.productosCarrito[index]["Nombre"].toString(),
                              esborrarTasca: (valor) => accioEsborrarTasca(index),
                            );
                          },
                        ),
                      ),
                      Text(
                        "Total = \$${total.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}