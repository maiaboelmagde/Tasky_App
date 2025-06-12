import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky_app/core/constants/StorageKey.dart';
import 'package:tasky_app/core/controllers/tasks_controller.dart';
import 'package:tasky_app/screens/main_screen.dart';
import 'package:tasky_app/screens/startup_screen.dart';
import 'package:tasky_app/core/services/preferences_manager.dart';
import 'package:tasky_app/core/theme/dart_theme.dart';
import 'package:tasky_app/core/theme/light_theme.dart';
import 'package:tasky_app/core/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PreferencesManager pref = PreferencesManager();
  await pref.init();
  //pref.clear();
  String? userName = pref.getString(StorageKey.userName);
  ThemeController themeController = ThemeController();
  themeController.init();

  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskProvider()..loadTasks(),
      child: MyApp(userName: userName),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.userName});
  final String? userName;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeController.themeNotifier,
      builder: (_, value, _) {
        return MaterialApp(
          home: userName == null ? StartupScreen() : MainScreen(),
          themeMode: value,
          theme: lightTheme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
