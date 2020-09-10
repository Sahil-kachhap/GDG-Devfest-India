import 'package:event_app/Helpers/Custom_Speaker_Card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileSpeakers extends StatefulWidget {
  @override
  _MobileSpeakersState createState() => _MobileSpeakersState();
}

class _MobileSpeakersState extends State<MobileSpeakers> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return new CustomSpeakerCard(
            SpeakerName: 'Harsh Akshit',
            SpeakerTopic: 'Topic: Intro To Payment Gateway',
            image: AssetImage('images/harsh_akshit.jpeg'),
          );
        });
  }
}


