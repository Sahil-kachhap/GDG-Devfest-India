import 'dart:math';

import 'package:event_app/UI_Components/Session_Cards.dart';
import 'package:flutter/material.dart';
import 'Custom_Speaker_Card.dart';
import 'Tools.dart';

class SessionContent extends StatelessWidget {
  final ImageProvider image;
  final String description;
  final String Duration;
  final String title;
  final String sessionSpeaker;
  final String sessionDesc;
  final String sessionTime;

  const SessionContent(
      {this.sessionSpeaker,
      this.Duration,
      this.image,
      this.title,
      this.description,
      this.sessionDesc,
      this.sessionTime});

  @override
  Widget build(BuildContext context) {
    return sessionCard(
      SpeakerName: sessionSpeaker,
      SessionTopic: title,
      image: image,
      SpeakerDesc: description,
      sessionDuration: Duration,
      session_time: sessionTime,
    );
  }
}
