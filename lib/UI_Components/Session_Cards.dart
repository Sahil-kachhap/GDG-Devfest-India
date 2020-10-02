import 'dart:math';

import 'package:flutter/material.dart';
import 'Custom_Dialog.dart';
import 'Tools.dart';

class sessionCard extends StatelessWidget {
  final ImageProvider image;
  final String SpeakerName;
  final String SessionTopic;
  final String SpeakerDesc;
  final String sessionDuration;
  final Widget CustomChild;
  final String session_time;

  const sessionCard(
      {this.image,
      @required this.SpeakerName,
      this.sessionDuration,
      @required this.SessionTopic,
      this.CustomChild,
      this.session_time,
      this.SpeakerDesc});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: ListTile(
        onTap: (){
          showDialog(
              context: context,
              builder: (context) {
                return CustomDialog(
                  Speaker: SpeakerName,
                  Desc: SpeakerDesc,
                  imageProvider:
                  AssetImage('Assets/Images/harsh_akshit.jpeg'),
                );
              });
        },
        isThreeLine: true,
        trailing: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "$sessionDuration \n",
            style: Theme.of(context).textTheme.title.copyWith(
                fontFamily: 'Opensans',
                fontWeight: FontWeight.bold,
                fontSize: 14.0),
            children: [
              TextSpan(
                  text: session_time,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(fontSize: 12.0, fontFamily: 'Opensans')),
            ],
          ),
        ),
        leading: CircleAvatar(
          backgroundImage: image,
          radius: 30.0,
        ),
        title: RichText(
          text: TextSpan(
            text: "$SessionTopic \n",
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(fontSize: 16.0, fontFamily: 'Opensans'),
            children: [
              TextSpan(
                text: SpeakerName,
                style: Theme.of(context).textTheme.subtitle.copyWith(
                    fontFamily: 'Opensans',
                    fontSize: 14.0,
                    color: Tools.multiColors[Random().nextInt(4)]),
                children: [],
              ),
            ],
          ),
        ),
        subtitle: Text(
          SpeakerDesc,
          style: Theme.of(context)
              .textTheme
              .caption
              .copyWith(fontSize: 10.0, fontFamily: 'Opensans'),
        ),
      ),
    );
  }
}
