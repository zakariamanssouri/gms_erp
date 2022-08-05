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
  static Future<bool> addCustomerOrder(CustomerOrder order) async {

    print(1);
    try{
      var body = json.encode(order.toJson());
      final response = await http.post(
        Uri.parse(GlobalParams.baseUrl + 'customer-order'),
        body: body,
        headers: {'content-type': 'application/json'},
        encoding: Encoding.getByName("utf-8")
      );

      final parsed = json.decode(response.body);
      if (response.statusCode == 201) {
        if(parsed["id"] != null){
          return true;
        }
      }
      }on Exception catch (_, ex){
        print(_);
      }
      return false;

  }

  static Future<bool> updateCustomerOrder(CustomerOrder order) async {
    try{
      String url = '${GlobalParams.laravelApi}customer/${order.id}';
      var body = json.encode(order.toJson());
      var res = await http.put(Uri.parse(url), body:
        body,
        headers: {'content-type': 'application/json'});
        print(res.statusCode);
      if (res.statusCode == 200) {
        print("success");
        return true;
      }
      }on Exception catch (_, ex){
        print(_);
      }
    return false;
  }

}