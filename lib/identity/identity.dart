// ignore_for_file: unused_import, prefer_const_constructors, unused_label, unnecessary_const, unnecessary_new, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:gms_erp/config/menu.dart';
import 'package:gms_erp/crm/crm.dart';
import 'package:gms_erp/homepage.dart';
import 'package:gms_erp/identity/views/admin.adduser.view.dart';
import 'package:gms_erp/widgets/homebutton.dart';
import 'package:gms_erp/identity/views/Sign%20in/user_login.view.dart';
import 'package:gms_erp/identity/views/user.view.dart';
import 'views/Sign in/user.signup.view.dart';
import 'package:gms_erp/inventory/inventory.dart';
import 'package:gms_erp/inventory/views/InventoryDetails/Inventory_details_page.dart';

class IdentityPage extends StatelessWidget {
  IdentityPage({super.key});
  final GlobalKey<ScaffoldState>? _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/home": (context) => HomePage(),
        '/identityUsersList': (context) => const UserView(),
        '/identityAddUsers': (context) => const AddUserView(),
        '/identityAdminAddUsers': (context) => const AddUserAdminView(),
      },
      debugShowCheckedModeBanner: true,
      home: Builder(
          builder: (context) => Scaffold(
                key: _key,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            _key?.currentState!.openDrawer();
                          }),
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Text(
                        'Identité',
                      )),
                    ],
                  ),
                ),

                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      DrawerHeader(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 5.0,
                          child: ClipRRect(
                            child: Image.asset('assets/images/logo.png'),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        title: const Text('Accueil'),
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
                        },
                      ),
                      ListTile(
                        title: const Text('Ajouter Utilisatteurs'),
                        leading: const Icon(
                          Icons.person_add,
                          color: Colors.blue,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddUserAdminView(),
                              )); //
                        },
                      ),
                      ListTile(
                        title: const Text('Utilisateurs'),
                        leading: const Icon(
                          Icons.people_alt,
                          color: Colors.blue,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserView(),
                              )); //ddUserView
                        },
                      ),
                      ListTile(
                        title: const Text('Roles'),
                        leading: const Icon(
                          Icons.person_pin_rounded,
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
                        title: const Text("Droit d'Accées"),
                        leading: const Icon(
                          Icons.lock_person,
                          color: Colors.blue,
                        ),
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => UserLogin(),
                          //     ));
                        },
                      ),
                      SizedBox(
                        height: 150,
                      ),
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
                backgroundColor: Colors.white,
                // ignore: dead_code
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
