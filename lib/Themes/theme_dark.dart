import 'package:flutter/material.dart';

/// 🌙 DARK THEME
final ThemeData darkTheme = ThemeData(
  primaryColor: Colors.white,
  cardColor: Colors.blueGrey[500],
  scaffoldBackgroundColor: Color.fromARGB(200, 50, 50, 50),

  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(200, 150, 150, 150),
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.white, // 👈 Assicura visibilità
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),

  buttonTheme: ButtonThemeData(buttonColor: Colors.black),
  iconTheme: IconThemeData(color: Colors.white),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.grey,
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.black54,
    ),
  ),

  textTheme: TextTheme(
    labelLarge: TextStyle(color: Colors.white, fontSize: 30),
    titleLarge: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold), // 👈 Aggiunto
  ),

  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color.fromARGB(200, 50, 50, 50),
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
    ),
    textStyle: TextStyle(color: Colors.white, fontSize: 30),
  ),

  brightness: Brightness.dark,
);