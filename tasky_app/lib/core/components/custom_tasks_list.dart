import 'package:flutter/material.dart';
import 'package:tasky_app/core/components/custom_task_component.dart';
import 'package:tasky_app/core/components/no_tasks_widget.dart';
import 'package:tasky_app/models/task_model.dart';

class CustomTasksList extends StatelessWidget {
  const CustomTasksList({super.key, required this.myTasks});

  final List<TaskModel> myTasks;

  @override
  Widget build(BuildContext context) {
    return myTasks.isEmpty
        ? NoTasksWidget()
        : ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: myTasks.length,
            itemBuilder: ((context, indx) {
              TaskModel curTask = myTasks[indx];
              return CustomTaskComponent(curTask: curTask);
            }),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 8);
            },
          );
  }
}
