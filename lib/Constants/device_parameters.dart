import 'package:flutter/material.dart';

class Device {
  static double _height;
  static double _width;

  static void setDeviceHeightWidth(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
  }

  static double get height => _height;
  static double get width => _width;
}
