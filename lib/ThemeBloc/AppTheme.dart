import 'package:event_app/Constant_info/Constants.dart';
import 'package:flutter/material.dart';

class Themes {
  static final ThemeData LightTheme = ThemeData(
    //scaffoldBackgroundColor: Devfest.app_color,
    primaryColor: Colors.white,
    disabledColor: Colors.grey,
    cardColor: Colors.white,
    brightness: Brightness.light,
    canvasColor: Colors.grey[50],
    buttonTheme: ButtonThemeData(colorScheme: ColorScheme.light()),
    textTheme: TextTheme(
      headline: TextStyle(fontFamily: 'OpenSans'),
      body2: TextStyle(fontFamily: 'Opensans'),

    ),
    appBarTheme: AppBarTheme(
        color: Colors.white, iconTheme: IconThemeData(color: Colors.black),
      textTheme:  TextTheme(),
    ),

  );

  static final ThemeData DarkTheme = ThemeData(
   // primaryColor: Colors.black,
   // disabledColor: Colors.grey,
   // cardColor: Colors.black,
    canvasColor: Colors.black,
    brightness: Brightness.dark,
      buttonTheme: ButtonThemeData(colorScheme: ColorScheme.dark()),
      textTheme: TextTheme(
        headline: TextStyle(fontFamily: 'OpenSans'),
        body2: TextStyle(fontFamily: 'Opensans'),
      )
  );
}
