// ignore_for_file: unused_import, unnecessary_const, avoid_print

import 'package:flutter/material.dart';
import 'package:gms_erp/config/menu.dart';
import '../identity/myalert.dart';
import '../identity/views/product.view.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({Key? key, required this.buttonOption}) : super(key: key);
  final ButtonOption buttonOption;

  @override
  //context a ne jamais changer
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1;

    return Card(
          color: Colors.blue,
          child: InkWell(
          onTap: () 
          { 
          Navigator.pushNamed(context, buttonOption.route);
          },
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Icon(buttonOption.iconData,
                        size: 45.0, color: Colors.white)),
                // ignore: unnecessary_new
                new TextButton(
                  child: Text(
                    buttonOption.text,
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    print("clicked");
                    Navigator.pushNamed(context, buttonOption.route);
                  },
                ),
                 Padding(
                 padding: const EdgeInsets.all(8),
                  child: Text(''),
                 ),
              ]),
        ),
        ));
  }
}
