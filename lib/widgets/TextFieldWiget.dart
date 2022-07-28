import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  Color? focusColor;
  String labeltext;
  String valuetext;
  bool? readonly;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  List? inputFormatters;

  TextEditingController controller;
  TextFieldWidget(
      {Key? key,
      required this.obj,
      required this.labeltext,
      required this.valuetext,
      this.readonly = false,
      this.focusColor = Colors.black,
      required this.controller,
      this.validator,
      this.keyboardType,
      this.inputFormatters})
      : super(key: key);

  final Object obj;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
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
