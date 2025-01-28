import 'package:flutter/material.dart';

class Botonesdrawer extends StatelessWidget {
final String Txt;
final Function() acnBtn;

  const Botonesdrawer({super.key, required this.Txt, required this.acnBtn});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: acnBtn,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blueGrey[200],
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                Txt, 
                style: TextStyle(
                  fontSize: 20),
                  ),
                  ),
          ),
           
        ),
      ),
    );
  }
}