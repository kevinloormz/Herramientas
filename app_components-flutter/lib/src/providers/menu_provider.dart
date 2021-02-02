import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider{
  List<dynamic> opciones = [];

  _MenuProvider(){
    //cargarData();
  }

  //Cargar data se espere a que el root bundle reponda antes de finalizar el constructor
  //Una tarea que se va a resolver en el futuro
  //utiliza en el stateless un future building
  //es decir que se contruya cuando este proceso termina

  Future <List<dynamic>> cargarData() async {
    final resp=await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(resp);
    //print(dataMap['rutas']);
    opciones=dataMap['rutas'];

    return opciones;

   }

}


final menuProvider =new _MenuProvider ();