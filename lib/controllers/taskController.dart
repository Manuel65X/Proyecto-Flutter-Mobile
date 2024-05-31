// tarea_controller.dart
import 'package:flutter_final_to_do/services/TaskProvider.dart';

class TaskController {
  final TaskProvider _taskProvider = TaskProvider();

  Future<int> saveTask(String title, String description) async {
    // llamo al servicio
    try {
      final statusCode = await _taskProvider.createTask({
        'title': title,
        'description': description,
        'is_completed': false,
      });
      return statusCode;
    } catch (e) {
      throw Exception('Failed to save task: $e');
    }
  }

  Future<void> updateTask(String id, String title, String description) async {
    try {
      await _taskProvider.updateTask(id, title, description);
    } catch (e) {
      throw Exception('Failed to update task: $e');
    }
  }

  Future<void> deleteById(String? id) async {
    try {
      await _taskProvider.deleteById(id);
    } catch (e) {
      throw Exception('Failed to delete task: $e');
    }
  }

  Future<void> getTasks() async {
    try {
      await _taskProvider.getTasks();
    } catch (e) {
      throw Exception('Failed to fetch tasks: $e');
    }
  }
}


