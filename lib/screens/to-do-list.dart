import 'package:flutter/material.dart';
import 'package:flutter_final_to_do/controllers/taskController.dart';
import 'package:flutter_final_to_do/screens/add_page.dart';
import 'package:flutter_final_to_do/screens/update_task.dart';
import 'package:flutter_final_to_do/services/TaskProvider.dart';
import 'package:provider/provider.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = TaskController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'To Do List',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            final currentRoute = ModalRoute.of(context)?.settings.name;
            if (currentRoute == '/login') {
              Navigator.popUntil(context, ModalRoute.withName('/login'));
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          if (taskProvider.tasks.isEmpty) {
            return Center(
              child: Text(
                'No hay ninguna tarea',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            );
          } else {
            return RefreshIndicator(
              color: Color.fromARGB(255, 52, 152, 219), // Color azul cielo
              onRefresh: () => taskProvider.getTasks(),
              child: ListView.builder(
                itemCount: taskProvider.tasks.length,
                itemBuilder: (context, index) {
                  final tarea = taskProvider.tasks[index] as Map;
                  final id = tarea.containsKey('_id')
                      ? tarea['_id'] as String?
                      : null;
                  print('Task ID at index $index: $id');
                  return ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green, // Fondo verde menta
                      ),
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      tarea['title'],
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      tarea['description'],
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    trailing: PopupMenuButton(
                      color: Colors.white, // Fondo blanco
                      icon: Icon(Icons.more_vert, color: Colors.black), // Icono de tres puntos en negro
                      onSelected: (value) {
                        if (value == 'edit') {
                          if (id != null) {
                            print('entre al conditional para hacer update');
                            _navigateToUpdatePage(context, id);
                          } else {
                            print(
                                'entre al condicional para hacer update, pero soy null');
                          }
                        } else if (value == 'delete') {
                          if (id != null) {
                            print('entre al conditional');
                            taskController.deleteById(id);
                          } else {
                            print('entre al condicional, pero soy null');
                          }
                        }
                      },
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                              value: 'edit',
                              child: Text('Edit', style: TextStyle(color: Colors.black))), // Texto negro
                          PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete', style: TextStyle(color: Colors.black))), // Texto negro
                        ];
                      },
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddPage(context),
        child: const Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 52, 152, 219),
      ),
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
    );
  }

  void _navigateToAddPage(BuildContext context) {
    final ruta = MaterialPageRoute(builder: (context) => const AddTarea());
    Navigator.push(context, ruta);
  }

  void _navigateToUpdatePage(BuildContext context, String taskId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateTaskScreen(taskId: taskId),
      ),
    );
  }
}
