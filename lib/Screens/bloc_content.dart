import 'package:animated_splash/animated_splash.dart';
import 'package:event_app/Constant_info/Constants.dart';
import 'package:event_app/Screens/Chapters.dart';
import 'package:event_app/Screens/Speakers_Screen.dart';
import 'package:event_app/ThemeBloc/Bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_app/Screens/HomeScreen.dart';
import 'package:event_app/ThemeBloc/export.dart';
import 'package:event_app/Screens/Agenda _Screen.dart';
void main() => runApp(DevApp());

class DevApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      builder: (context)=>ThemeBloc(),
      child: BlocBuilder<ThemeBloc,ThemeState>(
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Devfest.app_name,
            theme: state.theme,
            home: AnimatedSplash(
              imagePath: Devfest.Splash_Screen_Logo,
              home: ChapterScreen(),
              duration: 2500,
              type: AnimatedSplashType.StaticDuration,
            ),
          );
        },
      ),
    );
  }
}


/**/