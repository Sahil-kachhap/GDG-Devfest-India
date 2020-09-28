import 'dart:convert';

import 'package:event_app/Helpers/Custom_Scaffold.dart';
import 'package:event_app/Helpers/Expandable_Cards.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appTitle: ' FAQ',
      popButton: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
        setState(() {
          Navigator.of(context).pushNamedAndRemoveUntil('/home', ModalRoute.withName('/home'));
        });
      }),
      customIcon: Icon(Icons.share),
      customBody: FutureBuilder(
       future: DefaultAssetBundle.of(context).loadString('Assets/JSON/FAQ.json'),
        builder: (context,snapshot){
         var FaqData= json.decode(snapshot.data.toString());
         return ListView.builder(
           itemCount: 8,
           itemBuilder: (context,index){
             return ExpandableCards(
               answer: FaqData[index]['answer'],
               question: FaqData[index]['question'],
             );
           },
         );
        },
      )
    );
  }
}
