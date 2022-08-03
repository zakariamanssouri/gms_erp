import 'dart:convert';

import 'package:gms_erp/crm/models/CustomerDelivery.dart';
import 'package:http/http.dart' as http;

import 'package:gms_erp/config/global_params.dart';

class CustomerDeliveryService {
  
  static Future<List<CustomerDelivery>> getCustomerDeliveries() async {
    List<CustomerDelivery>? list;

    var res = await http.get(Uri.parse(GlobalParams.baseUrl + 'customer-delivery'));
    var json_data = json.decode(res.body);

    if (res.statusCode == 200) {
      var data = json_data as List;
      list = data.map<CustomerDelivery>((json) => CustomerDelivery.fromJson(json)).toList();
    }
    else{
      list = null;
    }

    return list!;
  }

}