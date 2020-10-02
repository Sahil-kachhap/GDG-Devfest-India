import 'dart:math';

import 'package:flutter/material.dart';
import 'Tools.dart';

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
      this.CustomChild,
      this.session_time,
      this.SpeakerDesc});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints.expand(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              child: Image(image: image),
            ),
            SizedBox(width: 20),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      SpeakerName,
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontFamily: 'Opensans'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: MediaQuery.of(context).size.height * 0.2,
                      height: 5,
                      color: Tools.multiColors[Random().nextInt(4)],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  SpeakerDesc,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(fontFamily: 'OpenSans'),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  session_time,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontFamily: 'Opensans'),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
