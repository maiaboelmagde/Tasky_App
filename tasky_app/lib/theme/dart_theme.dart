import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: 'Plus Jakarta Sans',
  scaffoldBackgroundColor: Colors.black,
  splashColor: Colors.black,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(21, 184, 108, 1)),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
    ),
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 28,
      color: Colors.white,
    ),
    displayMedium: TextStyle(fontSize: 16, color: Colors.white),
    displaySmall: TextStyle(fontSize: 14, color: Colors.white),
    bodySmall: TextStyle(fontSize: 14, color: Color.fromRGBO(198, 198, 198, 1)),
    headlineLarge: TextStyle(fontSize: 32, color: Colors.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Color.fromRGBO(21, 184, 108, 1)),
    ),
    hintStyle: TextStyle(
      fontSize: 16,
      fontFamily: 'Plus Jakarta Sans',
      color: Color.fromRGBO(109, 109, 109, 1),
    ),

    filled: true,
    fillColor: Color.fromRGBO(40, 40, 40, 1),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color.fromRGBO(21, 184, 108, 1),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
  ),

  switchTheme: SwitchThemeData(
    trackColor: WidgetStateProperty.resolveWith((status) {
      if (status.contains(WidgetState.selected)) {
        return (Color.fromRGBO(21, 184, 108, 1));
      }
      return null;
    }),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((status){
      if(status.contains(WidgetState.selected)){
        return Color.fromRGBO(21, 184, 108, 1);
      }
      return null;
    }),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color.fromRGBO(24, 24, 24, 1),
    selectedItemColor: Color.fromRGBO(21, 184, 108, 1),
    unselectedItemColor: Colors.white,
  ),
);
