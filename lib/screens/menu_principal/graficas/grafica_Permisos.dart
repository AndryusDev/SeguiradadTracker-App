// ignore: file_names
import 'package:flutter/material.dart';

class PermisosGraficas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gráficas de Permisos"),
        backgroundColor: Color.fromARGB(255, 26, 28, 133),
      ),
      body: Center(
        child: Text(
          "Aquí van las gráficas de permisos",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
