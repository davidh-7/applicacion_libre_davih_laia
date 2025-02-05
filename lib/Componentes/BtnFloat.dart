import 'package:flutter/material.dart';

class Btnfloat extends StatelessWidget {
  final String info;
  final String Nombre;
  const Btnfloat({super.key, required this.info, required this.Nombre});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        showDialog(
          context: context, 
          builder: (BuildContext context){
            return AlertDialog(
              title: Text(Nombre),
              content: Text(info),
              actions: [
                TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  }, 
                  child: Text("Cerrar"))
              ],
            );
          }
        );
      }
    );
  }
}