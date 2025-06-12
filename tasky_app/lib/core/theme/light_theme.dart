import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: 'Plus Jakarta Sans',
  scaffoldBackgroundColor: Color(0xFFECEDEF),
  splashColor: Color(0xFFF6F7F9),
  colorScheme: ColorScheme.light(
    primary: Color(0xFF15B86C),
    primaryContainer: Colors.white,
    secondary: Color.fromARGB(255, 81, 82, 82),
    onSecondary: Color(0xFFA0A0A0),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: CircleBorder(),
      padding: EdgeInsets.all(12),
      side: BorderSide(color: Colors.grey),
      foregroundColor: Colors.black,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Color(0xFF15B86C)),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
    ),
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 28,
      color: Color(0xFF161F1B),
    ),
    displayMedium: TextStyle(fontSize: 16, color: Color(0xFF161F1B)),
    displaySmall: TextStyle(fontSize: 14, color: Color(0xFF161F1B)),
    titleMedium: TextStyle(fontSize: 20, color: Color(0xFF161F1B)),
    bodySmall: TextStyle(fontSize: 14, color: Color(0xFF6A6A6A)),
    headlineLarge: TextStyle(fontSize: 32, color: Color(0xFF161F1B)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Color(0xFF15B86C)),
    ),
    hintStyle: TextStyle(
      fontSize: 16,
      fontFamily: 'Plus Jakarta Sans',
      color: Color(0xFF9E9E9E),
    ),
    filled: true,
    fillColor: Colors.white,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF15B86C),
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFF6F7F9),
    foregroundColor: Color(0xFF161F1B),
  ),
  switchTheme: SwitchThemeData(
    trackColor: WidgetStateProperty.resolveWith((status) {
      if (status.contains(WidgetState.selected)) {
        return Color(0xFF15B86C);
      }
      return null;
    }),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((status) {
      if (status.contains(WidgetState.selected)) {
        return Color(0xFF15B86C);
      }
      return null;
    }),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFF6F7F9),
    selectedItemColor: Color(0xFF15B86C),
    unselectedItemColor: Color(0xFF3A4640),
  ),
);
