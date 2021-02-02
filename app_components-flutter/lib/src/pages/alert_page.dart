

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Alertas'),
        ),
       body: Center(
         child: RaisedButton(
           color: Colors.blue,
           textColor: Colors.white,
           shape: StadiumBorder(),
           child: Text("Mostrar Alerta"),
           onPressed: ()=>_mostrarAlerta(context),

         ),
       )
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('title'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('dialogBody'),
              FlutterLogo(size: 50.0,)
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Salir'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }
}
