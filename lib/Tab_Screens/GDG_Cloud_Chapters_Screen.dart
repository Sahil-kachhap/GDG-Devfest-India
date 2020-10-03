import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GDGCloudChapterCards extends StatelessWidget {
  var mydata;

  GDGCloudChapterCards({
    @required this.mydata,
  });


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 11,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.23,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 3, right: 3, top: 5, bottom: 0),
                child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(10)),
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                 /*TODO: Uncomment the below code
                 CachedNetworkImage(
                    imageUrl: mydata[1][index]['image_link'],
                      placeholder: (context,url)=>Image(image: AssetImage('Assets/Images/gdgc_jaipur.png')),
                      errorWidget: (context,url,error)=>Icon(Icons.error),
                      fit: BoxFit.cover,
                      color: Colors.black54,
                      colorBlendMode: BlendMode.darken,
                    ),*/
                        Image(
                          image: AssetImage(
                              mydata[1][index]['image']),
                          fit: BoxFit.cover,
                          color: Colors.black54,
                          colorBlendMode: BlendMode.darken,
                        ),//TODO: Comment this line if cached_network_image works fine
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, bottom: 25),
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                mydata[1][index]['name'],
                                style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    color: Colors.white,
                                    fontSize: 22.0,
                                    fontWeight:
                                    FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons
                                            .facebookF,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {}),
                                  IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons
                                            .linkedin,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {}),
                                  IconButton(
                                      icon: Icon(
                                          FontAwesomeIcons
                                              .twitter,
                                          color: Colors.white),
                                      onPressed: () {}),
                                  IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.meetup,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {}),
                                  IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons
                                            .instagram,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {})
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          );
        });
  }
}
