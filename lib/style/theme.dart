import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.blue,
      canvasColor: Colors.amber[300],
      appBarTheme: AppBarTheme(backgroundColor: Colors.amber[300]),
      scaffoldBackgroundColor: const Color.fromRGBO(0, 1, 56, 1),
      fontFamily: 'Montserrat',
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.amber[300],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        // type: BottomNavigationBarType.fixed,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: Colors.red[600],
        unselectedLabelColor: Colors.black.withOpacity(0.4),
        indicator: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.red, width: 2))),
      ),
      buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: Colors.amber[300],
      ),
      cardTheme: const CardTheme(
          margin:
              EdgeInsets.only(right: 30.0, top: 10.0, bottom: 10.0, left: 30.0),
          color: Color.fromRGBO(0, 1, 56, 1),
          shape: StadiumBorder(
              side: BorderSide(
            color: Colors.amber,
            width: 1.0,
          ))),
      colorScheme: const ColorScheme(
        primary: Colors.amber,
        primaryContainer: Colors.amberAccent,
        secondary: Colors.white,
        secondaryContainer: Colors.black,
        surface: Colors.amber,
        background: Color.fromRGBO(0, 1, 56, 1),
        error: Colors.red,
        onPrimary: Colors.blueAccent,
        onSecondary: Colors.cyanAccent,
        onSurface: Colors.brown,
        onBackground: Colors.blueAccent,
        onError: Colors.red,
        brightness: Brightness.light,
      ),
    );
  }
}
