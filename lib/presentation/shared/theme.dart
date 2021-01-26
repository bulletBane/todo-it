import 'package:flutter/material.dart';

final lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    primaryColorDark: Colors.black,
    accentColor: Colors.redAccent,
    primaryColor: Colors.blueAccent);

final darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(centerTitle: true),
    scaffoldBackgroundColor: Colors.grey[900],
    primaryColorDark: Colors.white,
    accentColor: Colors.blueAccent,
    primaryColor: Colors.blueAccent);
