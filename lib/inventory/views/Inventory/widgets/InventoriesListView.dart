import 'package:gms_erp/inventory/models/Inventory.dart';
import 'package:gms_erp/inventory/services/InventoryService.dart';
import 'package:gms_erp/inventory/views/Inventory/widgets/InventoryCard.dart';
import 'package:flutter/material.dart';




class InventoriesListView extends StatelessWidget {
  List<Inventory> inventories;
  InventoriesListView({required this.inventories});


  @override
  Widget build(BuildContext context) {
      return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: inventories.length,
          itemBuilder: (BuildContext context, int index) {
            return InventoryCard(inventory: inventories[index]);
          },
        ),
      ),
    );
  }
}