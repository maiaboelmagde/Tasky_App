import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tasky_app/components/custom_tasks_list.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/services/preferences_manager.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  List<TaskModel> toDoTasks = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _getUserNameAndTasks();
  }

  _getUserNameAndTasks() async {
    setState(() {
      isLoading = true;
    });

    PreferencesManager preferencesManager = PreferencesManager();
    //tasks
    String? tasks = preferencesManager.getString(StorageKey.tasksList);
    if (tasks != null) {
      final tasksDecoded = jsonDecode(tasks) as List<dynamic>;
      setState(() {
        toDoTasks = tasksDecoded
            .map((task) => TaskModel.fromMap(task))
            .where((task)=>task.isCompleted == false)
            .toList();
      });

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To Do Tasks')),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : CustomTasksList(myTasks: toDoTasks),
    );
  }
}
