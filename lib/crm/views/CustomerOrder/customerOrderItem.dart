import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/CustomerOrder/customer_order_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/models/CustomerOrder.dart';

class CustomerOrderItem extends StatefulWidget {
  CustomerOrder customer_order;
  CustomerOrderItem({Key? key, required this.customer_order}) : super(key: key);

  @override
  State<CustomerOrderItem> createState() => _CustomerOrderItemState();
}

class _CustomerOrderItemState extends State<CustomerOrderItem> {
final Key keyOne = PageStorageKey('Général');
  final Key keyTwo = PageStorageKey('Produits');

  int currentTab = 0;

  late PageOne one;
  late PageTwo two;
  late List<Widget> pages;
  late Widget currentPage;

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    one = PageOne(
      key: keyOne,
      customer_order: widget.customer_order,
    );
    two = PageTwo(
      key: keyTwo,
    );

    pages = [one, two];

    currentPage = one;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Commande " + widget.customer_order.receiptNo!),
      ),
      body: PageStorage(
        child: currentPage,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (int index) {
          setState(() {
            currentTab = index;
            currentPage = pages[index];
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Général',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits),
            label: 'Produits',
          ),
        ],
      ),
    );
  }
}

class PageOne extends StatefulWidget {
  
  CustomerOrder customer_order;
  PageOne({
    Key? key,
    required this.customer_order
  }) : super(key: key);

  @override
  PageOneState createState() => PageOneState(customer_order: customer_order);
}

class PageOneState extends State<PageOne> {
  
  CustomerOrder customer_order;
  PageOneState({required this.customer_order});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BuildContext _context = context;

    return BlocListener<CustomerOrderBloc, CustomerOrderState>(
            listener: (context, state) {
            },
            child: ListView(children: <Widget>[
              Card(
                  child: ListTile(
                minLeadingWidth: 125,
                leading: const Text('Numéro du client',
                    style: TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_order.customerNo!,
                    style: const TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 125,
                leading: Text('Numéro du reçu',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_order.receiptNo!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 125,
                leading: Text('Utilisateur',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_order.user!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 125,
                leading: Text('TVA',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_order.totalVatAmount!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 125,
                leading: Text('Date de livraison',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_order.deliveryDate!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 125,
                leading: Text('Date de reçu',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_order.receiptNo!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 125,
                leading: Text('Addresse',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_order.address1!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    ))
                    )),
              Card(
                  child: ListTile(
                minLeadingWidth: 125,
                leading: const Text('Pays',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_order.countryName!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 125,
                leading: Text('Ville',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_order.city!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 125,
                leading: Text('Rue',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_order.street!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
            ]),
            );
  }
}


class PageTwo extends StatefulWidget {
  PageTwo({Key? key}) : super(key: key);

  @override
  PageTwoState createState() => PageTwoState();
}

class PageTwoState extends State<PageTwo> {
  

  @override
  void initState() {
    super.initState();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Produits'),
      ),
    );
  }

}
