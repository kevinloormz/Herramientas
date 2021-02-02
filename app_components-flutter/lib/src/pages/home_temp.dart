


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePageTemp extends StatelessWidget {

  final opciones = ["uno","dos","tres","cuatro","cinco","seis","siete","ocho","nueve"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('appbarTitle'),
        ),
        body: ListView(
          children: _crearListaCorta()
        ),
    );
  }


  List<Widget> _crearItem()
  {
    List<Widget> lista= new List<Widget>();

    for (String opt in opciones){
      final tempWidget = ListTile(
        title: Text(opt),
      ) ;
      lista..add(tempWidget)
           ..add(Divider());
    }


    return lista;

  }


  List<Widget> _crearListaCorta(){

    var widgets=opciones.map(( item ){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text( item + "!!!"),
            subtitle: Text("Cualquier cosa"),
            leading: Icon(Icons.account_box),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();

    return widgets;

  }



}
