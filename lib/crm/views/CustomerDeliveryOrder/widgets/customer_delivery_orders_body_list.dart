import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/CustomerDeliveryOrder/customer_delivery_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/models/CustomerDeliveryOrder.dart';
import 'package:gms_erp/widgets/ItemCardComplexe.dart';
import 'customer_delivery_orders_details.dart';

class CustomerDeliveryOrdersList extends StatelessWidget {
  List<CustomerDeliveryOrder> orders;
  CustomerDeliveryOrdersList({
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
              return ItemCardComplexe(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BlocProvider.value(
                      value:
                          BlocProvider.of<CustomerDeliveryOrderBlock>(_context),
                      child: CustomerDeliveryOrdersDetailsPage(
                          order: orders[index]),
                    );
                  }));
                },
                size: size * 1.2,
                var1: "C.No : ${orders[index].customerNo}",
                var2: "O.No : ${orders[index].orderNo}",
                var3:
                    "D.Date:${orders[index].deliveryDate.toString().substring(0, 10)}",
                var6: "R.NO:${orders[index].receiptNo}",
                var7:
                    "Net /Vat : ${orders[index].totalNetAmount!.toStringAsFixed(2)} / ${orders[index].totalVatAmount!.toStringAsFixed(2)}",
                indicator: Row(
                  children: [
                    orders[index].paymentStateId == "1"
                        ? Text("")
                        : Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 17,
                          ),
                    SizedBox(
                      width: 10,
                    ),
                    orders[index].isPrinted == "1"
                        ? Icon(
                            Icons.forward,
                            color: Colors.white,
                            size: 17,
                          )
                        : Text(""),
                  ],
                ),
              );
            }));
  }
}
