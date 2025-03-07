import 'package:flutter/material.dart';

/// ✨ DEFAULT THEME
final ThemeData defaultTheme = ThemeData(
  primaryColor: Color(0xFF009688), // Primary Color
  secondaryHeaderColor: Colors.purple[300], // Accent Color
  scaffoldBackgroundColor: Color(0xFFB2DFDB), // Light Primary Color

  appBarTheme: AppBarTheme(
    color: Color(0xFF009688), // Primary Color
    foregroundColor: Colors.white, // Testo e icone AppBar
    titleTextStyle: TextStyle(
      color: Colors.white, // 👈 Assicura visibilità
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),

  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Color(0xFFFFFFFF)), // Testo bianco
      backgroundColor: WidgetStateProperty.all(Color(0xFF009688)), // Primary Color
    ),
  ),

  cardColor: Color(0xFFB2DFDB), // Light Primary Color
  iconTheme: IconThemeData(color: Color(0xFF00796B)), // Dark Primary Color per icone generali

  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFF7C4DFF), // Accent Color
    textTheme: ButtonTextTheme.primary,
  ),

  brightness: Brightness.light,

  textTheme: TextTheme(
    labelLarge: TextStyle(color: Color(0xFF212121), fontSize: 30), // Primary Text
    titleLarge: TextStyle(color: Color(0xFF00796B), fontSize: 22, fontWeight: FontWeight.bold), // 👈 Aggiunto
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white, // Testo bianco
      backgroundColor: Color(0xFF009688), // Primary Color
    ),
  ),

  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFB2DFDB), // Light Primary Color
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFBDBDBD)), // Divider
      ),
    ),
    textStyle: TextStyle(color: Color(0xFF212121), fontSize: 30), // Primary Text
  ),
);