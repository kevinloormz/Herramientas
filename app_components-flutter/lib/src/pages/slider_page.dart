import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 100.0;
  bool _bloquearCheck = false;
  bool _bloquearSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Slider'),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 70.0),
          child: Column(
            children: <Widget>[
              _crearSlider(),
              _crearCheck(),
              _crearSwitch(),
              Expanded(child: _crearImage()),

            ],
          ),
        ));
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: "Tamaño",
      //divisions: 20,
      value: _valueSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearCheck||_bloquearSwitch)?null:(valor) {
        print(valor);
        setState(() {
          _valueSlider = valor;
        });
      },
    );
  }

  Widget _crearImage() {
    return Image(
      image: NetworkImage(
          'https://img1.freepng.es/20180514/gje/kisspng-batman-arkham-knight-superman-robin-5af9bbdfb76e48.1069924515263159997513.jpg'),
      width: _valueSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheck() {
    return CheckboxListTile(
      title: Text("Bloquear Slider"),
      activeColor: Colors.amber,
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck=valor;
        });

      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text("Bloquear Slider"),
      activeColor: Colors.amber,
      value: _bloquearSwitch,
      onChanged: (valor) {
        setState(() {
          _bloquearSwitch=valor;
        });

      },
    );

  }


}
