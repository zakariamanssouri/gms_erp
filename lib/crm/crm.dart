import 'package:flutter/material.dart';
import 'package:gms_erp/crm/views/Activity/activities.dart';
import 'package:gms_erp/crm/views/CustomerDelivery/customerDeliveries.dart';
import 'package:gms_erp/crm/views/CustomerOrder/customerOrders.dart';
import 'package:gms_erp/crm/views/Product/products.dart';
import 'package:gms_erp/crm/views/Client/clients.dart';
import 'package:gms_erp/crm/views/PurchasedOrders/purchased_orders.dart';
import 'package:gms_erp/crm/views/Vendor/vendors.dart';
import 'package:gms_erp/crm/widgets/list_item_view.dart';
import 'package:gms_erp/crm/widgets/side_drawer.dart';
import 'package:gms_erp/homepage.dart';

class CRMPage extends StatelessWidget {
   CRMPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState>? _key = GlobalKey();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/Activity': (context) => Activities(),
          '/Product': (context) => Products(),
          '/Client': (context) => Clients(),
          '/PurchasedOrders': (context) => PurchasedOrdersPage(),
          '/CustomerOrder': (context) => CustomerOrders(),
          '/CustomerDelivery': (context) => CustomerDeliveries(),
          '/Vendors': (context) => Vendors(),
        },
        title: 'GM-CRM',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          key: _key,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      _key?.currentState!.openDrawer();
                    }),
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Text(
                  'GM-CRM',
                )),
              ],
            ),
          ),
          body: ListItemView(),
          drawer: SideDrawer(),
        ));
  }
}
