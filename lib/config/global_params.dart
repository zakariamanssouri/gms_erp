// ignore_for_file: non_constant_identifier_names, prefer_const_declarations, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';

class GlobalParams {
// api
  static var baseUrl = '';
  //static final baseUrl = 'http://144.91.76.98:84/gm-erp/';
// for screens
  static const MainColor = Colors.blue;
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
      "title": "Products",
      // ignore: prefer_const_constructors
      "icon": Icon(
        Icons.dashboard,
        color: Colors.blue,
      ),
      "route": "/products"
    },
  ];

  // inventory details card header gradient colors
  static final List<Color> inventoryDetailsCardHeaderGradientColors = [
    Colors.blue,
    Colors.blue,
  ];
  static final String key_domain = "domainame";

  static const itemCardTextColor = Colors.white;

  // font sizes
  static final double MainfontSize = 15;
}
