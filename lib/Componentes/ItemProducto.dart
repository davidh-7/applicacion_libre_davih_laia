import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemProducto extends StatelessWidget {
  final String Nombre;
  final num Precio;
  final Function(BuildContext)? esborrarTasca;

  const ItemProducto(
      {super.key, 
      required this.Nombre, 
      required this.Precio,
      required this.esborrarTasca, 
      }
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(), 
          children: [
            SlidableAction(
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(10),
              onPressed: esborrarTasca,
            ),
          ]
        ),
        child: Container(
          
            decoration: BoxDecoration(
              color: Colors.teal[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  
                  //Text
                  Text(Nombre),
                ],
              ),
            )),
      ),
    );
  }
}
