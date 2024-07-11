import 'package:flutter/material.dart';

class ScreenDimensions {
  static double screenHeight (BuildContext context) => MediaQuery.of(context).size.height;
  static double screenWidth (BuildContext context) => MediaQuery.of(context).size.width;
  static Size widgetSize (BuildContext context) => MediaQuery.of(context).size;

}