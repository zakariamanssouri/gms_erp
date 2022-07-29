import 'dart:convert';

import 'package:gms_erp/crm/models/Client.dart';
import 'package:http/http.dart' as http;

import 'package:gms_erp/config/global_params.dart';

class ClientService {
  
  static Future<List<Client>> getClients() async {
    List<Client>? list;

    var res = await http.get(Uri.parse(GlobalParams.baseUrl + 'search_client.php?barcode=all'));
    var json_data = json.decode(res.body);

    if (res.statusCode == 200) {
      if(json_data["success"] == 1){
      var data = json_data["data"] as List;
      list = data.map<Client>((json) => Client.fromJson(json)).toList();
    }
    }
    else{
      list = null;
    }

    return list!;
  }

  static Future<Client?> addClient(Client client) async {
    var map = new Map<String, dynamic>();
    map['no'] = client.no;
    map['currency_id'] =  2.toString();
    map['customer_model_id'] =  3.toString();
    map['delivery_type_id'] =  1.toString();
    map['salutation_id'] =  3.toString();
    map['address_pool_id'] =  15707.toString();
    map['name'] = client.name;
    map['customer_type_id'] = client.type_id;
    map['customer_group_id'] = client.grp_id;
    map['customer_state_id'] = client.state_id;
    map['phone'] = client.phone;
    map['vat_booking_group_id'] = client.vat_id;

    final response = await http.post(
      Uri.parse(GlobalParams.baseUrl + 'client_add.php'/*'customer'*/),
      body: map,
    );

    final parsed = json.decode(response.body);
    print(parsed['success']);
    print(parsed['message']);
    //print(parsed);
    if (response.statusCode == 200) {
      /*clientAdded = true;
      return parsed;*/
      if(parsed['success'] == 1)
        return client;
    }
    else
      return null;
  }
}