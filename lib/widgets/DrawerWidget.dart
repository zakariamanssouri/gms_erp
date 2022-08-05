import 'package:flutter/material.dart';
import 'package:tree_view/tree_view.dart';

import '../config/global_params.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      DrawerHeader(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: CircleAvatar(
          radius: 5.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
      ),
      ...(GlobalParams.menus).map(
        (item) {
          return ListTile(
            title: Text(item["title"]),
            leading: item["icon"],
            onTap: () {
              Navigator.pushNamed(context, item["route"]);
            },
          );
        },
      ),
    ]));
  }
}
