import 'package:flutter/material.dart';
import 'package:gms_erp/inventory/models/Inventory_details.dart';
import 'package:gms_erp/inventory/views/ProductDetails/ProductDetails.dart';


class InventoryDetailsCard extends StatelessWidget {
  final InventoryDetails inventoryDetails;
  const InventoryDetailsCard({Key? key, required this.inventoryDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductDetails(inventoryDetails: inventoryDetails);
        }));
      },
      child: Container(
        height: size.height * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

          // TODO: review this in future
          gradient:
              !inventoryDetails.qty.toStringAsExponential(2).contains('0.00')
                  ? LinearGradient(colors: [
                      Color(0xff0590FE),
                      Color(0xff2F7EFB),
                      Color(0xff4D76F8),
                      Color(0xff6975F6)
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight)
                  : LinearGradient(colors: [Colors.red, Colors.red]),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${inventoryDetails.productName1}',
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white, fontSize: 13, fontFamily: 'Open Sans'),
              ),
            ),
            SizedBox(height: 10),
            Text(
              '${inventoryDetails.productNo}',
              style: TextStyle(
                  color: Colors.white, fontSize: 13, fontFamily: 'Open Sans'),
            ),
            SizedBox(height: 10),
            Text(
              '${inventoryDetails.stockLocationName}',
              style: TextStyle(
                  color: Colors.white, fontSize: 13, fontFamily: 'Open Sans'),
            ),
            SizedBox(height: 10),
            Text(
              '${inventoryDetails.qty.toStringAsFixed(2)}',
              style: TextStyle(
                  color: Colors.white, fontSize: 13, fontFamily: 'Open Sans'),
            ),
          ],
        ),
      ),
    );
  }
}

