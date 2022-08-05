import 'dart:convert';

import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/models/CustomerDeliveryOrder.dart';
import 'package:gms_erp/crm/models/PurchaseOrder.dart';
import 'package:http/http.dart' as http;

class CustomerDeliveryOrderService {
  static Future<List<CustomerDeliveryOrder>> getAllCustomerDeliveryOrders() async {
    final response = await http
        .get(Uri.parse(GlobalParams.baseUrl + 'customer-delivery-order'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return parsed
          .map<CustomerDeliveryOrder>(
              (json) => CustomerDeliveryOrder.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load customer delivery  orders');
    }
  }
}
