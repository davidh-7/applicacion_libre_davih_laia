import 'package:flutter/material.dart';

class Containerproducto extends StatelessWidget {
  final String Nombre;
  final String Precio;
  final String Imagen;

  const Containerproducto({super.key, required this.Nombre, required this.Precio, required this.Imagen});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            "lib/Imag/"+Imagen,
            width: 50,
            height: 50,
          ),
          Text(Nombre),
          Text(Precio),
        ],
      ),
    );
  }
}
