import 'dart:convert';
import 'package:event_app/Models/Speaker_Model.dart';
import 'package:event_app/UI_Components/Custom_Speaker_Card.dart';
import 'package:flutter/material.dart';

class MobileSpeakers extends StatefulWidget {
  final String mobileTrack;

  const MobileSpeakers({Key key, this.mobileTrack}) : super(key: key);
  @override
  _MobileSpeakersState createState() => _MobileSpeakersState();
}

class _MobileSpeakersState extends State<MobileSpeakers> {

  List<dynamic> allSpeakers=[];
  List<Speaker> mobileSpeakers=[];

  loadSpeakerData() async{

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('Assets/JSON/Speakers.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: 22,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var SpeakerData = json.decode(snapshot.data.toString());
                    return CustomSpeakerCard(
                      SpeakerName: SpeakerData['speakers'][index]
                          ['speaker_name'],
                      SpeakerTopic: SpeakerData['speakers'][index]
                          ['speaker_desc'],
                      SpeakerDesc: SpeakerData['speakers'][index]
                          ['speaker_desc'],
                      session_time: SpeakerData['speakers'][index]
                          ['speaker_session'],
                      image: AssetImage('Assets/Images/harsh_akshit.jpeg'),
                    );
                }
                );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
