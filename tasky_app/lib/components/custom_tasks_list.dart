import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky_app/components/no_tasks_widget.dart';
import 'package:tasky_app/controllers/tasks_controller.dart';
import 'package:tasky_app/enums/task_item_actions_enum.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/theme/theme_controller.dart';

class CustomTasksList extends StatelessWidget {
  const CustomTasksList({super.key, required this.myTasks});

  final List<TaskModel> myTasks;

  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<TaskProvider>(context);
    return myTasks.isEmpty
        ? NoTasksWidget()
        : ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: myTasks.length,
            itemBuilder: ((context, indx) {
              return Container(
                padding: EdgeInsets.only(right: 12, left: 4, bottom: 4, top: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: myTasks[indx].isCompleted,
                      onChanged: (value) {
                        tasksProvider.toggleComplete(myTasks[indx].id);
                      },
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            myTasks[indx].taskTitle,
                            style: myTasks[indx].isCompleted
                                              ? Theme.of(context)
                                                    .textTheme
                                                    .displayMedium
                                                    ?.copyWith(
                                                      decoration: TextDecoration.lineThrough,
                                                      color: Theme.of(context).colorScheme.onSecondary
                                                    )
                                              : Theme.of(
                                                  context,
                                                ).textTheme.displayMedium,
                          ),
                          Text(
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            myTasks[indx].taskDescription,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),

                    PopupMenuButton<TaskItemActionsEnum>(
                      icon: Icon(
                        Icons.more_vert,
                        color: ThemeController.isDark()
                            ? (myTasks[indx].isCompleted
                                  ? Color(0xFFA0A0A0)
                                  : Color(0xFFC6C6C6))
                            : (myTasks[indx].isCompleted
                                  ? Color(0xFF6A6A6A)
                                  : Color(0xFF3A4640)),
                      ),
                      onSelected: (value) async {
                        switch (value) {
                          case TaskItemActionsEnum.markAsDone:

                          case TaskItemActionsEnum.delete:

                          case TaskItemActionsEnum.edit:
                            
                        }
                      },
                      itemBuilder: (context) =>
                          TaskItemActionsEnum.values.map((e) {
                            return PopupMenuItem<TaskItemActionsEnum>(
                              value: e,
                              child: Text(e.name),
                            );
                          }).toList(),
                    ),
                  ],
                ),
              );
            }),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 8);
            },
          );
  }
}
