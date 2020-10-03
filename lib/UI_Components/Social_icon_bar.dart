import 'package:event_app/Constant_info/Constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Social_Icon_Horizontal_Bar extends StatelessWidget {
  const Social_Icon_Horizontal_Bar({
    Key key,
  }) : super(key: key);

 Future<void> _launchURL(String Url) async {
    if (await canLaunch(Url)) {
      await launch(Url);
    } else {
      throw 'Cannot reach $Url, Check your Internet Connection';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
            icon: Icon(FontAwesomeIcons.twitter),
            onPressed: () {
               _launchURL(Devfest.Devfest_twitter_Url);
            }),
        SizedBox(
          width: 10,
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.instagram),
          onPressed: () {
             _launchURL(Devfest.Devfest_Insta_Url);
          },
        ),
        SizedBox(
          width: 10,
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.youtube),
          onPressed: () {
              _launchURL(Devfest.Devfest_youtube_Url);
          },
        ),
        SizedBox(
          width: 10,
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.chrome),
          onPressed: () {
            _launchURL(Devfest.Devfest_website_Url);
          },
        )
      ],
    );
  }
}
