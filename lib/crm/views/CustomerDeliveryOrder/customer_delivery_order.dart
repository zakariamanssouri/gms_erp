import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/CustomerDeliveryOrder/customer_delivery_bloc.dart';
import 'package:gms_erp/blocs/CustomerDeliveryOrder/customer_delivery_event.dart';
import 'package:gms_erp/config/global_params.dart';

import 'widgets/customer_delivery_orders_body.dart';

class CustomerDeliveryOrderPage extends StatelessWidget {
  const CustomerDeliveryOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: GlobalParams.backgroundColor,
      appBar: AppBar(
        title: const Text('Customer Delivery Order'),
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: BlocProvider(
          create: (context) =>
              CustomerDeliveryOrderBlock()..add(const LoadAllCustomerDeliveryOrdersEvent()),
          child: const CustomerDeliveryOrdersPageBody()),
    );
  }
}
