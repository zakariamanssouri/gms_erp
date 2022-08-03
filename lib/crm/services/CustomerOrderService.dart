import 'dart:convert';

import 'package:gms_erp/crm/models/CustomerOrder.dart';
import 'package:http/http.dart' as http;

import 'package:gms_erp/config/global_params.dart';

class CustomerOrderService {
  
  static Future<List<CustomerOrder>> getCustomerOrders() async {
    List<CustomerOrder>? list;

    var res = await http.get(Uri.parse(GlobalParams.baseUrl + 'customer-order'));
    var json_data = json.decode(res.body);

    if (res.statusCode == 200) {
      var data = json_data as List;
      list = data.map<CustomerOrder>((json) => CustomerOrder.fromJson(json)).toList();
    }
    else{
      list = null;
    }

    return list!;
  }

}