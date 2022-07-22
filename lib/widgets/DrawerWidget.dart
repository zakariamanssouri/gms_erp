import 'package:flutter/material.dart';

import '../config/global_params.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        // TODO : add  a grid layout
        child: Center(
          child: CircleAvatar(
            // ToDO : add a logo
            child: Text("GM Invent"),
            radius: 50,
          ),
        ),
      ),
      ...(GlobalParams.menus).map(
        (item) {
          return ListTile(
            title: Text(item["title"]),
            leading: item["icon"],
            trailing: Icon(
              Icons.arrow_right,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.pushNamed(context, item["route"]);
            },
          );
        },
      ),
    ]));
  }
}
