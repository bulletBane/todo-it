import 'package:flutter/material.dart';

final lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(color: Colors.blue[400], centerTitle: true),
    primaryColor: Colors.blue[400]);
final darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(color: Colors.blue[900], centerTitle: true),
    primaryColor: Colors.blue[900]);
