
import 'package:gms_erp/config/global_params.dart';
import 'package:flutter/material.dart';
import 'package:gms_erp/widgets/SearchField.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key, required Size size, required SearchField child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(GlobalParams.MainPadding),
        width: double.infinity,
        height: 230,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/inventaires/header.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hi Zakaria !",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                // button with icon
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            // search box
          ],
        ));
  }
}
