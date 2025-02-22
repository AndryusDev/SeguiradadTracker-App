// ignore: file_names
import 'package:flutter/material.dart';

class GraficaPermisos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gráfica de Permisos')),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Aquí irá la gráfica de permisos'),
            // Aquí puedes agregar un widget de gráfico
          ],
        ),
      ),
    );
  }
}
