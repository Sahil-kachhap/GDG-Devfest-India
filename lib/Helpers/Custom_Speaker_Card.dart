import 'package:event_app/Constant_info/Constants.dart';
import 'package:flutter/material.dart';

import 'Custom_Dialog.dart';

class CustomSpeakerCard extends StatelessWidget {
  final ImageProvider image;
  final String SpeakerName;
  final String SpeakerTopic;
  final String SpeakerDesc;
  final Widget CustomChild;
  final String session_time;

  const CustomSpeakerCard(
      {this.image,
      @required this.SpeakerName,
      @required this.SpeakerTopic,
      this.CustomChild,this.session_time,this.SpeakerDesc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30.0))
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        child: Card(
          elevation: 20.0,
          margin: EdgeInsets.all(10.0),
          child: ListTile(
            contentPadding: EdgeInsets.all(10.0),
          //  trailing: Text(session_time),
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
                      Speaker: SpeakerName,
                      Desc: SpeakerDesc,
                      imageProvider:
                          AssetImage('Assets/Images/harsh_akshit.jpeg'),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
