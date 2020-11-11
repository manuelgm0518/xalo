import 'package:flutter/material.dart';

//Constantes Globales
const double kBorderRadius = 15.0;
const double kSpacing = 10.0;
const Color kPrimaryColor = Colors.teal; //#009688
const Color kAccentColor = Color.fromARGB(255, 0, 191, 165); //#00bfa5
const Color kLightColor = Color.fromARGB(255, 240, 250, 248); //f0faf8
const BoxShadow kShadow = const BoxShadow(color: Color.fromARGB(125, 0, 150, 136), blurRadius: 20.0, offset: const Offset(0, 5));

const kCircular = const BorderRadius.all(Radius.circular(kBorderRadius));
const kElevated = const BoxDecoration(boxShadow: [kShadow]);
const kSpacerW = const SizedBox(width: kSpacing);
const kSpacerH = const SizedBox(height: kSpacing);
const kBouncy = const BouncingScrollPhysics();

class AppThemes {
  static ThemeData main = ThemeData(
    fontFamily: 'Poppins',
    primarySwatch: Colors.teal,
    primaryColor: kPrimaryColor,
    accentColor: kAccentColor,
    scaffoldBackgroundColor: kLightColor,
    primaryColorBrightness: Brightness.dark,
    accentColorBrightness: Brightness.dark,
    cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: kCircular)),
    shadowColor: kLightColor,
    dividerTheme: DividerThemeData(color: Colors.grey),
    buttonTheme: ButtonThemeData(shape: RoundedRectangleBorder(borderRadius: kCircular)),
    inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder(borderRadius: kCircular)),
  );
}
/*
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
*/
