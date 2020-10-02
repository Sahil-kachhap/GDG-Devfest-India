import 'dart:convert';
import 'package:event_app/Models/Speaker_Model.dart';
import 'package:event_app/UI_Components/Custom_Speaker_Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class CloudSpeakers extends StatefulWidget {
  @override
  _CloudSpeakersState createState() => _CloudSpeakersState();
}

class _CloudSpeakersState extends State<CloudSpeakers> {
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
                  SpeakerName: SpeakerData['cloud'][index]['speaker_name'],
                  SpeakerTopic: SpeakerData['cloud'][index]
                  ['speaker_desc'],
                  SpeakerDesc: SpeakerData['cloud'][index]['speaker_desc'],
                  session_time: SpeakerData['cloud'][index]
                  ['speaker_session'],
                  image: SpeakerData['cloud'][index]['speaker_image'],
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
