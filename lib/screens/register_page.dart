import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_final_to_do/model/user.dart';
import 'package:flutter_final_to_do/screens/login.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;

  const RegisterPage({
    Key? key,
    required this.showLoginPage,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 25),
                      const Text(
                        "Regístrate en TaskMaster",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // Color de fondo gris
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextField(
                              controller: _nameController,
                              maxLength: 30,
                              decoration: const InputDecoration(
                                hintText: "Nombre",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                counterText: ""
                              ),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // Color de fondo gris
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextField(
                              controller: _emailController,
                              maxLength: 50,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                hintText: "Correo electrónico",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                counterText: ""
                              ),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // Color de fondo gris
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextField(
                              controller: _passwordController,
                              maxLength: 20,
                              obscureText: true,
                              decoration: const InputDecoration(
                                hintText: "Contraseña",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                counterText: ""
                              ),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // Color de fondo gris
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextField(
                              obscureText: true,
                              controller: _confirmPasswordController,
                              maxLength: 20,
                              decoration: const InputDecoration(
                                hintText: "Confirmar contraseña",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                counterText: ""
                              ),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // Color de fondo gris
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 10),
                            child: TextField(
                              controller: _phoneController,
                              maxLength: 15,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                hintText: "Teléfono",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                counterText: ""
                              ),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70.0),
                        child: ElevatedButton(
                          onPressed: () => signUp(context),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(15),
                            backgroundColor: const Color.fromARGB(255, 52, 152, 219),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Registrar",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "¿Ya tienes cuenta?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 6),
                          GestureDetector(
                            onTap: () {
                              _navigateToLoginPage(context);
                            }, 
                            child: const Text(
                              "Inicia sesión ahora",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color.fromARGB(255, 52, 152, 219),
                              ),
                            ),
                          ),
                        ],
                      ),
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


  Future<void> signUp(BuildContext context) async {
    // Obtener datos del formulario
    String correo = _emailController.text;
    String nombre = _nameController.text;
    String contrasena = _passwordController.text;
    String confirmarContrasena = _confirmPasswordController.text;
    String telefono = _phoneController.text;

    // Verificar si algún campo está vacío
    if (correo.isEmpty ||
        contrasena.isEmpty ||
        confirmarContrasena.isEmpty ||
        telefono.isEmpty ||
        nombre.isEmpty) {
      // Manejar el caso en que algún campo esté vacío
      mostrarMensajeFracaso("Todos los campos deben ser completados");
      return;
    }

    // Verificar si las contraseñas coinciden
    if (contrasena != confirmarContrasena) {
      // Manejar el caso en que las contraseñas no coincidan
      mostrarMensajeFracaso("Las contraseñas no coinciden");
      return;
    }

    // Obtener el usuario registrado
    Usuario unicoUsuario = Usuario.instance;

    // Verificar si el usuario ya existe

    if (unicoUsuario.contrasena.isNotEmpty &&
        unicoUsuario.correoElectronico.isNotEmpty &&
        unicoUsuario.nombre.isNotEmpty &&
        unicoUsuario.numero != 0) {
      mostrarMensajeFracaso("El usuario ya existe. No podemos crear otro.");
      return;
    }

    // Configurar las propiedades del usuario
    unicoUsuario.contrasena = contrasena;
    unicoUsuario.correoElectronico = correo;
    unicoUsuario.nombre = nombre;
    unicoUsuario.numero = int.parse(telefono);

    // Ejemplo de navegación a la página de inicio después de un registro exitoso
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(showRegisterPage: () {}),
      ),
    );
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

  void _navigateToLoginPage(BuildContext context) {
    final ruta = MaterialPageRoute(
        builder: (context) => LoginPage(
              showRegisterPage: () {},
            ));
    Navigator.push(context, ruta);
  }
}
