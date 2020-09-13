import 'dart:convert';
import 'package:event_app/Helpers/Custom_Scaffold.dart';
import 'package:event_app/Tab_Screens/GDG_Chapter_Screens.dart';
import 'package:event_app/Tab_Screens/GDG_Cloud_Chapters_Screen.dart';
import 'package:flutter/material.dart';

class ChapterScreen extends StatefulWidget {
  @override
  _ChapterScreenState createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen>
    with SingleTickerProviderStateMixin {
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
    return CustomScaffold(
        appTitle: 'GDG Chapters India',
        CustomIcon: Icon(Icons.share),
        BottomWidget: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(
              child: Text(
                'GDG Chapters',
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .copyWith(fontFamily: 'OpenSans', color: Colors.black,fontSize: 17),
              ),
            ),
            Tab(
              child: Text(
                'GDG Cloud Chapters',
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .copyWith(fontFamily: 'OpenSans', color: Colors.black,fontSize: 17),
              ),
            ),
          ],
        ),
        CustomBody: Container(
          child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('Assets/JSON/Chapters.json'),
              builder: (context, snapshot) {
                var mydata = json.decode(snapshot.data.toString());
                return TabBarView(
                  controller: _controller,
                  children: <Widget>[
                    GDGChapterCards(mydata: mydata),
                    GDGCloudChapterCards(mydata: mydata),
                  ],
                );
              }),
        ));
  }
}
