import 'package:app_components/src/pages/animated_container_page.dart';
import 'package:app_components/src/pages/card_page.dart';
import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Page'),
        actions: <Widget>[
          PopupMenuButton<int>(
            itemBuilder: (context)=>[
              PopupMenuItem(child: Text("Uno"), value: 1,),
              PopupMenuItem(child: Text("Dos"), value: 2,),

            ],
            onSelected: (value){
              print("value:$value");
              setState(() {
                if (value==1){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => CardPage() )  );
                }
                if (value==2){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => AnimatedContainerPage() )  );
                }


              });
            } ,
            icon: Icon(Icons.list),
          )
        ],
      ),
//        body: bodyWidget
    );
  }
}
