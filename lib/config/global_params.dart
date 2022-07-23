import 'dart:ui';

import 'package:flutter/material.dart';

class GlobalParams {
// api
  static final baseUrl = 'http://144.91.76.98:84/AndroidDB/';
// for screens
  static final MainColor = Color(0xFFCDDEEC);
  static final SecondaryColor = Color(0xFF3E30BC);
  static final backgroundColor = Color(0xffEDEDED);
  static final double MainPadding = 20;

  static final List<Map<String, dynamic>> menus = [
    
    {
      "title": "Home",
      "icon": Icon(
        Icons.dashboard,
        color: Colors.blue,
      ),
      "route": "/home"
    },

    {
      "title": "Inventaires",
      "icon": Icon(
        Icons.dashboard,
        color: Colors.blue,
      ),
      "route": "/inventory"
    },
    
  ];

  // inventory details card header gradient colors
  static final List<Color> inventoryDetailsCardHeaderGradientColors = [
    Colors.blue,
    Colors.blue,
  ];
}
