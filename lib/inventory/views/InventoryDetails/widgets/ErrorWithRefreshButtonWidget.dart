import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/inventory/models/Inventory.dart';
import 'package:flutter/material.dart';

class ErrorWithRefreshButtonWidget extends StatelessWidget {
  const ErrorWithRefreshButtonWidget({
    Key? key,
    required this.inventory,
    required this.button_function,
  }) : super(key: key);

  final Inventory? inventory;
  final VoidCallback button_function;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(GlobalParams.MainPadding),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              softWrap: true,
              "An error occurred Please Try Again ",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: button_function,
                child: Icon(Icons.refresh))
          ],
        ),
      ),
    );
  }
}
