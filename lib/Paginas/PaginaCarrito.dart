import 'package:applicacion_libre_davih_laia/Componentes/AppbarPer.dart';
import 'package:applicacion_libre_davih_laia/Componentes/DrawerPer.dart';
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


  @override
  void initState(){
    if(_boxHive.get("box_tasques_app") == null){
      db.generarDadesEx();
    }else{
      db.carregarDades();
    }
    super.initState();
  }

  // void accioGuardar(){
  //   setState(() {
  //     db.productosCarrito.add({"Titol": tecTextTasca.text, "Valor": false});
  //   });
  //   db.actualitzarDades();
  // }


  void canviarCheckbox(bool? valorCheckbox, int index){
    setState(() {
      db.productosCarrito[index]["Valor"] = !db.productosCarrito[index]["Valor"];
    });
    db.actualitzarDades();
  }
  void accioEsborrarTasca(int index) {
    setState(() {
      db.productosCarrito.removeAt(index);
    });
    db.actualitzarDades();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        
        child: Scaffold(
          backgroundColor: Colors.blueGrey[500],
          drawer: Drawerper(),
          appBar: appbarPer(),
          body: Center(
            child: Padding(
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
                      child: Center(
                        child: Text(
                          "CARRITO DE LA COMPRA",
                          style: TextStyle(
                            fontSize: 30
                          ),
                        )
                      ),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
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
                                  width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text("PRODUCTOS")
                                        ],
                                      ),
                                    ),
                                  
                                ),
                              ],
                            ),
                          ),
                        ),
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
                                  width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text("TOTAL: ")
                                        ],
                                      ),
                                    ),
                                  
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ),
        ),
      ),
    );
  }
}