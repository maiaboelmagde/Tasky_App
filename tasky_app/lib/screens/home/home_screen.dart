import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app/components/custom_tasks_list.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/screens/home/components/achieved_tasks_widget.dart';
import 'package:tasky_app/screens/new_task_screen.dart';
import 'package:tasky_app/services/preferences_manager.dart';
import 'package:tasky_app/services/user_controller.dart';
import 'package:tasky_app/theme/theme_controller.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<TaskModel> myTasks = [];
  int totalTask =0;
  int totalCompletedTasks=0;
  double completedTasksPercentage = 0;

  @override
  void initState() {
    super.initState();
    _getUserNameAndTasks();
  }

  _getUserNameAndTasks() async {
    myTasks = [];
    PreferencesManager preferencesManager = PreferencesManager();
    //tasks
    String? tasks = preferencesManager.getString(StorageKey.tasksList);
    if (tasks != null) {
      final tasksDecoded = jsonDecode(tasks) as List<dynamic>;
      setState(() {
        myTasks = tasksDecoded.map((task) => TaskModel.fromMap(task)).toList();
      });
    }

    _calculateCompletedPercentage();
  }


  _calculateCompletedPercentage(){
    totalTask = myTasks.length;
    totalCompletedTasks = myTasks.where((task)=>task.isCompleted == true).length;
    completedTasksPercentage = (totalCompletedTasks/totalTask);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            SizedBox(height: 30),
            Row(
              spacing: 15,
              children: [
                CircleAvatar(
                  radius: 21,
                  child: Image.asset('assets/images/personalAvatar.png'),
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
                        }
                      ),
                      ValueListenableBuilder(
                        valueListenable: UserController.motifationQuote,
                        builder: (_, value, _) {
                          return Text(
                            value,
                            style: Theme.of(context).textTheme.bodySmall,
                          );
                        }
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
                    child: 
                    ValueListenableBuilder(
                      valueListenable: ThemeController.themeNotifier,
                      builder: (context, value, child) {
                        if(ThemeController.isDark()) {
                          return Image.asset('assets/images/sun.png');
                        }
                        return Icon(Icons.dark_mode_outlined);
                      }
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Yuhuu ,Your work Is ',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Row(
              spacing: 20,
              children: [
                Text(
                  'almost done !',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SvgPicture.asset('assets/images/waving.svg'),
              ],
            ),
            AchievedTasksWidget(totalDoneTasks: totalCompletedTasks, totalTask: totalTask, percent: completedTasksPercentage),
            Container(
              height: 150,
              margin: EdgeInsets.symmetric(vertical: 4),
              padding: EdgeInsets.only(right: 12, left: 4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            Text('My Tasks', style: Theme.of(context).textTheme.displayLarge),
            CustomTasksList(myTasks: myTasks),
            SizedBox(height: 55,)
          ],
        ),
      ),

      floatingActionButton: SizedBox(
        width: 170,
        child: FloatingActionButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Icon(Icons.add),
                Text(
                  'Add New Task',
                ),
              ],
            ),
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
            _getUserNameAndTasks();
          },
        ),
      ),
    );
  }
}
