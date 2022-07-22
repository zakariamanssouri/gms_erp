import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gms_erp/crm/widgets/side_drawer.dart';
import 'package:gms_erp/crm/widgets/search_field.dart';
import 'package:gms_erp/crm/models/Product.dart';
import 'package:gms_erp/crm/views/Product/productItem.dart';
import 'package:gms_erp/crm/services/ProductService.dart';

import 'package:http/http.dart' as http;

class Products extends StatefulWidget {
  String url;
  Products({Key? key, required this.url}) : super(key: key);
  
  BuildContext? get context => null;
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  Widget listViewWidget(List<Product> product) {
    return Container(
      child: ListView.builder(
        itemCount: product.length,
          itemBuilder: (context, position) {
            return Card(
              child: ListTile(
                leading: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                  '${product[position].name}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black),
                ), 
                Text(
                  '${product[position].code}',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey),
                ),
                      ]),
                trailing: Text(
                        '${product[position].s_price}',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black),
                      ),
                onTap: () {
              _navigateToProductItem(context, product[position]);
            }
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Produits"),
      ),
      body: 
          FutureBuilder(
          future: ProductService.getProducts(widget.url, context),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? listViewWidget(snapshot.data as List<Product>)
                : Center(child: CircularProgressIndicator());
          }),
        drawer: SideDrawer(),
    );
  }

  void _navigateToProductItem(BuildContext context, Product product) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductItem(product: product)));
  }
}
