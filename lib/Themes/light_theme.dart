import 'package:flutter/material.dart';

/// 🌟 LIGHT THEME
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue, // Colore principale
  scaffoldBackgroundColor: Colors.white, // Sfondo principale
  secondaryHeaderColor: Colors.teal, // Colore secondario
  cardColor: Colors.blueGrey[50], // Sfondo delle card

  appBarTheme: AppBarTheme(
    color: Colors.blue, // Sfondo AppBar
    foregroundColor: Colors.white, // Testo e icone AppBar
    elevation: 4,
    titleTextStyle: TextStyle(
      color: Colors.white, // Assicura visibilità del titolo
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),

  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Colors.blue),
      backgroundColor: WidgetStateProperty.all(Colors.blueGrey[100]),
    ),
  ),

  iconTheme: IconThemeData(color: Colors.blueGrey[700]),

  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blueGrey[100],
    textTheme: ButtonTextTheme.primary,
  ),

  textTheme: TextTheme(
    labelLarge: TextStyle(color: Colors.blue, fontSize: 30),
    titleLarge: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold), // 👈 Aggiunto
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
    ),
  ),

  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.blueGrey[50],
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey[300]!)),
    ),
    textStyle: TextStyle(color: Colors.black, fontSize: 18),
  ),
);
