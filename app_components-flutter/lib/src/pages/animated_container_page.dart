import 'dart:math';

import 'package:flutter/material.dart';


class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width =50.0;
  double _height= 50.0;
  Color _color= Colors.blue;

  BorderRadiusGeometry _borderRadius= BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animated'),
        ),
        body: Center(
          child: AnimatedContainer(
            duration:  Duration(seconds: 1 ),
            curve: Curves.bounceIn,
            width: _width,
            height: _height,
            decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: _cambiarEstado,
                child: Icon(Icons.play_arrow),

        ),
    );
  }
//no regresa nada es un void
   void _cambiarEstado() {
    final random= Random();
    setState(() {
      _height=random.nextInt(300).toDouble();
      _width=random.nextInt(300).toDouble();
      _color=Color.fromRGBO(
          random.nextInt(255),
          random.nextInt(255),
          random.nextInt(255),
          1);
      _borderRadius=BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }


   }

