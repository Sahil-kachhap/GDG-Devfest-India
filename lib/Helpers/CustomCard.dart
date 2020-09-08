import 'package:flutter/material.dart';

class CustomImageCard extends StatelessWidget {
  final ImageProvider imageProvider;
  CustomImageCard({
    @required this.imageProvider
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        image:
        DecorationImage(image: imageProvider),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        // color: Colors.white
      ),
    );
  }
}
