import 'dart:convert';

import 'package:gms_erp/crm/models/CustomerInvoice.dart';
import 'package:http/http.dart' as http;

import 'package:gms_erp/config/global_params.dart';

class CustomerInvoiceService {
  
  static Future<List<CustomerInvoice>> getCustomerInvoices() async {
    List<CustomerInvoice>? list;

    var res = await http.get(Uri.parse(GlobalParams.baseUrl + 'customer-invoice'));
    var json_data = json.decode(res.body);

    if (res.statusCode == 200) {
      var data = json_data as List;
      list = data.map<CustomerInvoice>((json) => CustomerInvoice.fromJson(json)).toList();
    }
    else{
      list = null;
    }

    return list!;
  }

}