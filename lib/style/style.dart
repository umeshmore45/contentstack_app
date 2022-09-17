import 'package:flutter/material.dart';

class Style {
  static const textStyle = TextStyle(color: Colors.amber);
  static var textCardStyle = TextStyle(color: Colors.white.withOpacity(0.8));

  static const containerStyle =
      BoxDecoration(color: Color.fromRGBO(0, 1, 56, 1));

  static const backGroundBlueColorStyle = Color.fromRGBO(0, 1, 56, 1);

  static var cardShapeStyle = BeveledRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
    side: const BorderSide(
      color: Colors.amber,
      width: 1.0,
    ),
  );

  static getTextFiledStyle(String textLabel) {
    return InputDecoration(
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.cyanAccent)),
      focusedBorder:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
      labelStyle: const TextStyle(color: Colors.amber),
      labelText: textLabel,
    );
  }

  static getTextStyle(Color textColor, {double textFontSize = 14}) {
    return TextStyle(
      color: textColor,
      fontSize: textFontSize,
    );
  }
}
