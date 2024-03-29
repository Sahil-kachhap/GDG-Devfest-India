import 'package:flutter/material.dart';

class ExpandableCards extends StatefulWidget {
  final String question;
  final String answer;

  const ExpandableCards({Key key, this.question, this.answer})
      : super(key: key);
  @override
  _ExpandableCardsState createState() => _ExpandableCardsState();
}

class _ExpandableCardsState extends State<ExpandableCards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 12.0,
        child: ExpansionTile(
          title: Text(
            widget.question,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontFamily: 'Opensans',fontWeight: FontWeight.bold,
              letterSpacing: 1.0,),
          ),

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                widget.answer,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontFamily: 'Opensans',letterSpacing: 1.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
