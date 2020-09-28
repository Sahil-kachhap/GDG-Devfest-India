import 'package:animated_splash/animated_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Constant_info/Constants.dart';
import 'Screens/Agenda _Screen.dart';
import 'Screens/Chapters.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/Speakers_Screen.dart';
import 'Screens/FAQ.dart';
import 'ThemeBloc/Bloc.dart';
import 'ThemeBloc/export.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(DevApp());
}



class DevApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      builder: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Devfest.app_name,
            theme: state.theme,
            routes: <String , WidgetBuilder>{
             '/home': (context)=> HomeScreen(),
              '/agenda': (context)=> AgendaPage(),
              '/speaker': (context)=>SpeakerScreen(),
              '/chapter':(context)=> ChapterScreen(),
              '/sponsor':(context)=>FAQScreen(),
            },
           // home: HomeScreen()
           home: AnimatedSplash(
              imagePath: Devfest.Splash_Screen_Logo,
              home: HomeScreen(),
              duration: 2500,
              type: AnimatedSplashType.StaticDuration,
            ),
          );
        },
      ),
    );
  }
}

/*import 'package:animated_splash/animated_splash.dart';
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
*/
