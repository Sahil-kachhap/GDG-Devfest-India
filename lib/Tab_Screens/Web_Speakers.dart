import 'dart:convert';
import 'package:event_app/Models/Speaker_Model.dart';
import 'package:event_app/UI_Components/Custom_Speaker_Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class WebSpeakers extends StatefulWidget {
  @override
  _WebSpeakersState createState() => _WebSpeakersState();
}

class _WebSpeakersState extends State<WebSpeakers> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('Assets/JSON/Speakers.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var SpeakerData = json.decode(snapshot.data.toString());
                return CustomSpeakerCard(
                  SpeakerName: SpeakerData['web'][index]['speaker_name'],
                  SpeakerTopic: SpeakerData['web'][index]
                  ['speaker_desc'],
                  SpeakerDesc: SpeakerData['web'][index]['speaker_desc'],
                  session_time: SpeakerData['web'][index]
                  ['speaker_session'],
                  image: SpeakerData['web'][index]['speaker_image'],
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
