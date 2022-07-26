import 'package:flutter/material.dart';
import 'package:gms_erp/config/menu.dart';
import 'package:gms_erp/crm/models/CustomerDelivery.dart';
import 'package:gms_erp/crm/models/CustomerInvoice.dart';
import 'package:gms_erp/crm/views/Activity/activities.dart';
import 'package:gms_erp/crm/views/Client/clients.dart';
import 'package:gms_erp/crm/views/CustomerDelivery/customerDeliveries.dart';
import 'package:gms_erp/crm/views/CustomerInvoice/customerInvoices.dart';
import 'package:gms_erp/crm/views/CustomerOrder/customerOrders.dart';
import 'package:gms_erp/crm/views/Product/products.dart';
import 'package:gms_erp/widgets/homebutton.dart';

class ListItemView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new GridView.count(
            padding: const EdgeInsets.all(60),
            crossAxisCount:2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(ButtonOption.CrmOptions.length, (index) 
            { 
              var bOption= ButtonOption.CrmOptions[index];
                return Center(child: HomeButton(buttonOption: bOption),);
            }),
    );
  }

  void _navigateToActivities(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Activities()));
  }
  void _navigateToVisite(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Activities()));
  }
  void _navigateToClients(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Clients()));
  }
  void _navigateToCustomerOrder(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerOrders()));
  }
  void _navigateToOpportunities(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Activities()));
  }
  void _navigateToDevis(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Activities()));
  }
  void _navigateToCustomerDelivery(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerDeliveries()));
  }
  void _navigateToCustomerInvoice(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerInvoices()));
  }
  void _navigateToProducts(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Products()));
  }
  void _navigateToVendor(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Activities()));
  }
}