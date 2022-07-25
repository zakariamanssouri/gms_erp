// ignore_for_file: unused_import, prefer_const_constructors, unused_label, unnecessary_const
import 'package:flutter/material.dart';
import 'package:gms_erp/config/menu.dart';
import 'package:gms_erp/crm/crm.dart';
import 'package:gms_erp/inventory/views/Inventory/inventories_page.dart';
import 'package:gms_erp/widgets/homebutton.dart';
import 'package:gms_erp/identity/identity.dart';
import 'package:gms_erp/identity/views/Sign%20in/userlogin.views.dart';
import 'package:gms_erp/identity/views/user.view.dart';
import 'package:gms_erp/identity/views/useradd.view.dart';
import 'package:gms_erp/inventory/inventory.dart';
import 'package:gms_erp/inventory/views/InventoryDetails/Inventory_details_page.dart';
import 'identity/views/product.view.dart';
//import 'home.dart';

class HomePage extends StatelessWidget 
{
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        routes: {
          '/inventory': (context) => InventoryHomePage(),
          '/inventory_details': (context) => InventoyDetailsPage(),
          '/crm': (context) => CRMPage(),
          '/identity': (context) => IdentityPage(),
          '/home': (context) => HomePage(),
         
        },
        title: 'GMS ERP',
        debugShowCheckedModeBanner: false,
          home: Builder(
          builder: (context) =>Scaffold(
          appBar: AppBar(
            title: const Text('GMS ERP'),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                        child: DrawerHeader(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                  image: AssetImage('images/logo.png'),
                  
                 ),
                     borderRadius:  BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                  ), 
                           
                ),
                child: Container(
                
                   child:CircleAvatar(
                   radius: 5.0,
                    child: ClipRRect(
                      child: Image.asset('assets/images/logo.png'),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                 
                   ),
                ),),),
                SizedBox(height:10,),
                ListTile(
                  title: const Text('CRM'),
                  leading: const Icon(
                    Icons.cases_sharp,
                    color: Colors.blue,
                  ),
                  onTap: () {
                   Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CRMPage(),
                              ));
                  },
                ),
                ListTile(
                  title: const Text('Inventaire'),
                  leading: const Icon(
                    Icons.inventory_2,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InventoryHomePage(),
                        )); //ddUserView
                  },
                ),
                ListTile(
                  title: const Text('identité'),
                  leading: const Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IdentityPage(),
                        ));
                  },
                ),
                ListTile(
                  title: const Text('BI'),
                  leading: const Icon(
                    Icons.poll_sharp,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
                SizedBox(height: 200,),
                ListTile(
                        title: const Text("Se Déconnecter"),
                        leading: const Icon(
                          Icons.logout_rounded,
                          color: Colors.blue,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserLogin(),
                              ));
                        },
                      ),
              ],
            ),
          ),
          body: GridView.count(
            padding: const EdgeInsets.all(60),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(ButtonOption.Options.length, (index) {
              var bOption = ButtonOption.Options[index];
              return Center(
                child: HomeButton(buttonOption: bOption),
              );
            }),
          ),
        )));
  }
}
