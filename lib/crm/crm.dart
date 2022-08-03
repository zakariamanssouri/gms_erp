import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/purchased_orders/purchased_orders_bloc.dart';
import 'package:gms_erp/crm/models/PurchaseOrder.dart';
import 'package:gms_erp/crm/views/Activity/activities.dart';
import 'package:gms_erp/crm/views/Product/products.dart';
import 'package:gms_erp/crm/views/Client/clients.dart';
import 'package:gms_erp/crm/views/PurchasedOrders/purchased_orders.dart';
import 'package:gms_erp/crm/widgets/list_item_view.dart';
import 'package:gms_erp/crm/widgets/side_drawer.dart';

class CRMPage extends StatelessWidget {
  const CRMPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/Activity': (context) => Activities(),
          '/Product': (context) => Products(),
          '/Client': (context) => Clients(),
          '/PurchasedOrders': (context) =>  PurchasedOrdersPage(),
        },
        title: 'GM-CRM',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: new AppBar(title: Text("GM-CRM")),
          body: ListItemView(),
          drawer: SideDrawer(),
        ));
  }
}
