import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gms_erp/crm/models/Product.dart';
import 'package:http/http.dart' as http;

import '../../config/global_params.dart';

class ProductService {

  static Future<List<Product>> getProducts(String url, BuildContext? context) async {
    List<Product>? list;
    int success=-1;
    String message="";

    var res = await http.get(Uri.parse(GlobalParams.baseUrl + 'produit_add.php'));
    var json_data = json.decode(res.body);

    if (res.statusCode == 200) {
      success = json_data["success"];
      message = json_data["message"];
    }
    if(success == 1){
      var data = json_data["data"] as List;
      list = data.map<Product>((json) => Product.fromJson(json)).toList();
    }
    else{
      list = null;
    }

    return list!;
  }

  static Future<dynamic> addProduct(Product product) async {
    var map = new Map<String, dynamic>();
    
    map['no'] = product.no;
    map['name'] = product.name;
    map['p_price'] = product.p_price;
    map['s_price'] = product.s_price;
    map['stock'] = product.stock_min;
    map['code'] = product.code;
    map['measure_id'] = product.measure_id;
    map['pack_id'] = product.packtype_id;
    map['g_id'] = product.grp_id;
    map['type_id'] = product.type_id;
    map['s_id'] = product.state_id;
    map['booking_g_id'] = product.vat_id;

    final response = await http.post(
      Uri.parse(GlobalParams.baseUrl + 'produit_add.php'),
      body: map,
    );

    final parsed = json.decode(response.body);
    if (parsed['success'] == 1) {
      return true;
    } else
      return false;
  }
}