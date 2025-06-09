import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tasky_app/components/custom_tasks_list.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/services/preferences_manager.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  List<TaskModel> completedTasks = [];
  bool isLoading = false;

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
        completedTasks = tasksDecoded
            .map((task) => TaskModel.fromMap(task))
            .where((task)=>task.isCompleted == true)
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
      appBar: AppBar(title: Text('Completed Tasks')),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : CustomTasksList(myTasks: completedTasks),
    );
  }
}
