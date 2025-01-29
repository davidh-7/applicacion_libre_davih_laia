import 'package:flutter/material.dart';

class appbarPer extends StatelessWidget implements PreferredSizeWidget{
  const appbarPer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey[200],
      titleTextStyle: TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: 18,
        color: Colors.white
      ),
      title: Text("Deportes y ocio"),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}