import 'package:flutter/material.dart';

final _icon =<String, IconData> {
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open' : Icons.folder_open,
  'donut_large' : Icons.donut_large,
  'input' : Icons.input,
  'tune' : Icons.tune,
  'list' :Icons.list,
  'location_on' :Icons.location_on,
  'radio_button_checked' :Icons.radio_button_checked,
  'camera_alt' :Icons.camera_alt,

};


Icon getIcon (String nombreIcono)
{
  return Icon( _icon[nombreIcono], color: Colors.blueGrey, );
}