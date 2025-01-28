import 'package:applicacion_libre_davih_laia/Componentes/BotonesDrawer.dart';
import 'package:applicacion_libre_davih_laia/Paginas/PaginaCarrito.dart';
import 'package:applicacion_libre_davih_laia/Paginas/PaginaPrincipal.dart';
import 'package:flutter/material.dart';

class Drawerper extends StatelessWidget {
  const Drawerper({super.key});

  dynamic FnCarrito(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Paginacarrito()));
  }

  dynamic FnPrincipal(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Paginaprincipal()));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey[500],
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("MENU"),
          ),
          Botonesdrawer(
            Txt: "Pagina Principal",
            acnBtn: () => FnPrincipal(context),
          ),
          Botonesdrawer(
            Txt: "Carrito",
            acnBtn: () => FnCarrito(context) 
          ),
        ],
      ),
    );
  }
}
