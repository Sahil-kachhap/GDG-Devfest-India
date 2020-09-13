import 'package:flutter/material.dart';
import 'package:event_app/Helpers/Agenda_Content.dart';
import 'package:event_app/Helpers/Custom_Scaffold.dart';

class AgendaPage extends StatefulWidget {
  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  @override
  Widget build(BuildContext context) {
    return new CustomScaffold(
      appTitle: 'Agenda',
        CustomBody: Column(
          children: [
            AgendaContent(
              title: 'Agenda 1',
              description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              image: AssetImage('images/harsh_akshit.jpeg'),
            ),
            AgendaContent(
              title: 'Agenda 2',
              description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since ',
              image: AssetImage('images/harsh_akshit.jpeg'),
            )
          ],
        ),
      CustomIcon: Icon(Icons.share),
    );
  }
}

