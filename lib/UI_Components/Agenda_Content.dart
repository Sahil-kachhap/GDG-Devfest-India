import 'package:flutter/material.dart';
import 'Custom_Speaker_Card.dart';

class AgendaContent extends StatelessWidget {
  //final ImageProvider image;
  final String description;
  final String title;
  final String sessionDesc;
  final String sessionTime;

  const AgendaContent({this.title,this.description,this.sessionDesc,this.sessionTime});

  @override
  Widget build(BuildContext context) {
    return CustomSpeakerCard(
        SpeakerName: title,
        SpeakerTopic: description,
        SpeakerDesc: sessionDesc,
        session_time: sessionTime,
    );
     /* Card(
      margin: EdgeInsets.all(10.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30.0,
          backgroundImage: image,
        ),
        title: Text(title),
        //subtitle: Text(description),
      ),
    );*/
  }
}
