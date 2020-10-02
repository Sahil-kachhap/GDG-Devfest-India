import 'package:animated_splash/animated_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Constant_info/Constants.dart';
import 'ThemeBloc/Bloc.dart';
import 'ThemeBloc/export.dart';
import 'UI_Components/Custom_Scaffold.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
           home: AnimatedSplash(
              imagePath: Devfest.Splash_Screen_Logo,
              home: CustomScaffold(),
              duration: 2500,
              type: AnimatedSplashType.StaticDuration,
            ),
          );
        },
      ),
    );
  }
}

