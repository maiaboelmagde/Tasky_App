import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/services/preferences_manager.dart';

class TaskProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<TaskModel> _tasks = [];

  bool get isLoading => _isLoading;
  List<TaskModel> get tasks => _tasks;
  List<TaskModel> get completedTasks =>
      _tasks.where((task) => task.isCompleted).toList();
  List<TaskModel> get highPriorityTasks =>
      _tasks.where((task) => task.isHighPriority).toList();
  List<TaskModel> get toDoTasks =>
      _tasks.where((task) => !task.isCompleted).toList();

  double get completedPercentage {
    if (_tasks.isEmpty) return 0;
    int completed = _tasks.where((task) => task.isCompleted).length;
    return completed / _tasks.length;
  }

  Future<void> loadTasks() async {
    _isLoading = true;
    notifyListeners();
    final prefs = PreferencesManager();
    String? tasksString = prefs.getString(StorageKey.tasksList);

    if (tasksString != null) {
      final decoded = jsonDecode(tasksString) as List;
      _tasks = decoded.map((e) => TaskModel.fromMap(e)).toList();
    } else {
      _tasks = [];
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addTask(TaskModel newTask) async {
    _tasks.add(newTask);
    await _saveToPrefs();
    notifyListeners();
  }

  Future<void> toggleComplete(int taskId) async {
    final task = _tasks.firstWhere((t) => t.id == taskId);
    task.isCompleted = !task.isCompleted;
    await _saveToPrefs();
    notifyListeners();
  }

  Future<void> deleteTask(int taskId) async {
    _tasks.removeWhere((t) => t.id == taskId);
    await _saveToPrefs();
    notifyListeners();
  }

  Future<void> editTask({
    required int taskId,
    required String taskTitle,
    required String? taskDescription,
    required bool isHighPriority,
  }
    
  ) async {
    _tasks = _tasks
        .map(
          (t) => t.id == taskId
              ? TaskModel(
                  id: t.id,
                  taskTitle: taskTitle,
                  taskDescription: taskDescription ?? '',
                  isHighPriority: isHighPriority,
                  isCompleted: t.isCompleted,
                )
              : t,
        )
        .toList();
    await _saveToPrefs();
    notifyListeners();
  }

  Future<void> _saveToPrefs() async {
    final prefs = PreferencesManager();
    final encoded = jsonEncode(_tasks.map((e) => e.toMap()).toList());
    await prefs.setString(StorageKey.tasksList, encoded);
  }
}
