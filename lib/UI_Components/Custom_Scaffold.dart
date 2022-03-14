import 'package:event_app/Screens/Agenda%20_Screen.dart';
import 'package:event_app/Screens/Chapters.dart';
import 'package:event_app/Screens/FAQ.dart';
import 'package:event_app/Screens/HomeScreen.dart';
import 'package:event_app/Screens/Speakers_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomScaffold extends StatefulWidget {
  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
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
                  label: 'Speakers',
                  icon: Icon(FontAwesomeIcons.teamspeak)),
              BottomNavigationBarItem(
                  label: 'Agenda', icon: Icon(Icons.event)),
              BottomNavigationBarItem(
                  label: 'Home', icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: 'Community', icon: Icon(Icons.people)),
              BottomNavigationBarItem(
                  label: 'FAQ', icon: Icon(FontAwesomeIcons.solidStar)),
            ],
            onTap: _onBottomIconTap,
          ),
        ),
    );
  }
}

