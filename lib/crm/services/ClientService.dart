import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gms_erp/crm/models/Client.dart';
import 'package:http/http.dart' as http;

class ClientService {
  
  static Future<List<Client>> getClients(String url, BuildContext? context) async {
    List<Client>? list;
    int success=-1;
    String message="";

    url = 'http://144.91.76.98:84/AndroidDB/search_client.php?barcode=all';
    var res = await http.get(Uri.parse(url));
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
      final scaffold = ScaffoldMessenger.of(context!);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
    }

    return list!;
  }
}