import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky_app/components/edit_task_component.dart';
import 'package:tasky_app/controllers/tasks_controller.dart';
import 'package:tasky_app/enums/task_item_actions_enum.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/theme/theme_controller.dart';

class CustomTaskComponent extends StatelessWidget {
  const CustomTaskComponent({super.key, required this.curTask});

  final TaskModel curTask;

  void _openCountryPicker(BuildContext context, TaskModel task) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => EditTaskComponent(myTask: task),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<TaskProvider>(context);
    return Container(
      padding: EdgeInsets.only(right: 12, left: 4, bottom: 4, top: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Checkbox(
            value: curTask.isCompleted,
            onChanged: (value) {
              tasksProvider.toggleComplete(curTask.id);
            },
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  curTask.taskTitle,
                  style: curTask.isCompleted
                      ? Theme.of(context).textTheme.displayMedium?.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: Theme.of(context).colorScheme.onSecondary,
                        )
                      : Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  curTask.taskDescription,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),

          PopupMenuButton<TaskItemActionsEnum>(
            icon: Icon(
              Icons.more_vert,
              color: ThemeController.isDark()
                  ? (curTask.isCompleted
                        ? Color(0xFFA0A0A0)
                        : Color(0xFFC6C6C6))
                  : (curTask.isCompleted
                        ? Color(0xFF6A6A6A)
                        : Color(0xFF3A4640)),
            ),
            onSelected: (value) async {
              switch (value) {
                case TaskItemActionsEnum.markAsDone:
                  tasksProvider.toggleComplete(curTask.id);
                  break;
                case TaskItemActionsEnum.delete:
                  tasksProvider.deleteTask(curTask.id);
                  break;
                case TaskItemActionsEnum.edit:
                  _openCountryPicker(context, curTask);
                  break;
              }
            },
            itemBuilder: (context) => TaskItemActionsEnum.values.map((e) {
              return PopupMenuItem<TaskItemActionsEnum>(
                value: e,
                child: Text(e.name),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
