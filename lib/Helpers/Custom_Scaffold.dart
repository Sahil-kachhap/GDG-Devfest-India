//import 'package:dev_app/ThemeBloc/themes.dart';
import 'package:event_app/ThemeBloc/AppTheme.dart';
import 'package:event_app/ThemeBloc/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomScaffold extends StatefulWidget {
  final String appTitle;
  final Icon CustomIcon;
  final Widget CustomBody;
  final Widget BottomWidget;
  CustomScaffold(
      {@required this.appTitle,
      @required this.CustomIcon,
      @required this.CustomBody,this.BottomWidget});

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  bool _isThemeSwitch = false;
  int indexBottom=2;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: widget.BottomWidget,
        title: Text(
          widget.appTitle,
          style: TextStyle(
            color: _isThemeSwitch ? Colors.white : Colors.black,
            fontFamily: 'OpenSans',
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: _isThemeSwitch
                ? Icon(Icons.lightbulb_outline)
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
          IconButton(icon: widget.CustomIcon, onPressed: () {})
        ],
      ),
      body: widget.CustomBody,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //selectedItemColor: Colors.white,
        currentIndex: indexBottom,
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
              title: Text('Sponsors'),
              icon: Icon(FontAwesomeIcons.handshake)),
        ],
        onTap: (index) {
          setState(() {
            indexBottom=index;
          });
        },
      ),
    );
  }
}
