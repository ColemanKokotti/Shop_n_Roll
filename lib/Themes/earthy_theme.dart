import 'package:flutter/material.dart';

final ThemeData earthyTheme = ThemeData(
  primaryColor: Color(0xFF6D4C41), // Marrone terroso
  scaffoldBackgroundColor: Color(0xFFD7CCC8), // Beige sabbia
  secondaryHeaderColor: Color(0xFF8D6E63), // Marrone più chiaro

  appBarTheme: AppBarTheme(
    color: Color(0xFF5D4037), // Marrone scuro
    foregroundColor: Colors.white, // Testo e icone in contrasto
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Color(0xFF5D4037), // Marrone scuro
    ),
  ),

  cardColor: Color(0xFFF5E1DA), // Color crema

  iconTheme: IconThemeData(color: Color(0xFF4E342E)), // Icone marroni scure

  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFF8D6E63), // Marrone chiaro
    textTheme: ButtonTextTheme.primary,
  ),

  brightness: Brightness.light,

  textTheme: TextTheme(
    labelLarge: TextStyle(color: Color(0xFF3E2723), fontSize: 30), // Testo marrone molto scuro
    titleLarge: TextStyle(color: Color(0xFFCD853F), fontSize: 22, fontWeight: FontWeight.bold),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Color(0xFF6D4C41), // Marrone medio
    ),
  ),

  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFF5E1DA), // Beige chiaro
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF8D6E63)), // Marrone chiaro
      ),
    ),
    textStyle: TextStyle(color: Color(0xFF3E2723), fontSize: 18), // Testo marrone molto scuro
  ),
);
