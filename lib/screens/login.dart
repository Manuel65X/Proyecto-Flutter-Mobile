import 'package:flutter/material.dart';
import 'package:flutter_final_to_do/model/user.dart';
import 'package:flutter_final_to_do/screens/register_page.dart';
import 'package:flutter_final_to_do/screens/to-do-list.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Alineación vertical uniforme
                    children: [
                      const Text(
                        "Bienvenido a TaskMaster",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextField(
                              controller: _emailController,
                              cursorColor: const Color.fromARGB(255, 52, 152, 219),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Correo Electronico",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              cursorColor: const Color.fromARGB(255, 52, 152, 219),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Contraseña",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                        child: ElevatedButton(
                          onPressed: () => signIn(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 52, 152, 219),
                            padding: const EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Inicio sesión",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "¿No tienes cuenta? ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _navigateToRegisterPage(context);
                            }, 
                            child: const Text(
                              "Regístrate ahora",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn(BuildContext context) async {
    // Obtener datos del formulario
    String correoPorLogin = _emailController.text;
    String contrasenaPorLogin = _passwordController.text;

    // Obtener el usuario registrado
    Usuario usuarioRegistrado = Usuario.instance;

    // Verificar las credenciales
    if (usuarioRegistrado.verificarCredenciales(
        correoPorLogin, contrasenaPorLogin)) {
      // Las credenciales son correctas, navegar a la página de inicio
      mostrarMensajeExito("Inicio de sesión exitoso");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ToDoList()),
      );
    } else {
      // Las credenciales son incorrectas
      mostrarMensajeFracaso("Inicio de sesión fallido");
    }
  }

  void mostrarMensajeFracaso(String message) {
    final snackBar = SnackBar(
      content: Text(message,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void mostrarMensajeExito(String message) {
    final snackBar = SnackBar(
      content: Text(message,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _navigateToRegisterPage(BuildContext context) {
    final ruta = MaterialPageRoute(
        builder: (context) => RegisterPage(
              showLoginPage: () {},
            ));
    Navigator.push(context, ruta);
  }
}
