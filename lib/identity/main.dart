// ignore_for_file: unused_import, prefer_const_constructors, unused_label, unnecessary_const
import 'package:flutter/material.dart';
import 'package:gms_erp/identity/homebutton.dart';
import 'package:gms_erp/identity/views/Sign%20in/userlogin.views.dart';
import 'package:gms_erp/identity/views/user.view.dart';
import 'package:gms_erp/identity/views/useradd.view.dart';
import 'package:gms_erp/inventory/views/Inventory/Inventory_page.dart';
import 'package:gms_erp/inventory/views/InventoryDetails/Inventory_details_page.dart';
import 'views/product.view.dart';
//import 'home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/home': (context) => MyApp(),
          '/inventory': (context) => InventoryPage(),
          '/inventory_details': (context) => InventoyDetailsPage(),
        },
        title: 'GM-Bank',
        debugShowCheckedModeBanner: true,
        home: Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: 50,
                  child: DrawerHeader(
                    child: Text('GM-Bank'),
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                ),
                ListTile(
                  title: const Text('Home'),
                  leading: const Icon(
                    Icons.home,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeButton(buttonOption),));
                  },
                ),
                ListTile(
                  title: const Text('Add User'),
                  leading: const Icon(
                    Icons.person_add,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddUserView(),
                        )); //ddUserView
                  },
                ),
                ListTile(
                  title: const Text('Users List'),
                  leading: const Icon(
                    Icons.person_pin_circle_outlined,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserView(),
                        ));
                  },
                ),
                ListTile(
                  title: const Text('Product'),
                  leading: const Icon(
                    Icons.production_quantity_limits_rounded,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserLogin()));
                  },
                ),
              ],
            ),
          ),
          // ignore: dead_code
          appBar: AppBar(
            title: const Text('GM-Bank'),
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
        ));
  }
}
