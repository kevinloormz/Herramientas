import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorPage extends StatefulWidget {
  @override
  _GeolocatorPageState createState() => _GeolocatorPageState();
}

class _GeolocatorPageState extends State<GeolocatorPage> {
  final Geolocator _geolocator = Geolocator()..forceAndroidLocationManager;
  Position _actualPosition;
  String _actualDireccion;
  String _lugares;
  Position _latLonLugares;
  //Position _lonLugares;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Geolocator'),
        ),
        body: bodyWidget());
  }

  Widget bodyWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          //lAtitude y longitud en base a un lugar string
          if ( _latLonLugares!=null ) Text("lugar:+ ${_latLonLugares.latitude}, ${_latLonLugares.longitude}  "),

          SizedBox(height: 30.0,),
          //Direccion, codigo postal y pais string
          if ( _actualPosition!=null ) Text("Direccion:"+_actualDireccion),

          SizedBox(height: 30.0,),
          //Ubicacion actual en longitud y latitudd
          if ( _actualPosition!=null ) Text("Ubicacion actual:+${_actualPosition.latitude}, ${_actualPosition.longitude}"),

          SizedBox(height: 30.0,),
          FlatButton(color: Colors.blue,
            textColor: Colors.white,
            child: Text("Get location "),
            onPressed: () {
              _obtenerUbicacion();
            },
          )
        ],
      ),
    );
  }

  _obtenerUbicacion() {
    _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position _position) {
      setState(() {
        _actualPosition = _position;
      });

      _obtenerDireccion();
    }).catchError((e) {
      print(e);
    });
  }

  _obtenerDireccion() async {
    try {
      List<Placemark> _p = await _geolocator.placemarkFromCoordinates(
          _actualPosition.latitude, _actualPosition.longitude);

      Placemark _place = _p[0];

      setState(() {
        _actualDireccion="${_place.locality},${_place.postalCode},${_place.country}";
        _lugares=_place.locality;
      });

      _obtenerLatLonLugares();

    } catch (e) {
      print(e);
    }
  }


  _obtenerLatLonLugares() async {

    try {
      //List<Placemark> _p = await _geolocator.placemarkFromAddress(_lugares);
      List<Placemark> _p = await _geolocator.placemarkFromAddress("Urdesa , Guayaquil");

      Placemark _place = _p[0];

      setState(() {
        //_actualDireccion="${_place.locality},${_place.postalCode},${_place.country}";
        _latLonLugares=_place.position;
      });

      //_obtenerLatLonLugares();

    } catch (e) {
      print(e);
    }


  }


}
