import 'package:flutter/material.dart';
import 'package:tasky_app/screens/completed_screen.dart';
import 'package:tasky_app/screens/home/home_screen.dart';
import 'package:tasky_app/screens/profile_screen.dart';
import 'package:tasky_app/screens/to_do_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> subScreens = [
    Homescreen(),
    ToDoScreen(),
    CompletedScreen(),
    ProfileScreen(),
  ];

  int curScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curScreenIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'To Do'),
          BottomNavigationBarItem(icon: Icon(Icons.fact_check_outlined),label: 'Completed'),
          BottomNavigationBarItem(icon: Icon(Icons.person_3_outlined),label: 'Profile')
        ],
        onTap: (value) {
          curScreenIndex = value;
          setState(() {
            
          });
        },
      ),
      body: subScreens[curScreenIndex],
    );
  }
}
