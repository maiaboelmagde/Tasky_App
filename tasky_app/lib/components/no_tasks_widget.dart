import 'package:flutter/material.dart';

class NoTasksWidget extends StatelessWidget {
  final VoidCallback? onAddTask;

  const NoTasksWidget({super.key, this.onAddTask});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox, size: 80, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            'No tasks yet',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.grey.shade600,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Start by adding your first task!',
            style: TextStyle(color: Colors.grey.shade500),
          ),
          const SizedBox(height: 20),
          if (onAddTask != null)
            ElevatedButton.icon(
              onPressed: onAddTask,
              icon: const Icon(Icons.add),
              label: const Text('Add Task'),
            ),
        ],
      ),
    );
  }
}
