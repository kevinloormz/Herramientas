import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CamaraPage extends StatefulWidget {

  @override
  _CamaraPageState createState() => _CamaraPageState();
}

class _CamaraPageState extends State<CamaraPage> {

File _image;


  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Camaras'),
        ),
        body: Center(
          child: _image==null? Text("No hay imagen"): Image.file(_image)

          ),
         floatingActionButton: FloatingActionButton(
           onPressed: getImage,
           tooltip: 'Subir',
           child: Icon(Icons.camera_alt),
         ),
    );
  }
}
