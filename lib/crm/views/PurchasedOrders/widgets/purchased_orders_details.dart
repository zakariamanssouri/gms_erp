import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:gms_erp/blocs/purchased_orders/purchased_orders_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/models/PurchaseOrder.dart';

class PurchasedOrdersDetailsPage extends StatefulWidget {
  PurchaseOrder purchaseOrder;
  PurchasedOrdersDetailsPage({Key? key, required this.purchaseOrder})
      : super(key: key);

  @override
  State<PurchasedOrdersDetailsPage> createState() =>
      _PurchasedOrdersDetailsPageState();
}

class _PurchasedOrdersDetailsPageState
    extends State<PurchasedOrdersDetailsPage> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Reception : ${widget.purchaseOrder.orderStateId}'),
        ),
        body: ListView(children: <Widget>[
          Card(
              child: ListTile(
            minLeadingWidth: 70,
            leading: const Text('Numero du fournisseur',
                style: TextStyle(
                    fontFamily: GlobalParams.MainfontFamily,
                    fontWeight: FontWeight.w800)),
            title: Text(
              widget.purchaseOrder.vendorNo,
              style: const TextStyle(
                  fontFamily: GlobalParams.MainfontFamily,
                  fontWeight: FontWeight.w300),
            ),
          )),
          Card(
              child: ListTile(
            minLeadingWidth: 70,
            leading: const Text('Numéro du réception',
                style: TextStyle(
                    fontFamily: GlobalParams.MainfontFamily,
                    fontWeight: FontWeight.w800)),
            title: Text(widget.purchaseOrder.receiptNo,
                style: const TextStyle(
                  fontFamily: GlobalParams.MainfontFamily,
                  fontWeight: FontWeight.w300,
                )),
          )),
          Card(
              child: ListTile(
            minLeadingWidth: 70,
            leading: const Text('Numéro du projet ',
                style: TextStyle(
                    fontFamily: GlobalParams.MainfontFamily,
                    fontWeight: FontWeight.w800)),
            title: Text(widget.purchaseOrder.projectNo ?? "",
                style: const TextStyle(
                  fontFamily: GlobalParams.MainfontFamily,
                  fontWeight: FontWeight.w300,
                )),
          )),
          Card(
              child: ListTile(
            minLeadingWidth: 70,
            leading: const Text('Nom du fournisseur',
                style: TextStyle(
                    fontFamily: GlobalParams.MainfontFamily,
                    fontWeight: FontWeight.w800)),
            title: Text(widget.purchaseOrder.vendorName1,
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
            title: Text("${widget.purchaseOrder.countryName}",
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
            title: Text(widget.purchaseOrder.currencyName,
                style: const TextStyle(
                  fontFamily: GlobalParams.MainfontFamily,
                  fontWeight: FontWeight.w300,
                )),
          )),
          Card(
              child: ListTile(
            minLeadingWidth: 70,
            leading: const Text('Status du Payement',
                style: TextStyle(
                    fontFamily: GlobalParams.MainfontFamily,
                    fontWeight: FontWeight.w800)),
            title: Text(widget.purchaseOrder.orderStateName,
                style: const TextStyle(
                  fontFamily: GlobalParams.MainfontFamily,
                  fontWeight: FontWeight.w300,
                )),
          )),
          Card(
              child: ListTile(
            minLeadingWidth: 70,
            leading: const Text('Status',
                style: TextStyle(
                    fontFamily: GlobalParams.MainfontFamily,
                    fontWeight: FontWeight.w800)),
            title: Text(widget.purchaseOrder.orderStateName,
                style: const TextStyle(
                  fontFamily: GlobalParams.MainfontFamily,
                  fontWeight: FontWeight.w300,
                )),
          )),
          Card(
              child: ListTile(
            minLeadingWidth: 70,
            leading: const Text('Date de livraison',
                style: TextStyle(
                    fontFamily: GlobalParams.MainfontFamily,
                    fontWeight: FontWeight.w800)),
            title: Text(
                widget.purchaseOrder.deliveryDate.toString().substring(0, 10),
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
            title: Text(
                widget.purchaseOrder.receiptDate.toString().substring(0, 10),
                style: const TextStyle(
                  fontFamily: GlobalParams.MainfontFamily,
                  fontWeight: FontWeight.w300,
                )),
          )),
        ]));
  }
}
