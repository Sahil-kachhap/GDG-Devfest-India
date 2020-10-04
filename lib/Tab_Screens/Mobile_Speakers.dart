import 'dart:convert';
import 'package:event_app/UI_Components/Custom_Speaker_Card.dart';
import 'package:flutter/material.dart';

class MobileSpeakers extends StatefulWidget {
  final String mobileTrack;

  const MobileSpeakers({Key key, this.mobileTrack}) : super(key: key);
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
              itemCount: 6,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var SpeakerData = json.decode(snapshot.data.toString());
                  return CustomSpeakerCard(
                    SpeakerName: SpeakerData['mobile'][index]['speaker_name'],
                    SpeakerTopic: SpeakerData['mobile'][index]
                        ['speaker_desc'],
                    SpeakerDesc: SpeakerData['mobile'][index]['speaker_desc'],
                    session_topic: SpeakerData['mobile'][index]
                        ['speaker_session'],
                    image: SpeakerData['mobile'][index]['speaker_image'],
                    linkedinURL: SpeakerData['mobile'][index]['linkedin_url'],
                    twitterURL: SpeakerData['mobile'][index]['twitter_url'],
                  );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
