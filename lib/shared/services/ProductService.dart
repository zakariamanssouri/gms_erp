import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/models/Product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static Future<List<Product>> getProducts() async {
    final response =
        await http.get(Uri.parse(GlobalParams.laravelApi + 'product'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return parsed.map<Product>((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
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
