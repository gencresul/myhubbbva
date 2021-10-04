import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(backgroundColor: Color(0xFF298d00)),
      backgroundColor: Colors.white,
      buttonColor: Colors.blue,
      textTheme: TextTheme(
          bodyText1: TextStyle(color: Color(0xFFF3F4ED)),
          bodyText2: TextStyle(color: Color(0xFFDDDDDD)),
          caption: TextStyle(color: Color(0xFF1A1B1D))));

  static final dark = ThemeData.dark().copyWith(
      backgroundColor: Colors.black,
      buttonColor: Colors.red,
      textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          caption: TextStyle(color: Color(0xFFF3F4ED))));
}
