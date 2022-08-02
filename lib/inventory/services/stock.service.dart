import 'dart:convert';

import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/inventory/models/stock.dart';
import 'package:http/http.dart' as http;

class StockService {
  static Future<List<Stock>> getProducts() async {
    final response =
        await http.get(Uri.parse(GlobalParams.baseUrl + 'stock'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      print(parsed);
      return parsed.map<Stock>((json) => Stock.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
