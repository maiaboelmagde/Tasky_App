import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky_app/components/custom_tasks_list.dart';
import 'package:tasky_app/controllers/tasks_controller.dart';
import 'package:tasky_app/screens/home/components/achieved_tasks_widget.dart';
import 'package:tasky_app/screens/home/components/priority_tasks_widget.dart';
import 'package:tasky_app/screens/new_task_screen.dart';
import 'package:tasky_app/controllers/user_controller.dart';
import 'package:tasky_app/theme/theme_controller.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final myTasks = taskProvider.tasks;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Row(
              spacing: 15,
              children: [
                ValueListenableBuilder(
                  valueListenable: UserController.userImageNotifier,
                  builder: (_, profileImagePath, _) {
                    return CircleAvatar(
                      radius: 21,
                      backgroundImage: profileImagePath == null
                          ? AssetImage('assets/images/user.png')
                          : FileImage(File(profileImagePath)),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    );
                  },
                ),

                SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: UserController.userNameNotifier,
                        builder: (_, value, _) {
                          return Text(
                            'Good Evening ,$value ',
                            style: Theme.of(context).textTheme.displayMedium,
                          );
                        },
                      ),
                      ValueListenableBuilder(
                        valueListenable: UserController.motifationQuote,
                        builder: (_, value, _) {
                          return Text(
                            value,
                            style: Theme.of(context).textTheme.bodySmall,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 1),
                GestureDetector(
                  onTap: () => ThemeController.toggleTheme(),
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: ValueListenableBuilder(
                      valueListenable: ThemeController.themeNotifier,
                      builder: (context, value, child) {
                        if (ThemeController.isDark()) {
                          return Image.asset('assets/images/sun.png');
                        }
                        return Icon(Icons.dark_mode_outlined);
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            myTasks.isEmpty
                ? Text(
                    "Let's start ..♡",
                    style: Theme.of(context).textTheme.headlineLarge,
                  )
                : taskProvider.completedPercentage == 1
                ? Text(
                    'Well Done .. 🎉',
                    style: Theme.of(context).textTheme.headlineLarge,
                  )
                : taskProvider.completedPercentage >= 0.5
                ? Text(
                    'Yuhuu ,Your work Is almost done ! 👋🏻',
                    style: Theme.of(context).textTheme.headlineLarge,
                  )
                : Text(
                    'Keep going..♡ ̆̈',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
            SizedBox(height: 5),
            AchievedTasksWidget(),
            SizedBox(height: 8),
            PrioritTasksWidget(),
            SizedBox(height: 24),
            Text('My Tasks', style: Theme.of(context).textTheme.displayLarge),
            SizedBox(height: 16),
            CustomTasksList(myTasks: myTasks),
            SizedBox(height: 55),
          ],
        ),
      ),

      floatingActionButton: SizedBox(
        width: 170,
        child: FloatingActionButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(children: [Icon(Icons.add), Text('Add New Task')]),
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return NewTaskScreen();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
