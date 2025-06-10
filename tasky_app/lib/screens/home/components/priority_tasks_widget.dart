import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky_app/controllers/tasks_controller.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/screens/high_priority_tasks_screen.dart';

class PrioritTasksWidget extends StatelessWidget {
  const PrioritTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskProvider taskProvider = Provider.of<TaskProvider>(context);
    final List<TaskModel> highPriorityTasks = taskProvider.highPriorityTasks;
    bool isLoading = taskProvider.isLoading;

    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Container(
            height: 175,
            margin: EdgeInsets.symmetric(vertical: 4),
            padding: EdgeInsets.only(right: 12, left: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'High Priority Tasks',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      Expanded(
                        child: Column(
                          children: List.generate(
                            highPriorityTasks.length > 4
                                ? 4
                                : highPriorityTasks.length,
                            (index) {
                              final task = highPriorityTasks[index];
                              return Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: Checkbox(
                                        value: task.isCompleted,
                                        onChanged: (newValue) {
                                          taskProvider.toggleComplete(task.id);
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        task.taskTitle,
                                        style: task.isCompleted
                                            ? Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color: Theme.of(
                                                      context,
                                                    ).colorScheme.onSecondary,
                                                  )
                                            : Theme.of(
                                                context,
                                              ).textTheme.displayMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      OutlinedButton(
                        
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HighPriorityTasksScreen(),
                            ),
                          );
                        },
                        child: Icon(Icons.arrow_outward),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
