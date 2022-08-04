// ignore_for_file: non_constant_identifier_names, prefer_const_declarations, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';

class GlobalParams {
// api
  static var baseUrl = '';
  //static final baseUrl = 'http://144.91.76.98:84/gm-erp/';

  // laravel api
  static final laravelApi = "http://144.91.76.98:84/gm-erp/public/api/";
// for screens
  static const MainColor = Colors.blue;
  static final SecondaryColor = Color(0xFF3E30BC);
  static final backgroundColor = Color(0xffEDEDED);
  static final double MainPadding = 20;

  static final List<Map<String, dynamic>> menus = [
    {
      "title": "Acceuil",
      "icon": Icon(
        Icons.home,
        color: Colors.blue,
      ),
      "route": "/home"
    },
    {
      "title": "Produits",
      // ignore: prefer_const_constructors
      "icon": Icon(
        Icons.grid_view_rounded,
        color: Colors.blue,
      ),
      "route": "/products"
    },
    {
      "title": "Stock",
      // ignore: prefer_const_constructors
      "icon": Icon(
        Icons.warehouse_rounded,
        color: Colors.blue,
      ),
      "route": "/stock"
    },
    {
      "title": "Inventaires",
      // ignore: prefer_const_constructors
      "icon": Icon(
        Icons.inventory,
        color: Colors.blue,
      ),
      "route": "/inventories"
    },
  ];

  // inventory details card header gradient colors
  static final List<Color> inventoryDetailsCardHeaderGradientColors = [
    Colors.blue,
    Colors.blue,
  ];

  static final String key_domain = "domainame";
  static final String key_domains = "domainames";
  static String key_token = "token";
  static const itemCardTextColor = Colors.white;

  // font sizes
  static const double MainfontSize = 15;
  static const MainfontFamily = "Open Sans";
}
