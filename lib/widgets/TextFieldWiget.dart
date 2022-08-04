import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  Color? focusColor;
  String labeltext;
  String valuetext;
  bool? readonly;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  List? inputFormatters;
  late void Function()? on_changed_function;
  late void Function()? onChangedFun;

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
      this.inputFormatters,
      this.on_changed_function,
      this.onChangedFun})
      : super(key: key);

  final Object obj;

  @override
  Widget build(BuildContext context) {
    if(on_changed_function != null && onChangedFun != null){
      return TextFormField(onChanged: (value) {
              onChangedFun!;
            },
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
          suffixIcon: IconButton(
              onPressed: on_changed_function,
              icon: Icon(Icons.qr_code_scanner_rounded),
            )
        ),
        style: TextStyle(
            fontWeight: FontWeight.w300, fontSize: 14, fontFamily: 'Open Sans'),
        controller: controller,
      );
    }
    else if(on_changed_function == null && onChangedFun != null){
      return TextFormField(
        onChanged: (value) {
              onChangedFun!;
            },
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
    else{
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
}
