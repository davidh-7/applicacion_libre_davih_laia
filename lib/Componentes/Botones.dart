import 'package:flutter/material.dart';

class Botones extends StatelessWidget {
    final Function()? accioBoto;

  const Botones({super.key, required this.accioBoto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width:  85 ,
        decoration: BoxDecoration(
          color: Colors.blueGrey[500],
          borderRadius: BorderRadius.circular(5),
        ),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: accioBoto,
            child: Icon(
              Icons.add_shopping_cart_rounded ,
              color: Colors.black,
            ),
          ),
        ),

      
      ),
    );
  }
}