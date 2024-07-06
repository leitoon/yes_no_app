

import 'package:flutter/material.dart';

const Color _customColor=Color(0xFFF49149F);
const List<Color> _colorThemes=[
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,

];


class AppTheme 
{
  final int selectedcolor;

  AppTheme({this.selectedcolor=0}):
  assert(selectedcolor>=0 && selectedcolor<=_colorThemes.length-1,'Colors must between 0 and ${_colorThemes.length}')
  ;

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedcolor]
    );
  }
}