import 'package:flutter/material.dart';
import 'package:seguridad_tracker/screens/menu_principal/graficas/grafica_Permisos.dart';

class MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menú Principal"),
        backgroundColor: Color.fromARGB(255, 26, 28, 133),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildMenuButton(
              context,
              "Gráficas de Permisos",
              PermisosGraficas(),
            ), // Agrega la pantalla de permisos aquí
          ],
        ),
      ),
    );
  }

  // Método para construir botones del menú
  Widget _buildMenuButton(BuildContext context, String text, Widget screen) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}
