// ignore: file_names
import 'package:flutter/material.dart';

class PermisosGraficas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gráficas de Permisos"),
        backgroundColor: const Color.fromARGB(255, 45, 100, 138),
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
