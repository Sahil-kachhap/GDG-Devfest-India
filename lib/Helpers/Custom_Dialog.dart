import 'dart:ui';
import 'package:event_app/Constant_info/Constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDialog extends StatelessWidget {
  final String Speaker;
  final String Desc;
  final ImageProvider imageProvider;

  CustomDialog({this.Speaker, this.Desc, this.imageProvider});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: SafeArea(
        child: Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Stack(
            overflow: Overflow.visible,
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 150,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        Speaker,
                        style: Theme.of(context).textTheme.title.copyWith(
                            fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          Desc,
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(fontFamily: 'OpenSans',fontWeight: FontWeight.bold),
                        ),
                      ),
                    /*  Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                                icon: Icon(FontAwesomeIcons.linkedin),
                                onPressed: () {}),
                            IconButton(
                                icon: Icon(FontAwesomeIcons.instagram),
                                onPressed: () {}),
                            IconButton(
                                icon: Icon(FontAwesomeIcons.twitter),
                                onPressed: () {}),
                          ],
                        ),
                      ),*/
                    SizedBox(
                      height: 60.0,
                    ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          child: Icon(FontAwesomeIcons.video),
                          onPressed: (){},),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -50,
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: imageProvider,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
