import 'package:event_app/Helpers/Custom_Scaffold.dart';
import 'package:event_app/Tab_Screens/Mobile_Speakers.dart';
import 'package:flutter/material.dart';

class SpeakerScreen extends StatefulWidget {
  @override
  _SpeakerScreenState createState() => _SpeakerScreenState();
}

class _SpeakerScreenState extends State<SpeakerScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    controller = TabController(vsync: this, length: 5);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appTitle: 'Speakers',
      CustomIcon: Icon(Icons.share),
      BottomWidget: TabBar(isScrollable: true, controller: controller, tabs: [
        Tab(
          child: Text(
            'Mobile',
            style: TextStyle(fontFamily: 'OpenSans',color: Colors.black))
        ),
        Tab(
          child: Text(
            'Web',
            style: TextStyle(fontFamily: 'OpenSans',color: Colors.black),
          ),
        ),
        Tab(
          child: Text(
            'Cloud',
            style: TextStyle(fontFamily: 'OpenSans',color: Colors.black),
          ),
        ),
        Tab(
          child: Text(
            'Machine Learning',
            style: TextStyle(fontFamily: 'OpenSans',color: Colors.black),
          ),
        ),
        Tab(
          child: Text(
            'Design[UI/UX]',
            style: TextStyle(fontFamily: 'OpenSans',color: Colors.black),
          ),
        ),
      ]),
      CustomBody: TabBarView(
        controller: controller,
        children: <Widget>[
          MobileSpeakers(),
          Center(child: Text('Web Speakers will be Displayed Here')),
          Center(child: Text('Cloud Speakers will be Displayed Here')),
          Center(child: Text('ML Speakers will be Displayed Here')),
          Center(child: Text('Design Speakers will be Displayed Here')),
        ],
      ),
    );
  }
}
