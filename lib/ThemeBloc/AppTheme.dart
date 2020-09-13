import 'package:event_app/Constant_info/Constants.dart';
import 'package:flutter/material.dart';

class Themes {
  static final ThemeData LightTheme = ThemeData(
    //scaffoldBackgroundColor: Devfest.app_color,
    brightness: Brightness.light,
    tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(color: Colors.black)
    ),
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
    brightness: Brightness.dark,
      tabBarTheme: TabBarTheme(labelStyle: TextStyle(color: Colors.white)),
      textTheme: TextTheme(
        headline: TextStyle(fontFamily: 'OpenSans'),
        body2: TextStyle(fontFamily: 'Opensans'),
      )
  );
}
