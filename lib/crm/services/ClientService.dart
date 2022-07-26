import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gms_erp/crm/models/Client.dart';
import 'package:http/http.dart' as http;

import 'package:gms_erp/config/global_params.dart';

class ClientService {
  
  static Future<List<Client>> getClients() async {
    List<Client>? list;
    int success=-1;
    String message="";

    var res = await http.get(Uri.parse(GlobalParams.baseUrl + 'search_client.php?barcode=all'));
    var json_data = json.decode(res.body);

    if (res.statusCode == 200) {
      success = json_data["success"];
      message = json_data["message"];
    }
    if(success == 1){
      var data = json_data["data"] as List;
      list = data.map<Client>((json) => Client.fromJson(json)).toList();
    }
    else{
      list = null;
    }

    return list!;
  }
}