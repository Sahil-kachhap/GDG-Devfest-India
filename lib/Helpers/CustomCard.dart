import 'package:flutter/material.dart';

class CustomImageCard extends StatelessWidget {
  final ImageProvider imageProvider;
 const CustomImageCard({Key key ,@required this.imageProvider}):super(key:key) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        image:
        DecorationImage(image: imageProvider),
        borderRadius: BorderRadius.all(Radius.circular(17.0)),
          color: Colors.white
      ),
    );
  }
}
