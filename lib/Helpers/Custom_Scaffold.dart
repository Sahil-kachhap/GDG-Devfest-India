import 'package:event_app/Screens/Agenda%20_Screen.dart';
import 'package:event_app/Screens/Chapters.dart';
import 'package:event_app/Screens/FAQ.dart';
import 'package:event_app/Screens/HomeScreen.dart';
import 'package:event_app/Screens/Speakers_Screen.dart';
import 'package:event_app/ThemeBloc/AppTheme.dart';
import 'package:event_app/ThemeBloc/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomScaffold extends StatefulWidget {
  final String appTitle;
  final Icon customIcon;
  final Widget customBody;
  final Widget tabBar;
  final Widget popButton;

  CustomScaffold(
      {@required this.appTitle,
      @required this.customIcon,
      @required this.customBody,
      this.tabBar,
      this.popButton});

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  bool _isThemeSwitch = false;
  // int indexBottom=2;
  int _currentIndex = 2;

  List<String> _screens = <String>[
    '/speaker',
    '/agenda',
    '/home',
    '/chapter',
    '/sponsor',
  ];

  /* void _onBottomIconTap(int index) {
    setState(() {
      _currentIndex = index;
     // Navigator.pushNamed(context, _Screens[index]);
    });
  }*/
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: widget.popButton != null ? widget.popButton : null,
          bottom: widget.tabBar != null ? widget.tabBar : null,
          title: Text(
            widget.appTitle,
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              fontFamily: 'OpenSans',
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: _isThemeSwitch
                  ? Icon(FontAwesomeIcons.lightbulb)
                  : Icon(FontAwesomeIcons.solidLightbulb),
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
            IconButton(icon: widget.customIcon, onPressed: () {})
          ],
        ),
        body: widget.customBody,
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).brightness == Brightness.light
                ? Colors.blue
                : null,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  title: Text('Speakers'),
                  icon: Icon(FontAwesomeIcons.teamspeak)),
              BottomNavigationBarItem(
                  title: Text('Agenda'),
                  icon: Icon(FontAwesomeIcons.calendarCheck)),
              BottomNavigationBarItem(
                  title: Text('Home'), icon: Icon(FontAwesomeIcons.home)),
              BottomNavigationBarItem(
                  title: Text('Chapters'), icon: Icon(Icons.people)),
              BottomNavigationBarItem(
                  title: Text('FAQ'), icon: Icon(FontAwesomeIcons.solidStar)),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                Navigator.pushNamed(context, _screens[index]);
              });
            }),
      ),
    );
  }
}
