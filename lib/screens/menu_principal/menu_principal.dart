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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 26, 28, 133),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.security, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    "Seguridad Tracker",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
              context,
              "Gráficas de Permisos",
              Icons.insert_chart,
              PermisosGraficas(),
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
      body: Center(child: Text("Bienvenido al Menú Principal")),
    );
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}
