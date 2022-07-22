import 'package:flutter/material.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/inventory/models/Inventory_details.dart';

class InventoryDetailsCardHeader extends StatelessWidget {
  // constructor
  const InventoryDetailsCardHeader(
      {Key? key, required this.size, required this.inventoryDetails})
      : super(key: key);

  final Size size;
  final InventoryDetails inventoryDetails;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.06,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: GlobalParams.inventoryDetailsCardHeaderGradientColors,
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          "${inventoryDetails.productNo}",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Open Sans'),
        ),
      ),
    );
  }
}
