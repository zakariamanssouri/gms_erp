import 'dart:convert';

import 'package:gms_erp/inventory/models/Inventory.dart';
import 'package:gms_erp/inventory/models/Inventory_details.dart';
import 'package:http/http.dart' as http;

import 'package:gms_erp/config/global_params.dart';

class InventoryService {
  Future<List<Inventory>> getInventories() async {
    final response =
        await http.get(Uri.parse(GlobalParams.baseUrl + 'inventory'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);

      return parsed.map<Inventory>((json) => Inventory.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load inventories');
    }
  }

  // create a function for inventory details
  Future<List<InventoryDetails>> getInventoryDetails(String id) async {
    final response = await http
        .get(Uri.parse('${GlobalParams.baseUrl}inventory/$id/products'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return parsed
          .map<InventoryDetails>((json) => InventoryDetails.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load inventory details');
    }
  }

  Future<dynamic> updateProduct(InventoryDetails inventoryDetails) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    final response = await http.put(
        Uri.parse(
            '${GlobalParams.baseUrl}inventory/details/${inventoryDetails.id}'),
        body: jsonEncode(inventoryDetails.toJson()),
        headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
