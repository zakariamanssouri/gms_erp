import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/CustomerDelivery/customer_delivery_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/models/CustomerDelivery.dart';

class CustomerDeliveryItem extends StatefulWidget {
  CustomerDelivery customer_delivery;
  CustomerDeliveryItem({Key? key, required this.customer_delivery}) : super(key: key);

  @override
  State<CustomerDeliveryItem> createState() => _CustomerDeliveryItemState();
}

class _CustomerDeliveryItemState extends State<CustomerDeliveryItem> {

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BuildContext _context = context;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Livraison  ' + widget.customer_delivery.deliveryNo!),
        ),
        body: BlocListener<CustomerDeliveryBloc, CustomerDeliveryState>(
            listener: (context, state) {
            },
            child: ListView(children: <Widget>[
              Card(
                  child: ListTile(
                minLeadingWidth: 120,
                leading: Text('Numéro de Livraison',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_delivery.deliveryNo!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 120,
                leading: const Text('Numéro du client',
                    style: TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_delivery.customerNo!,
                    style: const TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 120,
                leading: Text('Numéro de Facture',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_delivery.invoiceNo!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 120,
                leading: Text('Numéro d\'ordre',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_delivery.orderNo!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 120,
                leading: Text('Numéro ICE',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_delivery.iceNo!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 120,
                leading: Text('Type d\'ordre',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_delivery.orderTypeName!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 120,
                leading: Text('Date de livraison',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_delivery.deliveryDate!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 120,
                leading: Text('Date de facture',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_delivery.invoiceDate!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 120,
                leading: Text('Addresse',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_delivery.address1!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    ))
                    )),
              Card(
                  child: ListTile(
                minLeadingWidth: 120,
                leading: const Text('Pays',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_delivery.countryName!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 120,
                leading: Text('Ville',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_delivery.city!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 120,
                leading: Text('Rue',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_delivery.street!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 120,
                leading: Text('Total Net',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_delivery.totalNetAmount!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 120,
                leading: Text('TVA',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_delivery.totalVatAmount!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
            ])),
            );
  }
}
