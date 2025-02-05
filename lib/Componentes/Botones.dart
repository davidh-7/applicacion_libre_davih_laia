import 'package:flutter/material.dart';

class Botones extends StatelessWidget {
    final bool carrito;
    final Function()? accioBoto;

  const Botones({super.key, required this.carrito, this.accioBoto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: carrito ? 85 : 0,
        decoration: BoxDecoration(
          color:carrito ? Colors.blueGrey[500] : const Color.fromARGB(239, 170, 190, 233),
          borderRadius: BorderRadius.circular(5),
        ),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: accioBoto,
            child: Icon(
              carrito ? Icons.add_shopping_cart_rounded : Icons.info,
              color: Colors.black,
            ),
          ),
        ),

      
      ),
    );
  }
}