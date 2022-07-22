import 'dart:convert';

import 'package:gms_erp/inventory/models/Inventory.dart';
import 'package:gms_erp/inventory/models/Inventory_details.dart';
import 'package:http/http.dart' as http;

import 'package:gms_erp/config/global_params.dart';

class InventoryService {
  Future<List<Inventory>> getInventories() async {
    final response =
        await http.get(Uri.parse(GlobalParams.baseUrl + 'inventory.php'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);

      return parsed['data']
          .map<Inventory>((json) => Inventory.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load inventories');
    }
  }

  // create a function for inventory details
  Future<List<InventoryDetails>> getInventoryDetails(String id) async {
    final response = await http
        .get(Uri.parse(GlobalParams.baseUrl + 'inventorydetail.php?id=' + id));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return parsed['data']
          .map<InventoryDetails>((json) => InventoryDetails.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load inventory details');
    }
  }
}
