import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre='';
  String _email='';
  String _pass='';
  String _opcionSeleccionada;
  DateTime _fecha;
  List<String> _lista=['Maculino','Femenino','Otros'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Input'),
        ),
        body: ListView(
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            _crearInput(),
            Divider(),
            _crearEmail(),
            Divider(),
            _crearPass(),
            Divider(),
            _crearFecha(context),
            Divider(),
            _crearDropDown(),
            Divider(),
            _crearPersona(),

          ],
        )
    );
  }

  Widget _crearInput() {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          counter: Text(" ${_nombre.length}"),
          hintText: "Nombres y apellidos",
          labelText:"Ingrese sus datos",
          helperText: "Solo texto",
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor){
        setState(() {
          _nombre=valor;
        });

        //print(_nombre);
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre: $_nombre' ),
      subtitle: Text('Correo electronico: $_email' ),

    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text(" ${_email.length}"),
        hintText: "Email",
        labelText:"Ingrese su email",
        helperText: "Solo texto",
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (valor){
        setState(() {
          _email=valor;
        });

        //print(_nombre);
      },
    );
  }

  Widget _crearPass() {
    return TextField(
      obscureText: true,
      autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text(" ${_pass.length}"),
        hintText: "Password",
        labelText:"Ingrese su contraseña",
        helperText: "Debe ser mas de 8 caracteres",
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
      onChanged: (valor){
        setState(() {
          _pass=valor;
        });

        //print(_nombre);
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: "Fecha de nacimiento",
        labelText:"Escoger fecha",
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.perm_contact_calendar),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

   _selectDate(BuildContext context) async{
      DateTime picked= await showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(2019),
          lastDate: new DateTime(2025),
          locale: Locale('es','ES')
      );

      if (picked!=null){
         setState(() {
           _fecha=picked;
           _inputFieldDateController.text= _fecha.toString();
         });
      }


   }

   List<DropdownMenuItem<String>> getOpcionesItem(){

    List<DropdownMenuItem<String>> lista = new List();
    _lista.forEach((sexo){
      lista.add(DropdownMenuItem(
        child: Text(sexo),
        value: sexo,

      ));
    });

    return lista;

   }

  Widget _crearDropDown() {
    return Row(

      //mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Icon (Icons.select_all),
        SizedBox(width: 30.0,),
        Expanded(
          child: DropdownButton(
              value: _opcionSeleccionada,
              items: getOpcionesItem(),
              onChanged: (opt) {
                print(opt);
                setState(() {
                  _opcionSeleccionada=opt;
                });
              }
          ),
        )
      ],
    );



  }
}
