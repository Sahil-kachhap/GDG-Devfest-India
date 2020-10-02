import 'dart:math';

import 'package:event_app/Screens/Agenda%20_Screen.dart';
import 'package:event_app/Screens/Chapters.dart';
import 'package:event_app/Screens/FAQ.dart';
import 'package:event_app/Screens/HomeScreen.dart';
import 'package:event_app/Screens/Speakers_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Tools.dart';
//import 'package:share/share.dart';

class CustomScaffold extends StatefulWidget {
 /* final String appTitle;
  final Icon customIcon;
  final Widget customBody;
  final Widget tabBar;
  final Widget popButton;

  CustomScaffold(
      {@required this.appTitle,
      @required this.customIcon,
      @required this.customBody,
      this.tabBar,
      this.popButton});*/

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
 // bool _isThemeSwitch = false;
  // int indexBottom=2;
  int _currentIndex = 2;

  List<Widget> _screens = <Widget>[
    SpeakerScreen(),
    AgendaPage(),
    HomeScreen(),
    ChapterScreen(),
    FAQScreen(),
  ];

  void _onBottomIconTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> _willPopCallback() async {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      return true;
    }
    return SafeArea(
      child: Scaffold(
          body: _screens.elementAt(_currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).brightness == Brightness.light
                ?  Color(0xff3e5df5)
                : null,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  title: Text('Speakers'),
                  icon: Icon(FontAwesomeIcons.teamspeak)),
              BottomNavigationBarItem(
                  title: Text('Agenda'), icon: Icon(Icons.event)),
              BottomNavigationBarItem(
                  title: Text('Home'), icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  title: Text('Community'), icon: Icon(Icons.people)),
              BottomNavigationBarItem(
                  title: Text('FAQ'), icon: Icon(FontAwesomeIcons.solidStar)),
            ],
            onTap: _onBottomIconTap,
          ),
        ),
    );
  }
}
