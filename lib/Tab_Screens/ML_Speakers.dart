import 'dart:convert';
import 'dart:math';
import 'package:event_app/UI_Components/Custom_Speaker_Card.dart';
import 'package:event_app/UI_Components/Tools.dart';
import 'package:flutter/material.dart';

class MLSpeakers extends StatefulWidget {
  @override
  _MLSpeakersState createState() => _MLSpeakersState();
}

class _MLSpeakersState extends State<MLSpeakers> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('Assets/JSON/Speakers.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  var SpeakerData = json.decode(snapshot.data.toString());
                  return CustomSpeakerCard(
                    SpeakerName: SpeakerData['ML'][index]['speaker_name'],
                    SpeakerTopic: SpeakerData['ML'][index]
                    ['speaker_desc'],
                    SpeakerDesc: SpeakerData['ML'][index]['speaker_desc'],
                    session_topic: SpeakerData['ML'][index]['speaker_session'],
                    image: SpeakerData['ML'][index]['speaker_image'],
                    linkedinURL: SpeakerData['ML'][index]['linkedin_url'],
                    twitterURL: SpeakerData['ML'][index]['twitter_url'],
                  );
                });
          }else{
            return Center(child: CircularProgressIndicator(backgroundColor: Tools.multiColors[Random().nextInt(4)],));
          }
        });
  }
}
