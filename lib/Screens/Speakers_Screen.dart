import 'dart:math';

import 'package:event_app/Tab_Screens/Cloud_Speakers.dart';
import 'package:event_app/Tab_Screens/ML_Speakers.dart';
import 'package:event_app/Tab_Screens/Mobile_Speakers.dart';
import 'package:event_app/Tab_Screens/Web_Speakers.dart';
import 'package:event_app/ThemeBloc/AppTheme.dart';
import 'package:event_app/ThemeBloc/export.dart';
import 'package:event_app/UI_Components/Tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

class SpeakerScreen extends StatefulWidget {
  @override
  _SpeakerScreenState createState() => _SpeakerScreenState();
}

class _SpeakerScreenState extends State<SpeakerScreen>
    with SingleTickerProviderStateMixin {
  bool _isThemeSwitch = false;
  TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    controller = TabController(vsync: this, length: 5);
    super.initState();
    MobileSpeakers _mobileSpeakers = MobileSpeakers();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
            indicatorColor: Tools.multiColors[Random().nextInt(4)],
            isScrollable: true,
            controller: controller,
            tabs: [
              Tab(
                child: Text(
                  'Mobile',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    letterSpacing: 1.0,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Cloud',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    letterSpacing: 1.0,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Web',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    letterSpacing: 1.0,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Machine Learning',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    letterSpacing: 1.0,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Design [UI/UX]',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    letterSpacing: 1.0,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ]),
        title: Text(
          'Speakers',
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            fontFamily: 'OpenSans',
            letterSpacing: 1.0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Theme.of(context).brightness == Brightness.dark
                ? Icon(FontAwesomeIcons.sun)
                : Icon(FontAwesomeIcons.moon),
            onPressed: () {
              _isThemeSwitch = _isThemeSwitch ? false : true;
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
                  () => Share.share(
                  "Download the new GDG DevFest India App and share with your tech friends.\nPlayStore -  ")
              )
        ],
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          MobileSpeakers(),
          CloudSpeakers(),
          WebSpeakers(),
          MLSpeakers(),
          Center(child: Text('Flutter speakers'),)
        ],
      ),
    );
  }
}
