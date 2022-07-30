import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/models/Product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static Future<List<Product>> getProducts() async {
    List<Product>? list;
    int success = -1;
    String message = "";

    String url = '${GlobalParams.baseUrl}search.php?barcode=all';
    var res = await http.get(Uri.parse(url));
    var json_data = json.decode(res.body);

    if (res.statusCode == 200) {
      success = json_data["success"];
      message = json_data["message"];
    }
    if (success == 1) {
      var data = json_data["data"] as List;
      list = data.map<Product>((json) => Product.fromJson(json)).toList();
    } else {
      list = null;
    }

    return list!;
  }

  // create methode to update product that takes Product object as parameter and pass it to the request method
  static Future<bool> updateProduct(Product product) async {
    bool success = false;
    String url = '${GlobalParams.laravelApi}product/${product.id}';
    var res = await http.put(Uri.parse(url), body: {
      "ean_code": product.code,
    });
    if (res.statusCode == 200) {
      success = true;
      print("success");
    }
    return success;
  }
}
