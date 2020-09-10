import 'package:event_app/Helpers/Custom_Scaffold.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChapterScreen extends StatefulWidget {
  @override
  _ChapterScreenState createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appTitle: 'GDG Chapters India',
        CustomIcon: Icon(Icons.search),
        CustomBody: Container(),
    );
  }
}
