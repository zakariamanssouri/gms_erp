import 'package:flutter/material.dart';
import 'package:gms_erp/crm/crm.dart';
import 'package:gms_erp/crm/views/Activity/activities.dart';
import 'package:gms_erp/crm/views/Client/clients.dart';
import 'package:gms_erp/crm/views/Product/products.dart';
import 'package:gms_erp/homepage.dart';

class SideDrawer extends StatelessWidget {

  String url = "";
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 101.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Container(
                  width: 80,
                  height: 80,
                  child: CircleAvatar(
                    child: Text("GM-CRM"),
                  ),
                ),
              ),
            ),
        ListTile(
          leading: Icon(Icons.home,
          color: Colors.blue),
          title: Text("Accueil"),
          onTap: () {
            _navigateToAccueil(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.dashboard,
          color: Colors.blue),
          title: Text("Activités"),
          onTap: () {
            _navigateToActivities(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.calendar_month,
          color: Colors.blue),
          title: Text("Plan de visite"),
          onTap: () {
            _navigateToVisite(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.account_box,
          color: Colors.blue),
          title: Text("Clients"),
          onTap: () {
            _navigateToClients(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.contact_page,
          color: Colors.blue),
          title: Text("Contacts"),
          onTap: () {
            _navigateToContacts(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.file_copy,
          color: Colors.blue),
          title: Text("Opportunités"),
          onTap: () {
            _navigateToOpportunities(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.file_download,
          color: Colors.blue),
          title: Text("Devis"),
          onTap: () {
            _navigateToDevis(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.keyboard_command_key,
          color: Colors.blue),
          title: Text("Commandes"),
          onTap: () {
            _navigateToCommands(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.inventory,
          color: Colors.blue),
          title: Text("Factures"),
          onTap: () {
            _navigateToBills(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.production_quantity_limits,
          color: Colors.blue),
          title: Text("Produits"),
          onTap: () {
            _navigateToProducts(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.logout,
          color: Colors.blue),
          title: Text("Se déconnecter"),
          onTap: () {
            _navigateToLogout(context);
          },
        ),
          ],
        ),
      );
  }

  void _navigateToAccueil(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
  }
  void _navigateToActivities(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Activities()));
  }
  void _navigateToVisite(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Activities()));
  }
  void _navigateToClients(BuildContext context) {
    Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Clients(url: url,),
    ));
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
  
  void _navigateToLogout(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CRMPage()));
  }
}