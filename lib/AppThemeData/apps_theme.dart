import 'package:flutter/material.dart';

class AppsThemeData {
  
  static InputDecorationTheme textFieldData() {
    return InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.white,
        fontSize: 13,
      ),
      fillColor: Colors.purple[100],
      filled: true,
      isDense: true,
      contentPadding: EdgeInsets.all(13),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  static TextStyle textThemeStyle() {
    return TextStyle(color: Colors.white, fontFamily: "Raleway");
  }

  static TextTheme textData() {
    return TextTheme(
      bodyText1: textThemeStyle(),
      bodyText2: textThemeStyle(),
      button: textThemeStyle(),
    );
  }
}
