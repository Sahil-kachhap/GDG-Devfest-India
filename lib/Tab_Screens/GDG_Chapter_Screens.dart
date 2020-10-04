import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class GDGChapterCards extends StatelessWidget {
  var mydata;

  GDGChapterCards({
    @required this.mydata,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> _launchURL(String Url) async {
      if (await canLaunch(Url)) {
        await launch(Url);
      } else {
        throw 'Cannot reach $Url, Check your Internet Connection';
      }
    }

    return ListView.builder(
        itemCount: 39,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.23,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 3, right: 3, top: 5, bottom: 0),
                child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        /*TODO: Uncomment the following lines
                        CachedNetworkImage(
                          imageUrl: mydata[0][index]['image_link'],
                          placeholder: (context,url)=>Image(image: AssetImage('Assets/Images/gdg_bhilai.png')),
                          errorWidget: (context,url,error)=>Icon(Icons.error),
                          fit: BoxFit.cover,
                          color: Colors.black54,
                          colorBlendMode: BlendMode.darken,
                        ),*/
                        Image.network(
                          mydata[0][index]['image_link'],
                          fit: BoxFit.cover,
                          color: Colors.black54,
                          colorBlendMode: BlendMode.darken,
                        ),
                        /*  Image(
                          image: AssetImage(mydata[0][index]['image']),
                          fit: BoxFit.cover,
                          color: Colors.black54,
                          colorBlendMode: BlendMode.darken,
                        ),*/ //TODO: Remove or comment out this image widget if cached_network_image works fine.
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 12.0, bottom: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                mydata[0][index]['name'],
                                style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    color: Colors.white,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(
                                        Icons.open_in_browser,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        _launchURL(mydata[0][index]['gdg']);
                                      }),
                                  IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.linkedin,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        _launchURL(
                                            mydata[0][index]['linkedin']);
                                      }),
                                  IconButton(
                                      icon: Icon(FontAwesomeIcons.twitter,
                                          color: Colors.white),
                                      onPressed: () {
                                        _launchURL(mydata[0][index]['twitter']);
                                      }),
                                  IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.meetup,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        _launchURL(mydata[0][index]['meetup']);
                                      }),
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
