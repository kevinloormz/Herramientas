import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CardPage'),
        ),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            _cardTipo1(),
            SizedBox(height: 30.0,),
            _cardTipo2(),
            SizedBox(height: 30.0,),
            _cardTipo2(),
            SizedBox(height: 30.0,),
            _cardTipo2(),
            SizedBox(height: 30.0,),
            _cardTipo2(),
          ],
        ));
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text("Persona 1"),
            leading: Icon(Icons.photo_album),
            subtitle: Text(
                "Aqui estamos con la descripcion de la tarjeta que se desea mostrar"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: null, child: Text("Ok")),
              FlatButton(onPressed: null, child: Text("Cancelar")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
              placeholder: AssetImage('assets/original.gif'),
              fadeInDuration: Duration(milliseconds: 300),
              height: 250.0,
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://cdn.cnn.com/cnnnext/dam/assets/190517091026-07-unusual-landscapes-travel.jpg')),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text("Esto es una imagen desde la web")),
        ],
      ),
    );

    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 10.0)),
        ],
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white
      ),
    );
  }
}
