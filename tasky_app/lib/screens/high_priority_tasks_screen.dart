import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky_app/components/custom_tasks_list.dart';
import 'package:tasky_app/controllers/tasks_controller.dart';

class HighPriorityTasksScreen extends StatelessWidget {
  const HighPriorityTasksScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final myTasks = Provider.of<TaskProvider>(context).highPriorityTasks;
    return Scaffold(
      appBar: AppBar(title: Text('High Priority Tasks'),),
      body: CustomTasksList(myTasks: myTasks),
    );
  }
}