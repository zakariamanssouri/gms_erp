import 'package:flutter/material.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/models/CustomerDeliveryOrder.dart';

class CustomerDeliveryOrdersDetailsPage extends StatefulWidget {
  CustomerDeliveryOrder order;
  CustomerDeliveryOrdersDetailsPage({Key? key, required this.order})
      : super(key: key);

  @override
  State<CustomerDeliveryOrdersDetailsPage> createState() =>
      _CustomerDeliveryOrdersDetailsPageState();
}

class _CustomerDeliveryOrdersDetailsPageState
    extends State<CustomerDeliveryOrdersDetailsPage> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Reception : ${widget.order.orderStateId}'),
        ),
        body: ListView(children: <Widget>[
          Card(
              child: ListTile(
            minLeadingWidth: 70,
            leading: const Text('Numero du Client',
                style: TextStyle(
                    fontFamily: GlobalParams.MainfontFamily,
                    fontWeight: FontWeight.w800)),
            title: Text(
              widget.order.customerNo ?? " ",
              style: const TextStyle(
                  fontFamily: GlobalParams.MainfontFamily,
                  fontWeight: FontWeight.w300),
            ),
          )),
          Card(
              child: ListTile(
            minLeadingWidth: 70,
            leading: const Text('Numéro du Commande',
                style: TextStyle(
                    fontFamily: GlobalParams.MainfontFamily,
                    fontWeight: FontWeight.w800)),
            title: Text(widget.order.orderNo ?? "",
                style: const TextStyle(
                  fontFamily: GlobalParams.MainfontFamily,
                  fontWeight: FontWeight.w300,
                )),
          )),
          Card(
              child: ListTile(
            minLeadingWidth: 70,
            leading: const Text('Numéro du Réception',
                style: TextStyle(
                    fontFamily: GlobalParams.MainfontFamily,
                    fontWeight: FontWeight.w800)),
            title: Text(widget.order.receiptNo ?? "",
                style: const TextStyle(
                  fontFamily: GlobalParams.MainfontFamily,
                  fontWeight: FontWeight.w300,
                )),
          )),
          Card(
              child: ListTile(
            minLeadingWidth: 70,
            leading: const Text('Adresses',
                style: TextStyle(
                    fontFamily: GlobalParams.MainfontFamily,
                    fontWeight: FontWeight.w800)),
            title: Text(widget.order.address1 ?? "",
                style: const TextStyle(
                  fontFamily: GlobalParams.MainfontFamily,
                  fontWeight: FontWeight.w300,
                )),
          )),
          Card(
              child: ListTile(
            minLeadingWidth: 70,
            leading: const Text('Date du Commande',
                style: TextStyle(
                    fontFamily: GlobalParams.MainfontFamily,
                    fontWeight: FontWeight.w800)),
            title: Text(widget.order.orderDate.toString().substring(0, 10),
                style: const TextStyle(
                  fontFamily: GlobalParams.MainfontFamily,
                  fontWeight: FontWeight.w300,
                )),
          )),
          Card(
              child: ListTile(
            minLeadingWidth: 70,
            leading: const Text('Date du livraison',
                style: TextStyle(
                    fontFamily: GlobalParams.MainfontFamily,
                    fontWeight: FontWeight.w800)),
            title: Text(widget.order.deliveryDate.toString().substring(0, 10),
                style: const TextStyle(
                  fontFamily: GlobalParams.MainfontFamily,
                  fontWeight: FontWeight.w300,
                )),
          )),
          Card(
              child: ListTile(
            minLeadingWidth: 70,
            leading: const Text('Date du réception',
                style: TextStyle(
                    fontFamily: GlobalParams.MainfontFamily,
                    fontWeight: FontWeight.w800)),
            title: Text(widget.order.receiptDate.toString().substring(0, 10),
                style: const TextStyle(
                  fontFamily: GlobalParams.MainfontFamily,
                  fontWeight: FontWeight.w300,
                )),
          )),
          Card(
              child: ListTile(
            minLeadingWidth: 70,
            leading: const Text('Ville',
                style: TextStyle(
                    fontFamily: GlobalParams.MainfontFamily,
                    fontWeight: FontWeight.w800)),
            title: Text("${widget.order.city}",
                style: const TextStyle(
                  fontFamily: GlobalParams.MainfontFamily,
                  fontWeight: FontWeight.w300,
                )),
          )),
          Card(
              child: ListTile(
            minLeadingWidth: 70,
            leading: const Text('Pays',
                style: TextStyle(
                    fontFamily: GlobalParams.MainfontFamily,
                    fontWeight: FontWeight.w800)),
            title: Text(widget.order.countryName ?? "",
                style: const TextStyle(
                  fontFamily: GlobalParams.MainfontFamily,
                  fontWeight: FontWeight.w300,
                )),
          )),
          Card(
              child: ListTile(
            minLeadingWidth: 70,
            leading: const Text('Devise',
                style: TextStyle(
                    fontFamily: GlobalParams.MainfontFamily,
                    fontWeight: FontWeight.w800)),
            title: Text(widget.order.currencyName ?? "",
                style: const TextStyle(
                  fontFamily: GlobalParams.MainfontFamily,
                  fontWeight: FontWeight.w300,
                )),
          )),
        
        ]));
  }
}
