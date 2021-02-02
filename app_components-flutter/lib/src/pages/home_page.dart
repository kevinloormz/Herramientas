import 'package:app_components/src/pages/alert_page.dart';
import 'package:app_components/src/providers/menu_provider.dart';
import 'package:app_components/src/utils/icono_string_util.dart';


import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Componentes'),
        ),
        body: _lista()
    );
  }

  Widget _lista() {

    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: [], //nunca va a estar null
        //builder se va a disparar en tres escenarios
        //pidiendo data
        //se obtuvo la data
        //sucedio un error
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
          //print('builder');
          //print(snapshot.data);
          return ListView(
            children:  _listaItem(snapshot.data, context),
          );
        },
    );

  }

  List<Widget> _listaItem(List<dynamic> data, BuildContext context) {

    var widget=data.map((opt){
      return ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: (){

          Navigator.pushNamed(context, opt['ruta']);

//          final route = MaterialPageRoute(
//              builder: (context){
//                return AlertPage();
//              }
//
//          );
//         Navigator.push(context, route);

        },
      );
    }).toList();

   return widget;

  }


}
