import 'package:flutter/material.dart';

/// 🎞️ VINTAGE RETRO THEME
final ThemeData vintageRetroTheme = ThemeData(
  primaryColor: Color(0xFF795548), // Primary Color
  scaffoldBackgroundColor: Color(0xFFD7CCC8), // Light Primary Color
  secondaryHeaderColor: Color(0xFFFFC107), // Accent Color
  brightness: Brightness.light,
  cardColor: Color(0xFFD7CCC8), // Light Primary Color

  appBarTheme: AppBarTheme(
    color: Color(0xFF5D4037), // Dark Primary Color
    foregroundColor: Colors.white, // Testo e icone
    titleTextStyle: TextStyle(
      color: Colors.white, // Assicura visibilità
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),

  iconTheme: IconThemeData(color: Colors.white), // Icone bianche

  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFFFFC107), // Accent Color
    textTheme: ButtonTextTheme.primary,
  ),

  textTheme: TextTheme(
    labelLarge: TextStyle(color: Color(0xFF212121), fontSize: 30), // Primary Text
    titleLarge: TextStyle(color: Colors.amber, fontSize: 22, fontWeight: FontWeight.bold), // 👈 Aggiunto
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white, // Testo bottone
      backgroundColor: Color(0xFF795548), // Primary Color
    ),
  ),

  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFD7CCC8), // Light Primary Color
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFBDBDBD)), // Divider
      ),
    ),
    textStyle: TextStyle(color: Color(0xFF757575), fontSize: 18), // Secondary Text
  ),
);
