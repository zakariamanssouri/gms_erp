// ignore_for_file: unused_import, unnecessary_const, avoid_print

import 'package:flutter/material.dart';
import 'package:gms_erp/config/menu.dart';
import 'myalert.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({Key? key, required this.buttonOption}) : super(key: key);
  final ButtonOption buttonOption;

  @override
  //context a ne jamais changer
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1;
    Size size = MediaQuery.of(context).size;

    return Container(
        width: size.width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, buttonOption.route);
          },
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(buttonOption.iconData,
                      size: size.width * 0.10, color: Colors.white),
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
                ]),
          ),
        ));
  }
}
