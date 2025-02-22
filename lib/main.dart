import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seguridad Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 26, 28, 133)),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // Puedes agregar controladores y lógica de autenticación según lo necesites.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo con degradado de verdes
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 181, 225, 255),
              const Color.fromARGB(255, 61, 91, 175),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Logo y Nombre de la App
                Image.asset(
                  'assets/logo.png', // Asegúrate de tener el logo en tu carpeta assets y configurarlo en pubspec.yaml.
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 10),
                Text(
                  'Seguridad Tracker',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 25, 16, 112),
                  ),
                ),
                SizedBox(height: 30),
                // Tarjeta del formulario de inicio de sesión
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Campo para Usuario
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Usuario',
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        SizedBox(height: 16),
                        // Campo para Contraseña
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.visibility),
                              onPressed: () {
                                // Aquí puedes implementar la funcionalidad para mostrar/ocultar contraseña.
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        // Botón de Iniciar Sesión
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Implementa la acción de inicio de sesión
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                36,
                                67,
                                153,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: Text(
                              'Iniciar Sesión',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        // Separador para el acceso biométrico
                        Text(
                          '— O ingresa con huella dactilar —',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 16),
                        // Botón de huella dactilar
                        IconButton(
                          icon: Icon(
                            Icons.fingerprint,
                            size: 40,
                            color: const Color.fromARGB(255, 36, 67, 153),
                          ),
                          onPressed: () {
                            // Aquí puedes integrar la autenticación biométrica (huella dactilar)
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
