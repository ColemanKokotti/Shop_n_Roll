import 'package:flutter/material.dart';
/// 🌸 PASTEL THEME
final ThemeData pastelTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFFFFB6C1), // Light Pink
  scaffoldBackgroundColor: Color(0xFFFFF0F5), // Lavender Blush
  secondaryHeaderColor: Color(0xFFFFD1DC), // Pastel Rose
  cardColor: Color(0xFFFFE4E1), // Misty Rose

  appBarTheme: AppBarTheme(
    color: Color(0xFFFFD1DC),
    foregroundColor: Colors.white,
    elevation: 4,
    titleTextStyle: TextStyle(
      color: Colors.white, // 👈 Assicura contrasto
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),

  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Color(0xFFFF69B4)),
      backgroundColor: WidgetStateProperty.all(Color(0xFFFFC1CC)),
    ),
  ),

  iconTheme: IconThemeData(color: Color(0xFFFFA6C9)),

  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFFFFC1CC),
    textTheme: ButtonTextTheme.primary,
  ),

  textTheme: TextTheme(
    labelLarge: TextStyle(color: Color(0xFFD597AE), fontSize: 30),
    titleLarge: TextStyle(color: Color(0xFF734F96), fontSize: 22, fontWeight: FontWeight.bold), // 👈 Aggiunto
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Color(0xFFFF69B4),
      backgroundColor: Color(0xFFFFC1CC),
    ),
  ),

  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFFFF0F5),
      border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFFFA6C9))),
    ),
    textStyle: TextStyle(color: Color(0xFFD597AE), fontSize: 18),
  ),
);
