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
          title: Text('Ordre  ' + widget.customer_order.receiptNo!),
        ),
        body: BlocListener<CustomerOrderBloc, CustomerOrderState>(
            listener: (context, state) {
            },
            child: ListView(children: <Widget>[/*
              Card(
                  child: ListTile(
                minLeadingWidth: 120,
                leading: const Text('Numéro d\'ordre',
                    style: TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(
                  widget.customer_order.customerOrderNo == null ? '--' : widget.customer_order.customerOrderNo!,
                  style: const TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300),
                ),
              )),*/
              Card(
                  child: ListTile(
                minLeadingWidth: 120,
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
                minLeadingWidth: 120,
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
                minLeadingWidth: 120,
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
                minLeadingWidth: 120,
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
                minLeadingWidth: 120,
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
                minLeadingWidth: 120,
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
                minLeadingWidth: 120,
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
                minLeadingWidth: 120,
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
                minLeadingWidth: 120,
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
                minLeadingWidth: 120,
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
            ])),
            );
  }
}
