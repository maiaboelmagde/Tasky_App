import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky_app/core/controllers/tasks_controller.dart';

class AchievedTasksWidget extends StatelessWidget {
  const AchievedTasksWidget({
    super.key,
   
  });


  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final totalTask = taskProvider.tasks.length;
    final totalCompletedTasks = taskProvider.tasks.where((t) => t.isCompleted).length;
    final completedTasksPercentage = taskProvider.completedPercentage;
    return  Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Achieved Tasks',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 4),
                  Text(
                    '$totalCompletedTasks Out of $totalTask Done',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                    angle: -pi/2,
                    child: SizedBox(
                      height: 48,
                      width: 48,
                      child: CircularProgressIndicator(
                        value: completedTasksPercentage,
                        backgroundColor: Color(0xFF6D6D6D),
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF15B86C)),
                        strokeWidth: 4,
                      ),
                    ),
                  ),
                  Text(
                    "${((completedTasksPercentage * 100).toInt())}%",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            ],
          ),
        );
  }
}
