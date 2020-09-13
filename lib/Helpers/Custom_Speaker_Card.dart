import 'package:event_app/Constant_info/Constants.dart';
import 'package:flutter/material.dart';

import 'Custom_Dialog.dart';

class CustomSpeakerCard extends StatelessWidget {
  final ImageProvider image;
  final String SpeakerName;
  final String SpeakerTopic;

  const CustomSpeakerCard(
      {@required this.image,@required this.SpeakerName,@required this.SpeakerTopic});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Card(
        margin: EdgeInsets.all(10.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage: image,
          ),
          title: Text(SpeakerName),
          subtitle: Text(SpeakerTopic),
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return new CustomDialog(
                    Speaker: 'Harsh Akshit',
                    Desc: Devfest.HarshAkshit,
                    imageProvider: AssetImage('Assets/Images/harsh_akshit.jpeg'),
                  );
                });
          },
        ),
      ),
    );
  }
}
