import 'dart:convert';
import 'dart:math';
import 'package:event_app/Tab_Screens/GDG_Chapter_Screens.dart';
import 'package:event_app/Tab_Screens/GDG_Cloud_Chapters_Screen.dart';
import 'package:event_app/ThemeBloc/AppTheme.dart';
import 'package:event_app/ThemeBloc/export.dart';
import 'package:event_app/UI_Components/Tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:share/share.dart';

class ChapterScreen extends StatefulWidget {
  @override
  _ChapterScreenState createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen>
    with SingleTickerProviderStateMixin {
  bool _isThemeSwitch=false;
  TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    _controller = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
          bottom: TabBar(
            indicatorColor: Tools.multiColors[Random().nextInt(4)],
            isScrollable: true,
            controller: _controller,
            tabs: <Widget>[
              Tab(
                child: Text(
                  'GDG Chapters',
                  style: Theme.of(context).brightness == Brightness.light
                      ? Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(fontFamily: 'OpenSans', color: Colors.black,  fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,)
                      : Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(fontFamily: 'OpenSans', color: Colors.white, letterSpacing: 1.0),
                ),
              ),
              Tab(
                child: Text(
                  'GDG Cloud Chapters',
                  style: Theme.of(context).brightness == Brightness.light
                      ? Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(fontFamily: 'OpenSans', color: Colors.black,
                    letterSpacing: 1.0,)
                      : Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(fontFamily: 'OpenSans', color: Colors.white,letterSpacing: 1.0),
                ),
              ),
            ],
          ),
          title: Text(
            'GDG Community',
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              letterSpacing: 1.0,
              fontFamily: 'Opensans'
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon:  Theme.of(context).brightness == Brightness.dark
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
                onPressed: (){}/* Share.share(
                    "Download the new GDG DevFest India App and share with your tech friends.\nPlayStore -  ")*/
            )
          ],
        ),
        body: Container(
          child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('Assets/JSON/Chapters.json'),
              builder: (context, snapshot) {
                var mydata = json.decode(snapshot.data.toString());
                if (snapshot.hasData) {
                  return TabBarView(
                    controller: _controller,
                    children: <Widget>[
                      GDGChapterCards(mydata: mydata),
                      GDGCloudChapterCards(mydata: mydata),
                    ],
                  );
                }else{
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ));
  }
}
