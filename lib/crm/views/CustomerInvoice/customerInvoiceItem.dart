import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/CustomerInvoice/customer_invoice_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/models/CustomerInvoice.dart';

class CustomerInvoiceItem extends StatefulWidget {
  CustomerInvoice customer_invoice;
  CustomerInvoiceItem({Key? key, required this.customer_invoice}) : super(key: key);

  @override
  State<CustomerInvoiceItem> createState() => _CustomerInvoiceItemState();
}

class _CustomerInvoiceItemState extends State<CustomerInvoiceItem> {

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
          title: Text('Facture  ' + widget.customer_invoice.invoiceNo!),
        ),
        body: BlocListener<CustomerInvoiceBloc, CustomerInvoiceState>(
            listener: (context, state) {
            },
            child: ListView(children: <Widget>[
              Card(
                  child: ListTile(
                minLeadingWidth: 145,
                leading: Text('Numéro de Livraison',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_invoice.invoiceNo!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 145,
                leading: const Text('Numéro du client',
                    style: TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_invoice.customerNo!,
                    style: const TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 145,
                leading: Text('Numéro de Facture',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_invoice.invoiceNo!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 145,
                leading: Text('Numéro d\'ordre',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_invoice.orderNo!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 145,
                leading: Text('Type d\'ordre',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_invoice.orderTypeName!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 145,
                leading: Text('Date de livraison',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_invoice.deliveryDate!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 145,
                leading: Text('Date de facture',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_invoice.invoiceDate!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 145,
                leading: Text('Addresse',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_invoice.address1!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    ))
                    )),
              Card(
                  child: ListTile(
                minLeadingWidth: 145,
                leading: const Text('Pays',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_invoice.countryName!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 145,
                leading: Text('Ville',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_invoice.city!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 145,
                leading: Text('Rue',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_invoice.street!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 145,
                leading: Text('Emplacement',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_invoice.locationName == null ? '' : widget.customer_invoice.locationName!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 145,
                leading: Text('Total Net',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_invoice.totalNetAmount!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 145,
                leading: Text('TVA',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w800)),
                title: Text(widget.customer_invoice.totalVatAmount!,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
            ])),
            );
  }
}
