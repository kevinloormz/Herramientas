import 'dart:async';

import 'package:flutter/material.dart';

class ListViewBuilderPage extends StatefulWidget {
  @override
  _ListViewBuilderPageState createState() => _ListViewBuilderPageState();
}

class _ListViewBuilderPageState extends State<ListViewBuilderPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  //llamar primero cuando el stafull entra en accion para llenar la lista
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _agregarUltimos10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_agregarUltimos10();
        fetchData();
      }
    });
  }

  //vaciar controller cuando se cierra la pagina
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListViewBuilder'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      ),

      //
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _refreshList,
      child: ListView.builder(
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
            placeholder: AssetImage('assets/original.gif'),
            image: NetworkImage('https://picsum.photos/500/300?random=$imagen'),
          );
        },
        itemCount: _listaNumeros.length,
      ),
    );
  }

  void _agregarUltimos10() {
    for (var i = 0; i < 5; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 3);
    return new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;
    _agregarUltimos10();
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(microseconds: 250),
      curve: Curves.fastOutSlowIn,
    );
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
      );
    } else {
      return Container();
    }
  }

  Future<Null>_refreshList() async{

    final duration = new Duration(seconds: 1);
    new Timer(duration, (){
      _listaNumeros.clear();
      _ultimoItem++; //quiero nuevas las siguientes imagenes
      _agregarUltimos10();
    });

    return Future.delayed(duration);


  }
}
