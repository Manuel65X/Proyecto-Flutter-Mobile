import 'package:flutter/material.dart';
import 'package:flutter_final_to_do/controllers/taskController.dart';

class UpdateTaskScreen extends StatefulWidget {
  final String taskId;

  const UpdateTaskScreen({Key? key, required this.taskId}) : super(key: key);

  @override
  _UpdateTaskScreenState createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final TaskController _taskController = TaskController();

  // Colores para los textos
  Color titleColor = Colors.black;
  Color descriptionColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Fondo blanco
        title: const Text(
          'Actualizar Tarea',
          style: TextStyle(color: Colors.black), // Color del texto del AppBar
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white, // Fondo blanco
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Actualizar tarea: ${widget.taskId}',
              style: TextStyle(color: Colors.black), // Color del texto negro
            ),
            TextField(
              controller: titleController,
              style: TextStyle(color: titleColor),
              cursorColor: const Color.fromARGB(255, 52, 152, 219), // Color del cursor
              decoration: InputDecoration(
                labelText: 'Titulo',
                labelStyle: TextStyle(color: Colors.black), // Color del underline
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromRGBO(52, 152, 219, 1), // Color del underline cuando está enfocado
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  titleColor = value.isNotEmpty ? const Color.fromRGBO(52, 152, 219, 1) : Colors.black;
                });
              },
            ),
            TextField(
              controller: descriptionController,
              style: TextStyle(color: descriptionColor),
              cursorColor: const Color.fromARGB(255, 52, 152, 219), // Color del cursor
              decoration: InputDecoration(
                labelText: 'Descripción',
                labelStyle: TextStyle(color: Colors.black), // Color del underline
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromRGBO(52, 152, 219, 1), // Color del underline cuando está enfocado
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  descriptionColor = value.isNotEmpty ? const Color.fromRGBO(52, 152, 219, 1) : Colors.black;
                });
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () => _updateTask(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 52, 152, 219) // Color de fondo azul cielo del botón
                  ),
                  child: const Text(
                    'Actualizar Tarea',
                    style: TextStyle(color: Colors.white), // Color del texto blanco del botón
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateTask() async {
    try {
      await _taskController.updateTask(
        widget.taskId,
        titleController.text,
        descriptionController.text,
      );

      titleController.text = '';
      descriptionController.text = '';

      // Después de actualizar, puedes querer volver a la pantalla principal de la lista de tareas
      Navigator.pop(context);
    } catch (e) {
      print('Error: $e');
      // Manejar error, mostrar un snackbar, etc.
    }
  }
}
