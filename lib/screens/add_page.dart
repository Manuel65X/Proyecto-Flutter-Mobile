import 'package:flutter/material.dart';
import 'package:flutter_final_to_do/controllers/taskController.dart';
import 'package:flutter_final_to_do/services/TaskProvider.dart';
import 'package:provider/provider.dart';

class AddTarea extends StatefulWidget {
  const AddTarea({super.key});

  @override
  State<AddTarea> createState() => _AddTareaState();
}

class _AddTareaState extends State<AddTarea> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final TaskController _taskController =
      TaskController(); // Create an instance of your controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agregar tarea',
          style: TextStyle(color: Colors.black), // Color del texto del AppBar
        ),
        centerTitle: true,
        backgroundColor: Colors.white, // Color de fondo del AppBar
        iconTheme: const IconThemeData(
          color: Colors.black, // Color de los íconos del AppBar
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new), // Flecha minimalista
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                TextField(
                  controller: titleController,
                  style: const TextStyle(color: Colors.black), // Color del texto
                  decoration: const InputDecoration(
                    labelText: 'Titulo', // Texto del label
                    labelStyle: TextStyle(color: Colors.black), // Color del label
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 52, 152, 219), // Color de la línea underline al enfocarse
                      ),
                    ),
                  ),
                  cursorColor: const Color.fromARGB(255, 52, 152, 219), // Color del cursor
                ),
                const SizedBox(
                  height: 0,
                ),
                TextField(
                  controller: descriptionController,
                  style: const TextStyle(color: Colors.black), // Color del texto
                  decoration: const InputDecoration(
                    labelText: 'Descripcion', // Texto del label
                    labelStyle: TextStyle(color: Colors.black), // Color del label
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 52, 152, 219), // Color de la línea underline al enfocarse
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  minLines: 5,
                  maxLines: 10,
                  cursorColor: const Color.fromARGB(255, 52, 152, 219), // Color del cursor
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: saveTask,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 52, 152, 219), // Color del botón
            ),
            child: const Text(
              'Guardar',
              style: TextStyle(color: Colors.white), // Color del texto del botón
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white, // Fondo color blanco
    );
  }

  Future<void> saveTask() async {
    print("i got into saveTask ");
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty) {
      try {
        final titulo = titleController.text;
        final descripcion = descriptionController.text;

        final int statusCode = await _taskController.saveTask(
            titulo, descripcion); // Call the controller method

        print('Status code: $statusCode');

        if (statusCode == 201) {
          // ignore: use_build_context_synchronously
          Provider.of<TaskProvider>(context, listen: false).getTasks();
          titleController.text = '';
          descriptionController.text = '';
          const String mensage = 'Su tarea fue creada!';
          mostrarMensajeExito(mensage);
        } else {
          const String mensage = 'Hubo un error. Intentelo de nuevo';
          mostrarMensajeFracaso(mensage);
        }
      } catch (e) {
        const String mensage = 'Hubo una excepcion. Intentelo de nuevo';
        mostrarMensajeFracaso(mensage);
      }
    }
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

  void mostrarMensajeFracaso(String message) {
    final snackBar = SnackBar(
      content: Text(message,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
