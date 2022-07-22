import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gms_erp/inventory/models/Inventory_details.dart';

class TextFieldWidget extends StatelessWidget {
  Color? focusColor;
  String labeltext;
  String valuetext;
  bool? readonly;
  String? Function(String?)? validator;

  TextEditingController controller;
  TextFieldWidget(
      {Key? key,
      required this.inventoryDetails,
      required this.labeltext,
      required this.valuetext,
      this.readonly = false,
      this.focusColor = Colors.black,
      required this.controller,
      this.validator})
      : super(key: key);

  final InventoryDetails inventoryDetails;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      readOnly: readonly ?? false,
      decoration: InputDecoration(

        fillColor: Colors.red,
        focusColor: Colors.black,
        labelText: labeltext,
        labelStyle: TextStyle(
            fontWeight: FontWeight.w300, fontSize: 13, fontFamily: 'Open Sans'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: TextStyle(
          fontWeight: FontWeight.w300, fontSize: 14, fontFamily: 'Open Sans'),
      controller: controller,
    );
  }
}
