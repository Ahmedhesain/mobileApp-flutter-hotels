// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

abstract class AppColors {
  static get primary => appHallsRedDark;
  static const white = Color(0xfff8f9fa);
  static const black = Color(0xff6c757d);
  static const grey = Color(0xffababab);
  static const restaurantSecondColor = Color(0xfff7f7f7) ;
  static const restaurantThirdColor = Color(0xffd5ae0b) ;
  static const appBlue = Color(0xff0077a2);
  static const appGreyLight = Color(0xFFededed);
  static const appGreyDark = Color(0xFFdedede);
  static const appHallsRedLight = Color(0xFFF4DFDC);
  static const appHallsRed = Color(0xFFDD8378);
  static const appHallsRedDark = Color(0xFFeb344b);
  static const colorBar = Color(0xFFeb344b);
  static const colorLogo = Color(0xFF191d3a);
  static const appRedLight = Color(0x7ff1e0e0);

  static Color get fieldBorderColor => grey;
  static Color get backgroundColor => white;
  static Color get textFieldLabelColor => black;
  static Color get textFieldHintColor => grey;
  // static Color get text => AppTheme.isDark ? white : black;

  static Map<int, Color> getMaterialColor(Color color){
    return {
      50:Color.fromRGBO(color.red,color.green,color.blue, .1),
      100:Color.fromRGBO(color.red,color.green,color.blue, .2),
      200:Color.fromRGBO(color.red,color.green,color.blue, .3),
      300:Color.fromRGBO(color.red,color.green,color.blue, .4),
      400:Color.fromRGBO(color.red,color.green,color.blue, .5),
      500:Color.fromRGBO(color.red,color.green,color.blue, .6),
      600:Color.fromRGBO(color.red,color.green,color.blue, .7),
      700:Color.fromRGBO(color.red,color.green,color.blue, .8),
      800:Color.fromRGBO(color.red,color.green,color.blue, .9),
      900:Color.fromRGBO(color.red,color.green,color.blue, 1),
    };
  }

}

