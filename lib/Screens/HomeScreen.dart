import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:event_app/Constant_info/Constants.dart';
import 'package:event_app/Helpers/CustomCard.dart';
import 'package:event_app/Helpers/Custom_Scaffold.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return new CustomScaffold(
      appTitle: 'Home',
      CustomBody: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: new CustomImageCard(
                imageProvider: AssetImage('Assets/Images/dev_fest.jpg'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                Devfest.WelcomeDesc,
                style: Theme.of(context).textTheme.headline,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                Devfest.Description,
                style: Theme.of(context).textTheme.body2,
                textAlign: TextAlign.center,
              ),
            ),
            RaisedButton(
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                color: Color(0xff3e5df5),
                onPressed: () {}),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(FontAwesomeIcons.twitter),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.instagram),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.youtube),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 9.0),
              child: InkWell(
                onTap: (){},
                  child: TypewriterAnimatedTextKit(
                    onTap: (){},
                    totalRepeatCount: 1,
                    speed: Duration(milliseconds: 250),
                text: [
                  "#DevFestIndia",
                ],
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold
                    ),
              )),
            ),
          ],
        ),
      ),
      CustomIcon: Icon(Icons.share),
    );
  }
}
