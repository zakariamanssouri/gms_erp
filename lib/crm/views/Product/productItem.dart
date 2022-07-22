import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gms_erp/crm/models/Product.dart';
import 'package:http/http.dart' as http;

class ProductItem extends StatelessWidget {
  Product product;
  ProductItem({Key? key, required this.product}) : super(key: key);
  
  BuildContext? get context => null;

  
  Widget productItemList() {
    return ListView(
      children: <Widget>[
        Card(child: ListTile(
          minLeadingWidth: 60,
          leading: Text('Numéro', style: const TextStyle(fontWeight: FontWeight.bold)),
          title: Text(product.getNo),
        )),
        Card(child: ListTile(
          minLeadingWidth: 60,
          leading: Text('Nom', style: const TextStyle(fontWeight: FontWeight.bold)),
          title: Text(product.getName),
        )),
        Card(child: ListTile(
          minLeadingWidth: 60,
          leading: Text('Code Bar', style: const TextStyle(fontWeight: FontWeight.bold)),
          title: Text(product.getCode),
        )),
        Card(child: ListTile(
          minLeadingWidth: 60,
          leading: Text('Stock Min', style: const TextStyle(fontWeight: FontWeight.bold)),
          title: Text(product.getStock_min),
        )),
        Card(child: ListTile(
          minLeadingWidth: 60,
          leading: Text('Prix', style: const TextStyle(fontWeight: FontWeight.bold)),
          title: Text(product.getS_price),
        )),
        Card(child: ListTile(
          minLeadingWidth: 60,
          leading: Text('Prix Min', style: const TextStyle(fontWeight: FontWeight.bold)),
          title: Text(product.getS_price_min),
        )),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Prouit"),
      ),
      body: productItemList(),
    );
  }
}