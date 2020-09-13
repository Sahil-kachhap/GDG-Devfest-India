import 'package:flutter/material.dart';
import 'dart:ui';

class AgendaContent extends StatelessWidget {

  final ImageProvider image;
  final String description;
  final String title;

  const AgendaContent({this.image,this.description,this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
          margin: EdgeInsets.all(10.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 40.0,
                backgroundImage: image,
              ),
              title: Text(title),
              subtitle: Text(description),
            ),
        ),
    );
  }
}
