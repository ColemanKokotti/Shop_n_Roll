import 'package:flutter/material.dart';

final ThemeData oceanBreezeTheme = ThemeData(
  primaryColor: Color(0xFF0277BD), // Blu oceano intenso
  scaffoldBackgroundColor: Color(0xFFE0F7FA), // Azzurro chiarissimo
  secondaryHeaderColor: Color(0xFF4FC3F7), // Azzurro vivace

  appBarTheme: AppBarTheme(
    color: Color(0xFF01579B), // Blu oceano scuro
    foregroundColor: Colors.white, // Testo e icone a contrasto
    titleTextStyle: TextStyle(
      color: Colors.white, //  bianco per visibilità
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.white), //  bianco per contrasto
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Color(0xFF0288D1), // Azzurro medio
    ),
  ),

  cardColor: Color(0xFFB3E5FC), // Azzurro chiaro

  iconTheme: IconThemeData(color: Color(0xFF01579B)), // Icone blu scuro (fuori dall'AppBar)

  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFF4FC3F7), // Azzurro vivace
    textTheme: ButtonTextTheme.primary,
  ),

  brightness: Brightness.light,

  textTheme: TextTheme(
    labelLarge: TextStyle(color: Colors.white, fontSize: 30), // Blu scuro per il testo principale
    titleLarge: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold), // Scuro per evitare sovrapposizione
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Color(0xFF0277BD), // Blu oceano intenso
    ),
  ),

  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFB3E5FC), // Azzurro chiaro
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF0288D1)), // Azzurro medio
      ),
    ),
    textStyle: TextStyle(color: Color(0xFF01579B), fontSize: 18), // Testo blu scuro
  ),
);
