

import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeInImage(
            placeholder: AssetImage('assets/original.gif'),
            image: NetworkImage('https://img.discogs.com/nbsEfNGi0kQ_yYbthNXV2Dhia9M=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-10415816-1496976987-4435.jpeg.jpg'),
            fadeInDuration: Duration(milliseconds: 300),
        ),
      ),

      appBar: AppBar(
        title: Text('Avatars'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text("JJ"),
              backgroundColor: Colors.white,

            ),
          ),

        ],

      ),
       // body: bodyWidget
    );
  }
}
