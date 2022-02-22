import 'package:flutter/material.dart';

final ThemeData light_theme = ThemeData(
  splashColor: Colors.orange,
  brightness: Brightness.light,
  primaryColor: Colors.orange,
  fontFamily: 'HarmonyOS_Sans',
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 72.0,
      fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      fontSize: 36.0,
      fontStyle: FontStyle.italic,
    ),
    bodyText2: TextStyle(
      fontSize: 14.0,
      fontFamily: 'Hind',
    ),
  ),
);
final ThemeData dark_theme = ThemeData();
