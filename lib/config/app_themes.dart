import 'package:flutter/material.dart';

//Constantes Globales
const double kPadding = 10.0;
const double kMargin = 10.0;
const double kBorderRadius = 30.0;
const Color kMainColor = Color.fromARGB(255, 143, 14, 251);
const Color kMainAccentColor = Color.fromARGB(255, 58, 144, 251);
const Gradient kMainGradient = LinearGradient(colors: [
  Color.fromARGB(255, 184, 33, 251),
  Color.fromARGB(255, 40, 182, 251),
]);

class AppThemes {
  static ThemeData mainLight = ThemeData(
      textTheme: TextTheme(
    headline1: TextStyle(fontFamily: 'Poppins'),
  ));
  static ThemeData mainDark = ThemeData();
}

//Temas
final ThemeData mainTheme = ThemeData(
    primaryColor: kMainColor,
    accentColor: kMainAccentColor,
    textSelectionTheme: TextSelectionThemeData(cursorColor: kMainColor),
    fontFamily: 'Exo',
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    primaryColorBrightness: Brightness.dark,
    accentColorBrightness: Brightness.dark,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      actionsIconTheme: IconThemeData(color: kMainColor),
      iconTheme: IconThemeData(color: kMainColor),
      elevation: 0,
    ),
    cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kBorderRadius))),
    dividerTheme: DividerThemeData(color: Colors.grey),
    textTheme: TextTheme(button: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
    buttonColor: kMainColor,
    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kBorderRadius))),
    inputDecorationTheme: InputDecorationTheme(contentPadding: EdgeInsets.all(kPadding), border: OutlineInputBorder(borderRadius: BorderRadius.circular(kBorderRadius))));
