import 'dart:convert';
import 'package:event_app/Helpers/Custom_Speaker_Card.dart';
import 'package:flutter/material.dart';

class MobileSpeakers extends StatefulWidget {
  @override
  _MobileSpeakersState createState() => _MobileSpeakersState();
}

class _MobileSpeakersState extends State<MobileSpeakers> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('Assets/JSON/Speakers.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  var SpeakerData = json.decode(snapshot.data.toString());
                  return CustomSpeakerCard(
                    SpeakerName: SpeakerData['speakers'][index]['speaker_name'],
                    SpeakerTopic: SpeakerData['speakers'][index]
                        ['speaker_desc'],
                    SpeakerDesc: SpeakerData['speakers'][index]['speaker_desc'],
                    image: AssetImage('Assets/Images/harsh_akshit.jpeg'),
                  );
                });
          }else{
            return CircularProgressIndicator();
          }
        });
  }
}
