import 'package:flutter/material.dart';
import 'package:gms_erp/crm/views/Activity/activities.dart';
import 'package:gms_erp/crm/views/Client/clients.dart';
import 'package:gms_erp/crm/views/Product/products.dart';
import 'package:gms_erp/crm/widgets/buttons.dart';

class ListItemView extends StatelessWidget {
  String url = "";
  @override
  Widget build(BuildContext context) {
    return new GridView.count(
            padding: const EdgeInsets.all(60),
            crossAxisCount:3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(CRMButtonOption.Options.length, (index) 
            { 
              var bOption= CRMButtonOption.Options[index];
                return Center(child: CRMHomeButton(buttonOption: bOption),);
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
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Clients(url: url)));
  }
  void _navigateToContacts(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Activities()));
  }
  void _navigateToOpportunities(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Activities()));
  }
  void _navigateToDevis(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Activities()));
  }
  void _navigateToCommands(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Activities()));
  }
  void _navigateToBills(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Activities()));
  }
  void _navigateToProducts(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Products(url: url)));
  }
}