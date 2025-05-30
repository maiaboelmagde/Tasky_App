import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky_app/components/custom_tasks_list.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/screens/new_task_screen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String? userName;
  List<TaskModel> myTasks = [];

  @override
  void initState() {
    super.initState();
    _getUserNameAndTasks();
  }

  _getUserNameAndTasks() async {
    myTasks = [];
    var prefs = await SharedPreferences.getInstance();
    //prefs.clear();
    userName = prefs.getString(SharedPrefsKeys.userName);
    String? tasks = prefs.getString(SharedPrefsKeys.tasksList);
    if (tasks != null) {
      for (var task in jsonDecode(tasks)) {
        myTasks.add(TaskModel.fromMap(task));
      }
    }
    log(myTasks.toString());

    setState(() {});
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
                      Text(
                        'Good Evening ,$userName ',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        'One task at a time.One step closer.',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 1),
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color.fromRGBO(40, 40, 40, 1),
                  ),
                  child: Image.asset('assets/images/sun.png'),
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
            Container(
              height: 80,
              margin: EdgeInsets.symmetric(vertical: 4),
                    padding: EdgeInsets.only(right: 12, left: 4),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(40, 40, 40, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
            ),Container(
              height: 150,
              margin: EdgeInsets.symmetric(vertical: 4),
                    padding: EdgeInsets.only(right: 12, left: 4),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(40, 40, 40, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
            ),

            Text('My Tasks', style: Theme.of(context).textTheme.displayLarge),
            SizedBox(
              height: 300,
              child: CustomTasksList(myTasks: myTasks),
            ),
          ],
        ),
      ),

      floatingActionButton: SizedBox(
        width: 170,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Icon(Icons.add, color: Colors.white),
                Text(
                  'Add New Task',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          ),
          onPressed: () async{
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

