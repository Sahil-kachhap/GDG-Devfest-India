import 'dart:convert';
import 'dart:math';
import 'package:event_app/Constant_info/Constants.dart';
import 'package:event_app/ThemeBloc/AppTheme.dart';
import 'package:event_app/ThemeBloc/export.dart';
import 'package:event_app/UI_Components/Session_content.dart';
import 'package:event_app/UI_Components/Tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:share/share.dart';

class AgendaPage extends StatefulWidget {
  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage>
    with SingleTickerProviderStateMixin {
  bool _isThemeSwitch =false;
  TabController _AgendaTabscontroller;

  @override
  void initState() {
    // TODO: implement initState
    _AgendaTabscontroller = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _AgendaTabscontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _AgendaTabscontroller,
          indicatorColor: Tools.multiColors[Random().nextInt(4)],
          tabs: <Widget>[
            Tab(
              child: Text(
                'Day 1',
                style: TextStyle(
                    letterSpacing: 1.0,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    fontFamily: 'OpenSans'
                ),
              ),
            ),
            Tab(
              child: Text(
                'Day 2',
                style: TextStyle(
                    letterSpacing: 1.0,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    fontFamily: 'OpenSans'),
              ),
            ),
            Tab(
              child: Text(
                'Day 3',
                style: TextStyle(
                    letterSpacing: 1.0,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    fontFamily: 'OpenSans'),
              ),
            )
          ],
        ),//widget.tabBar != null ? widget.tabBar : null,
        title: Text(
          'Agenda',
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
              onPressed: (){} /*=> Share.share(
                  "Download the new GDG DevFest India App and share with your tech friends.\nPlayStore -  ")*/)
        ],
      ),

      body: TabBarView(
        controller: _AgendaTabscontroller,
        children: <Widget>[
          Center(child: Text("Session Info will be updated soon.",style: Theme.of(context).textTheme.subtitle.copyWith(fontFamily: 'Opensans',letterSpacing: 1.0),)),
          Center(child: Text("Session Info will be updated soon.",style: Theme.of(context).textTheme.subtitle.copyWith(fontFamily: 'Opensans',letterSpacing: 1.0))),
          Center(child: Text("Session Info will be updated soon.",style: Theme.of(context).textTheme.subtitle.copyWith(fontFamily: 'Opensans',letterSpacing: 1.0))),
          // AgendaBodyWidget(),
         // AgendaBodyWidget(),
         // AgendaBodyWidget(),
        ],
      ), //AgendaBodyWidget(),
    );
  }
}

class AgendaBodyWidget extends StatelessWidget {
  const AgendaBodyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('Assets/JSON/Agenda.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                var agendaData = json.decode(snapshot.data.toString());
                return SessionContent(
                  description: agendaData['sessions'][index]['speaker_desc'],
                  sessionSpeaker: agendaData['sessions'][index]['speaker_name'],
                  title: agendaData['sessions'][index]['session_title'],
                  image: AssetImage(Devfest.Harsh_Akshit_image),
                  Duration: agendaData['sessions'][index]['session_total_time'],
                  sessionTime: agendaData['sessions'][index]['session_start_time'],
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}

