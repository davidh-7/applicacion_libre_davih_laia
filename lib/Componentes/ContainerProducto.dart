import 'package:applicacion_libre_davih_laia/Componentes/Botones.dart';
import 'package:applicacion_libre_davih_laia/Componentes/BtnFloat.dart';
import 'package:flutter/material.dart';

class Containerproducto extends StatelessWidget {
  final String Nombre;
  final String Precio;
  final String Imagen;
  final String Tipo;
  final String Info;
  final Function() AccioCarrito;

  const Containerproducto({super.key, required this.Nombre, required this.Precio, required this.Imagen, required this.Tipo, required this.Info, required this.AccioCarrito});

  @override
  Widget build(BuildContext context) {
    return Container(
     
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(239, 170, 190, 233),
      ),
      
      
      child: Stack(
        children: [
          FloatingActionButton(
            backgroundColor: Colors.blueGrey[500],
            onPressed: (){
              showDialog(
                context: context, 
                builder: (BuildContext context){
                  return AlertDialog(
                    title: Text(Nombre),
                    content: Text(Info),
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
            },
            child: Icon(
              Icons.info,
              color: const Color.fromARGB(224, 0, 0, 0),
            ),
          ),
          //Botones(carrito: false, accioBoto: () { Btnfloat(info: Info, Nombre: Nombre); }, ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                    "lib/Imag/"+Imagen,
                    width: double.infinity,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              
          
              Text(
                Tipo, 
                style: TextStyle(
                  fontSize: 15, 
                  color: const Color.fromARGB(255, 8, 69, 119),
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(Nombre),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Precio: " + Precio + "€"),
                      ],
                    ),
                  ],
                ),
                
              ),
              Botones(accioBoto: () {  }),
             ],
          ),
        ],
      ),
    );
  }
}
