import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:event_app/Constant_info/Constants.dart';
import 'package:event_app/ThemeBloc/AppTheme.dart';
import 'package:event_app/ThemeBloc/Bloc.dart';
import 'package:event_app/ThemeBloc/export.dart';
import 'package:event_app/UI_Components/CustomCard.dart';
import 'package:event_app/UI_Components/Social_icon_bar.dart';
import 'package:event_app/UI_Components/Tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:share/share.dart';
//import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isThemeSwitch = false;

  /*Future<void> _launchURL(String Url) async {
    if (await canLaunch(Url)) {
      await launch(Url);
    } else {
      throw 'Cannot reach $Url, Check your Internet Connection';
    }
  }*/

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white10
          : Colors.black,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness:
          Theme.of(context).brightness == Brightness.light
              ? Brightness.dark
              : Brightness.light,
    ));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            letterSpacing: 1.0,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            fontFamily: 'OpenSans',
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Theme.of(context).brightness == Brightness.dark
                ? Icon(FontAwesomeIcons.sun)
                : Icon(FontAwesomeIcons.moon),
            onPressed: () {
              _isThemeSwitch = _isThemeSwitch
                  ? false
                  : true;
              setState(() {
                if (_isThemeSwitch) {
                  BlocProvider.of<ThemeBloc>(context)
                      .dispatch(ThemeEvent(theme: Themes.DarkTheme));
                } else {
                  BlocProvider.of<ThemeBloc>(context)
                      .dispatch(ThemeEvent(theme: Themes.LightTheme));
                }
              });
            },
          ),
          SizedBox(
            width: 5,
          ),
          IconButton(
              icon: Icon(Icons.share),
              onPressed:
                  () {} /* => Share.share(
                  "Download the new GDG DevFest India App and share with your tech friends.\nPlayStore -  ")*/
              )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CustomImageCard(
                imageProvider: AssetImage('Assets/Images/dev_fest.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  Devfest.WelcomeDesc,
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(fontFamily: 'Opensans', letterSpacing: 1.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  Devfest.Description,
                  style: Theme.of(context).textTheme.body2.copyWith(
                        letterSpacing: 1.0,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              RaisedButton(
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  color: Tools
                      .multiColors[Random().nextInt(4)], //Color(0xff3e5df5),
                  onPressed: () {
                    // _launchURL(Devfest.Devfest_RegisterPage_Url);
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Social_Icon_Horizontal_Bar(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9.0),
                child: TypewriterAnimatedTextKit(
                  onTap: () {},
                  totalRepeatCount: 1,
                  speed: Duration(milliseconds: 250),
                  text: [
                    "#DevFestIndia",
                  ],
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Tools.multiColors[Random().nextInt(4)],
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 9.0,
              ),
              Text(
                Devfest.app_version,
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
