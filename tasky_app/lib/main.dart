import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/screens/main_screen.dart';
import 'package:tasky_app/screens/startup_screen.dart';
import 'package:tasky_app/theme/dart_theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); 
  final SharedPreferences pref = await SharedPreferences.getInstance();
  //pref.clear();
  String? userName = pref.getString(SharedPrefsKeys.userName);
  runApp( MyApp(userName: userName,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,this.userName});
  final String? userName;
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: userName == null? StartupScreen():MainScreen(),
      theme: darkTheme,

      debugShowCheckedModeBanner: false,
    );
  }
}
