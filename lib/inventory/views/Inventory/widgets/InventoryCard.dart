import 'package:gms_erp/blocs/InventoryDetails/inventory_details_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/inventory/models/Inventory.dart';
import 'package:gms_erp/inventory/models/Inventory_details.dart';
import 'package:gms_erp/inventory/inventory.dart';
import 'package:gms_erp/inventory/views/InventoryDetails/Inventory_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InventoryCard extends StatelessWidget {
  final Inventory inventory;
  const InventoryCard({
    Key? key,
    required this.inventory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return InventoyDetailsPage(inventory: inventory);
        }));
      },
      child: Container(
        width: double.infinity,
        height: size.height * 0.18,
        margin: EdgeInsets.all(GlobalParams.MainPadding),
        padding: EdgeInsets.only(right: GlobalParams.MainPadding),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              const BoxShadow(
                  color: Color.fromARGB(246, 190, 185, 185),
                  blurRadius: 25,
                  spreadRadius: 5,
                  offset: Offset(20, 20))
            ]),
        child: Row(
          children: [
            Container(
              color:
                  inventory.inventoryStatusName.toLowerCase().startsWith("fe")
                      ? Colors.red
                      : Colors.green,
              width: 4,
              height: double.infinity,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  top: GlobalParams.MainPadding,
                  left: GlobalParams.MainPadding,
                  right: GlobalParams.MainPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                      "${inventory.description}  ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Open Sans"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          "Numero : ${inventory.inventoryNumber}",
                          style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w300,
                              fontSize: 14),
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          "${inventory.endDate.toString().substring(0, 10)}",
                          style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w300,
                              fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 80,
                      height: 25,
                      decoration: BoxDecoration(
                          color: inventory.inventoryStatusName
                                  .toLowerCase()
                                  .startsWith("fe")
                              ? Colors.red
                              : Colors.green,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: Text(
                        "${inventory.inventoryStatusName.toLowerCase().startsWith("fe") ? "Fermé" : "Ouvert"}",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w300,
                            fontSize: 13),
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
