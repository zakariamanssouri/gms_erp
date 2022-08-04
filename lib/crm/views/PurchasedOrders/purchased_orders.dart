import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/purchased_orders/purchased_orders_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/views/PurchasedOrders/widgets/purchased_orders_body.dart';

class PurchasedOrdersPage extends StatelessWidget {
  const PurchasedOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: GlobalParams.backgroundColor,
      appBar: AppBar(
        title: const Text('Réceptions'),
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: BlocProvider(
          create: (context) =>
              PurchasedOrderBlock()..add(const LoadAllOrders()),
          child: const PurchasedOrdersPageBody()),
    );
  }
}
