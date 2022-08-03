import 'dart:convert';

import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/models/PurchaseOrder.dart';
import 'package:http/http.dart' as http;

class PurchasedOrdersService {
  static Future<List<PurchaseOrder>> getAllPurchasedOrders() async {
    final response =
        await http.get(Uri.parse(GlobalParams.baseUrl + 'purchase-order'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return parsed
          .map<PurchaseOrder>((json) => PurchaseOrder.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load purchased orders');
    }
  }
}
