import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tasky_app/components/no_tasks_widget.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/enums/task_item_actions_enum.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/services/preferences_manager.dart';
import 'package:tasky_app/theme/theme_controller.dart';

class CustomTasksList extends StatefulWidget {
  const CustomTasksList({super.key, required this.myTasks});

  final List<TaskModel> myTasks;

  @override
  State<CustomTasksList> createState() => _CustomTasksListState();
}

class _CustomTasksListState extends State<CustomTasksList> {
  @override
  Widget build(BuildContext context) {
    return widget.myTasks.isEmpty
        ? NoTasksWidget()
        : ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.myTasks.length,
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
                      value: widget.myTasks[indx].isCompleted,
                      onChanged: (value) {
                        widget.myTasks[indx].isCompleted =
                            value ?? !widget.myTasks[indx].isCompleted;
                        setState(() {
                          PreferencesManager preferencesManager =
                              PreferencesManager();
                          String? localTasks = preferencesManager.getString(
                            StorageKey.tasksList,
                          );
                          List<dynamic> allTasks = [];
                          if (localTasks != null) {
                            allTasks = jsonDecode(localTasks);
                            final curTask = widget.myTasks[indx].toMap();
                            allTasks = allTasks
                                .map(
                                  (task) => task["id"] == curTask["id"]
                                      ? curTask
                                      : task,
                                )
                                .toList();
                            log('allTasks : $allTasks');
                          }
                          preferencesManager.setString(
                            StorageKey.tasksList,
                            jsonEncode(allTasks),
                          );
                        });
                      },
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            widget.myTasks[indx].taskTitle,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            widget.myTasks[indx].taskDescription,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),

                    PopupMenuButton<TaskItemActionsEnum>(
                      icon: Icon(
                        Icons.more_vert,
                        color: ThemeController.isDark()
                            ? (widget.myTasks[indx].isCompleted
                                  ? Color(0xFFA0A0A0)
                                  : Color(0xFFC6C6C6))
                            : (widget.myTasks[indx].isCompleted
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
