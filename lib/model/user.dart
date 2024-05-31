
class Usuario {
  String? _correoElectronico;
  String? _contrasena;
  String? _nombre;
  int? _numero;

  // Singleton instance
  static Usuario? _instance;

  // Private constructor
  Usuario._() {
    if (_instance != null) {
      throw Exception("This class is a singleton!");
    }
  }

  // Getter for the instance
  static Usuario get instance {
    _instance ??= Usuario._();
    return _instance!;
  }

  // Getters and setters for correoElectronico
  String get correoElectronico => _correoElectronico ?? '';
  set correoElectronico(String? value) {
    _correoElectronico = value;
  }

  // Getters and setters for contrasena
  String get contrasena => _contrasena ?? '';
  set contrasena(String? value) {
    _contrasena = value;
  }

  // Getters and setters for nombre
  String get nombre => _nombre ?? '';
  set nombre(String? value) {
    _nombre = value;
  }

  // Getters and setters for numero
  int get numero => _numero ?? 0;
  set numero(int? value) {
    _numero = value;
  }

  // Método para verificar las credenciales
  bool verificarCredenciales(String correo, String contrasenaPorLogin) {
    return correoElectronico == correo && contrasenaPorLogin == contrasena;
  }
}
