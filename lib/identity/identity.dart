// ignore_for_file: unused_import, prefer_const_constructors, unused_label, unnecessary_const, unnecessary_new
import 'package:flutter/material.dart';
import 'package:gms_erp/config/menu.dart';
import 'package:gms_erp/crm/crm.dart';
import 'package:gms_erp/homepage.dart';
import 'package:gms_erp/widgets/homebutton.dart';
import 'package:gms_erp/identity/views/Sign%20in/userlogin.views.dart';
import 'package:gms_erp/identity/views/user.view.dart';
import 'package:gms_erp/identity/views/useradd.view.dart';
import 'package:gms_erp/inventory/inventory.dart';
import 'package:gms_erp/inventory/views/InventoryDetails/Inventory_details_page.dart';
import 'views/product.view.dart';

class IdentityPage extends StatelessWidget {
  const IdentityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Builder(
          builder: (context) => Scaffold(
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      Container(
                        height: 50,
                        child: DrawerHeader(
                          child: Text('Identity'),
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
                         Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              )); //
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
                // ignore: dead_code
                appBar: AppBar(
                  title: const Text('Identity'),
                ),
                body: GridView.count(
                  padding: const EdgeInsets.all(60),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(ButtonOption.IdentityOptions.length,
                      (index) {
                    var bOption = ButtonOption.IdentityOptions[index];
                    return Center(
                      child: HomeButton(buttonOption: bOption),
                    );
                  }),
                ),
              )),
    );
  }
}
