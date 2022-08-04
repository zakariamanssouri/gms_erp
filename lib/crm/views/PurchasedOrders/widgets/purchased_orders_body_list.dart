import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/purchased_orders/purchased_orders_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/models/PurchaseOrder.dart';
import 'package:gms_erp/crm/views/PurchasedOrders/widgets/purchased_orders_details.dart';
import 'package:gms_erp/widgets/ItemCard.dart';

class PurchasedOrdersList extends StatelessWidget {
  List<PurchaseOrder> orders;
  PurchasedOrdersList({
    Key? key,
    required this.size,
    required this.orders,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    return Container(
        height: size.height * 0.78,
        padding: EdgeInsets.only(
            top: GlobalParams.MainPadding / 2,
            left: GlobalParams.MainPadding / 3,
            right: GlobalParams.MainPadding / 4),
        child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemCard(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return BlocProvider.value(
                      value: BlocProvider.of<PurchasedOrderBlock>(_context),
                      child: PurchasedOrdersDetailsPage(purchaseOrder: orders[index]),
                    );
                  }));
                },
                size: size * 1.2,
                var1: orders[index].vendorName1,
                var2: "F:${orders[index].vendorNo}",
                var3: "D.Date:${orders[index].deliveryDate.toString().substring(0, 10)}",
                var6: "R.NO:${orders[index].receiptNo}",
                var7: "R.DATE:${orders[index].receiptDate.toString().substring(0, 10)}",
                indicator: orders[index].orderStateName.startsWith("Fe")
                    ? const Icon(
                        Icons.lock,
                        size: 15,
                        color: Colors.white,
                      )
                    : const Text(""),
              );
            }));
  }
}
