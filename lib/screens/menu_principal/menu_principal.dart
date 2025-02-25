import 'package:flutter/material.dart';
import 'package:seguridad_tracker/screens/menu_principal/graficas/grafica_Permisos.dart';

class MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menú Principal", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(
          color: Color.fromARGB(
            255,
            245,
            245,
            245,
          ), //Cambiar el color de las rayas laterales izquierdas
        ),
        backgroundColor: Color.fromARGB(255, 45, 100, 138),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 45, 100, 138),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.security, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    "Seguridad Tracker",
                    style: TextStyle(
                      color: Color.fromARGB(255, 245, 245, 245),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
              context,
              "Permisos",
              Icons.insert_chart,
              Scaffold(body: Center(child: Text("Pantalla de Permisos"))),
            ),
            _buildDrawerItem(
              context,
              "Comisiones",
              Icons.assignment,
              Scaffold(body: Center(child: Text("Pantalla de Comisiones"))),
            ),
            _buildDrawerItem(
              context,
              "Apoyo Institucional",
              Icons.people,
              Scaffold(
                body: Center(child: Text("Pantalla de Apoyo Institucional")),
              ),
            ),
            _buildDrawerItem(
              context,
              "Registro de Armas",
              Icons.security,
              Scaffold(
                body: Center(child: Text("Pantalla de Registro de Armas")),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20), // Espaciado superior
            Text(
              "Bienvenido al Menú Principal",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20), // Espaciado entre el texto y la gráfica
            GraficaPermisosEspeciales(), // Aquí se agrega la gráfica de permisos
          ],
        ),
      ),
    );
  }
}

Widget _buildDrawerItem(
  BuildContext context,
  String title,
  IconData icon,
  Widget screen,
) {
  return ListTile(
    leading: Icon(icon, color: Colors.blue),
    title: Text(title, style: TextStyle(fontSize: 16)),
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
    },
  );
}
