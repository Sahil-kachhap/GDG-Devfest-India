import 'package:animated_splash/animated_splash.dart';
import 'package:event_app/Constant_info/Constants.dart';
import 'package:event_app/Screens/Chapters.dart';
import 'package:event_app/Screens/Speakers_Screen.dart';
import 'package:event_app/ThemeBloc/Bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Screens/HomeScreen.dart';
import 'ThemeBloc/export.dart';
import 'package:event_app/Screens/Agenda _Screen.dart';
import 'package:event_app/Screens/bloc_content.dart';
void main() => runApp(InitialPage());

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => DevApp(),
        '/Agenda': (context) => AgendaPage(),
      },
    );
  }
}


/**/