import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky_app/core/components/custom_tasks_list.dart';
import 'package:tasky_app/core/controllers/tasks_controller.dart';
import 'package:tasky_app/models/task_model.dart';

class ToDoScreen extends StatelessWidget{
  const ToDoScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    List<TaskModel> toDoTasks = taskProvider.toDoTasks;
    bool isLoading = taskProvider.isLoading;

    return Scaffold(
      appBar: AppBar(title: Text('To Do Tasks')),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : CustomTasksList(myTasks: toDoTasks),
    );
  }
}
